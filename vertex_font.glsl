#pragma language glsl3

const vec2 vtx[4] = vec2[](vec2(-1.0,  1.0),  // tl
                           vec2( 1.0,  1.0),  // tr
                           vec2( 1.0, -1.0),  // br
                           vec2(-1.0, -1.0)); // bl

uniform mat4 transform;

out vec4 PixelTexture;

void vertexmain()
{
  vec2 vertex = vtx[gl_VertexID];

  PixelTexture = vec4(vertex * vec2(0.5, -0.5) + 0.5, 0, 0);

  vertex = vertex * vec2(0.5, 0.5) + vec2(0.5, -0.5);

  love_Position = transform * vec4(vertex, 0.0, 1.0);
}
