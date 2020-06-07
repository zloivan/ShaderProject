Shader "MyShaders/NormalMapping"
{
    Properties
    {
        _defuseTex ("Defuse Texture (RGB)", 2D) = "white" {}
        _normalTex ("Normal", 2D) = "bump" {}
        _intenceDefuse ("Albedo intense", Range(0,5)) = 1
        _intenceNormal ("Normal Change", Range(0,5)) = 1
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert


        sampler2D _defuseTex;
        sampler2D _normalTex;
        half _intenceDefuse;
        half _intenceNormal;

        struct Input
        {
            float2 uv_defuseTex;
            float2 uv_normalTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = (tex2D(_defuseTex,IN.uv_defuseTex) * _intenceDefuse).rgb;
            o.Normal = UnpackNormal(tex2D(_normalTex,IN.uv_normalTex));
            o.Normal *= float3(_intenceNormal,_intenceNormal,1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
