local ffi = require 'ffi'

local sin = math.sin
local cos = math.cos

local mat4

local newmat4 = function(_t)
   -- newByteData is zero-initialized
   local data = love.data.newByteData(16 * 4)
   local m = ffi.cast('float*', data:getFFIPointer())
   value = {
      data = data,
      m = m,
   }
   setmetatable(value, mat4)
   return value
end

mat4 = {
   __call = newmat4,

   identity = function()
      local M = newmat4()
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
      local M = newmat4()
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

      local M = newmat4()
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

      local M = newmat4()
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

      local M = newmat4()
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

   dot = function(a, b)
      print("dot" .. tostring(a) .. tostring(b))
   end
}

setmetatable(mat4, mat4)

return {
   mat4 = mat4
}
