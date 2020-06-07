Shader "MyShaders/Chellange_1"
{
    Properties
    {
        _myTex0 ("Albedo (RGB)", 2D) = "white" {}
        _myTex1 ("Emmission (RGB)", 2D) = "white" {}
        _intense ("Intence", Range(0,5)) = 1
        _intenseEmission ("Intence Emmission", Range(0,5)) = 1
    }
    SubShader
    {
        CGPROGRAM
            #pragma surface surf Lambert


        sampler2D _myTex0;
        sampler2D _myTex1;
        half _intense;
        half _intenseEmission;

        struct Input
        {
            float2 uv_myTex0;
            float2 uv_myTex1;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = (tex2D(_myTex0, IN.uv_myTex0) * _intense).rgb;
            o.Emission.rgb = (tex2D(_myTex1, IN.uv_myTex1) * _intenseEmission).rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
