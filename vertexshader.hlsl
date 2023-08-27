cbuffer mycBuffer : register(b0)
{
    float4x4 mat;
	float4x4 mac;
}; 

struct VS_INPUT
{
    float3 inPos : POSITION;
    float2 inTexCoord : TEXCOORD;
	float inBone : BONES;
};

struct VS_OUTPUT
{
    float4 outPosition : SV_POSITION;
    float2 outTexCoord : TEXCOORD;
};

VS_OUTPUT main(VS_INPUT input) 
{
    VS_OUTPUT output;
	if (input.inBone == 0.0f)
	{
		output.outPosition = mul(float4(input.inPos, 1.0f), mac);
	}
	else
	{
		output.outPosition = mul(float4(input.inPos, 1.0f), mat);
	}
	output.outTexCoord = input.inTexCoord;
	return output;
}