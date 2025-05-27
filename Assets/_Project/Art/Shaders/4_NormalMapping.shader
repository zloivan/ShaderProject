Shader "ShaderTutorials/4_NormalMapping"
{
    Properties
    {
        _myDiffuse ("Albedo (RGB)", 2D) = "white" {}
        _myNormalMap ("Normal (RGB)", 2D) = "bump" {}
        _bumpIntense ("Bump Intensity", Range(0, 10)) = 1
        _myScale ("Texture Scale", Range(0.5, 2)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            fixed2 uv_myDiffuse;
            fixed2 uv_myNormalMap;
        };

        sampler2D _myDiffuse;
        sampler2D _myNormalMap;
        half _bumpIntense;
        half _myScale;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rgb = tex2D(_myDiffuse, IN.uv_myDiffuse * _myScale).rgb;
            // half4 temp = half4(tex2D(_myNormalMap, IN.uv_myNormalMap).r * _bumpIntense,
            //                    tex2D(_myNormalMap, IN.uv_myNormalMap).g * _bumpIntense,
            //                    tex2D(_myNormalMap, IN.uv_myNormalMap).b, 0);

            o.Normal = UnpackNormal(tex2D(_myNormalMap, IN.uv_myNormalMap));
            o.Normal *= float3(_bumpIntense, _bumpIntense, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}