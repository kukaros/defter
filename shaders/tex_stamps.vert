/*
/ Copyright � 2010
/ Andrew Flower & Justin Crause
/ Honours Project - Deformable Terrain
*/

#version 150 core

// Uniforms
uniform vec2 stamp_scale;
uniform mat2 stamp_rotation;
uniform vec2 clickPos;
uniform vec2 stamp_mirror;


// Shader Input
in vec2 vert_Position;


// Shader Output
out vec2 frag_TexCoord;
out vec2 stamp_TexCoord;


//------------------------------------------------------------------------------
void main()
{
	vec2 dif 		= 0.5 - clickPos;

	vec2 texCoord 	= stamp_rotation * vert_Position * stamp_scale;

	gl_Position 	= vec4(2 * (texCoord - dif), 1.0, 1.0);

	frag_TexCoord 	= texCoord  + clickPos;
	stamp_TexCoord	= (vert_Position * 0.5 + 0.5);
	stamp_TexCoord.x= stamp_mirror.x - (stamp_mirror.y * stamp_TexCoord.x);
}
