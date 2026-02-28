#pragma language glsl3

layout (location = 0) out vec4 g_color;

uniform sampler2D texture_sampler;

in vec4 PixelTexture;

uniform vec2 cell;
uniform vec2 glyph;

void pixelmain()
{
  vec4 sample = texture(texture_sampler, PixelTexture.xy * cell + cell * glyph);
  float px = sample.x == 0.0 ? 0.0 : 1.0;

  g_color = vec4(vec3(px), 1.0);
  //g_color = vec4(1, 0, 0, 1.0);
}
