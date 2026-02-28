layout (location = 0) out vec4 g_color;
layout (location = 1) out vec4 g_position;
layout (location = 2) out vec4 g_normal;

void pixelmain()
{
  g_color = vec4(0.0, 0.0, 0.0, 1.0);
  g_position = vec4(0.0, 0.0, 0.0, 1.0);
  g_normal = vec4(0.0, 0.0, 0.0, 1.0);
}
