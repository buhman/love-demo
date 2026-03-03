local ffi = require "ffi"
local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3
local vec4 = _math.vec4

local cube_indices = {
   0, 1, 2,
   3, 4, 5,
   6, 7, 8,
   9, 10, 11,
   12, 13, 14,
   15, 16, 17,
   0, 18, 1,
   3, 19, 4,
   6, 20, 7,
   9, 21, 10,
   12, 22, 13,
   15, 23, 16
}
local cube_indices_count = #cube_indices
local cube_index_buffer
local blocks
local shader_minecraft
local region_buffers = {}

local load_blocks_buffer = function(name)
   local data = love.filesystem.newFileData(name)
   local format = {
      { format = "uint8vec4" },
   }
   local buffer = love.graphics.newBuffer(format, data, { shaderstorage = true, usage = "static" })
   return buffer
end

local load_region_buffer = function(path)
   local data = love.filesystem.newFileData(path)
   local format = {
      { format = "uint8vec4" },
      { format = "uint32" },
   }
   local buffer = love.graphics.newBuffer(format, data, { shaderstorage = true, usage = "static" })
   return buffer
end

local load_cube_index_buffer = function()
   local data = love.data.newByteData(cube_indices_count * 4)
   local ptr = ffi.cast("uint32_t*", data:getFFIPointer())
   for i, index in ipairs(cube_indices) do
      ptr[i - 1] = index
   end
   local buffer = love.graphics.newBuffer("uint32", data, { index = true, usage = "static" })
   return buffer
end

local load_minecraft_shader = function()
   local pixel_data = love.filesystem.newFileData("pixel_minecraft.glsl")
   local vertex_data = love.filesystem.newFileData("vertex_minecraft.glsl")
   local shader = love.graphics.newShader(pixel_data, vertex_data)
   return shader
end

local init = function()
   table.insert(region_buffers, load_region_buffer("minecraft/region.0.0.data"))
   table.insert(region_buffers, load_region_buffer("minecraft/region.-1.0.data"))
   table.insert(region_buffers, load_region_buffer("minecraft/region.0.-1.data"))
   table.insert(region_buffers, load_region_buffer("minecraft/region.-1.-1.data"))
   cube_index_buffer = load_cube_index_buffer()
   shader_minecraft = load_minecraft_shader()
end

local viewpos = {
   x = -4 * 31,
   y = 0,
   z = -4 * 31,
}

local draw = function(projection)
   local view = mat4.look_at_rh(vec3(-50 + viewpos.x, -50 + viewpos.z, 100 + 50 + viewpos.y),
                                vec3(50 + viewpos.x, 50 + viewpos.z, 50 + viewpos.y),
                                vec3(0, 0, 1))

   love.graphics.setCanvas()

   love.graphics.setDepthMode("always", true)
   love.graphics.setShader(shader_clear)
   love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)

   love.graphics.setDepthMode("greater", true)
   love.graphics.setShader(shader_minecraft)

   local view_projection = view * projection

   for _, region_buffer in ipairs(region_buffers) do
      local instance_count = math.floor(region_buffer:getSize() / (4 * 2))
      shader_minecraft:send("transform", "column", view_projection:data())
      shader_minecraft:send("BlocksLayout", region_buffer)
      love.graphics.drawFromShader(cube_index_buffer, cube_indices_count, instance_count, 1)
   end
end

return {
   viewpos = viewpos,
   init = init,
   draw = draw,
}
