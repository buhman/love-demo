#pragma language glsl3

uniform sampler2D g_occlusion_sampler;

in vec4 PixelTexture;

out vec2 out_blur;

//const float offset[3] = float[](0.0, 1.3846153846, 3.2307692308);
//const float weight[3] = float[](0.2270270270, 0.3162162162, 0.0702702703);
const float offset[3] = float[](-1.200436, 0, 1.200436);
const float weight[3] = float[](0.30613, 0.38774, 0.30613);

uniform vec2 inverse_screen_size;
uniform vec2 dir;

void pixelmain()
{
  vec2 sample = texture(g_occlusion_sampler, gl_FragCoord.xy * inverse_screen_size).xy;

  float blur = sample.x * weight[1];

  vec2 a = (gl_FragCoord.xy + (dir * offset[0])) * inverse_screen_size;
  vec2 b = (gl_FragCoord.xy - (dir * offset[0])) * inverse_screen_size;
  blur += texture(g_occlusion_sampler, a).x * weight[0];
  blur += texture(g_occlusion_sampler, b).x * weight[0];
  /*
  for (int i=1; i<1; i++) {
    vec2 a = (gl_FragCoord.xy + (dir * offset[i])) * inverse_screen_size;
    vec2 b = (gl_FragCoord.xy - (dir * offset[i])) * inverse_screen_size;
    blur += texture(g_occlusion_sampler, a).x * weight[i];
    blur += texture(g_occlusion_sampler, b).x * weight[i];
  }
  */

  out_blur = vec2(blur, sample.y);
}
