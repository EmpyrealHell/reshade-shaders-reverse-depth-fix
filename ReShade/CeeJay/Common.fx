#ifndef INCLUDE_GUARD_CEEJAY_COMMON
#define INCLUDE_GUARD_CEEJAY_COMMON

//Stuff all/most of CeeJay shared shaders need
#define CeeJay_SETTINGS_DEF "ReShade/CeeJay.cfg"
#define CeeJay_SETTINGS_UNDEF "ReShade/CeeJay.undef" 

#include CeeJay_SETTINGS_DEF 

  /*-----------------------.
  | ::     Textures     :: |
  '-----------------------*/

namespace CeeJay
{

#if (USE_SMAA == 1)

texture edgesTex
{
	Width = BUFFER_WIDTH;
	Height = BUFFER_HEIGHT;
	Format = R8G8B8A8; //R8G8 is also an option  
};

texture blendTex
{
	Width = BUFFER_WIDTH;
	Height = BUFFER_HEIGHT;
	Format = R8G8B8A8;
};

texture areaTex < string source = "ReShade/CeeJay/Textures/SMAA_AreaTex.dds"; >
{
	Width = 160;
	Height = 560;
	Format = R8G8;
};

texture searchTex < string source = "ReShade/CeeJay/Textures/SMAA_SearchTex.dds"; >
{
	Width = 64;
	Height = 16;
	Format = R8;
};

#endif 

}

  /*-----------------------.
  | ::     Samplers     :: |
  '-----------------------*/

namespace CeeJay
{

sampler colorLinearSampler
{
	Texture = RFX::backbufferTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = true;
};

sampler BorderSampler
{
	Texture = RFX::backbufferTex;
	AddressU = Border; AddressV = Border;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear; //Why Mipfilter linear - shouldn't point be fine?
	SRGBTexture = false;
};

#if (USE_SMAA == 1)
sampler edgesSampler
{
	Texture = edgesTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};

sampler blendSampler
{
	Texture = blendTex;
	AddressU = Clamp; AddressV = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};

sampler areaSampler
{
	Texture = areaTex;
	AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
	MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
	SRGBTexture = false;
};

sampler searchSampler
{
	Texture = searchTex;
	AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
	MipFilter = Point; MinFilter = Point; MagFilter = Point;
	SRGBTexture = false;
};

#endif

}

#define predicationSampler RFX::depthColor //Use the depth sampler as our predication sampler

  /*-----------------------.
  | ::     Effects      :: |
  '-----------------------*/

#define px BUFFER_RCP_WIDTH
#define py BUFFER_RCP_HEIGHT

#define s0 RFX::backbufferColor
#define s1 colorLinearSampler
#define myTex2D tex2D 

  /*-----------------------.
  | ::     Uniforms     :: |
  '-----------------------*/
//uniform float2 pingpong < source = "pingpong"; min = -1; max = 2; step = 2; >;
//uniform int framecount < source = "framecount"; >; // Total amount of frames since the game started.

//included main file to check for shared shaders in use

  /*----------------------.
  | ::   Shared Pass   :: |
  '----------------------*/

#if (USE_LEVELS == 1)
  #include "ReShade\CeeJay\SharedShader\Levels.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_TECHNICOLOR == 1)
  #include "ReShade\CeeJay\SharedShader\Technicolor.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_TECHNICOLOR2 == 1)
  #include "ReShade\CeeJay\SharedShader\Technicolor2.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_DPX == 1)
  #include "ReShade\CeeJay\SharedShader\DPX.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_MONOCHROME == 1)
  #include "ReShade\CeeJay\SharedShader\Monochrome.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_COLORMATRIX == 1)
  #include "ReShade\CeeJay\SharedShader\ColorMatrix.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_LIFTGAMMAGAIN == 1)
  #include "ReShade\CeeJay\SharedShader\LiftGammaGain.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_TONEMAP == 1)
  #include "ReShade\CeeJay\SharedShader\Tonemap.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_VIBRANCE == 1)
  #include "ReShade\CeeJay\SharedShader\Vibrance.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_CURVES == 1)
  #include "ReShade\CeeJay\SharedShader\Curves.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_SEPIA == 1)
  #include "ReShade\CeeJay\SharedShader\Sepia.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_FILMICPASS == 1)
  #include "ReShade\CeeJay\SharedShader\FilmicPass.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_REINHARDLINEAR == 1)
  #include "ReShade\CeeJay\SharedShader\ReinhardLinear.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_NOSTALGIA == 1)
  #include "ReShade\CeeJay\SharedShader\Nostalgia.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_VIGNETTE == 1)
  #include "ReShade\CeeJay\SharedShader\Vignette.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_FILMGRAIN == 1)
  #include "ReShade\CeeJay\SharedShader\FilmGrain.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_DITHER == 1)
  #include "ReShade\CeeJay\SharedShader\Dither.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_BORDER == 1)
  #include "ReShade\CeeJay\SharedShader\Border.h"
  #define CeeJay_SHARED 1
#endif

#if (USE_SPLITSCREEN == 1)
  #include "ReShade\CeeJay\SharedShader\Splitscreen.h"
  #define CeeJay_SHARED 1
#endif

  /*----------------------------------.
  | :: Begin operation "Piggyback" :: |
  '----------------------------------*/
// Operation "Piggyback" is where we track what pass came before the shared pass,
// so it can piggyback on the previous pass instead of running in it's own -
// thus avoid the overhead of another pass and increasing performance.
// PIGGY_COUNT_PING needs to initially count all shaders that are able to piggyback

#define CeeJay_PIGGY_COUNT_PING (USE_ASCII + USE_CARTOON + USE_EXPLOSION + USE_CA + USE_ADVANCED_CRT + USE_PIXELART_CRT + USE_BLOOM + USE_HDR + USE_LUMASHARPEN + USE_LENS_DISTORTION + USE_SMAA + USE_FXAA - 1)

#if (CeeJay_PIGGY_COUNT_PING == -1)
	#define CeeJay_PIGGY 0
#else
	#define CeeJay_PIGGY -1 //If you dont want to use piggyback, set to 0
#endif

  /*--------------------.
  | ::     SMAA      :: |
  '--------------------*/
  
  //TODO Move SMAA Wrappers to seperate file

#if (USE_SMAA == 1)

  #define SMAA_RT_METRICS float4(RFX_PixelSize, RFX_ScreenSize) //let SMAA know the size of a pixel and the screen
  
  //#define SMAA_HLSL_3 1
  #define SMAA_CUSTOM_SL 1 //our own reshade branch
  
  #define SMAA_PIXEL_SIZE pixel
  #define SMAA_PRESET_CUSTOM 1

  #include "ReShade\CeeJay\SMAA.h"
#endif

  /*--------------------.
  | ::     FXAA      :: |
  '--------------------*/

#if (USE_FXAA == 1)

  #define FXAA_PC 1
  #define FXAA_HLSL_3 1
  #define FXAA_GREEN_AS_LUMA 1 //It's better to calculate luma in the previous pass and pass it, than to use this option.

  #include "ReShade\CeeJay\Fxaa3_11.h"
#endif

#include CeeJay_SETTINGS_UNDEF

#pragma message "SweetFX 2.0 by CeeJay\n"

#endif
