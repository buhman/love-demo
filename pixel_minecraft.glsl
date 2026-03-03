#pragma language glsl4

in vec3 PixelNormal;
in vec3 PixelColor;
in float PixelBlock;

out vec4 out_color;

void pixelmain()
{
  if (PixelBlock == 0) {
    discard;
    return;
  }

  vec3 light_direction = normalize(vec3(-1, -0.5, 0.5));
  float diffuse_intensity = max(dot(PixelNormal, light_direction), 0.0);

  vec3 color = PixelColor * diffuse_intensity;

  out_color = vec4(color, 1.0);
}
