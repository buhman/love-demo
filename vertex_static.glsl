#pragma language glsl4

struct vertex_t {
  vec4 Position;
  vec4 Normal;
  vec4 Texture;
};

layout (std430) readonly buffer VertexPNTLayout
{
  vertex_t VertexPNTBuffer[];
};

uniform int VertexPNTOffset;

uniform mat4 view_transform;
uniform mat4 world_transform;
uniform mat4 light_transform;
uniform mat4 transform;

varying vec4 PixelNormal;
varying vec4 PixelTexture;
varying vec4 PixelWorldPosition;
varying vec4 PixelLightPosition;
varying vec4 PixelViewPosition;

void vertexmain()
{
  vertex_t VertexPNT = VertexPNTBuffer[VertexPNTOffset + gl_VertexID];

  PixelNormal = world_transform * vec4(VertexPNT.Normal.xyz, 0);
  PixelTexture = VertexPNT.Texture;

  vec4 Position = vec4(VertexPNT.Position.xyz, 1);

  PixelViewPosition = view_transform * Position;
  PixelWorldPosition = world_transform * Position;
  PixelLightPosition = light_transform * Position;
  love_Position = transform * Position;
}
