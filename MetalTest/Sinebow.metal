//
//  Wave.metal
//  MetalTest
//
//  Created by Clarissa Alverina on 20/06/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 sinebow(
    float2 pos, half4 color, float2 s, float t) {
        float2 uv = (pos / s.x) * 2-1;
        float waves = sin(uv.x + t);
        waves *= waves * 50;
        float luma = 1 / (100 * uv.y + waves);
        return half4(luma, luma, luma, 1);
        
}
