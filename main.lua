local rotation
local texture

local ffi = require 'ffi'
local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar
local collada_scene = require 'collada_scene'
local collada_scene_animate = require 'collada_scene.animate'
local collada_scene_node_state = require 'collada_scene.node_state'

local scene_test = require 'scene.test.test'
local scene_noodle = require 'scene.noodle.noodle'
local scene_sci_fi_ship = require 'scene.sci_fi_ship.sci_fi_ship'
local scene_shadow_test = require 'scene.shadow_test.shadow_test'

local font = require 'font'
local terminus_font

local update_global_parameters = require "update_global_parameters"

local scenes = {
   sci_fi_ship = {
      descriptor = scene_sci_fi_ship.descriptor,
      image_path = "scene/sci_fi_ship",
      idx_path = "scene/sci_fi_ship/sci_fi_ship.idx",
      vtx_path = "scene/sci_fi_ship/sci_fi_ship.vtx",
      vjw_path = "scene/sci_fi_ship/sci_fi_ship.vjw",
   },
   shadow_test = {
      descriptor = scene_shadow_test.descriptor,
      image_path = "scene/shadow_test",
      idx_path = "scene/shadow_test/shadow_test.idx",
      vtx_path = "scene/shadow_test/shadow_test.vtx",
      vjw_path = "scene/shadow_test/shadow_test.vjw",
   },
}

local node_state

--local screen_index_buffer
local screen_shader

local load_screen_index_buffer = function()
   local screen_index_data = love.data.newByteData(3 * 2 * 4)
   local ptr = ffi.cast('uint32_t*', screen_index_data:getFFIPointer())
   ptr[0] = 0
   ptr[1] = 1
   ptr[2] = 2

   ptr[3] = 0
   ptr[4] = 2
   ptr[5] = 3
   screen_index_buffer = love.graphics.newBuffer("uint32", screen_index_data, { index = true, usage = "static" })
end

local load_screen_shader = function()
   load_screen_index_buffer()

   local pixel_data = love.filesystem.newFileData("pixel_screen.glsl")
   local vertex_data = love.filesystem.newFileData("vertex_screen.glsl")
   screen_shader = love.graphics.newShader(pixel_data, vertex_data)
end

function init()
   love.window.setMode(1024, 1024, {depth=true, resizable=false})

   local scene = scenes.sci_fi_ship
   collada_scene.load_buffers(scene.idx_path, scene.vtx_path, scene.vjw_path)
   collada_scene.load_images(scene.image_path, scene.descriptor.images)
   node_state = collada_scene_node_state(scene.descriptor.nodes)
   node_state:set_camera("node_camera001", "node_camera001_target")
   node_state:set_light("node_direct001")

   ----------------------------------------------------------------------
   -- canvas
   ----------------------------------------------------------------------

   g_position_canvas = love.graphics.newCanvas(1024, 1024, {format = "rgba32f"})
   g_normal_canvas = love.graphics.newCanvas(1024, 1024, {format = "rgba32f"})
   g_color_canvas = love.graphics.newCanvas(1024, 1024, {format = "rgba32f"})
   g_occlusion_canvas_a = love.graphics.newCanvas(1024, 1024, {format = "rg32f"})
   g_occlusion_canvas_b = love.graphics.newCanvas(1024, 1024, {format = "rg32f"})

   g_shadow_canvas = love.graphics.newCanvas(2048, 2048, {format = "r32f"})

   load_screen_shader()

   terminus_font = font.load_font(font.fonts.ter_10x18)
end

local rotation = 0.0
local t = 0.0

local update = function(dt)

   collada_scene_animate.update(t, node_state)
   t = t + 0.016 * 0.1

   rotation = rotation + 0.01
end

local draw = function()
   width, height = love.graphics.getDimensions()
   local aspect_ratio = width / height
   local perspective_projection = mat4.perspective_fov_rh(scalar.convert_to_radians(45 * 0.5),
                                                          aspect_ratio,
                                                          1,
                                                          0.1)
                                                          --0.1,
                                                          --10000.0)

   local orthographic_projection = mat4.orthographic_rh(300, 300, 200, 400.0)

   love.graphics.setBlendMode("replace", "premultiplied")
   collada_scene.draw_scene(node_state, perspective_projection, orthographic_projection)

   update_global_parameters.draw(terminus_font)
end

local keypressed = function(key, scancode, isrepeat)
   --print(key, scancode, isrepeat)
   if key == "q" then
      update_global_parameters.update_parameter(function(v) return v - 0.01 end)
   elseif key == "w" then
      update_global_parameters.update_parameter(function(v) return v + 0.01 end)
   elseif key == "a" then
      update_global_parameters.update_parameter(function(v) return v - 0.1 end)
   elseif key == "s" then
      update_global_parameters.update_parameter(function(v) return v + 0.1 end)
   elseif key == "z" then
      update_global_parameters.update_parameter(function(v) return v - 1.0 end)
   elseif key == "x" then
      update_global_parameters.update_parameter(function(v) return v + 1.0 end)
   elseif key == "up" then
      update_global_parameters.update_current_ix(function(v) return v - 1 end)
   elseif key == "down" then
      update_global_parameters.update_current_ix(function(v) return v + 1 end)
   else
      print(key)
   end
end

function love.run()
   init()

   love.timer.step()

   return function()
      love.event.pump()
      for name, a,b,c,d,e,f,g,h in love.event.poll() do
         --print(name)
         if name == "quit" then
            if c or not love.quit or not love.quit() then
               return a or 0, b
            end
         end
         if name == "keypressed" then
            keypressed(a, b, c)
         end
         --love.handlers[name](a,b,c,d,e,f,g,h)
      end

      local dt = love.timer.step()
      update(dt)
      draw()
      love.graphics.present()
      love.timer.sleep(0.001)
   end
end
