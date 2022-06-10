// language: metal2.0
#include <metal_stdlib>
#include <simd/simd.h>

using metal::uint;


void main_1(
    thread metal::float4& OutColor,
    thread metal::float3& col_1
) {
    metal::float3 _e8 = col_1;
    OutColor = metal::float4(_e8.x, _e8.y, _e8.z, 1.0);
    return;
}

struct main_Input {
    metal::float4 _pos [[position]];
    metal::float3 col [[user(loc0)]];
};
struct main_Output {
    metal::float4 member [[color(0)]];
};
fragment main_Output main_(
  main_Input varyings [[stage_in]]
) {
    metal::float4 OutColor = {};
    metal::float3 col_1 = {};
    metal::float4 _pos_1 = {};
    const auto col = varyings.col;
    const auto _pos = varyings._pos;
    col_1 = col;
    _pos_1 = _pos;
    main_1(OutColor, col_1);
    metal::float4 _e5 = OutColor;
    return main_Output { _e5 };
}
