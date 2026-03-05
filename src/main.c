#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <stdbool.h>

#include "glad/gl.h"
#include <GLFW/glfw3.h>

static const float vertex_buffer_data[] = {
  // position          // color
   0.5f, -0.5f, 0.0f,  1.0f, 0.0f, 0.0f, 0.010f,  // bottom right
  -0.5f, -0.5f, 0.0f,  0.0f, 1.0f, 0.0f, 0.050f,  // bottom left
   0.0f,  0.5f, 0.0f,  0.0f, 0.0f, 1.0f, 0.100f,   // top
};

const int vertex_buffer_data_size = (sizeof (vertex_buffer_data));

struct location {
  struct {
    unsigned int position;
    unsigned int color;
  } attrib;
};

extern unsigned int load();

int main()
{
  glfwInitHint(GLFW_PLATFORM, GLFW_PLATFORM_X11);
  glfwInit();
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  //glfwWindowHint(GLFW_OPENGL_DEBUG_CONTEXT, GLFW_TRUE);

  GLFWwindow* window = glfwCreateWindow(1024, 1024, "LearnOpenGL", NULL, NULL);
  if (window == NULL) {
    const char* description;
    glfwGetError(&description);
    printf("Failed to create GLFW window: %s\n", description);
    glfwTerminate();
    return -1;
  }
  glfwMakeContextCurrent(window);
  gladLoadGL(glfwGetProcAddress);

  glViewport(0, 0, 1024, 1024);

  unsigned int vertex_buffer;
  glGenBuffers(1, &vertex_buffer);
  glBindBuffer(GL_ARRAY_BUFFER, vertex_buffer);
  glBufferData(GL_ARRAY_BUFFER, vertex_buffer_data_size, vertex_buffer_data, GL_STATIC_DRAW);

  unsigned int program = load();

  struct location location;

  location.attrib.position = glGetAttribLocation(program, "position");
  location.attrib.color = glGetAttribLocation(program, "color");
  printf("attributes:\n  position %u\n  color %u\n",
         location.attrib.position,
         location.attrib.color);

  unsigned int vertex_array_object;
  glGenVertexArrays(1, &vertex_array_object);
  glBindVertexArray(vertex_array_object);
  glBindBuffer(GL_ARRAY_BUFFER, vertex_buffer);
  glVertexAttribPointer(location.attrib.position,
                        3,
                        GL_FLOAT,
                        GL_FALSE,
                        (sizeof (float)) * 7,
                        (void*)0
                        );
  glVertexAttribPointer(location.attrib.color,
                        4,
                        GL_FLOAT,
                        GL_FALSE,
                        (sizeof (float)) * 7,
                        (void*)(3 * 4)
                        );
  glEnableVertexAttribArray(location.attrib.position);
  glEnableVertexAttribArray(location.attrib.color);

  while(!glfwWindowShouldClose(window)) {
    if(glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
      glfwSetWindowShouldClose(window, true);

    glClearColor(0.1f, 0.1f, 0.1f, 0.1f);
    glClear(GL_COLOR_BUFFER_BIT);

    //
    // render
    //
    glUseProgram(program);
    glBindVertexArray(vertex_array_object);

    glDrawArrays(GL_TRIANGLES, 0, 3);

    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  glfwTerminate();

  return 0;
}
