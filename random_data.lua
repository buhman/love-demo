local ffi = require 'ffi'

local _math = require '_math'
local vec3 = _math.vec3

local generate_noise_texture = function(width, height)
   local noise_data = love.data.newByteData(width * height * 2 * 4)
   local noise_data_ptr = ffi.cast('float*', noise_data:getFFIPointer())
   for i = 0, (width * height - 1) do
      noise_data_ptr[i * 2 + 0] = love.math.random() * 2 - 1
      noise_data_ptr[i * 2 + 1] = love.math.random() * 2 - 1
   end
   local noise_image_data = love.image.newImageData(width, height, "rg32f", noise_data)
   local noise_texture = love.graphics.newTexture(noise_image_data)
   noise_texture:setWrap("repeat", "repeat")

   return noise_texture
end

local lerp = function(a, b, t)
   return a + t * (b - a)
end

local generate_ssao_kernel = function(kernel_samples)
   local ssao_kernel_data = love.data.newByteData(kernel_samples * 4 * 4)
   local ssao_kernel_data_ptr = ffi.cast('float*', ssao_kernel_data:getFFIPointer())
   for i = 0, (kernel_samples - 1) do
      local v = vec3(love.math.random() * 2.0 - 1.0,
                     love.math.random() * 2.0 - 1.0,
                     love.math.random())
      v = vec3.normalize(v)
      local scale = i / kernel_samples
      scale = lerp(0.1, 1.0, scale * scale)
      v = vec3.multiply_scalar(v, love.math.random() * scale)
      ssao_kernel_data_ptr[i * 4 + 0] = v.f[0]
      ssao_kernel_data_ptr[i * 4 + 1] = v.f[1]
      ssao_kernel_data_ptr[i * 4 + 2] = v.f[2]
      --ssao_kernel_data_ptr[i * 4 + 3] = 0
   end

   local ssao_kernel_format = {
      { format = 'floatvec4' },
   }
   local ssao_kernel_shaderstorage_buffer = love.graphics.newBuffer(ssao_kernel_format, ssao_kernel_data, { shaderstorage = true, usage = "static" })

   return ssao_kernel_shaderstorage_buffer
end

return {
   generate_noise_texture = generate_noise_texture,
   generate_ssao_kernel = generate_ssao_kernel,
}
