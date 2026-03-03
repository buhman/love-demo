local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar

local collada_types = require 'collada_types'
local random_data = require 'random_data'

local pixel_color_data = love.filesystem.newFileData("pixel_color.glsl")
local pixel_shadow_data = love.filesystem.newFileData("pixel_shadow.glsl")
local vertex_static_data = love.filesystem.newFileData("vertex_static.glsl")
local vertex_skinned_data = love.filesystem.newFileData("vertex_skinned.glsl")
local shader_color_static = love.graphics.newShader(pixel_color_data, vertex_static_data)
local shader_color_skinned = love.graphics.newShader(pixel_color_data, vertex_skinned_data)
local shader_shadow_static = love.graphics.newShader(pixel_shadow_data, vertex_static_data)
local shader_shadow_skinned = love.graphics.newShader(pixel_shadow_data, vertex_skinned_data)

local vertex_screen = love.filesystem.newFileData("vertex_screen.glsl")
local pixel_ssao = love.filesystem.newFileData("pixel_ssao.glsl")
local shader_ssao = love.graphics.newShader(pixel_ssao, vertex_screen)

local pixel_clear = love.filesystem.newFileData("pixel_clear.glsl")
shader_clear = love.graphics.newShader(pixel_clear, vertex_screen)

local pixel_blur = love.filesystem.newFileData("pixel_blur.glsl")
local shader_blur = love.graphics.newShader(pixel_blur, vertex_screen)

local pixel_shade = love.filesystem.newFileData("pixel_shade.glsl")
local shader_shade = love.graphics.newShader(pixel_shade, vertex_screen)

local noise_texture = random_data.generate_noise_texture(4, 4)
local ssao_kernel_shaderstorage_buffer = random_data.generate_ssao_kernel(64)

local global_parameters = require "global_parameters"

local shader_set = {
   shadow = {
      static = shader_shadow_static,
      skinned = shader_shadow_skinned,
   },
   color = {
      static = shader_color_static,
      skinned = shader_color_skinned,
   },
}

local send_material
local current_shader_set
local current_shader

local images_textures = {}
local node_instances = {}

local collada_scene

local index_buffer

collada_scene = {
   load_buffers = function(idx_path, vtx_path, vjw_path)
      ----------------------------------------------------------------------
      -- index buffer
      ----------------------------------------------------------------------

      local index_data = love.filesystem.newFileData(idx_path)
      index_buffer = love.graphics.newBuffer("uint32", index_data, { index = true, usage = "static" })

      ----------------------------------------------------------------------
      -- vertex shader storage buffer
      ----------------------------------------------------------------------

      local vtx_format = {
         { name = 'Position', format = 'floatvec4' },
         { name = 'Normal', format = 'floatvec4' },
         { name = 'Texture', format = 'floatvec4' },
      }
      local vtx_data = love.filesystem.newFileData(vtx_path)
      local vtx_shaderstorage_buffer = love.graphics.newBuffer(vtx_format, vtx_data, { shaderstorage = true, usage = "static" })

      local vjw_format = {
         { name = 'Joint', format = 'int32vec4' },
         { name = 'Weight', format = 'floatvec4' },
      }
      shader_color_static:send("VertexPNTLayout", vtx_shaderstorage_buffer)
      shader_color_skinned:send("VertexPNTLayout", vtx_shaderstorage_buffer)
      shader_shadow_static:send("VertexPNTLayout", vtx_shaderstorage_buffer)
      shader_shadow_skinned:send("VertexPNTLayout", vtx_shaderstorage_buffer)

      local vjw_data = love.filesystem.newFileData(vjw_path)
      if vjw_data:getSize() ~= 0 then
         local vjw_shaderstorage_buffer = love.graphics.newBuffer(vjw_format, vjw_data, { shaderstorage = true, usage = "static" })
         shader_color_skinned:send("VertexJWLayout", vjw_shaderstorage_buffer)
         shader_shadow_skinned:send("VertexJWLayout", vjw_shaderstorage_buffer)
      end
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
         current_shader:send(color_uniform, color_or_texture.color)
      elseif color_or_texture.type == collada_types.color_or_texture_type.TEXTURE then
         current_shader:send(sampler_uniform, images_textures[color_or_texture.texture.image_index])
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
         current_shader:send("shininess", effect.blinn.shininess);
      elseif effect.type == collada_types.effect_type.LAMBERT then
         collada_scene.set_color_or_texture(effect.lambert.emission, "emission_color", "emission_sampler");
         collada_scene.set_color_or_texture(effect.lambert.ambient, "ambient_color", "ambient_sampler");
         collada_scene.set_color_or_texture(effect.lambert.diffuse, "diffuse_color", "diffuse_sampler");
      elseif effect.type == collada_types.effect_type.PHONG then
         collada_scene.set_color_or_texture(effect.phong.emission, "emission_color", "emission_sampler");
         collada_scene.set_color_or_texture(effect.phong.ambient, "ambient_color", "ambient_sampler");
         collada_scene.set_color_or_texture(effect.phong.diffuse, "diffuse_color", "diffuse_sampler");
         collada_scene.set_color_or_texture(effect.phong.specular, "specular_color", "specular_sampler");
         current_shader:send("shininess", effect.phong.shininess);
      elseif effect.type == collada_types.effect_type.CONSTANT then
         current_shader:send("emission_color", effect.constant.color)
      else
         assert(false)
      end

      local texture_channel = {
         instance_material.emission.input_set,
         instance_material.ambient.input_set,
         instance_material.diffuse.input_set,
         instance_material.specular.input_set,
      }
      current_shader:send("texture_channel", texture_channel)
   end,

   draw_geometry = function(geometry, instance_materials)
      local mesh = geometry.mesh
      local base_index_buffer_offset = mesh.index_buffer_offset / 4

      for _, instance_material in ipairs(instance_materials) do
         if send_material then
            collada_scene.set_instance_material(instance_material)
         end
         local triangles = mesh.triangles[instance_material.element_index + 1]

         local index_offset = base_index_buffer_offset + triangles.index_offset
         local index_count = triangles.count * 3

         local vertex_offset = mesh.vertex_buffer_offset / (4 * 4 * 3)
         current_shader:send("VertexPNTOffset", vertex_offset)
         love.graphics.drawFromShader(index_buffer, index_count, 1, 1 + index_offset)
      end
   end,

   draw_instance_geometries = function(instance_geometries)
      for _, instance_geometry in ipairs(instance_geometries) do
         collada_scene.draw_geometry(instance_geometry.geometry, instance_geometry.instance_materials)
      end
   end,

   draw_skin = function(skin, instance_materials)
      local mesh = skin.geometry.mesh
      local base_index_buffer_offset = mesh.index_buffer_offset / 4

      for _, instance_material in ipairs(instance_materials) do
         collada_scene.set_instance_material(instance_material)
         local triangles = mesh.triangles[instance_material.element_index + 1]

         local index_offset = base_index_buffer_offset + triangles.index_offset
         local index_count = triangles.count * 3

         local mesh_vertex_offset = mesh.vertex_buffer_offset / (4 * 4 * 3)
         current_shader:send("VertexPNTOffset", mesh_vertex_offset)
         local skin_vertex_offset = skin.vertex_buffer_offset / (4 * 4 * 2)
         current_shader:send("VertexJWOffset", skin_vertex_offset)

         love.graphics.drawFromShader(index_buffer, index_count, 1, 1 + index_offset)
      end
   end,

   draw_instance_controllers = function(node_state, instance_controllers)
      for _, instance_controller in ipairs(instance_controllers) do
         local skin = instance_controller.controller.skin

         local joints = {}

         for joint_index = 1, instance_controller.joint_count do
            local ibm = mat4.load_table(skin.inverse_bind_matrices[joint_index])
            local node_index = instance_controller.joint_node_indices[joint_index]
            local node_instance = node_state.node_instances[node_index]

            joints[joint_index] = ibm * node_instance.world
         end

         --shader:send("Joints", "column",
         --joints[1]:data(),
         --joints[2]:data(),
         --joints[3]:data())
         current_shader:send("Joints", "column",
                             mat4.store_table(joints[1]),
                             mat4.store_table(joints[2]),
                             mat4.store_table(joints[3]))

         collada_scene.draw_skin(instance_controller.controller.skin,
                                 instance_controller.instance_materials)
      end
   end,

   draw_node = function(node_state, projection, view, light_transform, node, node_instance)
      if node.type ~= collada_types.node_type.NODE then
         return
      end

      if node.instance_geometries_count == 0 and node.instance_controllers_count == 0 then
         return
      end

      local world = node_instance.world
      view_transform = world * view
      transform = view_transform * projection
      light_transform = world * light_transform

      if node.instance_geometries_count > 0 then
         current_shader = current_shader_set.static
         love.graphics.setShader(current_shader)
         --current_shader:send("projection", "column", projection:data())
         current_shader:send("view_transform", "column", view_transform:data())
         current_shader:send("world_transform", "column", world:data())
         current_shader:send("light_transform", "column", light_transform:data())
         current_shader:send("transform", "column", transform:data())
         collada_scene.draw_instance_geometries(node.instance_geometries)
      end

      if node.instance_controllers_count > 0 then
         current_shader = current_shader_set.skinned
         love.graphics.setShader(current_shader)
         current_shader:send("world_transform", "column", world:data())
         current_shader:send("light_transform", "column", light_transform:data())
         current_shader:send("transform", "column", transform:data())
         collada_scene.draw_instance_controllers(node_state, node.instance_controllers)
      end
   end,

   draw_nodes = function(node_state, projection, view, light_transform)
      local node_index = 0
      for _, node in ipairs(node_state.nodes) do
         local node_instance = node_state.node_instances[node_index]
         collada_scene.draw_node(node_state, projection, view, light_transform, node, node_instance)
         node_index = node_index + 1
      end
   end,

   draw_scene = function(node_state, perspective_projection, orthographic_projection)
      local camera_world = node_state.node_instances[node_state.camera].world
      local view_position = vec3.transform(vec3._zero, camera_world)

      local camera_target_world = node_state.node_instances[node_state.camera_target].world
      local view_target_position = vec3.transform(vec3._zero, camera_target_world)

      local light_world = node_state.node_instances[node_state.light].world
      local light_position = vec3.transform(vec3._zero, light_world)

      local up = vec3(0, 0, 1)

      local view = mat4.look_at_rh(view_position, view_target_position, up)
      local transform = view * perspective_projection

      local light_view = mat4.look_at_rh(light_position, vec3._zero, up)
      local light_transform = light_view * orthographic_projection

      ----------------------------------------------------------------------
      -- shadow
      ----------------------------------------------------------------------

      if false then
         love.graphics.setCanvas({g_shadow_canvas, depth=true})
         love.graphics.clear({0.0, 0.0, 0.0, 1.0})
         current_shader_set = shader_set.shadow
         send_material = false
         love.graphics.setDepthMode("less", true)
         collada_scene.draw_nodes(node_state, light_transform, light_transform)
      end

      ----------------------------------------------------------------------
      -- color
      ----------------------------------------------------------------------

      shader_color_static:send("view_position", view_position:data())
      shader_color_static:send("light_position", light_position:data())
      --shader_color_static:send("shadow_sampler", g_shadow_canvas)

      shader_color_skinned:send("view_position", view_position:data())
      shader_color_skinned:send("light_position", light_position:data())
      --shader_color_skinned:send("shadow_sampler", g_shadow_canvas)

      love.graphics.setCanvas({g_color_canvas, g_position_canvas, g_normal_canvas, depth=true})
      --love.graphics.setCanvas()
      --love.graphics.clear({0.0, 0.0, 0.0, 1.0})
      --love.graphics.clear({0, 0, 0, 1.0}, {0, 0, 0, 1.0}, {0, 0, 0, 1.0}, 255, 0)
      love.graphics.setDepthMode("always", true)
      love.graphics.setShader(shader_clear)
      love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)

      current_shader_set = shader_set.color
      send_material = true
      love.graphics.setDepthMode("greater", true)
      collada_scene.draw_nodes(node_state, perspective_projection, view, light_transform)

      ----------------------------------------------------------------------
      -- ssao
      ----------------------------------------------------------------------

      if true then
         love.graphics.setCanvas({g_occlusion_canvas_a, depth=false})
         love.graphics.setShader(shader_ssao)
         shader_ssao:send("projection", "column", perspective_projection:data())
         --shader_ssao:send("g_color_sampler", g_color_canvas)
         shader_ssao:send("g_position_sampler", g_position_canvas)
         shader_ssao:send("g_normal_sampler", g_normal_canvas)
         shader_ssao:send("noise_sampler", noise_texture)
         shader_ssao:send("SSAOKernelLayout", ssao_kernel_shaderstorage_buffer)

         shader_ssao:send("bias", global_parameters.ssao.bias)
         shader_ssao:send("radius", global_parameters.ssao.radius)
         shader_ssao:send("occlusion_exponent", global_parameters.ssao.occlusion_exponent)
         shader_ssao:send("occlusion_offset", global_parameters.ssao.occlusion_offset)

         shader_ssao:send("bias1", global_parameters.ssao.bias1)
         shader_ssao:send("radius1", global_parameters.ssao.radius1)
         shader_ssao:send("occlusion_exponent1", global_parameters.ssao.occlusion_exponent1)
         shader_ssao:send("occlusion_offset1", global_parameters.ssao.occlusion_offset1)

         love.graphics.setDepthMode("always", false)
         love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)
      end

      if true then
         love.graphics.setShader(shader_blur)
         for i = 1, 2 do
            shader_blur:send("g_occlusion_sampler", g_occlusion_canvas_a)
            shader_blur:send("inverse_screen_size", {1.0 / 1024.0, 1.0 / 1024.0})
            shader_blur:send("dir", {1, 0})
            love.graphics.setDepthMode("always", false)
            love.graphics.setCanvas({g_occlusion_canvas_b, depth=false})
            love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)

            shader_blur:send("g_occlusion_sampler", g_occlusion_canvas_b)
            shader_blur:send("dir", {0, 1})
            love.graphics.setCanvas({g_occlusion_canvas_a, depth=false})
            love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)
         end
      end

      shader_shade:send("g_occlusion_sampler", g_occlusion_canvas_a)
      shader_shade:send("g_color_sampler", g_color_canvas)
      love.graphics.setDepthMode("always", false)
      love.graphics.setCanvas()
      love.graphics.setShader(shader_shade)
      love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)
   end,
}

return {
   draw_nodes = collada_scene.draw_nodes,
   draw_scene = collada_scene.draw_scene,
   load_buffers = collada_scene.load_buffers,
   load_node_instances = collada_scene.load_node_instances,
   load_images = collada_scene.load_images,
   update = collada_scene.update,
}
