Shader "ShaderTutorials/2_data_structures_shader"
{
    Properties
    {
        _myColour ("My Colour", Color) = (1,1,1,1)
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

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = fixed3(_myColour.r, 1, 1);
            o.Alpha = _myColour.a;
        }
        ENDCG
    }

    Fallback "Legacy Shaders/Diffuse"
}