#pragma language glsl4

uniform sampler2D g_color_sampler;
uniform sampler2D g_position_sampler;
uniform sampler2D g_normal_sampler;
uniform sampler2D noise_sampler;

uniform mat4 projection;
uniform vec3 sample_kernel[64];

const vec2 noise_scale = vec2(1024.0 / 4.0, 1024 / 4.0);

uniform float bias;
uniform float radius;
uniform float occlusion_exponent;
uniform float occlusion_offset;

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
    //vec3 sample_position = SSAOKernel[i].xyz;
    sample_position = sample_position * radius + position;

    vec4 offset = vec4(sample_position, 1.0);
    offset = projection * offset;
    offset.xyz = offset.xyz / offset.w;

    vec2 sample_depth_coord = offset.xy * vec2(0.5, -0.5) + 0.5;
    float sample_depth = texture(g_position_sampler, sample_depth_coord).z;

    float range_check = smoothstep(0.0, 1.0, radius / abs(position.z - sample_depth));
    occlusion += (sample_depth >= sample_position.z + bias ? 1.0 : 0.0) * range_check;
  }
  occlusion = 1.0 - (occlusion / samples);
  occlusion = pow(occlusion, occlusion_exponent) + occlusion_offset;

  out_color = vec4(color * occlusion, 1.0);
}
