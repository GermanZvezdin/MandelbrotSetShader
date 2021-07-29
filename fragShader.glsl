
const float RE_START = -2.2;
const float RE_END = 1.2;
const float IM_START = -1.2;
const float IM_END = 1.2;



vec3 mandelbrot(in vec2 C){
    vec2 z = vec2(0.0 , 0.0);
    float n = .0;
    while (length(z) <= 25.0 * abs(sin(iTime * 0.3)) && n < 25.0 * abs(sin(iTime * 0.3))){
        z = vec2(z.x * z.x -  z.y * z.y,  2.0 * z.x * z.y) + C;
        n += 0.95;
    }
    return vec3(n, z);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    
    vec2 uv = fragCoord;
 
    vec2 C = vec2(RE_START + (uv.x / iResolution.x) * (RE_END - RE_START),
                  IM_START + (uv.y / iResolution.y) * (IM_END - IM_START));
    
    vec3 n = mandelbrot(C);
    
    float y = n.x / (25.0 * abs(sin(iTime * 0.3)));
    float z = n.x / (25.0 * abs(sin(iTime * 0.3)));
    
    /*
    if (20.0 * abs(sin(iTime * 0.5)) > 15.5) {
        n.x += (5.0 / (1.0 + exp(-20.0 * abs(sin(iTime * 0.5)) + 17.5))) * exp(25.0 * abs(sin(iTime* 0.5)) - 15.0) * 0.1;
        y +=  n.x * (0.05 / (1.0 + exp(-20.0 * abs(sin(iTime* 0.5)) + 17.5)) )*exp(25.0 * abs(sin(iTime* 0.5)) - 15.0)* 0.1 ;
        z +=  n.x * (0.05 / (1.0 + exp(-20.0 * abs(sin(iTime * 0.5)) + 17.5)) )*exp(25.0 * abs(sin(iTime* 0.5)) - 15.0)* 0.1;
        
       
    }*/
    
    
    vec3 col = vec3(y,n.x / (25.0 * abs(sin(iTime * 0.3))),z);

   
    fragColor = vec4(col, 1.0);
}
