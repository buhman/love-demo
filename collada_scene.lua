local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar

local collada_types = require 'collada_types'

local geometries_meshes = {}

local pixel_data = love.filesystem.newFileData("pixel.glsl")
local vertex_data = love.filesystem.newFileData("vertex.glsl")
local shader = love.graphics.newShader(pixel_data, vertex_data)

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

function set_color_or_texture(color_or_texture, color_uniform, sampler_uniform)
   if color_or_texture.type == collada_types.color_or_texture_type.COLOR then
      shader:send(color_uniform, color_or_texture.color)
   elseif color_or_texture.type == collada_types.color_or_texture_type.TEXTURE then
      assert(false)
      --shader:send(sampler_uniform, )
   else
      assert(false)
   end
end

function set_instance_material(instance_material)
   effect = instance_material.material.effect

   if effect.type == collada_types.effect_type.BLINN then
      set_color_or_texture(effect.blinn.emission, "emission_color", "emission_sampler");
      set_color_or_texture(effect.blinn.ambient, "ambient_color", "ambient_sampler");
      set_color_or_texture(effect.blinn.diffuse, "diffuse_color", "diffuse_sampler");
      set_color_or_texture(effect.blinn.specular, "specular_color", "specular_sampler");
      shader:send("shininess", effect.blinn.shininess);
   elseif effect.type == collada_types.effect_type.LAMBERT then
      set_color_or_texture(effect.lambert.emission, "emission_color", "emission_sampler");
      set_color_or_texture(effect.lambert.ambient, "ambient_color", "ambient_sampler");
      set_color_or_texture(effect.lambert.diffuse, "diffuse_color", "diffuse_sampler");
   elseif effect.type == collada_types.effect_type.PHONG then
      set_color_or_texture(effect.phong.emission, "emission_color", "emission_sampler");
      set_color_or_texture(effect.phong.ambient, "ambient_color", "ambient_sampler");
      set_color_or_texture(effect.phong.diffuse, "diffuse_color", "diffuse_sampler");
      set_color_or_texture(effect.phong.specular, "specular_color", "specular_sampler");
      shader:send("shininess", effect.phong.shininess);
   elseif effect.type == collada_types.effect_type.CONSTANT then
      shader:send("emission_color", effect.constant.color)
   else
      assert(false)
   end
end

function draw_geometry(geometry, instance_materials)
   local base_index_buffer_offset = geometry.mesh.index_buffer_offset / 4

   local mesh = geometries_meshes[geometry]

   for _, instance_material in ipairs(instance_materials) do
      set_instance_material(instance_material)
      local triangles = geometry.mesh.triangles[instance_material.element_index + 1]

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
   shader:send("world_transform", "column", world.data)
   shader:send("transform", "column", transform.data)

   for _, instance_geometry in ipairs(node.instance_geometries) do
      draw_geometry(instance_geometry.geometry, instance_geometry.instance_materials)
   end
end

function draw_nodes(nodes, transform)
   love.graphics.setShader(shader)
   shader:send("view_position", {-88.57101, -71.71298, 104.5738, 1.0})
   shader:send("light_position", {0.0, -56.804, 58.237, 1.0})

   local node_index = 0
   for _, node in ipairs(nodes) do
      draw_node(node_index, node, transform)
      node_index = node_index + 1
   end
end

return {
   draw_nodes = draw_nodes
}
