// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Community contribution: http://www.tasharen.com/forum/index.php?topic=9268.0
Shader "Hidden/Unlit/Transparent Colored (TextureClip)"
{
	Properties
	{
		_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
	}

	SubShader
	{
		LOD 200

		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}

		Pass
		{
			Cull Off
			Lighting Off
			ZWrite Off
			Offset -1, -1
			Fog { Mode Off }
			//ColorMask RGB
			Blend SrcAlpha OneMinusSrcAlpha
		
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			sampler2D _ClipTex;
			float4 _ClipRange0 = float4(0.0, 0.0, 1.0, 1.0);
			struct appdata_t
			{
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
				half4 color : COLOR;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float2 texcoord : TEXCOORD0;
				float2 clipUV : TEXCOORD1;
				half4 color : COLOR;
				fixed gray : TEXCOORD2;
			};

			v2f vert (appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.color = v.color;
				o.texcoord = v.texcoord;
				o.clipUV = (v.vertex.xy * _ClipRange0.zw + _ClipRange0.xy) * 0.5 + float2(0.5, 0.5);
				o.gray = dot(v.color,fixed4(1,0,0,0));
				return o;
			}

			half4 frag (v2f IN) : SV_Target
			{
				half4 col = tex2D(_MainTex, IN.texcoord);
				if(IN.gray == 0)
				{
					float grey = dot(col.rgb, fixed3(0.222,0.707,0.071));
					col.rgb = float3(grey, grey, grey);
				}
				else
				{
					col = col * IN.color;
				}
				col.a *= tex2D(_ClipTex, IN.clipUV).a;
				return col;
			}
			ENDCG
		}
	}
	Fallback "Unlit/Transparent Colored"
}
