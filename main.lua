local rotation
local texture

local ffi = require 'ffi'
local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar
local scene_test = require 'scene.test.test'
local collada_types = require 'collada_types'

local pixelcode = [[
    #pragma language glsl3

    varying vec4 PixelNormal;
    varying vec4 PixelTexture;
    varying float PixelId;

    uniform sampler2D texture_sampler;

    out vec4 outData;

    void pixelmain()
    {
      vec4 texColor = texture(texture_sampler, PixelTexture.xy);

      float intensity = min(max(dot(vec3(1, 1, 1), PixelNormal.xyz), 0), 1);
      outData = vec4(texColor.xyz * (0.1 + intensity * intensity), 1.0);
    }
]]

local vertexcode = [[
    #pragma language glsl3

    layout (location = 0) in vec4 VertexPosition;
    layout (location = 1) in vec4 VertexNormal;
    layout (location = 2) in vec4 VertexTexture;

    uniform mat4 transform;

    varying vec4 PixelNormal;
    varying vec4 PixelTexture;
    varying float PixelId;

    void vertexmain()
    {
        PixelNormal = VertexNormal * 0.5 + 0.5;
        PixelTexture = VertexTexture;
        PixelId = float(gl_VertexID) / (4800 * 3);
        love_Position = transform * vec4(VertexPosition.xyz, 1);
    }
]]

local shader = love.graphics.newShader(pixelcode, vertexcode)

local vertexformat = {
   { name = 'VertexPosition', format = 'floatvec3', location = 0 },
   { name = 'VertexNormal', format = 'floatvec3', location = 1 },
   { name = 'VertexTexture', format = 'floatvec3', location = 2 },
}

function pnt_attribute_list(vertex_buffer, offset)
   return {
      {
         buffer = vertex_buffer,
         location = 0,
         name = "VertexPosition",
         nameinbuffer = nil,
         step = "pervertex",
         startindex = 1 + offset,
      },
      {
         buffer = vertex_buffer,
         location = 1,
         name = "VertexNormal",
         nameinbuffer = nil,
         step = "pervertex",
         startindex = 1 + offset,
      },
      {
         buffer = vertex_buffer,
         location = 2,
         name = "VertexTexture",
         nameinbuffer = nil,
         step = "pervertex",
         startindex = 1 + offset,
      },
   }
end

local geometries_meshes = {}

function load_geometries(vertex_buffer, index_buffer, geometries)
   for _, geometry in ipairs(geometries) do
      local offset = geometry.mesh.vertex_buffer_offset / (4 * 3 * 3)
      local attribute_list = pnt_attribute_list(vertex_buffer, offset)

      local draw_mode = "triangles"
      local mesh = love.graphics.newMesh(attribute_list, draw_mode)
      mesh:setIndexBuffer(index_buffer)

      geometries_meshes[geometry] = mesh
   end
end


local node_instances = {}

function node_world_transform(node)
   local world
   if node.parent_index >= 0 then
      world = node_instances[node.parent_index].world
      assert(world ~= nil)
   else
      world = mat4.identity()
   end

   for _, transform in ipairs(node.transforms) do
      local m
      if transform.type == collada_types.transform_type.LOOKAT then
         assert(false)
      elseif transform.type == collada_types.transform_type.MATRIX then
         m = mat4.load_table(transform.matrix)
      elseif transform.type == collada_types.transform_type.ROTATE then
         local rotate = vec4.load_table(transform.rotate)
         local w = rotate.f[3]
         m = mat4.rotation_axis(rotate, scalar.convert_to_radians(w))
      elseif transform.type == collada_types.transform_type.SCALE then
         m = mat4.scaling_from_vector(vec3.load_table(transform.scale))
      elseif transform.type == collada_types.transform_type.TRANSLATE then
         m = mat4.translation_from_vector(vec3.load_table(transform.translate))
      else
         assert(false)
      end

      world = m * world
   end
   return world
end

function load_node_world_transforms(nodes)
   local node_index = 0
   for _, node in ipairs(nodes) do
      world = node_world_transform(node)
      node_instances[node_index] = { world = world }
      node_index = node_index + 1
   end
end

function love.load(args)
   love.window.setMode(1024, 1024, {depth=true})

   local vertex_data = love.filesystem.newFileData("scene/test/test.vtx")
   local index_data = love.filesystem.newFileData("scene/test/test.idx")

   local vertex_buffer = love.graphics.newBuffer(vertexformat, vertex_data, { vertex = true, usage = "static" })
   local index_buffer = love.graphics.newBuffer("uint32", index_data, { index = true, usage = "static" })

   load_geometries(vertex_buffer, index_buffer, scene_test.descriptor.geometries)
   load_node_world_transforms(scene_test.descriptor.nodes)

   local image_data = love.image.newCompressedData('bird.dds')
   texture = love.graphics.newTexture(image_data)
end

function draw_geometry(geometry)
   local base_index_buffer_offset = geometry.mesh.index_buffer_offset / 4

   local mesh = geometries_meshes[geometry]
   for triangle_index, triangles in pairs(geometry.mesh.triangles) do
      local index_offset = base_index_buffer_offset + triangles.index_offset
      local index_count = triangles.count * 3
      mesh:setDrawRange(1 + index_offset, index_count)
      love.graphics.draw(mesh, 0, 0, 0, 0, 0)
   end
end

function draw_node(node_index, node, transform)
   if node.type ~= collada_types.node_type.NODE then
      return
   end

   if node.instance_geometries_count == 0 and node.instance_controllers_count == 0 then
      return
   end

   local world = node_instances[node_index].world
   transform = world * transform
   shader:send("transform", "column", transform.data)

   for _, instance_geometry in ipairs(node.instance_geometries) do
      draw_geometry(instance_geometry.geometry)
   end
end

function draw_nodes(nodes, transform)
   local node_index = 0
   for _, node in ipairs(nodes) do
      draw_node(node_index, node, transform)
      node_index = node_index + 1
   end
end

local rotation = 0.0

function love.draw()
   local radius = 100
   local mx, my = love.mouse.getPosition()

   width, height = love.graphics.getDimensions()

   local projection = mat4.perspective_rh(width / width * 0.1,
                                          height / width * 0.1,
                                          0.1,
                                          1000.0)
   local view = mat4.look_at_rh(vec3(-88.57101, -71.71298, 104.5738),
                                vec3(-19.90239, -27.72767, 54.6898),
                                vec3(0, 0, 1))

   local world1 = mat4.rotation_x(rotation)
   local world2 = mat4.rotation_z(rotation * 0.5)
   --local world3 = mat4.translation(0, 0, -0.5)

   local transform = view * projection

   shader:send("texture_sampler", texture)

   rotation = rotation + 0.01

   love.graphics.setShader(shader)
   love.graphics.setDepthMode("less", true)

   draw_nodes(scene_test.descriptor.nodes, transform)
end
