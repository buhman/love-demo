#pragma language glsl3

varying vec4 PixelNormal;
varying vec4 PixelTexture;
varying vec4 PixelWorldPosition;

uniform vec4 emission_color;
uniform vec4 ambient_color;
uniform vec4 diffuse_color;
uniform vec4 specular_color;
uniform float shininess;

uniform vec4 view_position;
uniform vec4 light_position;
//uniform int4 texture_channel;

uniform sampler2D texture_sampler;

out vec4 out_color;

void pixelmain()
{
  //vec4 texColor = texture(texture_sampler, PixelTexture.xy);

  vec3 normal = normalize(PixelNormal.xyz);
  vec3 view_direction = normalize(view_position.xyz - PixelWorldPosition.xyz);
  vec3 light_direction = normalize(light_position.xyz - PixelWorldPosition.xyz);
  vec3 reflect_light_direction = reflect(-light_direction, normal);

  vec3 emission = emission_color.xyz;
  vec3 ambient = ambient_color.xyz;
  vec3 diffuse = diffuse_color.xyz;
  vec3 specular = specular_color.xyz;

  float diffuse_intensity = max(dot(normal, light_direction), 0.0);
  float specular_intensity = pow(max(dot(view_direction, reflect_light_direction), 0.0), shininess);

  vec3 color = emission * 0;
  color += ambient * 0;
  color += diffuse * diffuse_intensity;
  color += specular * specular_intensity * 0.3;

  out_color = vec4(color, 1.0);
}
