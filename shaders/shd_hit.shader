attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] *     vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~//
varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float strength;

void main()
{ 
    vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
    gl_FragColor.rgb = vec3(1,0.9,0.9);
    gl_FragColor.a = colour.a;
}
