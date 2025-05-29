Shader "ShaderTutorials/6_BumpedEnvironments"
{
    Properties
    {
        _myDiffuse ("My Diffuse", 2D) = "white" {}
        _myBump ("My Bump", 2D) = "bump" {}
        _mySlider ("Bump Intensity", Range(0, 10)) = 1
        _myBrightness ("Brightness", Range(0, 10)) = 1
        _myCube ("Cube Map", Cube) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myDiffuse;
        sampler2D _myBump;
        fixed _mySlider;
        fixed _myBrightness;
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
            o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse.xy).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump.xy)) * _myBrightness;
            o.Normal *= float3(_mySlider, _mySlider, 1);
            o.Emission = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal));
        }
        ENDCG
    }

    Fallback "Diffuse"
}