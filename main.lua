local mesh

local pixelcode = [[
    #pragma language glsl3

    varying vec4 vpos;

    out vec4 outData;

    void pixelmain()
    {
      outData = vpos;
    }
]]

local vertexcode = [[
    #pragma language glsl3

    layout(location = 0) in vec4 VertexPosition;

    varying vec4 vpos;

    void vertexmain()
    {
        vpos = VertexPosition;
        love_Position = TransformProjectionMatrix * VertexPosition;
    }
]]

shader = love.graphics.newShader(pixelcode, vertexcode)

local vertexformat = {
    { name = 'VertexPosition', format = 'floatvec3', location = 0 },   
}

local vertexdata = {
    {-0.5, -0.5, -0.5}, -- tl \|
    { 0.5, -0.5, -0.5}, -- tr
    { 0.5,  0.5, -0.5}, -- br
    { -0.5, 0.5, -0.5}, -- bl |\
}

function love.load(args)
   local vertexbuffer = love.graphics.newBuffer(vertexformat, vertexdata, { vertex = true, usage = "static" })
   
   attributelist = {
      {
	 buffer = vertexbuffer,
	 location = 0,
	 name = "VertexPosition", -- the name this vertex attribute will use in a shader
	 nameinbuffer = nil, -- the name of the attribute in the vertex buffer. Defaults to the name field.
	 step = "pervertex", -- vertex attribute step ("pervertex" or "perinstance"), defaults to "pervertex".
	 startindex = 1, -- 1-based array index within the given vertex buffer where the attribute data will start being pulled from during rendering. Defaults to 1.
      },
   }
   drawmode = "triangles"
   
   mesh = love.graphics.newMesh(attributelist, drawmode)

   mesh:setVertexMap(1, 2, 3,
		     1, 4, 3)
end

function love.draw()   
   local radius = 100   
   local mx, my = love.mouse.getPosition()

   love.graphics.setShader(shader)   
   love.graphics.draw(mesh, mx, my, 0, radius, radius)   
end
