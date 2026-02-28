#pragma language glsl4

uniform sampler2D g_color_sampler;
uniform sampler2D g_position_sampler;
uniform sampler2D g_normal_sampler;
uniform sampler2D noise_sampler;

uniform mat4 projection2;
uniform vec3 sample_kernel[64];

const vec2 noise_scale = vec2(1024.0 / 4.0, 1024 / 4.0);

const float bias = 0.05;
const float radius = 0.5;
const int samples = 64;

varying vec4 PixelTexture;

out vec4 out_color;

layout (std430) readonly buffer SSAOKernelLayout
{
  vec4 SSAOKernel[];
};

void pixelmain()
{
  vec3 color = texture(g_color_sampler, PixelTexture.xy).xyz;
  vec3 position = texture(g_position_sampler, PixelTexture.xy).xyz;
  vec3 normal = normalize(texture(g_normal_sampler, PixelTexture.xy).xyz);
  vec3 noise = normalize(vec3(texture(noise_sampler, PixelTexture.xy * noise_scale).xy, 0));

  vec3 tangent = normalize(noise - normal * dot(noise, normal));
  vec3 bitangent = cross(normal, tangent);
  mat3 TBN = mat3(tangent, bitangent, normal);

  float occlusion = 0.0;
  for (int i = 0; i < samples; i++) {
    vec3 sample_position = TBN * SSAOKernel[i].xyz;
    sample_position = sample_position * radius + position;

    vec4 offset = vec4(sample_position, 1.0);
    offset = projection2 * offset;
    offset.xyz = offset.xyz / offset.w;
    offset.xyz = offset.xyz * vec3(0.5, -0.5, 0.5) + 0.5;

    float sample_depth = texture(g_position_sampler, offset.xy).z;

    float range_check = smoothstep(0.0, 1.0, radius / abs(position.z - sample_depth));
    occlusion += (sample_depth >= sample_position.z + bias ? 1.0 : 0.0) * range_check;
  }
  occlusion = 1.0 - (occlusion / samples);

  out_color = vec4(color * vec3(pow(occlusion, 20) + 0.75), 1.0);

  //out_color = vec4(vec3(-position.z * 0.0001), 1.0);

  //out_color = vec4(vec3(-position.z * 0.0001), 1.0);
  //vec4 foo = projection2 * vec4(position, 1.0);
  //foo.xyz = foo.xyz / foo.w;
  //out_color = vec4(foo.xy * 0.5 + 0.5, 0.0, 1.0);
  //out_color = vec4(normal, 1);
  //out_color = vec4(SSAOKernel[].xyz * 8, 1.0);
}
