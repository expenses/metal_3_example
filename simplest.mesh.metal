// language: metal2.0
#include <metal_stdlib>
#include <simd/simd.h>

using metal::uint;

struct gl_MeshPerVertexNV {
    metal::float4 gl_Position [[position]];
};
struct type_3 {
    gl_MeshPerVertexNV inner[6u];
};
struct type_8 {
    metal::float3 inner[6u];
};
struct type_11 {
    uint inner[9u];
};
struct type_15 {
    type_3 member;
    type_8 member_1 [[user(loc0)]];
    type_11 member_2;
    uint member_3;
};
constant metal::float4 const_type_1_ = {-0.8999999761581421, -0.8999999761581421, 0.0, 1.0};
constant metal::float4 const_type_1_1 = {0.8999999761581421, -0.8999999761581421, 0.0, 1.0};
constant metal::float4 const_type_1_2 = {-0.8999999761581421, 0.800000011920929, 0.0, 1.0};
constant metal::float4 const_type_1_3 = {0.699999988079071, 0.800000011920929, 0.0, 1.0};
constant metal::float4 const_type_1_4 = {1.0, 1.0, 0.0, 1.0};
constant metal::float3 const_type_7_ = {1.0, 0.0, 0.0};
constant metal::float3 const_type_7_1 = {0.0, 1.0, 0.0};
constant metal::float3 const_type_7_2 = {0.0, 0.0, 1.0};
constant metal::float3 const_type_7_3 = {1.0, 1.0, 0.0};
constant metal::uint3 const_type_14_ = {1u, 1u, 1u};

void main_1(
    thread type_3& gl_MeshVerticesNV,
    thread type_8& vertexColor,
    thread type_11& gl_PrimitiveIndicesNV,
    thread uint& gl_PrimitiveCountNV
) {
    gl_MeshVerticesNV.inner[0].gl_Position = const_type_1_;
    gl_MeshVerticesNV.inner[1].gl_Position = const_type_1_1;
    gl_MeshVerticesNV.inner[2].gl_Position = const_type_1_2;
    gl_MeshVerticesNV.inner[3].gl_Position = const_type_1_3;
    gl_MeshVerticesNV.inner[4].gl_Position = const_type_1_4;
    vertexColor.inner[0] = const_type_7_;
    vertexColor.inner[1] = const_type_7_1;
    vertexColor.inner[2] = const_type_7_2;
    vertexColor.inner[3] = const_type_7_3;
    gl_PrimitiveIndicesNV.inner[0] = 0u;
    gl_PrimitiveIndicesNV.inner[1] = 1u;
    gl_PrimitiveIndicesNV.inner[2] = 2u;
    gl_PrimitiveIndicesNV.inner[3] = 2u;
    gl_PrimitiveIndicesNV.inner[4] = 1u;
    gl_PrimitiveIndicesNV.inner[5] = 3u;
    gl_PrimitiveIndicesNV.inner[6] = 3u;
    gl_PrimitiveIndicesNV.inner[7] = 4u;
    gl_PrimitiveIndicesNV.inner[8] = 2u;
    gl_PrimitiveCountNV = 3u;
    return;
}

struct main_Output {
    metal::float4 member [[position]];
    metal::float3 member_1 [[user(loc0)]];
};
[[mesh]] void main_(
  metal::mesh<main_Output, void, 6, 3, metal::topology::triangle> main_Output_mesh
) {
    type_3 gl_MeshVerticesNV = {};
    type_8 vertexColor = {};
    type_11 gl_PrimitiveIndicesNV = {};
    uint gl_PrimitiveCountNV = {};
    main_1(gl_MeshVerticesNV, vertexColor, gl_PrimitiveIndicesNV, gl_PrimitiveCountNV);
    type_3 _e4 = gl_MeshVerticesNV;
    type_8 _e5 = vertexColor;
    type_11 _e6 = gl_PrimitiveIndicesNV;
    uint _e7 = gl_PrimitiveCountNV;
    main_Output_mesh.set_primitive_count(gl_PrimitiveCountNV);
    for (uint i = 0; i < 6; i++) {
        main_Output _output;
        gl_MeshPerVertexNV _per_vertex = gl_MeshVerticesNV.inner[i];
        _output.member = _per_vertex.gl_Position;
        _output.member_1 = metal::float3(1.0, 1.0, 1.0);
        main_Output_mesh.set_vertex(i, _output);
    }
    for (uint i = 0; i < gl_PrimitiveCountNV * 3; i++) {
        main_Output_mesh.set_index(i, gl_PrimitiveIndicesNV.inner[i]);
    }
    return;
}
