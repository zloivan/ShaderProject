Shader "ShaderTutorials/3_properties"
{
    Properties
    {
        _myColour("My Colour", Color) = (1,1,1,1)
        _myColour2("MY Second Colour", Color) = (1,1,1,1)
        _myRange("My Range", Range(0,5)) = 0
        _myRange2("My Range 2", Range(0,5)) = 0
        _myTexture("My Texture", 2D) = "white" {}
        _myCube("My Cube", CUBE) = "" {}
        _myFloat("My Float", Float) = 0.5
        _myVector("My Vector", Vector) = (0.5,1,1,1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_myTexture;
            float3 worldRefl;
        };

        fixed4 _myColour;
        fixed4 _myColour2;
        half _myRange;
        half _myRange2;
        sampler2D _myTexture;
        samplerCUBE _myCube;
        float _myFloat;
        float4 _myVector;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = (tex2D(_myTexture, IN.uv_myTexture) * _myRange).rgb * _myColour2.rgb;
            o.Emission.rgb = (texCUBE(_myCube, IN.worldRefl) * _myRange2).rgb;
        }
        ENDCG
    }

    Fallback "Diffuse"
}