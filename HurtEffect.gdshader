shader_type canvas_item;
group_uniforms HurtScreen;

uniform float intensity = 0.3;
uniform float heart_beating_speed = 2.0;
uniform float clear_center_amount_mult = 60.0;
uniform vec3 effect_color : source_color = vec3(1.0, 0.221, 0.221);

void fragment()
{
	vec2 uv = UV;
	vec4 text = texture(TEXTURE, uv);
	uv *= 1.0 - uv.xy;
	float vignette = uv.x * uv.y * clear_center_amount_mult;
	vignette = 1.0 - pow(vignette, intensity);
	
	text.rgba *= vignette;
	text.rgb *= effect_color;
	text.a = text.a * clamp(abs(cos(TIME * heart_beating_speed)), 0.8, 1);
	COLOR = text;
}
