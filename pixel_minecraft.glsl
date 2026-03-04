#pragma language glsl4

in vec3 PixelNormal;
//in vec3 PixelColor;
in vec2 PixelTexture;
in float PixelBlock;

uniform sampler2D terrain_sampler;

out vec4 out_color;

layout (std430) readonly buffer TexturesLayout
{
  uint Textures[];
};

void pixelmain()
{
  vec3 light_direction = normalize(vec3(-1, -0.5, 0.5));
  float diffuse_intensity = max(dot(PixelNormal, light_direction), 0.0);

  //vec3 color = PixelColor * diffuse_intensity;

  //int t_ix = int(PixelBlock) / 4;
  //int t_shift = (int(PixelBlock) % 4) * 8;
  //int terrain_ix = int(Textures[t_ix] >> t_shift);
  int terrain_ix = int(Textures[int(PixelBlock)]);
  int terrain_x = terrain_ix % 16;
  int terrain_y = terrain_ix / 16;

  ivec2 coord = ivec2(terrain_x, terrain_y) * 16;
  coord += ivec2(int(PixelTexture.x * 16.0), int(PixelTexture.y * 16.0));

  vec4 texture_color = texelFetch(terrain_sampler, coord, 0);
  if (texture_color.w != 1.0) {
    discard;
    return;
  }

  if (int(PixelBlock) == 18) // leaves
    texture_color.xyz *= vec3(0.125, 0.494, 0.027);



  //out_color = vec4(color, 1.0);
  out_color = vec4((texture_color * diffuse_intensity).xyz, 1.0);
  //out_color = vec4(diffuse_intensity);
}
