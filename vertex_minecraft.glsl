#pragma language glsl4

struct vertex_t {
  vec3 position;
  vec3 normal;
};

vertex_t vertices[] = vertex_t[](vertex_t(vec3(-1.0, 1.0, -1.0), vec3(0.0, 1.0, 0.0)),
                                 vertex_t(vec3(1.0, 1.0, 1.0), vec3(0.0, 1.0, 0.0)),
                                 vertex_t(vec3(1.0, 1.0, -1.0), vec3(0.0, 1.0, 0.0)),
                                 vertex_t(vec3(1.0, 1.0, 1.0), vec3(0.0, 0.0, 1.0)),
                                 vertex_t(vec3(-1.0, -1.0, 1.0), vec3(0.0, 0.0, 1.0)),
                                 vertex_t(vec3(1.0, -1.0, 1.0), vec3(0.0, 0.0, 1.0)),
                                 vertex_t(vec3(-1.0, 1.0, 1.0), vec3(-1.0, 0.0, 0.0)),
                                 vertex_t(vec3(-1.0, -1.0, -1.0), vec3(-1.0, 0.0, 0.0)),
                                 vertex_t(vec3(-1.0, -1.0, 1.0), vec3(-1.0, 0.0, 0.0)),
                                 vertex_t(vec3(1.0, -1.0, -1.0), vec3(0.0, -1.0, 0.0)),
                                 vertex_t(vec3(-1.0, -1.0, 1.0), vec3(0.0, -1.0, 0.0)),
                                 vertex_t(vec3(-1.0, -1.0, -1.0), vec3(0.0, -1.0, 0.0)),
                                 vertex_t(vec3(1.0, 1.0, -1.0), vec3(1.0, 0.0, 0.0)),
                                 vertex_t(vec3(1.0, -1.0, 1.0), vec3(1.0, 0.0, 0.0)),
                                 vertex_t(vec3(1.0, -1.0, -1.0), vec3(1.0, 0.0, 0.0)),
                                 vertex_t(vec3(-1.0, 1.0, -1.0), vec3(0.0, 0.0, -1.0)),
                                 vertex_t(vec3(1.0, -1.0, -1.0), vec3(0.0, 0.0, -1.0)),
                                 vertex_t(vec3(-1.0, -1.0, -1.0), vec3(0.0, 0.0, -1.0)),
                                 vertex_t(vec3(-1.0, 1.0, 1.0), vec3(0.0, 1.0, 0.0)),
                                 vertex_t(vec3(-1.0, 1.0, 1.0), vec3(0.0, 0.0, 1.0)),
                                 vertex_t(vec3(-1.0, 1.0, -1.0), vec3(-1.0, 0.0, 0.0)),
                                 vertex_t(vec3(1.0, -1.0, 1.0), vec3(0.0, -1.0, 0.0)),
                                 vertex_t(vec3(1.0, 1.0, 1.0), vec3(1.0, 0.0, 0.0)),
                                 vertex_t(vec3(1.0, 1.0, -1.0), vec3(0.0, 0.0, -1.0)));

uniform mat4 transform;

out vec3 PixelNormal;
out vec3 PixelColor;
out float PixelBlock;

struct block_t {
  uint x_z_blockid;
  uint block_index;
};

layout (std430) readonly buffer BlocksLayout
{
  block_t Blocks[];
};

vec3 palette(float t) {
  vec3 a = vec3(0.5, 0.5, 0.5);
  vec3 b = vec3(0.5, 0.5, 0.5);
  vec3 c = vec3(1.0, 1.0, 1.0);
  vec3 d = vec3(0.263, 0.416, 0.557);

  return a + b * cos(6.28318 * (c * t + d));
}

int sign_extend(uint x)
{
  return int(((x + 0x80) & 0xff) - 0x80);
}

void vertexmain()
{
  vertex_t vertex = vertices[gl_VertexID];

  block_t block = Blocks[int(gl_InstanceID)];
  float x = float(block.block_index / (128 * 16));
  float y = float(block.block_index % 128);
  float z = float(int(block.block_index / 128) % 16);

  float chunk_x = float(sign_extend((block.x_z_blockid >> 0) & 0xff));
  float chunk_z = float(sign_extend((block.x_z_blockid >> 8) & 0xff));
  int block_id = int((block.x_z_blockid >> 16) & 0xff);

  PixelNormal = vertex.normal;
  PixelColor = palette(float(block_id) * 0.01);
  PixelBlock = block_id;
  vec3 position = ((vertex.position * 0.4) + vec3(x, z, y) + vec3(chunk_x * 16.0, chunk_z * 16.0, 0));
  love_Position = transform * vec4(position, 1.0);
}
