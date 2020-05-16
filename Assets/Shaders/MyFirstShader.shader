Shader "MyShaders/MyFirstShader"
{
    Properties
    {
        _EmitColor ("Emmit Color", Color) = (1,1,1,1)
        _AlbedoColor ("Albedo Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert


        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _EmitColor;
        fixed4 _AlbedoColor;


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _AlbedoColor.rgb;
            o.Emission = _EmitColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
