Shader "MyShaders/ChangeNormalVectors"
{

    Properties
    {
        _myX ("Nx", Range(-10, 10)) = 1
        _myY ("Ny", Range(-10, 10)) = 1
        _myZ ("Nz", Range(-10, 10)) = 1
        _intence ("intence", Range(-10, 10)) = 1
    }
    SubShader
    {

        CGPROGRAM
            #pragma surface surf Lambert

        half _myX;
        half _myY;
        half _myZ;
        half _intence;
        struct Input
        {
           float2 uv_myDiffuse;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
           o.Albedo = 1*_intence;
           o.Normal = float3(_myX, _myY, _myZ);
        }

        ENDCG
    }
    Fallback "Diffuse"
}

