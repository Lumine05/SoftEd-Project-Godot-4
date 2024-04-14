shader_type canvas_item;
uniform float blur_amount : hint_range(0.0, 10.0);
uniform vec2 SCREEN_SIZE;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 tex_offset = vec2(blur_amount / SCREEN_SIZE.x, 0.0);

    vec4 blur_color = vec4(0.0);

    // Horizontal blur pass
    blur_color += texture(TEXTURE, UV - 4.0 * tex_offset) * 0.05;
    blur_color += texture(TEXTURE, UV - 3.0 * tex_offset) * 0.09;
    blur_color += texture(TEXTURE, UV - 2.0 * tex_offset) * 0.12;
    blur_color += texture(TEXTURE, UV - tex_offset) * 0.15;
    blur_color += texture(TEXTURE, UV) * 0.16;
    blur_color += texture(TEXTURE, UV + tex_offset) * 0.15;
    blur_color += texture(TEXTURE, UV + 2.0 * tex_offset) * 0.12;
    blur_color += texture(TEXTURE, UV + 3.0 * tex_offset) * 0.09;
    blur_color += texture(TEXTURE, UV + 4.0 * tex_offset) * 0.05;
	// Called for every pixel the material is visible on.
	 // Output the blurred color
    COLOR = blur_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
