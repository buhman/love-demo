local rotation
local texture

local ffi = require 'ffi'
local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar
local scene_test = require 'scene.test.test'
local collada_scene = require 'collada_scene'
local collada_scene_animate = require 'collada_scene.animate'
local collada_scene_node_state = require 'collada_scene.node_state'

local node_state

function love.load(args)
   love.window.setMode(1024, 1024, {depth=true})

   collada_scene.load_buffers()
   collada_scene.load_images("scene/test", scene_test.descriptor.images)

   node_state = collada_scene_node_state(scene_test.descriptor.nodes)
end

local rotation = 0.0
local t = 0.0

function love.draw()
   local radius = 100
   local mx, my = love.mouse.getPosition()

   width, height = love.graphics.getDimensions()

   local aspect_ratio = width / height
   local projection = mat4.perspective_fov_rh(scalar.convert_to_radians(45 / 2),
                                              aspect_ratio,
                                              0.1,
                                              1000.0)

   local view = mat4.look_at_rh(vec3(-88.57101, -71.71298, 104.5738),
                                vec3(-19.90239, -27.72767, 54.6898),
                                vec3(0, 0, 1))

   local world1 = mat4.rotation_x(rotation)
   local world2 = mat4.rotation_z(rotation * 0.5)
   --local world3 = mat4.translation(0, 0, -0.5)

   local transform = view * projection

   collada_scene_animate.update(t, node_state)
   t = t + 0.016

   love.graphics.setDepthMode("less", true)
   collada_scene.draw_nodes(node_state, transform)
end
