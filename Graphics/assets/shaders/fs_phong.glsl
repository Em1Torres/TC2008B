#version 300 es
precision highp float; // fs_phong.glsl

in vec3 v_normalVector;
in vec3 v_surfToLight;

out vec4 outColor;

uniform vec4 u_ambientColor;
uniform vec4 u_diffuseColor;
uniform vec4 u_specularColor;
uniform float u_shininess;

uniform vec4 u_ambientLight;
uniform vec4 u_diffuseLight;
uniform vec4 u_specularLight;

void main() {

    vec3 Nnormal = normalize(v_normalVector);
    vec3 Nstol = normalize(v_surfToLight);

    // Ambient Color
    vec4 ambient = u_ambientColor*u_ambientLight;

    // Diffuse color
    float diffuseConstant = max(dot(Nnormal, Nstol),0.0);
    vec4 diffuseColor = u_diffuseColor * u_diffuseLight * diffuseConstant;

    outColor = ambient+diffuseColor;
}
