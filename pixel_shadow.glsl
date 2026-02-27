#pragma language glsl3

layout (location = 0) out float g_out;

void pixelmain()
{
  g_out = gl_FragCoord.z;
}
