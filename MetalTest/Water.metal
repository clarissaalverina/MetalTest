//
//  Water.metal
//  MetalTest
//
//  Created by Clarissa Alverina on 20/06/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 wave(
    float2 pos, float t, float2 s) {
//        float2 distance = pos / s;
        pos.y += sin(t * 6.5 + pos.y / 20) * 5;
//        * distance.y * 5;
        return pos;
}

