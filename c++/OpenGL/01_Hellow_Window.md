# 1.1 Basic window template
## Hello Window with GLFW and GLAD 
Example of how to create a basic OpenGL application using **GLFW** for window management and **GLAD** for loading OpenGL function pointers. The code sets up an OpenGL context, creates a transparent window, and runs a simple render loop that clears the screen with a custom background color.
```kotlin 

```cpp
// clang-format off
#include <glad/glad.h>
#include <GLFW/glfw3.h>
// clang-format on
#include <iostream>
// Include GLAD before GLFW to load all OpenGL function pointers
// Include GLFW for creating windows and handling user input

// Callback function for when the window is resized
void framebuffer_size_callback(GLFWwindow *window, int width, int height);

// Handles keyboard input (e.g., ESC to close)
void processInput(GLFWwindow *window);

// Window dimensions
const unsigned int SCR_WIDTH = 800;
const unsigned int SCR_HEIGHT = 600;

int main() {
  // Initialize GLFW library
  glfwInit();

  // Set the OpenGL version to 3.3
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);

  // Use the core profile (modern OpenGL, no legacy functions)
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  glfwWindowHint(GLFW_TRANSPARENT_FRAMEBUFFER, GLFW_TRUE); // <-- transparencia

#ifdef __APPLE__
  // On macOS, this is required for forward compatibility
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
#endif

  // Create a windowed mode window and OpenGL context
  GLFWwindow *window =
      glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "JoshOpenGL", NULL, NULL);

  // Check if window creation succeeded
  if (window == NULL) {
    std::cout << "Failed to create GLFW window" << std::endl;
    glfwTerminate(); // Clean up and exit
    return -1;
  }

  // Make the window the current OpenGL context
  glfwMakeContextCurrent(window);

  // Register callback function to adjust viewport when window is resized
  glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

  // Initialize GLAD to load OpenGL function pointers
  if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
    std::cout << "Failed to initialize GLAD" << std::endl;
    return -1;
  }

  // -----------------------------
  // Render loop (keeps running until the window should close)
  // -----------------------------
  while (!glfwWindowShouldClose(window)) {
    // Handle input (e.g., check for ESC key)
    processInput(window);

    // Set the background color and clear the color buffer
    glClearColor(0.0f, 0.0f, 0.0f, 0.8f); // RGB + Alpha
    glClear(GL_COLOR_BUFFER_BIT);         // Clear the screen with the color

    // Swap front and back buffers (double buffering)
    glfwSwapBuffers(window);

    // Poll for and process events (keyboard, mouse, etc.)
    glfwPollEvents();
  }

  // Clean up and close the application
  glfwTerminate();
  return 0;
}

// Handle user input: ESC key will close the window
void processInput(GLFWwindow *window) {
  // Check if the ESC key is pressed
  if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
    glfwSetWindowShouldClose(window, true); // Signal to close the window
}

// Callback function: executes when the window is resized
void framebuffer_size_callback(GLFWwindow *window, int width, int height) {
  // Adjust the OpenGL viewport to the new window size
  glViewport(0, 0, width, height);
}

