local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar

local collada_types = require 'collada_types'

local pixel_data = love.filesystem.newFileData("pixel.glsl")
local vertex_data = love.filesystem.newFileData("vertex.glsl")
local shader = love.graphics.newShader(pixel_data, vertex_data)

local images_textures = {}
local node_instances = {}

local collada_scene

local index_buffer

collada_scene = {
   load_buffers = function()
      ----------------------------------------------------------------------
      -- index buffer
      ----------------------------------------------------------------------

      local index_data = love.filesystem.newFileData("scene/noodle/noodle.idx")
      index_buffer = love.graphics.newBuffer("uint32", index_data, { index = true, usage = "static" })

      ----------------------------------------------------------------------
      -- vertex shader storage buffer
      ----------------------------------------------------------------------

      local format = {
         { name = 'Position', format = 'floatvec4' },
         { name = 'Normal', format = 'floatvec4' },
         { name = 'Texture', format = 'floatvec4' },
      }
      local vertex_data = love.filesystem.newFileData("scene/noodle/noodle.vtx")
      local shaderstorage_buffer = love.graphics.newBuffer(format, vertex_data, { shaderstorage = true, usage = "static" })
      shader:send("VertexLayout", shaderstorage_buffer)
   end,

   load_images = function(base_path, images)
      local image_index = 0
      for _, image in ipairs(images) do
         assert(string.sub(image.uri, 1, 1) == ".")
         path = base_path .. string.sub(image.uri, 2)
         print("load image", path)
         local image_data = love.image.newImageData(path)
         local texture = love.graphics.newTexture(image_data)
         images_textures[image_index] = texture
         image_index = image_index + 1
      end
   end,

   set_color_or_texture = function(color_or_texture, color_uniform, sampler_uniform)
      if color_or_texture.type == collada_types.color_or_texture_type.COLOR then
         shader:send(color_uniform, color_or_texture.color)
      elseif color_or_texture.type == collada_types.color_or_texture_type.TEXTURE then
         shader:send(sampler_uniform, images_textures[color_or_texture.texture.image_index])
      else
         assert(false)
      end
   end,

   set_instance_material = function(instance_material)
      local effect = instance_material.material.effect

      if effect.type == collada_types.effect_type.BLINN then
         collada_scene.set_color_or_texture(effect.blinn.emission, "emission_color", "emission_sampler");
         collada_scene.set_color_or_texture(effect.blinn.ambient, "ambient_color", "ambient_sampler");
         collada_scene.set_color_or_texture(effect.blinn.diffuse, "diffuse_color", "diffuse_sampler");
         collada_scene.set_color_or_texture(effect.blinn.specular, "specular_color", "specular_sampler");
         shader:send("shininess", effect.blinn.shininess);
      elseif effect.type == collada_types.effect_type.LAMBERT then
         collada_scene.set_color_or_texture(effect.lambert.emission, "emission_color", "emission_sampler");
         collada_scene.set_color_or_texture(effect.lambert.ambient, "ambient_color", "ambient_sampler");
         collada_scene.set_color_or_texture(effect.lambert.diffuse, "diffuse_color", "diffuse_sampler");
      elseif effect.type == collada_types.effect_type.PHONG then
         collada_scene.set_color_or_texture(effect.phong.emission, "emission_color", "emission_sampler");
         collada_scene.set_color_or_texture(effect.phong.ambient, "ambient_color", "ambient_sampler");
         collada_scene.set_color_or_texture(effect.phong.diffuse, "diffuse_color", "diffuse_sampler");
         collada_scene.set_color_or_texture(effect.phong.specular, "specular_color", "specular_sampler");
         shader:send("shininess", effect.phong.shininess);
      elseif effect.type == collada_types.effect_type.CONSTANT then
         shader:send("emission_color", effect.constant.color)
      else
         assert(false)
      end

      local texture_channel = {
         instance_material.emission.input_set,
         instance_material.ambient.input_set,
         instance_material.diffuse.input_set,
         instance_material.specular.input_set,
      }
      shader:send("texture_channel", texture_channel)
   end,

   draw_geometry = function(geometry, instance_materials)
      local base_index_buffer_offset = geometry.mesh.index_buffer_offset / 4

      for _, instance_material in ipairs(instance_materials) do
         collada_scene.set_instance_material(instance_material)
         local triangles = geometry.mesh.triangles[instance_material.element_index + 1]

         local index_offset = base_index_buffer_offset + triangles.index_offset
         local index_count = triangles.count * 3

         local vertex_offset = geometry.mesh.vertex_buffer_offset / (4 * 4 * 3)
         shader:send("VertexOffset", vertex_offset)
         love.graphics.drawFromShader(index_buffer, index_count, 1, 1 + index_offset)
      end
   end,

   draw_node = function(node, node_instance, transform)
      if node.type ~= collada_types.node_type.NODE then
         return
      end

      if node.instance_geometries_count == 0 and node.instance_controllers_count == 0 then
         return
      end

      local world = node_instance.world
      transform = world * transform
      shader:send("world_transform", "column", world.data)
      shader:send("transform", "column", transform.data)

      for _, instance_geometry in ipairs(node.instance_geometries) do
         collada_scene.draw_geometry(instance_geometry.geometry, instance_geometry.instance_materials)
      end
   end,

   draw_nodes = function(node_state, transform)
      love.graphics.setShader(shader)
      shader:send("view_position", {-88.57101, -71.71298, 104.5738, 1.0})
      shader:send("light_position", {0.0, -56.804, 58.237, 1.0})

      local node_index = 0
      for _, node in ipairs(node_state.nodes) do
         local node_instance = node_state.node_instances[node_index]
         collada_scene.draw_node(node, node_instance, transform)
         node_index = node_index + 1
      end
   end,
}

return {
   draw_nodes = collada_scene.draw_nodes,
   load_buffers = collada_scene.load_buffers,
   load_node_instances = collada_scene.load_node_instances,
   load_images = collada_scene.load_images,
   update = collada_scene.update,
}
