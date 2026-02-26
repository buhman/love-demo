#pragma language glsl3

uniform sampler2D g_position_sampler;
uniform sampler2D g_normal_sampler;
uniform sampler2D g_color_sampler;

varying vec4 PixelTexture;

out vec4 out_color;

mat3 sobel_x = mat3( 1.0,  2.0,  1.0,
                     0.0,  0.0,  0.0,
                    -1.0, -2.0, -1.0);
mat3 sobel_y = mat3(1.0, 0.0, -1.0,
                    2.0, 0.0, -2.0,
                    1.0, 0.0, -1.0);

float sobel(mat3 K)
{

  float sx = dot(sobel_x[0], K[0]) + dot(sobel_x[1], K[1]) + dot(sobel_x[2], K[2]);
  float sy = dot(sobel_y[0], K[0]) + dot(sobel_y[1], K[1]) + dot(sobel_y[2], K[2]);
  float edge = sqrt(pow(sx, 2.0) + pow(sy, 2.0));
  //float edge = max(sx, sy);
  return edge;
}

float kernel()
{
  mat3 K;
  mat3 Kz;
  //mat3 Kx;
  //mat3 Ky;
  //mat3 Kz;
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      vec4 sample = texelFetch(g_normal_sampler, ivec2(gl_FragCoord) + ivec2(x-1, y-1), 0);
      //Kx[x][y] = sample.x;
      //Ky[x][y] = sample.y;
      //Kz[x][y] = sample.z;
      K[x][y] = length(sample.xyz);
    }
  }

  //return max(sobel(Kx), max(sobel(Ky), sobel(Kz)));
  return float(sobel(K) < 0.1);
}

void pixelmain()
{
  vec4 color = texelFetch(g_color_sampler, ivec2(gl_FragCoord), 0);

  if (color.xyz == vec3(0, 0, 0)) {
    out_color = vec4(0.1, 0.1, 0.2, 1.0);
  } else {
    float edge = kernel();
    out_color = vec4(edge * color.xyz, 1.0);
    //out_color = vec4(edge, edge, edge, 1.0);
  }
}
