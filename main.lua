local mesh
local rotation
local texture

local ffi = require 'ffi'
local _math = require '_math'
local mat4 = _math.mat4
local vec3 = _math.vec3

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

    uniform mat4 transform;

    varying vec4 PixelNormal;
    varying vec4 PixelTexture;

    void vertexmain()
    {
        PixelNormal = VertexNormal * 0.5 + 0.5;
        PixelTexture = VertexTexture;
        love_Position = transform * vec4(VertexPosition.xyz, 1);
    }
]]

local shader = love.graphics.newShader(pixelcode, vertexcode)

local vertexformat = {
   { name = 'VertexPosition', format = 'floatvec3', location = 0 },
   { name = 'VertexNormal', format = 'floatvec3', location = 1 },
   { name = 'VertexTexture', format = 'floatvec3', location = 2 },
}

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

function love.draw()
   local radius = 100
   local mx, my = love.mouse.getPosition()

   width, height = love.graphics.getDimensions()
   -- shader:send("projection", "column", mat4.perspective_rh(width / width * 0.25,
   --                                                         height / width * 0.25,
   --                                                         0.1,
   --                                                         1000.0).data)
   -- shader:send("view", "column", mat4.look_at_rh(vec3(0, -2, 0),
   --                                               vec3(0, 0, 0),
   --                                               vec3(0, 0, 1)).data)

   -- shader:send("model", "column", mat4.rotation_x(rotation).data)
   -- shader:send("model2", "column", mat4.rotation_z(rotation * 0.5).data)

   local projection = mat4.perspective_rh(width / width * 0.25,
                                          height / width * 0.25,
                                          0.1,
                                          1000.0)
   local view = mat4.look_at_rh(vec3(0, -2, 0),
                                vec3(0, 0, 0),
                                vec3(0, 0, 1))

   local world1 = mat4.rotation_x(rotation)
   local world2 = mat4.rotation_z(rotation * 0.5)
   local world3 = mat4.translation(0, 0, -0.5)

   local transform = world3 * world2 * world1 * view * projection

   shader:send("transform", "column", transform.data)

   shader:send("texture_sampler", texture)
   rotation = rotation + 0.01
   love.graphics.setShader(shader)
   love.graphics.setDepthMode("less", true)
   love.graphics.draw(mesh, mx, my, 0, radius, radius)
end
