Shader "3_properties_practice_1"
{
    Properties
    {
        _myTexture("My Texture", 2D) = "white" {}
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myTexture;
        
        struct Input
        {
            fixed2 uv_myTexture;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 resultColour = tex2D(_myTexture, IN.uv_myTexture);
            resultColour *= fixed4(0,1,0,1); // Multiply the texture color by green
            o.Albedo = resultColour;
        }
        
        ENDCG
    }
    
    Fallback "Diffuse"
}