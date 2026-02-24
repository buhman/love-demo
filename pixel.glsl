#pragma language glsl3

varying vec4 PixelNormal;
varying vec4 PixelTexture;
varying vec4 PixelWorldPosition;

uniform vec4 emission_color;
uniform vec4 ambient_color;
uniform vec4 diffuse_color;
uniform vec4 specular_color;
uniform float shininess;

uniform sampler2D emission_sampler;
uniform sampler2D ambient_sampler;
uniform sampler2D diffuse_sampler;
uniform sampler2D specular_sampler;

uniform vec4 view_position;
uniform vec4 light_position;
uniform ivec4 texture_channel;

out vec4 out_color;

void pixelmain()
{
  vec3 normal = normalize(PixelNormal.xyz);
  vec3 view_direction = normalize(view_position.xyz - PixelWorldPosition.xyz);
  vec3 light_direction = normalize(light_position.xyz - PixelWorldPosition.xyz);
  vec3 reflect_light_direction = reflect(-light_direction, normal);

  vec4 emission;
  vec4 ambient;
  vec4 diffuse;
  vec4 specular;
  if (texture_channel.x >= 0) { // emission
    emission = texture(emission_sampler, PixelTexture.xy);
  } else {
    emission = emission_color;
  }
  if (texture_channel.y >= 0) { // ambient
    ambient = texture(ambient_sampler, PixelTexture.xy);
  } else {
    ambient = ambient_color;
  }
  if (texture_channel.z >= 0) { // diffuse
    diffuse = texture(diffuse_sampler, PixelTexture.xy);
  } else {
    diffuse = diffuse_color;
  }
  if (texture_channel.w >= 0) { // specular
    specular = texture(specular_sampler, PixelTexture.xy);
  } else {
    specular = specular_color;
  }

  float diffuse_intensity = max(dot(normal, light_direction), 0.0);
  float specular_intensity = pow(max(dot(view_direction, reflect_light_direction), 0.0), shininess);

  vec3 color = emission.xyz * 0;
  color += ambient.xyz * 0;
  color += diffuse.xyz * diffuse_intensity;
  color += specular.xyz * specular_intensity * 0.3;

  out_color = vec4(color, 1.0);
}
