#pragma language glsl3

uniform sampler2D g_sampler;

out vec4 out_color;

void pixelmain()
{
  vec4 color = texelFetch(g_sampler, ivec2(gl_FragCoord), 0);

  out_color = vec4(color.xyz, 1.0);
}
