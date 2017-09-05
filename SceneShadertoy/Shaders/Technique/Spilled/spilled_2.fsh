
float getVal(vec2 uv)
{
    return length(texture(iChannel0,uv).xyz);
}

vec2 getGrad(vec2 uv,float delta)
{
    vec2 d=vec2(delta,0);
    return vec2(
                getVal(uv+d.xy)-getVal(uv-d.xy),
                getVal(uv+d.yx)-getVal(uv-d.yx)
                )/delta;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec3 n = vec3(getGrad(uv,1.0/iResolution.y),150.0);
    //n *= n;
    n=normalize(n);
    fragColor=vec4(n,1);
    vec3 light = normalize(vec3(1,1,2));
    float diff=clamp(dot(n,light),0.5,1.0);
    float spec=clamp(dot(reflect(light,n),vec3(0,0,-1)),0.0,1.0);
    spec=pow(spec,36.0)*2.5;
    //spec=0.0;
    fragColor = texture(iChannel0,uv)*vec4(diff)+vec4(spec);
}
