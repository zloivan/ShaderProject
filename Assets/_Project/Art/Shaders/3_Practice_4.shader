Shader "Custom/3_Practice_4"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _EmissionTex ("Emission (RGB)", 2D) = "black" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _EmissionTex;

        struct Input
        {
            fixed2 uv_MainTex;
            fixed2 uv_EmissionTex;
        };


        void surf(Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Emission = tex2D(_EmissionTex, IN.uv_EmissionTex).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}