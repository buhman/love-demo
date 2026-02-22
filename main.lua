local mesh
local rotation
local texture

local ffi = require 'ffi'

local pixelcode = [[
    #pragma language glsl3

    varying vec4 PixelNormal;
    varying vec4 PixelTexture;

    uniform sampler2D texture_sampler;

    out vec4 outData;

    void pixelmain()
    {
      vec4 texColor = texture(texture_sampler, PixelTexture.xy);

      float intensity = min(max(dot(vec3(1, 1, 1), PixelNormal.xyz), 0), 1);
      outData = vec4(texColor.xyz * (0.1 + intensity * intensity), 1.0);
    }
]]

local vertexcode = [[
    #pragma language glsl3

    layout (location = 0) in vec4 VertexPosition;
    layout (location = 1) in vec4 VertexNormal;
    layout (location = 2) in vec4 VertexTexture;

    uniform mat4 projection;
    uniform mat4 view;
    uniform mat4 model;
    uniform mat4 model2;

    varying vec4 PixelNormal;
    varying vec4 PixelTexture;

    void vertexmain()
    {
        PixelNormal = VertexNormal * 0.5 + 0.5;
        PixelTexture = VertexTexture;
        mat4 trans = projection * view * model * model2;
        love_Position = trans * vec4(VertexPosition.xyz, 1);
    }
]]

local shader = love.graphics.newShader(pixelcode, vertexcode)

local vertexformat = {
   { name = 'VertexPosition', format = 'floatvec3', location = 0 },
   { name = 'VertexNormal', format = 'floatvec3', location = 1 },
   { name = 'VertexTexture', format = 'floatvec3', location = 2 },
}

function look_at()
   local m = {
      1.000000, 0.000000, 0.000000, 0.000000,
      0.000000, 1.000000, 0.000000, 0.000000,
      0.000000, 0.000000, 1.000000, -2.000000,
      0.000000, 0.000000, 0.000000, 1.000000,
   }

   return m;
end

function projection()
   local m = {
      1.000000, 0.000000, 0.000000, 0.000000,
      0.000000, 1.000000, 0.000000, 0.000000,
      0.000000, 0.000000, -1.002002, -0.200200,
      0.000000, 0.000000, -1.000000, 0.000000,
   }
   return m
end

function love.load(args)
   love.window.setMode(1024, 1024, {depth=true})

   local vertexdata = love.filesystem.newFileData("position_normal_texture.vtx")
   local indexdata = love.filesystem.newFileData("index.idx")

   local vertexbuffer = love.graphics.newBuffer(vertexformat, vertexdata, { vertex = true, usage = "static" })
   local indexbuffer = love.graphics.newBuffer("uint32", indexdata, { index = true, usage = "static" })

   attributelist = {
      {
         buffer = vertexbuffer,
         location = 0,
         name = "VertexPosition", -- the name this vertex attribute will use in a shader
         nameinbuffer = nil, -- the name of the attribute in the vertex buffer. Defaults to the name field.
         step = "pervertex", -- vertex attribute step ("pervertex" or "perinstance"), defaults to "pervertex".
         startindex = 1, -- 1-based array index within the given vertex buffer where the attribute data will start being pulled from during rendering. Defaults to 1.
      },
{
         buffer = vertexbuffer,
         location = 1,
         name = "VertexNormal", -- the name this vertex attribute will use in a shader
         nameinbuffer = nil, -- the name of the attribute in the vertex buffer. Defaults to the name field.
         step = "pervertex", -- vertex attribute step ("pervertex" or "perinstance"), defaults to "pervertex".
         startindex = 1, -- 1-based array index within the given vertex buffer where the attribute data will start being pulled from during rendering. Defaults to 1.
      },
      {
         buffer = vertexbuffer,
         location = 2,
         name = "VertexTexture", -- the name this vertex attribute will use in a shader
         nameinbuffer = nil, -- the name of the attribute in the vertex buffer. Defaults to the name field.
         step = "pervertex", -- vertex attribute step ("pervertex" or "perinstance"), defaults to "pervertex".
         startindex = 1, -- 1-based array index within the given vertex buffer where the attribute data will start being pulled from during rendering. Defaults to 1.
      },
   }
   drawmode = "triangles"

   mesh = love.graphics.newMesh(attributelist, drawmode)
   mesh:setIndexBuffer(indexbuffer)

  local image_data = love.image.newCompressedData('bird.dds')
  texture = love.graphics.newTexture(image_data)
end

local rotation = 0.0

function rotate_x(t)
   local cos = math.cos
   local sin = math.sin
   return {
      1, 0, 0, 0,
      0, cos(t), -sin(t), 0,
      0, sin(t), cos(t), 0,
      0, 0, 0, 1
   }
end

function rotate_y(t)
   local cos = math.cos
   local sin = math.sin
   return {
      cos(t), 0, sin(t), 0,
      0, 1, 0, 0,
      -sin(t), 0, cos(t), 0,
      0, 0, 0, 1
   }
end

function rotate_z(t)
   local cos = math.cos
   local sin = math.sin
   return {
      cos(t), -sin(t), 0, 0,
      sin(t), cos(t), 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1
   }
end

function print_matrix(ptr)
   for i=0,15 do
      io.write(tostring(ptr[i]))
      io.write(" ")
      if i % 4 == 3 then
         io.write("\n")
      end
   end
end


local math = require '_math'
local mat4 = math.mat4

function love.draw()
   local radius = 100
   local mx, my = love.mouse.getPosition()

   shader:send("projection", projection(1, 1))
   shader:send("view", "column", mat4.translation(0, 0, -2).data)
   shader:send("model", "column", mat4.rotation_x(rotation).data)
   shader:send("model2", "column", mat4.rotation_z(rotation * 0.5).data)
   shader:send("texture_sampler", texture)
   rotation = rotation + 0.01
   love.graphics.setShader(shader)
   love.graphics.setDepthMode("less", true)
   love.graphics.draw(mesh, mx, my, 0, radius, radius)
end
