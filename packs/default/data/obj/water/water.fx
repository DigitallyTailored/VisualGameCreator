// by Evolved
// http://www.vector3r.com/

//-----------------
// un-tweaks
//-----------------
  matrix WorldViewProj:WorldViewProjection;

//-----------------
// tweaks
//-----------------
  float u <> = 40.0f;
  float v <> = 40.0f;

//-----------------
// Texture
//-----------------
  texture water<string Name="";>;	
    sampler2D waterSampler=sampler_state
	{
	Texture = <water>;
   	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
 	};
  texture bumpmap <string Name=""; >; 
     sampler2D bumpmapSampler=sampler_state 
	{
	Texture = <bumpmap>;
	};

//-----------------
// structs 
//-----------------
 struct input{
   float4 Position:POSITION;
   float2 UV:TEXCOORD;
  };
 struct output{
    float4 pos:POSITION;
    float2 uv:TEXCOORD0;
    float4 pos_view:TEXCOORD1; 
  };

//-----------------
// vertex shader
//-----------------
 output VS(input IN)
  {
   output Out;
    Out.pos=mul(IN.Position,WorldViewProj);
    Out.uv=IN.UV*float2(u,v);
    float4x4 txtscale=float4x4(0.5,0,0,0.5,0,0.5,0,0.5,0,0,0.5,0.5,0,0,0,1);
    Out.pos_view=mul(txtscale,Out.pos);
    return Out;
  }

//-----------------
// pixel shader
//-----------------
 float4 PS(output IN) : COLOR 
  {
   float4 bump=(tex2D(bumpmapSampler,IN.uv)*2-1)*2;
   float4 nuv=(IN.pos_view+bump);
   float4 result=tex2Dproj(waterSampler,nuv)/1.1;
  return result;
 }

//-----------------
// techniques   
//-----------------
technique water
 {
  pass p1
   {		
    VertexShader = compile vs_2_0 VS(); 
    PixelShader = compile ps_2_0 PS(); 		
   }
  }
