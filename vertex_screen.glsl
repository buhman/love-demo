#pragma language glsl3

const vec4 vtx[4] = vec4[](vec4(-1.0,  1.0, 0.0, 1.0),  // tl
                           vec4( 1.0,  1.0, 0.0, 1.0),  // tr
                           vec4( 1.0, -1.0, 0.0, 1.0),  // br
                           vec4(-1.0, -1.0, 0.0, 1.0)); // bl

varying vec4 PixelTexture;

void vertexmain()
{
  vec4 vertex = vtx[gl_VertexID];

  PixelTexture = vec4(vertex.xy * vec2(0.5, -0.5) + 0.5, 0, 0);

  love_Position = vertex;
}
