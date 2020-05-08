#version 330 core

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 pos_texture;

out vec2 frag_tex_coords;

void main() {
    mat4 view_ = view;
    view_[3] = vec4(0.0, 0.0, 0.0, 1.0);

    vec4 pos = projection * view_ * vec4(position, 1.0);

    //vec4 pos = projection * view * vec4(position, 1.0);

    gl_Position = vec4(pos.xy, pos.z, pos.w);

    //gl_Position = pos.xyww;

    frag_tex_coords = pos_texture;
}
