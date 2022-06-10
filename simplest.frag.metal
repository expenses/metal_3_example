// language: metal2.0
#include <metal_stdlib>
#include <simd/simd.h>

using metal::uint;

constant metal::float4 const_type_1_ = {0.5, 0.0, 0.5, 1.0};

void main_1(
    thread metal::float4& OutColor
) {
    OutColor = const_type_1_;
    return;
}

struct main_Output {
    metal::float4 member [[color(0)]];
};
fragment main_Output main_(
) {
    metal::float4 OutColor = {};
    main_1(OutColor);
    metal::float4 _e1 = OutColor;
    return main_Output { _e1 };
}
