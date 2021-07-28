const float RE_START = -2.2;
const float RE_END = 1.2;
const float IM_START = -1.2;
const float IM_END = 1.2;


vec3 mandelbrot(in vec2 C){
    vec2 z = vec2(0.0 , 0.0);
    float n = .0;
    while (length(z) <= iTime && n < iTime){
        z = vec2(z.x * z.x -  z.y * z.y,  2.0 * z.x * z.y) + C;
        n += 0.95;
    }
    return vec3(n, z);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord) {
    
    vec2 uv = fragCoord;
    vec2 C = vec2(RE_START + (uv.x / iResolution.x) * (RE_END - RE_START),
                  IM_START + (uv.y / iResolution.y) * (IM_END - IM_START));
    
    vec3 n = mandelbrot(C);
    
    float y = n.x / iTime;
    float z = n.x / iTime;
    
    
    if (iTime > 15.0 && iTime < 15.15) {
        n.x = iTime * n.x;
        y =  n.x;
        z =  n.x;
    }
    if (iTime > 15.15) {
          
        y += exp(n.z / iTime) + 0.2*sin(iTime);
        z += exp(n.y / iTime) + 0.2*cos(iTime);
    }
    
    vec3 col = vec3(n.x / iTime, y, z);

   
    fragColor = vec4(col, 1.0);
}
