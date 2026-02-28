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

function love.load(args)
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

   g_shadow_canvas = love.graphics.newCanvas(2048, 2048, {format = "r32f"})

   load_screen_shader()

   terminus_font = font.load_font(font.fonts.ter_10x18)
end

local rotation = 0.0
local t = 0.0

function love.draw()
   local radius = 100
   local mx, my = love.mouse.getPosition()

   width, height = love.graphics.getDimensions()

   local aspect_ratio = width / height
   local perspective_projection = mat4.perspective_fov_rh(scalar.convert_to_radians(45 * 0.5),
                                                          aspect_ratio,
                                                          1,
                                                          0.1)
                                                          --0.1,
                                                          --10000.0)

   local orthographic_projection = mat4.orthographic_rh(300, 300, 200, 400.0)

   local world1 = mat4.rotation_z(rotation)
   local world2 = mat4.rotation_z(rotation * 0.5)
   --local world3 = mat4.translation(0, 0, -0.5)
   rotation = rotation + 0.01

   collada_scene_animate.update(t, node_state)
   t = t + 0.016 * 0.1

   love.graphics.setBlendMode("replace", "premultiplied")
   collada_scene.draw_scene(node_state, perspective_projection, orthographic_projection)

   -- love.graphics.setCanvas({
   --       g_color_canvas,
   --       g_position_canvas,
   --       g_normal_canvas,
   --       depth = true
   -- })
   -- love.graphics.clear(
   --    {0.0, 0.0, 0.0, 1.0},
   --    {0.0, 0.0, 0.0, 1.0},
   --    {0.0, 0.0, 0.0, 1.0})
   -- collada_scene.draw_nodes(node_state, transform)

   -- love.graphics.setCanvas()
   -- love.graphics.setShader(screen_shader)
   -- screen_shader:send("g_sampler", g_shadow_canvas)
   -- love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)

   font.draw_string(terminus_font, "asdf test 1234", 10, 10)
end
