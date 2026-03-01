#pragma language glsl3

uniform sampler2D g_occlusion_sampler;
uniform sampler2D g_color_sampler;

out vec4 out_color;

void pixelmain()
{
  vec2 occlusion = texelFetch(g_occlusion_sampler, ivec2(gl_FragCoord.xy), 0).xy;
  vec3 color = texelFetch(g_color_sampler, ivec2(gl_FragCoord.xy), 0).xyz;

  float f = (1.0 - min(1.0, occlusion.y));
  float f2 = smoothstep(0.0, 0.2, f);
  //out_color = vec4(color * f2 * occlusion.x, 1.0);
  if (color == vec3(0, 0, 0))
    out_color = vec4(0, 0, 0, 1);
  else
    out_color = vec4(color * occlusion.x + occlusion.y * occlusion.y, 1.0);
  //out_color = vec4(occlusion.y);
}
