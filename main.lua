local mesh

local pixelcode = [[
    #pragma language glsl3

    varying vec4 PixelColor;

    out vec4 outData;

    void pixelmain()
    {
      outData = PixelColor;
    }
]]

local vertexcode = [[
    #pragma language glsl3

    layout (location = 0) in vec4 VertexPosition;
    layout (location = 1) in vec4 VertexColor;

    varying vec4 PixelColor;

    void vertexmain()
    {
        PixelColor = VertexColor;
        love_Position = TransformProjectionMatrix * VertexPosition;
    }
]]

local shader = love.graphics.newShader(pixelcode, vertexcode)

local vertexformat = {
   { name = 'VertexPosition', format = 'floatvec3', location = 0 },
   { name = 'VertexColor', format = 'floatvec3', location = 1 },      
}

local vertexdata = {
   -0.5, -0.5, -0.5, 1, 0, 0, -- tl \|
    0.5, -0.5, -0.5, 0, 1, 0, -- tr
    0.5,  0.5, -0.5, 0, 0, 1, -- br
    -0.5, 0.5, -0.5, 1, 1, 1, -- bl |\
}

local indexdata = {
   0, 1, 2,
   0, 3, 2,
};

function love.load(args)
   local vertexbuffer = love.graphics.newBuffer(vertexformat, vertexdata, { vertex = true, usage = "static" })
   local indexbuffer = love.graphics.newBuffer("uint16", indexdata, { index = true, usage = "static" })   
   
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
	 name = "VertexColor", -- the name this vertex attribute will use in a shader
	 nameinbuffer = nil, -- the name of the attribute in the vertex buffer. Defaults to the name field.
	 step = "pervertex", -- vertex attribute step ("pervertex" or "perinstance"), defaults to "pervertex".
	 startindex = 1, -- 1-based array index within the given vertex buffer where the attribute data will start being pulled from during rendering. Defaults to 1.
      },
   }
   drawmode = "triangles"
   
   mesh = love.graphics.newMesh(attributelist, drawmode)
   mesh:setIndexBuffer(indexbuffer)
end

function love.draw()   
   local radius = 100   
   local mx, my = love.mouse.getPosition()

   love.graphics.setShader(shader)   
   love.graphics.draw(mesh, mx, my, 0, radius, radius)   
end
