#pragma language glsl3

layout (location = 0) in vec4 VertexPosition;
layout (location = 1) in vec4 VertexNormal;
layout (location = 2) in vec4 VertexTexture;

uniform mat4 world_transform;
uniform mat4 transform;

varying vec4 PixelNormal;
varying vec4 PixelTexture;
varying vec4 PixelWorldPosition;
varying float PixelId;

void vertexmain()
{
  PixelNormal = world_transform * vec4(VertexNormal.xyz, 0);
  PixelTexture = VertexTexture;
  PixelId = float(gl_VertexID) / (4800 * 3);

  PixelWorldPosition = world_transform * vec4(VertexPosition.xyz, 1);

  love_Position = transform * vec4(VertexPosition.xyz, 1);
}
