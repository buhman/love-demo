local ffi = require 'ffi'

local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt
local abs = math.abs

local mat4
local vec3
local scalar

scalar = {
   near_equal = function(s1, s2, epsilon)
      local d = abs(s1 - s2)
      return d <= epsilon
   end,
}

setmetatable(scalar, scalar)

mat4 = {
   __call = function(_t)
      -- newByteData is zero-initialized
      local data = love.data.newByteData(16 * 4)
      local m = ffi.cast('float*', data:getFFIPointer())
      value = {
         data = data,
         m = m,
      }
      setmetatable(value, mat4)
      return value
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
      value = {
         data = data,
         f = f,
      }
      f[0] = x or 0
      f[1] = y or 0
      f[2] = z or 0
      setmetatable(value, vec3)
      return value
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

----------------------------------------------------------------------
-- tests
----------------------------------------------------------------------

assert(vec3.dot(vec3(1, 3, -5), vec3(4, -2, -1)) == 3)
assert(vec3.dot(vec3(1, 3, -5), vec3(1, 3, -5)) == 35)
assert(vec3.length_sq(vec3(1, 3, -5)) == 35)
assert(vec3.equal(vec3.multiply(vec3(1, 3, -5), vec3(2, 3, 4)), vec3(2, 9, -20)))
assert(vec3.near_equal(vec3.normalize(vec3(1, 3, -5)), vec3(0.16903, 0.50709, -0.84515), 0.0001))
assert(vec3.equal(vec3.cross(vec3(1, 2, 3), vec3(4, 5, 6)), vec3(-3, 6, -3)))

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

return {
   scalar = scalar,
   mat4 = mat4,
   vec3 = vec3,
}
