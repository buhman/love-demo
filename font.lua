local _math = require "_math"
local mat4 = _math.mat4

local pixel_font_data = love.filesystem.newFileData("pixel_font.glsl")
local vertex_font_data = love.filesystem.newFileData("vertex_font.glsl")
local shader_font = love.graphics.newShader(pixel_font_data, vertex_font_data)

local fonts = {
   ter_6x12 = {
      path = "font/terminus_128x64_6x12.data",
      texture_width = 128,
      texture_height = 64,
      glyph_width = 6,
      glyph_height = 12,
   },
   ter_8x16 = {
      path = "font/terminus_128x128_8x16.data",
      texture_width = 128,
      texture_height = 128,
      glyph_width = 8,
      glyph_height = 16,
   },
   ter_10x18 = {
      path = "font/terminus_256x128_10x18.data",
      texture_width = 256,
      texture_height = 128,
      glyph_width = 10,
      glyph_height = 18,
   },
   ter_12x24 = {
      path = "font/terminus_256x128_12x24.data",
      texture_width = 256,
      texture_height = 128,
      glyph_width = 12,
      glyph_height = 24,
   }
}

local load_font = function(desc)
   local file_data = love.filesystem.newFileData(desc.path)
   local image_data = love.image.newImageData(desc.texture_width, desc.texture_height, "r8", file_data)
   local texture = love.graphics.newTexture(image_data)
   texture:setFilter("nearest", "nearest")
   local font = {
      texture = texture,
      texture_width = desc.texture_width,
      texture_height = desc.texture_height,
      glyph_width = desc.glyph_width,
      glyph_height = desc.glyph_height,
      stride = math.floor(desc.texture_width / desc.glyph_width),
   }
   return font
end

local glyph_coordinate = function(font, ord)
   local c = ord - 32
   local x = c % font.stride
   local y = math.floor(c / font.stride)
   return {x, y}
end

local glyph_transform = function(font, x, y)
   local transform = (
        mat4.scaling(font.glyph_width, font.glyph_height, 0)
      * mat4.translation(x, -y, 0)
      * mat4.scaling(2 / 1024, 2 / 1024, 0)
      * mat4.translation(-1, 1, 0)
   )
   return transform
end

local draw_string = function(font, s, x, y)
   love.graphics.setCanvas()
   love.graphics.setShader(shader_font)
   shader_font:send("texture_sampler", font.texture)
   love.graphics.setDepthMode("always", false)
   shader_font:send("cell", {font.glyph_width / font.texture_width, font.glyph_height / font.texture_height})

   for i = 1, #s do
      local c = s:byte(i)
      if c ~= 32 then
         shader_font:send("transform", "column", glyph_transform(font, x, y).data)
         shader_font:send("glyph", glyph_coordinate(font, c))
         love.graphics.drawFromShader(screen_index_buffer, 3 * 2, 1, 1)
      end

      x = x + font.glyph_width
   end
end

return {
   fonts = fonts,
   load_font = load_font,
   draw_string = draw_string,
}
