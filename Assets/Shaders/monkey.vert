#version 400
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 norm;
layout (location = 2) in vec2 uv;

layout (location = 0) out vec3 out_norm;
layout (location = 1) out vec2 out_uv;

layout(std140, binding = 0) uniform buf {
    mat4 model;
    //mat4 view;
    //mat4 proj;
} matrices;

void main() {

    out_norm = norm;
    out_uv  = uv;
    
    mat4 MVP = matrices.model;//(matrices.proj * matrices.view) * matrices.model;
    
    vec4 worldPos = MVP * vec4(pos, 1);
    
    gl_Position = worldPos;
    
    // GL->VK conventions
    gl_Position.y = -gl_Position.y;
    gl_Position.z = (gl_Position.z + gl_Position.w) / 2.0;
}
