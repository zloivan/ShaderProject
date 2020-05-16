Shader "MyShaders/MyFirstShader"
{
    Properties
    {
        _EmitColor ("Emmit Color", Color) = (1,1,1,1)
        _AlbedoColor ("Albedo Color", Color) = (1,1,1,1)
        _NormalColor ("Normal Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _EmitColor;
        fixed4 _AlbedoColor;
        fixed4 _NormalColor;


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _AlbedoColor.rgb;
            o.Emission = _EmitColor.rgb;
            o.Normal = _NormalColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
