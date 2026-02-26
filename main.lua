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

local node_state

local g_position_canvas
local g_normal_canvas

local screen_index_buffer
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

   local pixel_data = love.filesystem.newFileData("pixel_sobel.glsl")
   local vertex_data = love.filesystem.newFileData("vertex_sobel.glsl")
   screen_shader = love.graphics.newShader(pixel_data, vertex_data)
end

function love.load(args)
   love.window.setMode(1024, 1024, {depth=true, resizable=false})

   local scene = scene_sci_fi_ship

   local idx_path = "scene/sci_fi_ship/sci_fi_ship.idx"
   local vtx_path = "scene/sci_fi_ship/sci_fi_ship.vtx"
   local vjw_path = "scene/sci_fi_ship/sci_fi_ship.vjw"
   collada_scene.load_buffers(idx_path, vtx_path, vjw_path)
   collada_scene.load_images("scene/sci_fi_ship", scene.descriptor.images)
   node_state = collada_scene_node_state(scene.descriptor.nodes)

   ----------------------------------------------------------------------
   -- canvas
   ----------------------------------------------------------------------

   g_position_canvas = love.graphics.newCanvas(1024, 1024, {format = "rgba32f"})
   g_normal_canvas = love.graphics.newCanvas(1024, 1024, {format = "rgba32f"})
   g_color_canvas = love.graphics.newCanvas(1024, 1024, {format = "rgba32f"})

   load_screen_shader()
end

local rotation = 0.0
local t = 0.0

function love.draw()
   local radius = 100
   local mx, my = love.mouse.getPosition()

   width, height = love.graphics.getDimensions()

   local aspect_ratio = width / height
   local projection = mat4.perspective_fov_rh(scalar.convert_to_radians(45 * 0.5),
                                              aspect_ratio,
                                              0.1,
                                              10000.0)

   local view = mat4.look_at_rh(vec3(-630.43401, -528.53392, 474.3912),
                                vec3(0.0, 0.0, 13.41141),
                                vec3(0, 0, 1))

   local world1 = mat4.rotation_z(rotation)
   local world2 = mat4.rotation_z(rotation * 0.5)
   --local world3 = mat4.translation(0, 0, -0.5)
   rotation = rotation + 0.01

   local transform = view * projection

   collada_scene_animate.update(t, node_state)
   t = t + 0.016

   love.graphics.setBlendMode("replace", "premultiplied")
   love.graphics.setDepthMode("less", true)
   love.graphics.setCanvas({
         g_color_canvas,
         g_position_canvas,
         g_normal_canvas,
         depth = true
   })
   love.graphics.clear(
      {0.0, 0.0, 0.0, 1.0},
      {0.0, 0.0, 0.0, 1.0},
      {0.0, 0.0, 0.0, 1.0})
   collada_scene.draw_nodes(node_state, transform)

   love.graphics.setCanvas()
   love.graphics.setShader(screen_shader)
   screen_shader:send("g_normal_sampler", g_normal_canvas)
   screen_shader:send("g_color_sampler", g_color_canvas)
   love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)
end
