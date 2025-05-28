Shader "ShaderTutorials/5_VisualizationOfRefMap"
{
    Properties
    {
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float3 worldRefl;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = IN.worldRefl;
        }
        ENDCG
    }
    FallBack "Diffuse"
}