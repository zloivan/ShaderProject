Shader "ShaderTutorials/5_NormalMapVisualization"
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
            fixed2 uv_myDiffuse;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = o.Normal.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}