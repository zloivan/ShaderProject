Shader "ShaderTutorials/1_my-first-shader"
{
    Properties
    {
        _myColour ("My Colour", Color) = (1, 1, 1, 1)
        _myNormal ("My Normal", Color) = (1, 1, 1, 1)
        _myEmission ("My Emission", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uvMainTex;
        };

        fixed4 _myColour;
        fixed4 _myEmission;
        fixed4 _myNormal;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Emission = _myEmission.rgb;
            o.Albedo = _myColour;
            o.Normal = _myNormal;
        }
        ENDCG
    }

    FallBack "Diffuse"
}