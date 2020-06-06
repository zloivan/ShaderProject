Shader "MyShaders/MaxGreen"
{
    Properties
    {
        _myTex ("My Texture", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
            #pragma surface surf Lambert

        sampler2D _myTex;
        struct Input
        {
            float2 uv_myTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = (tex2D(_myTex,IN.uv_myTex)).rgb;
            o.Albedo.g = 1;
        }
        ENDCG
    }

    FallBack "Diffuse"
}
