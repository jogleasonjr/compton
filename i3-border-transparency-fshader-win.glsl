uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

void main() {
	vec4 c = texture2D(tex, gl_TexCoord[0]);
	{
		// This is 100% yellow, our key color for handling alpha.
		// This should match the bordor color in your i3 configuration.
		vec4 chromaColor = vec4(1,1,0, 1.0);

		vec4 vdiff = abs(chromaColor - c);
		float diff = max(max(max(vdiff.r, vdiff.g), vdiff.b), vdiff.a);
		
		if (diff < 0.001)
		{
			c *= 0.0;
		}
	}
	
	gl_FragColor = c;
}
