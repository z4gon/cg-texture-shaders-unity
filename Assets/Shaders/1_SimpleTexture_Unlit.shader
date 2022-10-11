Shader "Unlit/1_SimpleTexture_Unlit"
{
    Properties
    {
        _MainTexture("Main Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            sampler2D _MainTexture;

            fixed4 frag (v2f_img i) : COLOR
            {
                fixed3 color = tex2D(_MainTexture, i.uv).rgb;

                return fixed4(color, 1.0);
            }
            ENDCG
        }
    }
}
