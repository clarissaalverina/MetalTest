//
//  Passthrough.metal
//  MetalTest
//
//  Created by Clarissa Alverina on 20/06/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 passthrough(
    float2 position, half4 color) {
    return color;
}
