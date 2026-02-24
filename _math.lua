local ffi = require 'ffi'

local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt
local abs = math.abs

local mat4
local vec3
local vec4
local scalar

scalar = {
   near_equal = function(s1, s2, epsilon)
      local d = abs(s1 - s2)
      return d <= epsilon
   end,

   convert_to_radians = function(degrees)
      return degrees * (math.pi / 180.0)
   end,

   convert_to_degrees = function(radians)
      return radians * (180.0 / math.pi)
   end,
}

setmetatable(scalar, scalar)

mat4 = {
   __call = function(_t)
      -- newByteData is zero-initialized
      local data = love.data.newByteData(16 * 4)
      local m = ffi.cast('float*', data:getFFIPointer())
      local value = {
         data = data,
         m = m,
      }
      setmetatable(value, mat4)
      return value
   end,

   __mul = function(M1, M2)
      return mat4.multiply(M1, M2)
   end,

   load_table = function(t)
      assert(#t == 16)
      assert(t[1] ~= nil)
      assert(t[2] ~= nil)
      assert(t[3] ~= nil)
      assert(t[4] ~= nil)
      assert(t[5] ~= nil)
      assert(t[6] ~= nil)
      assert(t[7] ~= nil)
      assert(t[8] ~= nil)
      assert(t[9] ~= nil)
      assert(t[10] ~= nil)
      assert(t[11] ~= nil)
      assert(t[12] ~= nil)
      assert(t[13] ~= nil)
      assert(t[14] ~= nil)
      assert(t[15] ~= nil)
      assert(t[16] ~= nil)
      return mat4.set(t[1], t[2], t[3], t[4],
                      t[5], t[6], t[7], t[8],
                      t[9], t[10], t[11], t[12],
                      t[13], t[14], t[15], t[16])
   end,

   set = function(m00, m01, m02, m03,
                  m10, m11, m12, m13,
                  m20, m21, m22, m23,
                  m30, m31, m32, m33)
      local M = mat4()
      M.m[0 * 4 + 0] = m00
      M.m[0 * 4 + 1] = m01
      M.m[0 * 4 + 2] = m02
      M.m[0 * 4 + 3] = m03

      M.m[1 * 4 + 0] = m10
      M.m[1 * 4 + 1] = m11
      M.m[1 * 4 + 2] = m12
      M.m[1 * 4 + 3] = m13

      M.m[2 * 4 + 0] = m20
      M.m[2 * 4 + 1] = m21
      M.m[2 * 4 + 2] = m22
      M.m[2 * 4 + 3] = m23

      M.m[3 * 4 + 0] = m30
      M.m[3 * 4 + 1] = m31
      M.m[3 * 4 + 2] = m32
      M.m[3 * 4 + 3] = m33
      return M
   end,

   identity = function()
      local M = mat4()
        M.m[0 * 4 + 0] = 1.0
      --M.m[0 * 4 + 1] = 0.0
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = 1.0
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = 1.0
      --M.m[2 * 4 + 3] = 0.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
      --M.m[3 * 4 + 2] = 0.0
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   translation = function(x, y, z)
      local M = mat4()
        M.m[0 * 4 + 0] = 1.0
      --M.m[0 * 4 + 1] = 0.0
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = 1.0
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = 1.0
      --M.m[2 * 4 + 3] = 0.0

        M.m[3 * 4 + 0] = x
        M.m[3 * 4 + 1] = y
        M.m[3 * 4 + 2] = z
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   translation_from_vector = function(v)
      return mat4.translation(v.f[0], v.f[1], v.f[2])
   end,

   scaling = function(x, y, z)
      local M = mat4()
        M.m[0 * 4 + 0] = x
      --M.m[0 * 4 + 1] = 0.0
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = y
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = z
      --M.m[2 * 4 + 3] = 0.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
      --M.m[3 * 4 + 2] = 0.0
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   scaling_from_vector = function(v)
      return mat4.scaling(v.f[0], v.f[1], v.f[2])
   end,

   rotation_x = function(angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local M = mat4()
        M.m[0 * 4 + 0] = 1.0
      --M.m[0 * 4 + 1] = 0.0
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = cos_angle
        M.m[1 * 4 + 2] = sin_angle
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
        M.m[2 * 4 + 1] = -sin_angle
        M.m[2 * 4 + 2] = cos_angle
      --M.m[2 * 4 + 3] = 0.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
      --M.m[3 * 4 + 2] = 0.0
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   rotation_y = function(angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local M = mat4()
        M.m[0 * 4 + 0] = cos_angle
      --M.m[0 * 4 + 1] = 0.0
        M.m[0 * 4 + 2] = -sin_angle
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = 1.0
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

        M.m[2 * 4 + 0] = sin_angle
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = cos_angle
      --M.m[2 * 4 + 3] = 0.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
      --M.m[3 * 4 + 2] = 0.0
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   rotation_z = function(angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local M = mat4()
        M.m[0 * 4 + 0] = cos_angle
        M.m[0 * 4 + 1] = sin_angle
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

        M.m[1 * 4 + 0] = -sin_angle
        M.m[1 * 4 + 1] = cos_angle
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = 1.0
      --M.m[2 * 4 + 3] = 0.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
      --M.m[3 * 4 + 2] = 0.0
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   transpose = function(M)
      local MT = mat4()
      --MT.m[0 * 4 + 0] = M.m[0 * 4 + 0]
        MT.m[0 * 4 + 1] = M.m[1 * 4 + 0]
        MT.m[0 * 4 + 2] = M.m[2 * 4 + 0]
        MT.m[0 * 4 + 3] = M.m[3 * 4 + 0]

        MT.m[1 * 4 + 0] = M.m[0 * 4 + 1]
      --MT.m[1 * 4 + 1] = M.m[1 * 4 + 1]
        MT.m[1 * 4 + 2] = M.m[2 * 4 + 1]
        MT.m[1 * 4 + 3] = M.m[3 * 4 + 1]

        MT.m[2 * 4 + 0] = M.m[0 * 4 + 2]
        MT.m[2 * 4 + 1] = M.m[1 * 4 + 2]
      --MT.m[2 * 4 + 2] = M.m[2 * 4 + 2]
        MT.m[2 * 4 + 3] = M.m[3 * 4 + 2]

        MT.m[3 * 4 + 0] = M.m[0 * 4 + 3]
        MT.m[3 * 4 + 1] = M.m[1 * 4 + 3]
        MT.m[3 * 4 + 2] = M.m[2 * 4 + 3]
      --MT.m[3 * 4 + 3] = M.m[3 * 4 + 3]
      return MT
   end,

   multiply = function(M1, M2)
      local M = mat4()

      local x = M1.m[0 * 4 + 0]
      local y = M1.m[0 * 4 + 1]
      local z = M1.m[0 * 4 + 2]
      local w = M1.m[0 * 4 + 3]
      M.m[0 * 4 + 0] = (M2.m[0 * 4 + 0] * x) + (M2.m[1 * 4 + 0] * y) + (M2.m[2 * 4 + 0] * z) + (M2.m[3 * 4 + 0] * w)
      M.m[0 * 4 + 1] = (M2.m[0 * 4 + 1] * x) + (M2.m[1 * 4 + 1] * y) + (M2.m[2 * 4 + 1] * z) + (M2.m[3 * 4 + 1] * w)
      M.m[0 * 4 + 2] = (M2.m[0 * 4 + 2] * x) + (M2.m[1 * 4 + 2] * y) + (M2.m[2 * 4 + 2] * z) + (M2.m[3 * 4 + 2] * w)
      M.m[0 * 4 + 3] = (M2.m[0 * 4 + 3] * x) + (M2.m[1 * 4 + 3] * y) + (M2.m[2 * 4 + 3] * z) + (M2.m[3 * 4 + 3] * w)
      x = M1.m[1 * 4 + 0]
      y = M1.m[1 * 4 + 1]
      z = M1.m[1 * 4 + 2]
      w = M1.m[1 * 4 + 3]
      M.m[1 * 4 + 0] = (M2.m[0 * 4 + 0] * x) + (M2.m[1 * 4 + 0] * y) + (M2.m[2 * 4 + 0] * z) + (M2.m[3 * 4 + 0] * w)
      M.m[1 * 4 + 1] = (M2.m[0 * 4 + 1] * x) + (M2.m[1 * 4 + 1] * y) + (M2.m[2 * 4 + 1] * z) + (M2.m[3 * 4 + 1] * w)
      M.m[1 * 4 + 2] = (M2.m[0 * 4 + 2] * x) + (M2.m[1 * 4 + 2] * y) + (M2.m[2 * 4 + 2] * z) + (M2.m[3 * 4 + 2] * w)
      M.m[1 * 4 + 3] = (M2.m[0 * 4 + 3] * x) + (M2.m[1 * 4 + 3] * y) + (M2.m[2 * 4 + 3] * z) + (M2.m[3 * 4 + 3] * w)
      x = M1.m[2 * 4 + 0]
      y = M1.m[2 * 4 + 1]
      z = M1.m[2 * 4 + 2]
      w = M1.m[2 * 4 + 3]
      M.m[2 * 4 + 0] = (M2.m[0 * 4 + 0] * x) + (M2.m[1 * 4 + 0] * y) + (M2.m[2 * 4 + 0] * z) + (M2.m[3 * 4 + 0] * w)
      M.m[2 * 4 + 1] = (M2.m[0 * 4 + 1] * x) + (M2.m[1 * 4 + 1] * y) + (M2.m[2 * 4 + 1] * z) + (M2.m[3 * 4 + 1] * w)
      M.m[2 * 4 + 2] = (M2.m[0 * 4 + 2] * x) + (M2.m[1 * 4 + 2] * y) + (M2.m[2 * 4 + 2] * z) + (M2.m[3 * 4 + 2] * w)
      M.m[2 * 4 + 3] = (M2.m[0 * 4 + 3] * x) + (M2.m[1 * 4 + 3] * y) + (M2.m[2 * 4 + 3] * z) + (M2.m[3 * 4 + 3] * w)
      x = M1.m[3 * 4 + 0]
      y = M1.m[3 * 4 + 1]
      z = M1.m[3 * 4 + 2]
      w = M1.m[3 * 4 + 3]
      M.m[3 * 4 + 0] = (M2.m[0 * 4 + 0] * x) + (M2.m[1 * 4 + 0] * y) + (M2.m[2 * 4 + 0] * z) + (M2.m[3 * 4 + 0] * w)
      M.m[3 * 4 + 1] = (M2.m[0 * 4 + 1] * x) + (M2.m[1 * 4 + 1] * y) + (M2.m[2 * 4 + 1] * z) + (M2.m[3 * 4 + 1] * w)
      M.m[3 * 4 + 2] = (M2.m[0 * 4 + 2] * x) + (M2.m[1 * 4 + 2] * y) + (M2.m[2 * 4 + 2] * z) + (M2.m[3 * 4 + 2] * w)
      M.m[3 * 4 + 3] = (M2.m[0 * 4 + 3] * x) + (M2.m[1 * 4 + 3] * y) + (M2.m[2 * 4 + 3] * z) + (M2.m[3 * 4 + 3] * w)

      return M
   end,

   rotation_normal = function(normal_axis, angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local c2 = vec3.replicate(1.0 - cos_angle)
      local c1 = vec3.replicate(cos_angle)
      local c0 = vec3.replicate(sin_angle)

      local n0 = vec3(normal_axis.f[1], normal_axis.f[2], normal_axis.f[0])
      local n1 = vec3(normal_axis.f[2], normal_axis.f[0], normal_axis.f[1])

      local v0 = vec3.multiply(c2, n0)
      v0 = vec3.multiply(v0, n1)

      local r0 = vec3.multiply(c2, normal_axis)
      r0 = vec3.multiply_add(r0, normal_axis, c1)

      local r1 = vec3.multiply_add(c0, normal_axis, v0)
      local r2 = vec3.negative_multiply_subtract(c0, normal_axis, v0)

      local M = mat4()
        M.m[0 * 4 + 0] = r0.f[0]
        M.m[0 * 4 + 1] = r1.f[2]
        M.m[0 * 4 + 2] = r2.f[1]
      --M.m[0 * 4 + 3] = 0.0

        M.m[1 * 4 + 0] = r2.f[2]
        M.m[1 * 4 + 1] = r0.f[1]
        M.m[1 * 4 + 2] = r1.f[0]
      --M.m[1 * 4 + 3] = 0.0

        M.m[2 * 4 + 0] = r1.f[1]
        M.m[2 * 4 + 1] = r2.f[0]
        M.m[2 * 4 + 2] = r0.f[2]
      --M.m[2 * 4 + 3] = 0.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
      --M.m[3 * 4 + 2] = 0.0
        M.m[3 * 4 + 3] = 1.0
      return M
   end,

   rotation_axis = function(axis, angle)
      local normal = vec3.normalize(axis)
      return mat4.rotation_normal(normal, angle)
   end,

   look_to_lh = function(eye_position, eye_direction, up_direction)
      assert(not vec3.equal(eye_direction, vec3._zero))
      assert(not vec3.isinfinite(eye_direction))
      assert(not vec3.equal(up_direction, vec3._zero))
      assert(not vec3.isinfinite(up_direction))

      local r2 = vec3.normalize(eye_direction)
      local r0 = vec3.cross(up_direction, r2)
      r0 = vec3.normalize(r0)

      local r1 = vec3.cross(r2, r0)

      local neg_eye_position = vec3.negate(eye_position)

      local d0 = vec3.dot(r0, neg_eye_position)
      local d1 = vec3.dot(r1, neg_eye_position)
      local d2 = vec3.dot(r2, neg_eye_position)

      local M = mat4()
        M.m[0 * 4 + 0] = r0.f[0]
        M.m[1 * 4 + 0] = r0.f[1]
        M.m[2 * 4 + 0] = r0.f[2]
        M.m[3 * 4 + 0] = d0

        M.m[0 * 4 + 1] = r1.f[0]
        M.m[1 * 4 + 1] = r1.f[1]
        M.m[2 * 4 + 1] = r1.f[2]
        M.m[3 * 4 + 1] = d1

        M.m[0 * 4 + 2] = r2.f[0]
        M.m[1 * 4 + 2] = r2.f[1]
        M.m[2 * 4 + 2] = r2.f[2]
        M.m[3 * 4 + 2] = d2

      --M.m[0 * 4 + 3] = 0
      --M.m[1 * 4 + 3] = 0
      --M.m[2 * 4 + 3] = 0
        M.m[3 * 4 + 3] = 1
      return M
   end,

   look_at_lh = function(eye_position, focus_position, up_direction)
      local eye_direction = vec3.subtract(focus_position, eye_position)
      return mat4.look_to_lh(eye_position, eye_direction, up_direction)
   end,

   look_at_rh = function(eye_position, focus_position, up_direction)
      local neg_eye_direction = vec3.subtract(eye_position, focus_position)
      return mat4.look_to_lh(eye_position, neg_eye_direction, up_direction)
   end,

   perspective_rh = function(view_width, view_height, near_z, far_z)
      assert(near_z > 0.0 and far_z > 0.0)
      assert(not scalar.near_equal(view_width, 0.0, 0.00001))
      assert(not scalar.near_equal(view_height, 0.0, 0.00001))
      assert(not scalar.near_equal(far_z, near_z, 0.00001))

      local two_near_z = near_z + near_z;
      local f_range = far_z / (near_z - far_z);

      local M = mat4()
        M.m[0 * 4 + 0] = two_near_z / view_width
      --M.m[0 * 4 + 1] = 0.0
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = two_near_z / view_height
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = f_range
        M.m[2 * 4 + 3] = -1.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
        M.m[3 * 4 + 2] = f_range * near_z
      --M.m[3 * 4 + 3] = 0.0
      return M
   end,

   perspective_fov_rh = function(fov_angle_y, aspect_ratio, near_z, far_z)
      assert(near_z > 0.0 and far_z > 0.0)
      assert(not scalar.near_equal(fov_angle_y, 0.0, 0.00001 * 2.0))
      assert(not scalar.near_equal(aspect_ratio, 0.0, 0.00001))
      assert(not scalar.near_equal(far_z, near_z, 0.00001))

      local sin_fov = sin(fov_angle_y)
      local cos_fov = cos(fov_angle_y)

      local height = cos_fov / sin_fov
      local width = height / aspect_ratio
      local f_range = far_z / (near_z - far_z)

      local M = mat4()
        M.m[0 * 4 + 0] = width
      --M.m[0 * 4 + 1] = 0.0
      --M.m[0 * 4 + 2] = 0.0
      --M.m[0 * 4 + 3] = 0.0

      --M.m[1 * 4 + 0] = 0.0
        M.m[1 * 4 + 1] = height
      --M.m[1 * 4 + 2] = 0.0
      --M.m[1 * 4 + 3] = 0.0

      --M.m[2 * 4 + 0] = 0.0
      --M.m[2 * 4 + 1] = 0.0
        M.m[2 * 4 + 2] = f_range
        M.m[2 * 4 + 3] = -1.0

      --M.m[3 * 4 + 0] = 0.0
      --M.m[3 * 4 + 1] = 0.0
        M.m[3 * 4 + 2] = f_range * near_z
      --M.m[3 * 4 + 3] = 0.0
      return M
   end,

   near_equal = function(M1, M2, epsilon)
      local d00 = abs(M1.m[0 * 4 + 0] - M2.m[0 * 4 + 0])
      local d01 = abs(M1.m[0 * 4 + 1] - M2.m[0 * 4 + 1])
      local d02 = abs(M1.m[0 * 4 + 2] - M2.m[0 * 4 + 2])
      local d03 = abs(M1.m[0 * 4 + 3] - M2.m[0 * 4 + 3])

      local d10 = abs(M1.m[1 * 4 + 0] - M2.m[1 * 4 + 0])
      local d11 = abs(M1.m[1 * 4 + 1] - M2.m[1 * 4 + 1])
      local d12 = abs(M1.m[1 * 4 + 2] - M2.m[1 * 4 + 2])
      local d13 = abs(M1.m[1 * 4 + 3] - M2.m[1 * 4 + 3])

      local d20 = abs(M1.m[2 * 4 + 0] - M2.m[2 * 4 + 0])
      local d21 = abs(M1.m[2 * 4 + 1] - M2.m[2 * 4 + 1])
      local d22 = abs(M1.m[2 * 4 + 2] - M2.m[2 * 4 + 2])
      local d23 = abs(M1.m[2 * 4 + 3] - M2.m[2 * 4 + 3])

      local d30 = abs(M1.m[3 * 4 + 0] - M2.m[3 * 4 + 0])
      local d31 = abs(M1.m[3 * 4 + 1] - M2.m[3 * 4 + 1])
      local d32 = abs(M1.m[3 * 4 + 2] - M2.m[3 * 4 + 2])
      local d33 = abs(M1.m[3 * 4 + 3] - M2.m[3 * 4 + 3])

      return (
         (d00 <= epsilon) and (d01 <= epsilon) and (d02 <= epsilon) and (d03 <= epsilon) and
         (d10 <= epsilon) and (d11 <= epsilon) and (d12 <= epsilon) and (d13 <= epsilon) and
         (d20 <= epsilon) and (d21 <= epsilon) and (d22 <= epsilon) and (d23 <= epsilon) and
         (d30 <= epsilon) and (d31 <= epsilon) and (d32 <= epsilon) and (d33 <= epsilon)
      )
   end,

   equal = function(M1, M2)
      return (
         M1.m[0 * 4 + 0] == M2.m[0 * 4 + 0] and
         M1.m[0 * 4 + 1] == M2.m[0 * 4 + 1] and
         M1.m[0 * 4 + 2] == M2.m[0 * 4 + 2] and
         M1.m[0 * 4 + 3] == M2.m[0 * 4 + 3] and

         M1.m[1 * 4 + 0] == M2.m[1 * 4 + 0] and
         M1.m[1 * 4 + 1] == M2.m[1 * 4 + 1] and
         M1.m[1 * 4 + 2] == M2.m[1 * 4 + 2] and
         M1.m[1 * 4 + 3] == M2.m[1 * 4 + 3] and

         M1.m[2 * 4 + 0] == M2.m[2 * 4 + 0] and
         M1.m[2 * 4 + 1] == M2.m[2 * 4 + 1] and
         M1.m[2 * 4 + 2] == M2.m[2 * 4 + 2] and
         M1.m[2 * 4 + 3] == M2.m[2 * 4 + 3] and

         M1.m[3 * 4 + 0] == M2.m[3 * 4 + 0] and
         M1.m[3 * 4 + 1] == M2.m[3 * 4 + 1] and
         M1.m[3 * 4 + 2] == M2.m[3 * 4 + 2] and
         M1.m[3 * 4 + 3] == M2.m[3 * 4 + 3]
      )
   end,

   print = function(M)
      for i = 0, 15 do
         io.write(tostring(M.m[i]))
         io.write(" ")
         if i % 4 == 3 then
            io.write("\n")
         end
      end
   end
}

setmetatable(mat4, mat4)

vec3 = {
   __call = function(_t, x, y, z)
      -- newByteData is zero-initialized
      local data = love.data.newByteData(3 * 4)
      local f = ffi.cast('float*', data:getFFIPointer())
      local value = {
         data = data,
         f = f,
      }
      f[0] = x or 0
      f[1] = y or 0
      f[2] = z or 0
      setmetatable(value, vec3)
      return value
   end,

   load_table = function(t)
      assert(#t == 3)
      assert(t[1] ~= nil)
      assert(t[2] ~= nil)
      assert(t[3] ~= nil)
      return vec3(t[1], t[2], t[3])
   end,

   set_x = function(v, value)
      return vec3(value, v.f[1], v.f[2])
   end,

   set_y = function(v, value)
      return vec3(v.f[0], value, v.f[2])
   end,

   set_z = function(v, value)
      return vec3(v.f[0], v.f[1], value)
   end,

   replicate = function(value)
      return vec3(value, value, value)
   end,

   dot = function(v1, v2)
      local value = (
         v1.f[0] * v2.f[0] +
         v1.f[1] * v2.f[1] +
         v1.f[2] * v2.f[2]
      )
      return value
   end,

   length_sq = function(v)
      return vec3.dot(v, v)
   end,

   reciprocal_length = function(v)
      local result
      result = vec3.length_sq(v)
      result = 1.0 / sqrt(result)
      return result
   end,

   length = function(v)
      local result
      result = vec3.length_sq(v)
      result = sqrt(result)
      return result
   end,

   add = function(v1, v2)
      local result = vec3(
         v1.f[0] + v2.f[0],
         v1.f[1] + v2.f[1],
         v1.f[2] + v2.f[2]
      )
      return result
   end,

   subtract = function(v1, v2)
      local result = vec3(
         v1.f[0] - v2.f[0],
         v1.f[1] - v2.f[1],
         v1.f[2] - v2.f[2]
      )
      return result
   end,

   multiply = function(v1, v2)
      local result = vec3(
         v1.f[0] * v2.f[0],
         v1.f[1] * v2.f[1],
         v1.f[2] * v2.f[2]
      )
      return result
   end,

   multiply_add = function(v1, v2, v3)
      local result = vec3(
         v1.f[0] * v2.f[0] + v3.f[0],
         v1.f[1] * v2.f[1] + v3.f[1],
         v1.f[2] * v2.f[2] + v3.f[2]
      )
      return result
   end,

   negative_multiply_subtract = function(v1, v2, v3)
      local result = vec3(
         v3.f[0] - (v1.f[0] * v2.f[0]),
         v3.f[1] - (v1.f[1] * v2.f[1]),
         v3.f[2] - (v1.f[2] * v2.f[2])
      )
      return result
   end,

   normalize = function(v)
      local length = vec3.reciprocal_length(v)
      local result = vec3(
         v.f[0] * length,
         v.f[1] * length,
         v.f[2] * length
      )
      return result
   end,

   cross = function(v1, v2)
      local result = vec3(
         (v1.f[1] * v2.f[2]) - (v1.f[2] * v2.f[1]),
         (v1.f[2] * v2.f[0]) - (v1.f[0] * v2.f[2]),
         (v1.f[0] * v2.f[1]) - (v1.f[1] * v2.f[0])
      )
      return result
   end,

   negate = function(v)
      local result = vec3(
         -v.f[0],
         -v.f[1],
         -v.f[2]
      )
      return result
   end,

   equal = function(v1, v2)
      return (
         (v1.f[0] == v2.f[0]) and
         (v1.f[1] == v2.f[1]) and
         (v1.f[2] == v2.f[2])
      )
   end,

   near_equal = function(v1, v2, epsilon)
      local dx = abs(v1.f[0] - v2.f[0])
      local dy = abs(v1.f[1] - v2.f[1])
      local dz = abs(v1.f[2] - v2.f[2])
      return (dx <= epsilon) and (dy <= epsilon) and (dz <= epsilon)
   end,

   isinfinite = function(v)
      return (
         (v.f[0] == -math.huge or v.f[0] == math.huge) or
         (v.f[1] == -math.huge or v.f[1] == math.huge) or
         (v.f[2] == -math.huge or v.f[2] == math.huge)
      )
   end,

   print = function(v)
      print(tostring(v.f[0]) .. " " .. tostring(v.f[1]) .. " " .. tostring(v.f[2]))
   end,
}

setmetatable(vec3, vec3)
vec3._zero = vec3(0, 0, 0)

vec4 = {
   __call = function(_t, x, y, z, w)
      -- newByteData is zero-initialized
      local data = love.data.newByteData(4 * 4)
      local f = ffi.cast('float*', data:getFFIPointer())
      local value = {
         data = data,
         f = f,
      }
      f[0] = x or 0
      f[1] = y or 0
      f[2] = z or 0
      f[3] = w or 0
      setmetatable(value, vec4)
      return value
   end,

   load_table = function(t)
      assert(#t == 4)
      assert(t[1] ~= nil)
      assert(t[2] ~= nil)
      assert(t[3] ~= nil)
      assert(t[4] ~= nil)
      return vec4(t[1], t[2], t[3], t[4])
   end,

   set_x = function(v, value)
      return vec4(value, v.f[1], v.f[2], v.f[3])
   end,

   set_y = function(v, value)
      return vec4(v.f[0], value, v.f[2], v.f[3])
   end,

   set_z = function(v, value)
      return vec4(v.f[0], v.f[1], value, v.f[3])
   end,

   set_w = function(v, value)
      return vec4(v.f[0], v.f[1], v.f[2], value)
   end,

   print = function(v)
      print(tostring(v.f[0]) .. " " .. tostring(v.f[1]) .. " " .. tostring(v.f[2]) .. " " .. tostring(v.f[3]))
   end,
}

setmetatable(vec4, vec4)

----------------------------------------------------------------------
-- tests
----------------------------------------------------------------------

assert(vec3.dot(vec3(1, 3, -5), vec3(4, -2, -1)) == 3)
assert(vec3.dot(vec3(1, 3, -5), vec3(1, 3, -5)) == 35)
assert(vec3.length_sq(vec3(1, 3, -5)) == 35)
assert(vec3.equal(vec3.multiply(vec3(1, 3, -5), vec3(2, 3, 4)), vec3(2, 9, -20)))
assert(vec3.near_equal(vec3.normalize(vec3(1, 3, -5)), vec3(0.16903, 0.50709, -0.84515), 0.0001))
assert(vec3.equal(vec3.cross(vec3(1, 2, 3), vec3(4, 5, 6)), vec3(-3, 6, -3)))

assert(vec3.equal(vec3.load_table({1, 2, 3}),
                  vec3(1, 2, 3)))

assert(mat4.near_equal(mat4.look_to_lh(vec3(1, 2, 3),
                                       vec3(5, 6, 7),
                                       vec3(9, 10, 11)),
                       mat4.set( 0.408249,  0.778499,  0.476731, 0.000000,
                                -0.816496,  0.077850,  0.572078, 0.000000,
                                 0.408248, -0.622799,  0.667424, 0.000000,
                                -0.000001,  0.934199, -3.623158, 1.000000),
                       0.00001))

assert(mat4.near_equal(mat4.perspective_rh(2, 3, 4, 5),
                       mat4.set(4.000000, 0.000000, 0.000000, 0.000000,
                                0.000000, 2.666667, 0.000000, 0.000000,
                                0.000000, 0.000000, -5.000000, -1.000000,
                                0.000000, 0.000000, -20.000000, 0.000000),
                       0.00001))

assert(mat4.equal(mat4.multiply(mat4.set(1, 2, 3, 4,
                                         5, 6, 7, 8,
                                         9, 10, 11, 12,
                                         13, 14, 15, 16),
                                mat4.set(17, 18, 19, 20,
                                         21, 22, 23, 24,
                                         25, 26, 27, 29,
                                         30, 31, 32, 33)),
                  mat4.set(254, 264, 274, 287,
                           626, 652, 678, 711,
                           998, 1040, 1082, 1135,
                           1370, 1428, 1486, 1559)))

assert(mat4.equal(mat4.set(1, 2, 3, 4,
                           5, 6, 7, 8,
                           9, 10, 11, 12,
                           13, 14, 15, 16)
                  *
                  mat4.set(17, 18, 19, 20,
                           21, 22, 23, 24,
                           25, 26, 27, 29,
                           30, 31, 32, 33),
                  mat4.set(254, 264, 274, 287,
                           626, 652, 678, 711,
                           998, 1040, 1082, 1135,
                           1370, 1428, 1486, 1559)))

assert(mat4.equal(mat4.load_table({1, 2, 3, 4,
                                   5, 6, 7, 8,
                                   9, 10, 11, 12,
                                   13, 14, 15, 16}),
                  mat4.set(1, 2, 3, 4,
                           5, 6, 7, 8,
                           9, 10, 11, 12,
                           13, 14, 15, 16)))

assert(mat4.near_equal(mat4.rotation_normal(vec3(1, 0, 0), 33.0),
                       mat4.set(1.000000,  0.000000,  0.000000, 0.000000,
                                0.000000, -0.013275,  0.999912, 0.000000,
                                0.000000, -0.999912, -0.013275, 0.000000,
                                0.000000,  0.000000,  0.000000, 1.000000),
                       0.00001))

assert(mat4.near_equal(mat4.rotation_normal(vec3(0, 1, 0), 78.0),
                       mat4.set(-0.857803, 0.000000, -0.513979, 0.000000,
                                 0.000000, 1.000000,  0.000000, 0.000000,
                                 0.513979, 0.000000, -0.857803, 0.000000,
                                 0.000000, 0.000000,  0.000000, 1.000000),
                       0.00001))

assert(mat4.near_equal(mat4.rotation_normal(vec3(0, 0, 1), 135.0),
                       mat4.set(-0.996087,  0.088377, 0.000000, 0.000000,
                                -0.088377, -0.996087, 0.000000, 0.000000,
                                 0.000000,  0.000000, 1.000000, 0.000000,
                                 0.000000,  0.000000, 0.000000, 1.000000),
                       0.00001))

assert(mat4.near_equal(mat4.rotation_axis(vec3(1, 2, 3), 17.0),
                       mat4.set(-0.184080, -0.588667, 0.787138, 0.000000,
                                 0.952999,  0.089169, 0.289554, 0.000000,
                                -0.240639,  0.803443, 0.544584, 0.000000,
                                 0.000000,  0.000000, 0.000000, 1.000000),
                       0.00001))

return {
   scalar = scalar,
   mat4 = mat4,
   vec3 = vec3,
   vec4 = vec4,
}
