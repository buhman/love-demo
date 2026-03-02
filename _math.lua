local ffi = require 'ffi'

local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt
local abs = math.abs

local mat4
local vec2
local vec3
local vec4
local scalar

local mat4_t
local vec2_t
local vec3_t
local vec4_t

ffi.cdef [[
  typedef struct { float m00, m01, m02, m03;
                   float m10, m11, m12, m13;
                   float m20, m21, m22, m23;
                   float m30, m31, m32, m33; } mat4;
  typedef struct { float x, y; } vec2;
  typedef struct { float x, y, z; } vec3;
  typedef struct { float x, y, z, w; } vec4;
]]

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

mat4 = {
   __call = function(_t)
      return mat4_t(0, 0, 0, 0,
                    0, 0, 0, 0,
                    0, 0, 0, 0,
                    0, 0, 0, 0)
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

   store_table = function(M)
      return {
         M.m[0], M.m[1], M.m[2], M.m[3],
         M.m[4], M.m[5], M.m[6], M.m[7],
         M.m[8], M.m[9], M.m[10], M.m[11],
         M.m[12], M.m[13], M.m[14], M.m[15],
      }
   end,

   set = function(m00, m01, m02, m03,
                  m10, m11, m12, m13,
                  m20, m21, m22, m23,
                  m30, m31, m32, m33)
      local M = mat4()
      M.m00 = m00
      M.m01 = m01
      M.m02 = m02
      M.m03 = m03

      M.m10 = m10
      M.m11 = m11
      M.m12 = m12
      M.m13 = m13

      M.m20 = m20
      M.m21 = m21
      M.m22 = m22
      M.m23 = m23

      M.m30 = m30
      M.m31 = m31
      M.m32 = m32
      M.m33 = m33
      return M
   end,

   identity = function()
      local M = mat4()
        M.m00 = 1.0
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = 1.0
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = 1.0
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
      --M.m32 = 0.0
        M.m33 = 1.0
      return M
   end,

   translation = function(x, y, z)
      local M = mat4()
        M.m00 = 1.0
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = 1.0
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = 1.0
      --M.m23 = 0.0

        M.m30 = x
        M.m31 = y
        M.m32 = z
        M.m33 = 1.0
      return M
   end,

   translation_from_vector = function(v)
      return mat4.translation(v.x, v.y, v.z)
   end,

   scaling = function(x, y, z)
      local M = mat4()
        M.m00 = x
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = y
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = z
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
      --M.m32 = 0.0
        M.m33 = 1.0
      return M
   end,

   scaling_from_vector = function(v)
      return mat4.scaling(v.x, v.y, v.z)
   end,

   rotation_x = function(angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local M = mat4()
        M.m00 = 1.0
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = cos_angle
        M.m12 = sin_angle
      --M.m13 = 0.0

      --M.m20 = 0.0
        M.m21 = -sin_angle
        M.m22 = cos_angle
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
      --M.m32 = 0.0
        M.m33 = 1.0
      return M
   end,

   rotation_y = function(angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local M = mat4()
        M.m00 = cos_angle
      --M.m01 = 0.0
        M.m02 = -sin_angle
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = 1.0
      --M.m12 = 0.0
      --M.m13 = 0.0

        M.m20 = sin_angle
      --M.m21 = 0.0
        M.m22 = cos_angle
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
      --M.m32 = 0.0
        M.m33 = 1.0
      return M
   end,

   rotation_z = function(angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local M = mat4()
        M.m00 = cos_angle
        M.m01 = sin_angle
      --M.m02 = 0.0
      --M.m03 = 0.0

        M.m10 = -sin_angle
        M.m11 = cos_angle
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = 1.0
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
      --M.m32 = 0.0
        M.m33 = 1.0
      return M
   end,

   transpose = function(M)
      local MT = mat4()
      --MT.m00 = M.m00
        MT.m01 = M.m10
        MT.m02 = M.m20
        MT.m03 = M.m30

        MT.m10 = M.m01
      --MT.m11 = M.m11
        MT.m12 = M.m21
        MT.m13 = M.m31

        MT.m20 = M.m02
        MT.m21 = M.m12
      --MT.m22 = M.m22
        MT.m23 = M.m32

        MT.m30 = M.m03
        MT.m31 = M.m13
        MT.m32 = M.m23
      --MT.m33 = M.m33
      return MT
   end,

   multiply = function(M1, M2)
      local M = mat4()

      local x = M1.m00
      local y = M1.m01
      local z = M1.m02
      local w = M1.m03
      M.m00 = (M2.m00 * x) + (M2.m10 * y) + (M2.m20 * z) + (M2.m30 * w)
      M.m01 = (M2.m01 * x) + (M2.m11 * y) + (M2.m21 * z) + (M2.m31 * w)
      M.m02 = (M2.m02 * x) + (M2.m12 * y) + (M2.m22 * z) + (M2.m32 * w)
      M.m03 = (M2.m03 * x) + (M2.m13 * y) + (M2.m23 * z) + (M2.m33 * w)
      x = M1.m10
      y = M1.m11
      z = M1.m12
      w = M1.m13
      M.m10 = (M2.m00 * x) + (M2.m10 * y) + (M2.m20 * z) + (M2.m30 * w)
      M.m11 = (M2.m01 * x) + (M2.m11 * y) + (M2.m21 * z) + (M2.m31 * w)
      M.m12 = (M2.m02 * x) + (M2.m12 * y) + (M2.m22 * z) + (M2.m32 * w)
      M.m13 = (M2.m03 * x) + (M2.m13 * y) + (M2.m23 * z) + (M2.m33 * w)
      x = M1.m20
      y = M1.m21
      z = M1.m22
      w = M1.m23
      M.m20 = (M2.m00 * x) + (M2.m10 * y) + (M2.m20 * z) + (M2.m30 * w)
      M.m21 = (M2.m01 * x) + (M2.m11 * y) + (M2.m21 * z) + (M2.m31 * w)
      M.m22 = (M2.m02 * x) + (M2.m12 * y) + (M2.m22 * z) + (M2.m32 * w)
      M.m23 = (M2.m03 * x) + (M2.m13 * y) + (M2.m23 * z) + (M2.m33 * w)
      x = M1.m30
      y = M1.m31
      z = M1.m32
      w = M1.m33
      M.m30 = (M2.m00 * x) + (M2.m10 * y) + (M2.m20 * z) + (M2.m30 * w)
      M.m31 = (M2.m01 * x) + (M2.m11 * y) + (M2.m21 * z) + (M2.m31 * w)
      M.m32 = (M2.m02 * x) + (M2.m12 * y) + (M2.m22 * z) + (M2.m32 * w)
      M.m33 = (M2.m03 * x) + (M2.m13 * y) + (M2.m23 * z) + (M2.m33 * w)

      return M
   end,

   rotation_normal = function(normal_axis, angle)
      local sin_angle = sin(angle)
      local cos_angle = cos(angle)

      local c2 = vec3.replicate(1.0 - cos_angle)
      local c1 = vec3.replicate(cos_angle)
      local c0 = vec3.replicate(sin_angle)

      local n0 = vec3(normal_axis.y, normal_axis.z, normal_axis.x)
      local n1 = vec3(normal_axis.z, normal_axis.x, normal_axis.y)

      local v0 = vec3.multiply(c2, n0)
      v0 = vec3.multiply(v0, n1)

      local r0 = vec3.multiply(c2, normal_axis)
      r0 = vec3.multiply_add(r0, normal_axis, c1)

      local r1 = vec3.multiply_add(c0, normal_axis, v0)
      local r2 = vec3.negative_multiply_subtract(c0, normal_axis, v0)

      local M = mat4()
        M.m00 = r0.x
        M.m01 = r1.z
        M.m02 = r2.y
      --M.m03 = 0.0

        M.m10 = r2.z
        M.m11 = r0.y
        M.m12 = r1.x
      --M.m13 = 0.0

        M.m20 = r1.y
        M.m21 = r2.x
        M.m22 = r0.z
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
      --M.m32 = 0.0
        M.m33 = 1.0
      return M
   end,

   rotation_axis = function(axis, angle)
      assert(not vec3.equal(axis, vec3._zero))
      assert(not vec3.isinfinite(axis))

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
        M.m00 = r0.x
        M.m10 = r0.y
        M.m20 = r0.z
        M.m30 = d0

        M.m01 = r1.x
        M.m11 = r1.y
        M.m21 = r1.z
        M.m31 = d1

        M.m02 = r2.x
        M.m12 = r2.y
        M.m22 = r2.z
        M.m32 = d2

      --M.m03 = 0
      --M.m13 = 0
      --M.m23 = 0
        M.m33 = 1
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
        M.m00 = two_near_z / view_width
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = two_near_z / view_height
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = f_range
        M.m23 = -1.0

      --M.m30 = 0.0
      --M.m31 = 0.0
        M.m32 = f_range * near_z
      --M.m33 = 0.0
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
        M.m00 = width
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = height
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = f_range
        M.m23 = -1.0

      --M.m30 = 0.0
      --M.m31 = 0.0
        M.m32 = f_range * near_z
      --M.m33 = 0.0
      return M
   end,

   orthographic_rh = function(view_width, view_height, near_z, far_z)
      assert(not scalar.near_equal(view_width, 0.0, 0.00001))
      assert(not scalar.near_equal(view_height, 0.0, 0.00001))
      assert(not scalar.near_equal(far_z, near_z, 0.00001))

      local f_range = 1.0 / (near_z - far_z)

      local M = mat4()
        M.m00 = 2.0 / view_width
      --M.m01 = 0.0
      --M.m02 = 0.0
      --M.m03 = 0.0

      --M.m10 = 0.0
        M.m11 = 2.0 / view_height
      --M.m12 = 0.0
      --M.m13 = 0.0

      --M.m20 = 0.0
      --M.m21 = 0.0
        M.m22 = f_range
      --M.m23 = 0.0

      --M.m30 = 0.0
      --M.m31 = 0.0
        M.m32 = f_range * near_z
        M.m33 = 1.0
        return M
   end,

   near_equal = function(M1, M2, epsilon)
      local d00 = abs(M1.m00 - M2.m00)
      local d01 = abs(M1.m01 - M2.m01)
      local d02 = abs(M1.m02 - M2.m02)
      local d03 = abs(M1.m03 - M2.m03)

      local d10 = abs(M1.m10 - M2.m10)
      local d11 = abs(M1.m11 - M2.m11)
      local d12 = abs(M1.m12 - M2.m12)
      local d13 = abs(M1.m13 - M2.m13)

      local d20 = abs(M1.m20 - M2.m20)
      local d21 = abs(M1.m21 - M2.m21)
      local d22 = abs(M1.m22 - M2.m22)
      local d23 = abs(M1.m23 - M2.m23)

      local d30 = abs(M1.m30 - M2.m30)
      local d31 = abs(M1.m31 - M2.m31)
      local d32 = abs(M1.m32 - M2.m32)
      local d33 = abs(M1.m33 - M2.m33)

      return (
         (d00 <= epsilon) and (d01 <= epsilon) and (d02 <= epsilon) and (d03 <= epsilon) and
         (d10 <= epsilon) and (d11 <= epsilon) and (d12 <= epsilon) and (d13 <= epsilon) and
         (d20 <= epsilon) and (d21 <= epsilon) and (d22 <= epsilon) and (d23 <= epsilon) and
         (d30 <= epsilon) and (d31 <= epsilon) and (d32 <= epsilon) and (d33 <= epsilon)
      )
   end,

   equal = function(M1, M2)
      return (
         M1.m00 == M2.m00 and
         M1.m01 == M2.m01 and
         M1.m02 == M2.m02 and
         M1.m03 == M2.m03 and

         M1.m10 == M2.m10 and
         M1.m11 == M2.m11 and
         M1.m12 == M2.m12 and
         M1.m13 == M2.m13 and

         M1.m20 == M2.m20 and
         M1.m21 == M2.m21 and
         M1.m22 == M2.m22 and
         M1.m23 == M2.m23 and

         M1.m30 == M2.m30 and
         M1.m31 == M2.m31 and
         M1.m32 == M2.m32 and
         M1.m33 == M2.m33
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

vec2 = {
   __call = function(_, x, y)
      return vec2_t(x, y)
   end,

   load_table = function(t)
      assert(#t == 2)
      assert(t[1] ~= nil)
      assert(t[2] ~= nil)
      return vec2(t[1], t[2])
   end,

   add = function(v1, v2)
      local result = vec2(
         v1.x + v2.x,
         v1.y + v2.y
      )
      return result
   end,

   multiply = function(v1, v2)
      local result = vec2(
         v1.x * v2.x,
         v1.y * v2.y
      )
      return result
   end,

   set_x = function(v, value)
      return vec2(value, v.y)
   end,

   set_y = function(v, value)
      return vec2(v.x, value)
   end,

   get_x = function(v)
      return v.x
   end,

   get_y = function(v)
      return v.y
   end,

   print = function(v)
      print(tostring(v.x) .. " " .. tostring(v.y))
   end,
}

vec3 = {
   __call = function(_, x, y, z)
      return vec3_t(x, y, z)
   end,

   load_table = function(t)
      assert(#t == 3)
      assert(t[1] ~= nil)
      assert(t[2] ~= nil)
      assert(t[3] ~= nil)
      return vec3(t[1], t[2], t[3])
   end,

   set_x = function(v, value)
      return vec3(value, v.y, v.z)
   end,

   set_y = function(v, value)
      return vec3(v.x, value, v.z)
   end,

   set_z = function(v, value)
      return vec3(v.x, v.y, value)
   end,

   replicate = function(value)
      return vec3(value, value, value)
   end,

   dot = function(v1, v2)
      local value = (
         v1.x * v2.x +
         v1.y * v2.y +
         v1.z * v2.z
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
         v1.x + v2.x,
         v1.y + v2.y,
         v1.z + v2.z
      )
      return result
   end,

   subtract = function(v1, v2)
      local result = vec3(
         v1.x - v2.x,
         v1.y - v2.y,
         v1.z - v2.z
      )
      return result
   end,

   multiply = function(v1, v2)
      local result = vec3(
         v1.x * v2.x,
         v1.y * v2.y,
         v1.z * v2.z
      )
      return result
   end,

   multiply_scalar = function(v1, s)
      local result = vec3(
         v1.x * s,
         v1.y * s,
         v1.z * s
      )
      return result
   end,

   multiply_add = function(v1, v2, v3)
      local result = vec3(
         v1.x * v2.x + v3.x,
         v1.y * v2.y + v3.y,
         v1.z * v2.z + v3.z
      )
      return result
   end,

   negative_multiply_subtract = function(v1, v2, v3)
      local result = vec3(
         v3.x - (v1.x * v2.x),
         v3.y - (v1.y * v2.y),
         v3.z - (v1.z * v2.z)
      )
      return result
   end,

   normalize = function(v)
      local length = vec3.reciprocal_length(v)
      local result = vec3(
         v.x * length,
         v.y * length,
         v.z * length
      )
      return result
   end,

   cross = function(v1, v2)
      local result = vec3(
         (v1.y * v2.z) - (v1.z * v2.y),
         (v1.z * v2.x) - (v1.x * v2.z),
         (v1.x * v2.y) - (v1.y * v2.x)
      )
      return result
   end,

   negate = function(v)
      local result = vec3(
         -v.x,
         -v.y,
         -v.z
      )
      return result
   end,

   transform = function(v, M)
      local x = ((M.m00 * v.x)
               + (M.m10 * v.y)
               + (M.m20 * v.z)
               + (M.m30))

      local y = ((M.m01 * v.x)
               + (M.m11 * v.y)
               + (M.m21 * v.z)
               + (M.m31))

      local z = ((M.m02 * v.x)
               + (M.m12 * v.y)
               + (M.m22 * v.z)
               + (M.m32))

      return vec4(x, y, z, 1)
   end,

   transform_normal = function(v, M)
      local x = ((M.m00 * v.x)
               + (M.m10 * v.y)
               + (M.m20 * v.z))

      local y = ((M.m01 * v.x)
               + (M.m11 * v.y)
               + (M.m21 * v.z))

      local z = ((M.m02 * v.x)
               + (M.m12 * v.y)
               + (M.m22 * v.z))

      return vec4(x, y, z, 0)
   end,

   equal = function(v1, v2)
      return (
         (v1.x == v2.x) and
         (v1.y == v2.y) and
         (v1.z == v2.z)
      )
   end,

   near_equal = function(v1, v2, epsilon)
      local dx = abs(v1.x - v2.x)
      local dy = abs(v1.y - v2.y)
      local dz = abs(v1.z - v2.z)
      return (dx <= epsilon) and (dy <= epsilon) and (dz <= epsilon)
   end,

   isinfinite = function(v)
      return (
         (v.x == -math.huge or v.x == math.huge) or
         (v.y == -math.huge or v.y == math.huge) or
         (v.z == -math.huge or v.z == math.huge)
      )
   end,

   print = function(v)
      print(tostring(v.x) .. " " .. tostring(v.y) .. " " .. tostring(v.z))
   end,
}

vec4 = {
   __call = function(_, x, y, z, w)
      return vec4_t(x, y, z, w)
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
      return vec4(value, v.y, v.z, v.w)
   end,

   set_y = function(v, value)
      return vec4(v.x, value, v.z, v.w)
   end,

   set_z = function(v, value)
      return vec4(v.x, v.y, value, v.w)
   end,

   set_w = function(v, value)
      return vec4(v.x, v.y, v.z, value)
   end,

   print = function(v)
      print(tostring(v.x) .. " " .. tostring(v.y) .. " " .. tostring(v.z) .. " " .. tostring(v.w))
   end,
}

----------------------------------------------------------------------
-- types
----------------------------------------------------------------------

setmetatable(scalar, scalar)
setmetatable(mat4, mat4)
setmetatable(vec2, vec2)
setmetatable(vec3, vec3)
setmetatable(vec4, vec4)

local mat4_metatable = {
   __mul = mat4.multiply,

   __index = {
      data = function(v)
         local data = love.data.newByteData(16 * 4)
         local f = ffi.cast('float*', data:getFFIPointer())
         ffi.copy(f, v, 16 * 4)
         return data
      end,
   }
}

local vec2_metatable = {
   __add = vec2.add,

   __mul = vec2.multiply,

   __index = {
      data = function(v)
         local data = love.data.newByteData(2 * 4)
         local f = ffi.cast('float*', data:getFFIPointer())
         ffi.copy(f, v, 2 * 4)
         return data
      end,
   }
}

local vec3_metatable = {
   __index = {
      data = function(v)
         local data = love.data.newByteData(3 * 4)
         local f = ffi.cast('float*', data:getFFIPointer())
         ffi.copy(f, v, 3 * 4)
         return data
      end,
   }
}

local vec4_metatable = {
   __index = {
      data = function(v)
         local data = love.data.newByteData(4 * 4)
         local f = ffi.cast('float*', data:getFFIPointer())
         ffi.copy(f, v, 4 * 4)
         return data
      end,
   }
}

mat4_t = ffi.metatype("mat4", mat4_metatable)
vec2_t = ffi.metatype("vec2", vec2_metatable)
vec3_t = ffi.metatype("vec3", vec3_metatable)
vec4_t = ffi.metatype("vec4", vec4_metatable)

vec3._zero = vec3_t(0, 0, 0)

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
