local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4
local scalar = _math.scalar

local collada_types = require 'collada_types'

local fract = function(f)
   return f - math.floor(f)
end

local loop = function(f, n)
   return fract(f / n) * n
end

local find_frame_ix = function(source, t)
   for i = 1, source.count - 1 do
      if source.float_array[i] <= t and source.float_array[i+1] > t then
         return i - 1 -- 0-based index
      end
   end
   return -1
end

local linear_interpolate_iv = function(source, frame_ix, t)
   local prev = source.float_array[(frame_ix + 0) * source.stride + 1]
   local next = source.float_array[(frame_ix + 1) * source.stride + 1]
   return (t - prev) / (next - prev)
end

local linear_interpolate_value = function(source, frame_ix, parameter_ix, iv)
   local prev = source.float_array[(frame_ix + 0) * source.stride + parameter_ix + 1]
   local next = source.float_array[(frame_ix + 1) * source.stride + parameter_ix + 1]
   return prev + iv * (next - prev)
end


local pow3 = function(f)
   return f * f * f
end

local pow2 = function(f)
   return f * f
end

local bezier = function(p0, c0, c1, p1, s)
   return
        (p0 * pow3(1 - s))
      + (c0 * 3 * s * pow2(1 - s))
      + (c1 * 3 * pow2(s) * (1 - s))
      + (p1 * pow3(s))
end

local bezier_binary_search = function(p0, c0, c1, p1, want)
   local low = 0.0
   local high = 1.0

   local iterations = 0
   while iterations < 20 do
      iterations = iterations + 1

      local s = (high + low) * 0.5
      local bs = bezier(p0, c0, c1, p1, s)
      local t = vec2.get_x(bs)

      local epsilon = 0.001
      if (math.abs(t - want) < epsilon) then
         return vec2.get_y(bs)
      end

      if t > want then
        high = s
      else
        low = s
      end
   end

   print(vec2.get_x(p0), vec2.get_y(p0))
   print(vec2.get_x(c0), vec2.get_y(c0))
   print(vec2.get_x(c1), vec2.get_y(c1))
   print(vec2.get_x(p1), vec2.get_y(p1))
   assert(false)
end

local tangent_index = function(source, frame_ix, parameter_ix)
   local ix = frame_ix * source.stride + parameter_ix * 2
   x = source.float_array[ix + 0 + 1]
   y = source.float_array[ix + 1 + 1]
   return {x, y}
end

local bezier_sampler = function(sampler, frame_ix, parameter_ix, t)
   -- P0 is (INPUT[i] , OUTPUT[i])
   -- C0 (or T0) is (OUT_TANGENT[i][0] , OUT_TANGENT[i][1])
   -- C1 (or T1) is (IN_TANGENT[i+1][0], IN_TANGENT[i+1][1])
   -- P1 is (INPUT[i+1], OUTPUT[i+1])

   local frame0_input = sampler.input.float_array[frame_ix + 0 + 1]
   local frame1_input = sampler.input.float_array[frame_ix + 1 + 1]

   local frame0_output = sampler.output.float_array[(frame_ix + 0) * sampler.output.stride + parameter_ix + 1]
   local frame1_output = sampler.output.float_array[(frame_ix + 1) * sampler.output.stride + parameter_ix + 1]

   local p0 = vec2(frame0_input, frame0_output)
   local c0 = vec2.load_table(tangent_index(sampler.out_tangent, frame_ix + 0, parameter_ix))
   local c1 = vec2.load_table(tangent_index(sampler.in_tangent, frame_ix + 1, parameter_ix))
   local p1 = vec2(frame1_input, frame1_output)

   return bezier_binary_search(p0, c0, c1, p1, t)
end


local apply_transform_target = function(transform, channel_target_attribute, value)
   if transform.type == collada_types.transform_type.TRANSLATE or transform.type == collada_types.transform_type.SCALE then
      if channel_target_attribute == collada_types.target_attribute.X then
         transform.value = vec3.set_x(transform.value, value)
      elseif channel_target_attribute == collada_types.target_attribute.Y then
         transform.value = vec3.set_y(transform.value, value)
      elseif channel_target_attribute == collada_types.target_attribute.Z then
         transform.value = vec3.set_z(transform.value, value)
      else
         assert(false)
      end
   elseif transform.type == collada_types.transform_type.ROTATE then
      if channel_target_attribute == collada_types.target_attribute.X then
         transform.value = vec4.set_x(transform.value, value)
      elseif channel_target_attribute == collada_types.target_attribute.Y then
         transform.value = vec4.set_y(transform.value, value)
      elseif channel_target_attribute == collada_types.target_attribute.Z then
         transform.value = vec4.set_z(transform.value, value)
      elseif channel_target_attribute == collada_types.target_attribute.ANGLE then
         transform.value = vec4.set_w(transform.value, value)
      else
         assert(false)
      end
   else
      assert(false)
   end
end

local animate_channel_segment = function(channel, transform, frame_ix, t)
   local target_attributes = {channel.target_attribute}
   if channel.target_attribute == collada_types.target_attribute.ALL then
      if transform.type == collada_types.transform_type.TRANSLATE or transform.type == collada_types.transform_type.SCALE then
         target_attributes = translate_scale_target_attributes
      elseif transform.type == collada_types.transform_type.ROTATE then
         target_attributes = rotate_target_attributes
      else
         assert(false)
      end
   end

   target_attributes_count = #target_attributes

   -- parameter_ix: 0-based index
   for parameter_ix = 0, target_attributes_count-1 do
      local interpolation = channel.source_sampler.interpolation.interpolation_array[frame_ix]
      local value
      if interpolation == collada_types.interpolation.BEZIER then
         value = bezier_sampler(channel.source_sampler, frame_ix, parameter_ix, t)
      else
         local iv = linear_interpolate_iv(channel.source_sampler.input, frame_ix, t)
         value = linear_interpolate_value(channel.source_sampler.output, frame_ix, parameter_ix, iv)
      end

      apply_transform_target(transform, target_attributes[parameter_ix + 1], value)
   end
end

local animate_node = function(node, node_instance, t)
   for _, channel in ipairs(node.channels) do
      local transform = node_instance.transforms[channel.target_transform_index]
      assert(transform ~= nil)
      -- frame_ix: 0-based index
      local frame_ix = find_frame_ix(channel.source_sampler.input, t)
      assert(frame_ix >= 0)
      animate_channel_segment(channel, transform, frame_ix, t)
   end
end

local update = function(_t, node_state)
   local t = loop(_t / 2.0, 3.333333)

   local node_index = 0
   for _, node in ipairs(node_state.nodes) do
      node_instance = node_state.node_instances[node_index]

      animate_node(node, node_instance, t)

      local world = node_state:node_instance_world(node, node_instance.transforms)
      node_instance.world = world

      node_index = node_index + 1
   end
end

return {
   update = update,
}
