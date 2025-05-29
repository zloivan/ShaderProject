Shader "ShaderTutorials/6_Practice_1"
{
    Properties
    {
        _myBump ("My Bump", 2D) = "bump" {}
        _mySlider ("Bump Intensity", Range(0, 10)) = 0.3
        _myCube ("Cube Map", Cube) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myBump;
        fixed _mySlider;
        samplerCUBE _myCube;

        struct Input
        {
            float2 uv_myDiffuse;
            float2 uv_myBump;
            float3 worldRefl;
            INTERNAL_DATA
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump.xy)) * _mySlider;
            o.Albedo = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal));
        }
        ENDCG
    }

    Fallback "Diffuse"
}