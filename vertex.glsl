#pragma language glsl4

struct vertex_t {
  vec4 Position;
  vec4 Normal;
  vec4 Texture;
};

layout (std430) readonly buffer VertexLayout
{
  vertex_t VertexBuffer[];
};

uniform int VertexOffset;

uniform mat4 world_transform;
uniform mat4 transform;

varying vec4 PixelNormal;
varying vec4 PixelTexture;
varying vec4 PixelWorldPosition;

void vertexmain()
{
  vertex_t Vertex = VertexBuffer[VertexOffset + gl_VertexID];

  PixelNormal = world_transform * vec4(Vertex.Normal.xyz, 0);
  PixelTexture = Vertex.Texture;

  PixelWorldPosition = world_transform * vec4(Vertex.Position.xyz, 1);

  love_Position = transform * vec4(Vertex.Position.xyz, 1);
}
