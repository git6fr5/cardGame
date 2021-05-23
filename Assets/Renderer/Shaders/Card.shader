// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Game/Card"
{
    Properties
    {
        [PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}

        _Color1("Primary Color", Color) = (1, 1, 1, 1)
        _Color2("Secondary Color", Color) = (1, 1, 1, 1)
        _Color3("Tertiary Color", Color) = (1, 1, 1, 1)

        _OutlineAlpha("Outline Alpha", Float) = 0
        _OutlineWidth("Outline Width", Float) = 0
        _OutlineColor("Outline Color", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        Tags
		{ 
			"Queue"="Transparent" 
			"IgnoreProjector"="True" 
			"RenderType"="Transparent" 
			"PreviewType"="Plane"
			"CanUseSpriteAtlas"="True"
		}

		Cull Off
		Lighting Off
		ZWrite Off
		Blend One OneMinusSrcAlpha

        Pass // left outline
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _OutlineAlpha;
            float _OutlineWidth;
            float4 _OutlineColor;

            v2f vert (appdata v)
            {
                float outlineWidth = _OutlineWidth;
                float3 outlineVertex = float3(v.vertex.x + outlineWidth, v.vertex.yz);
                
                // pass the data to the fragment shader
                v2f o;
                o.vertex = UnityObjectToClipPos(outlineVertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex); 

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                col.rgb = _OutlineColor.rgb * col.a;
                col.a = _OutlineAlpha;
                return col;
            }
            ENDCG
        }

        Pass // right outline
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _OutlineAlpha;
            float _OutlineWidth;
            float4 _OutlineColor;

            v2f vert(appdata v)
            {
                float outlineWidth = _OutlineWidth;
                float3 outlineVertex = float3(v.vertex.x - outlineWidth, v.vertex.yz);

                // pass the data to the fragment shader
                v2f o;
                o.vertex = UnityObjectToClipPos(outlineVertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                col.rgb = _OutlineColor.rgb * col.a;
                col.a = _OutlineAlpha;
                return col;
            }
            ENDCG
        }

        Pass // up outline
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _OutlineAlpha;
            float _OutlineWidth;
            float4 _OutlineColor;

            v2f vert(appdata v)
            {
                float outlineWidth = _OutlineWidth;
                float3 outlineVertex = float3(v.vertex.x, v.vertex.y + outlineWidth, v.vertex.z);

                // pass the data to the fragment shader
                v2f o;
                o.vertex = UnityObjectToClipPos(outlineVertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                col.rgb = _OutlineColor.rgb * col.a;
                col.a = _OutlineAlpha;
                return col;
            }
            ENDCG
        }

        Pass // down outline
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _OutlineAlpha;
            float _OutlineWidth;
            float4 _OutlineColor;

            v2f vert(appdata v)
            {
                float outlineWidth = _OutlineWidth;
                float3 outlineVertex = float3(v.vertex.x, v.vertex.y - outlineWidth, v.vertex.z);

                // pass the data to the fragment shader
                v2f o;
                o.vertex = UnityObjectToClipPos(outlineVertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                col.rgb = _OutlineColor.rgb * col.a;
                col.a = _OutlineAlpha;
                return col;
            }
            ENDCG
        }

        Pass // image
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _Color1;
            float4 _Color2;
            float4 _Color3;

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                float black = 1 - ceil( max(0, col.r + col.g + col.b) );
                col = ( ((1-col.r) * _Color1 + (1-col.g) * _Color2 + (1-col.b) * _Color3) * (1-black) + float4(0, 0, 0, 1) * black ) * col.a;
                //col = float4(col.rgb * black, col.a);
                return col;
            }
            ENDCG
        }
    }
}
