#pragma language glsl4

struct vertex_pnt_t {
  vec4 Position;
  vec4 Normal;
  vec4 Texture;
};

struct vertex_jw_t {
  ivec4 Joint;
  vec4 Weight;
};

layout (std430) readonly buffer VertexPNTLayout
{
  vertex_pnt_t VertexPNTBuffer[];
};

layout (std430) readonly buffer VertexJWLayout
{
  vertex_jw_t VertexJWBuffer[];
};

uniform int VertexPNTOffset;
uniform int VertexJWOffset;

uniform mat4 Joints[3];

uniform mat4 world_transform;
uniform mat4 transform;

varying vec4 PixelNormal;
varying vec4 PixelTexture;
varying vec4 PixelWorldPosition;

void vertexmain()
{
  vertex_pnt_t VertexPNT = VertexPNTBuffer[VertexPNTOffset + gl_VertexID];
  vertex_jw_t VertexJW = VertexJWBuffer[VertexJWOffset + gl_VertexID];

  mat4 mSkin
    = VertexJW.Weight.x * Joints[VertexJW.Joint.x]
    + VertexJW.Weight.y * Joints[VertexJW.Joint.y]
    + VertexJW.Weight.z * Joints[VertexJW.Joint.z]
    + VertexJW.Weight.w * Joints[VertexJW.Joint.w]
    ;

  PixelNormal = world_transform * vec4(VertexPNT.Normal.xyz, 0);
  PixelTexture = VertexPNT.Texture;

  vec4 Position = mSkin * vec4(VertexPNT.Position.xyz, 1);
  //vec4 Position = Joints * vec4(VertexPNT.Position.xyz, 1);
  PixelWorldPosition = world_transform * Position;
  love_Position = transform * Position;
}
