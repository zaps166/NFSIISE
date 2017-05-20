/*
	MIT License

	Copyright (c) 2014-2017 Błażej Szczygieł

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
*/

#ifndef GLIDE2X_H
#define GLIDE2X_H

#include "Wrapper.h"

#ifndef GLIDE_NUM_TMU
#  define GLIDE_NUM_TMU 2
#endif

/* Video defines */

typedef int32_t GrScreenRefresh_t;
#define GR_REFRESH_60Hz   0x0
#define GR_REFRESH_70Hz   0x1
#define GR_REFRESH_72Hz   0x2
#define GR_REFRESH_75Hz   0x3
#define GR_REFRESH_80Hz   0x4
#define GR_REFRESH_90Hz   0x5
#define GR_REFRESH_100Hz  0x6
#define GR_REFRESH_85Hz   0x7
#define GR_REFRESH_120Hz  0x8
#define GR_REFRESH_NONE   0xff

typedef int32_t GrScreenResolution_t;
#define GR_RESOLUTION_MIN	GR_RESOLUTION_320x200
#define GR_RESOLUTION_320x200   0x0
#define GR_RESOLUTION_320x240   0x1
#define GR_RESOLUTION_400x256   0x2
#define GR_RESOLUTION_512x384   0x3
#define GR_RESOLUTION_640x200   0x4
#define GR_RESOLUTION_640x350   0x5
#define GR_RESOLUTION_640x400   0x6
#define GR_RESOLUTION_640x480   0x7
#define GR_RESOLUTION_800x600   0x8
#define GR_RESOLUTION_960x720   0x9
#define GR_RESOLUTION_856x480   0xa
#define GR_RESOLUTION_512x256   0xb
#define GR_RESOLUTION_MAX	GR_RESOLUTION_512x256
#define GR_RESOLUTION_NONE      0xff

/*
** -----------------------------------------------------------------------
** TYPE DEFINITIONS
** -----------------------------------------------------------------------
*/
typedef uint32_t GrColor_t;
typedef uint8_t  GrAlpha_t;
typedef uint32_t GrMipMapId_t;
typedef uint8_t  GrFog_t;

/*
** -----------------------------------------------------------------------
** CONSTANTS AND TYPES
** -----------------------------------------------------------------------
*/
#define MAX_NUM_SST            4
#define MAX_MIPMAPS_PER_SST    1024
#define GR_FOG_TABLE_SIZE      64
#define GR_NULL_MIPMAP_HANDLE  ((GrMipMapId_t) -1)
#define GR_ZDEPTHVALUE_NEAREST  0xFFFF
#define GR_ZDEPTHVALUE_FARTHEST 0x0000
#define GR_WDEPTHVALUE_NEAREST  0x0000
#define GR_WDEPTHVALUE_FARTHEST 0xFFFF

#define GR_MIPMAPLEVELMASK_EVEN  FXBIT(0)
#define GR_MIPMAPLEVELMASK_ODD  FXBIT(1)
#define GR_MIPMAPLEVELMASK_BOTH (GR_MIPMAPLEVELMASK_EVEN | GR_MIPMAPLEVELMASK_ODD)

#define GR_LODBIAS_BILINEAR     0.5
#define GR_LODBIAS_TRILINEAR    0.0

typedef int32_t GrChipID_t;
#define GR_TMU0         0x0
#define GR_TMU1         0x1
#define GR_TMU2         0x2
#define GR_FBI          0x3

typedef int32_t GrCombineFunction_t;
#define GR_COMBINE_FUNCTION_ZERO        0x0
#define GR_COMBINE_FUNCTION_NONE        GR_COMBINE_FUNCTION_ZERO
#define GR_COMBINE_FUNCTION_LOCAL       0x1
#define GR_COMBINE_FUNCTION_LOCAL_ALPHA 0x2
#define GR_COMBINE_FUNCTION_SCALE_OTHER 0x3
#define GR_COMBINE_FUNCTION_BLEND_OTHER GR_COMBINE_FUNCTION_SCALE_OTHER
#define GR_COMBINE_FUNCTION_SCALE_OTHER_ADD_LOCAL 0x4
#define GR_COMBINE_FUNCTION_SCALE_OTHER_ADD_LOCAL_ALPHA 0x5
#define GR_COMBINE_FUNCTION_SCALE_OTHER_MINUS_LOCAL 0x6
#define GR_COMBINE_FUNCTION_SCALE_OTHER_MINUS_LOCAL_ADD_LOCAL 0x7
#define GR_COMBINE_FUNCTION_BLEND GR_COMBINE_FUNCTION_SCALE_OTHER_MINUS_LOCAL_ADD_LOCAL
#define GR_COMBINE_FUNCTION_SCALE_OTHER_MINUS_LOCAL_ADD_LOCAL_ALPHA 0x8
#define GR_COMBINE_FUNCTION_SCALE_MINUS_LOCAL_ADD_LOCAL 0x9
#define GR_COMBINE_FUNCTION_BLEND_LOCAL GR_COMBINE_FUNCTION_SCALE_MINUS_LOCAL_ADD_LOCAL
#define GR_COMBINE_FUNCTION_SCALE_MINUS_LOCAL_ADD_LOCAL_ALPHA 0x10

typedef int32_t GrCombineFactor_t;
#define GR_COMBINE_FACTOR_ZERO          0x0
#define GR_COMBINE_FACTOR_NONE          GR_COMBINE_FACTOR_ZERO
#define GR_COMBINE_FACTOR_LOCAL         0x1
#define GR_COMBINE_FACTOR_OTHER_ALPHA   0x2
#define GR_COMBINE_FACTOR_LOCAL_ALPHA   0x3
#define GR_COMBINE_FACTOR_TEXTURE_ALPHA 0x4
#define GR_COMBINE_FACTOR_DETAIL_FACTOR GR_COMBINE_FACTOR_TEXTURE_ALPHA
#define GR_COMBINE_FACTOR_LOD_FRACTION  0x5
#define GR_COMBINE_FACTOR_ONE           0x8
#define GR_COMBINE_FACTOR_ONE_MINUS_LOCAL 0x9
#define GR_COMBINE_FACTOR_ONE_MINUS_OTHER_ALPHA 0xa
#define GR_COMBINE_FACTOR_ONE_MINUS_LOCAL_ALPHA 0xb
#define GR_COMBINE_FACTOR_ONE_MINUS_TEXTURE_ALPHA 0xc
#define GR_COMBINE_FACTOR_ONE_MINUS_DETAIL_FACTOR GR_COMBINE_FACTOR_ONE_MINUS_TEXTURE_ALPHA
#define GR_COMBINE_FACTOR_ONE_MINUS_LOD_FRACTION 0xd


typedef int32_t GrCombineLocal_t;
#define GR_COMBINE_LOCAL_ITERATED 0x0
#define GR_COMBINE_LOCAL_CONSTANT 0x1
#define GR_COMBINE_LOCAL_NONE GR_COMBINE_LOCAL_CONSTANT
#define GR_COMBINE_LOCAL_DEPTH  0x2

typedef int32_t GrCombineOther_t;
#define GR_COMBINE_OTHER_ITERATED 0x0
#define GR_COMBINE_OTHER_TEXTURE 0x1
#define GR_COMBINE_OTHER_CONSTANT 0x2
#define GR_COMBINE_OTHER_NONE GR_COMBINE_OTHER_CONSTANT


typedef int32_t GrAlphaSource_t;
#define GR_ALPHASOURCE_CC_ALPHA 0x0
#define GR_ALPHASOURCE_ITERATED_ALPHA 0x1
#define GR_ALPHASOURCE_TEXTURE_ALPHA 0x2
#define GR_ALPHASOURCE_TEXTURE_ALPHA_TIMES_ITERATED_ALPHA 0x3


typedef int32_t GrColorCombineFnc_t;
#define GR_COLORCOMBINE_ZERO 0x0
#define GR_COLORCOMBINE_CCRGB 0x1
#define GR_COLORCOMBINE_ITRGB 0x2
#define GR_COLORCOMBINE_ITRGB_DELTA0 0x3
#define GR_COLORCOMBINE_DECAL_TEXTURE 0x4
#define GR_COLORCOMBINE_TEXTURE_TIMES_CCRGB 0x5
#define GR_COLORCOMBINE_TEXTURE_TIMES_ITRGB 0x6
#define GR_COLORCOMBINE_TEXTURE_TIMES_ITRGB_DELTA0 0x7
#define GR_COLORCOMBINE_TEXTURE_TIMES_ITRGB_ADD_ALPHA 0x8
#define GR_COLORCOMBINE_TEXTURE_TIMES_ALPHA 0x9
#define GR_COLORCOMBINE_TEXTURE_TIMES_ALPHA_ADD_ITRGB 0xa
#define GR_COLORCOMBINE_TEXTURE_ADD_ITRGB 0xb
#define GR_COLORCOMBINE_TEXTURE_SUB_ITRGB 0xc
#define GR_COLORCOMBINE_CCRGB_BLEND_ITRGB_ON_TEXALPHA 0xd
#define GR_COLORCOMBINE_DIFF_SPEC_A 0xe
#define GR_COLORCOMBINE_DIFF_SPEC_B 0xf
#define GR_COLORCOMBINE_ONE 0x10

typedef int32_t GrAlphaBlendFnc_t;
#define GR_BLEND_ZERO 0x0
#define GR_BLEND_SRC_ALPHA 0x1
#define GR_BLEND_SRC_COLOR 0x2
#define GR_BLEND_DST_COLOR GR_BLEND_SRC_COLOR
#define GR_BLEND_DST_ALPHA 0x3
#define GR_BLEND_ONE 0x4
#define GR_BLEND_ONE_MINUS_SRC_ALPHA 0x5
#define GR_BLEND_ONE_MINUS_SRC_COLOR 0x6
#define GR_BLEND_ONE_MINUS_DST_COLOR GR_BLEND_ONE_MINUS_SRC_COLOR
#define GR_BLEND_ONE_MINUS_DST_ALPHA 0x7
#define GR_BLEND_RESERVED_8 0x8
#define GR_BLEND_RESERVED_9 0x9
#define GR_BLEND_RESERVED_A 0xa
#define GR_BLEND_RESERVED_B 0xb
#define GR_BLEND_RESERVED_C 0xc
#define GR_BLEND_RESERVED_D 0xd
#define GR_BLEND_RESERVED_E 0xe
#define GR_BLEND_ALPHA_SATURATE 0xf
#define GR_BLEND_PREFOG_COLOR GR_BLEND_ALPHA_SATURATE

typedef int32_t GrAspectRatio_t;
#define GR_ASPECT_8x1 0x0       /* 8W x 1H */
#define GR_ASPECT_4x1 0x1       /* 4W x 1H */
#define GR_ASPECT_2x1 0x2       /* 2W x 1H */
#define GR_ASPECT_1x1 0x3       /* 1W x 1H */
#define GR_ASPECT_1x2 0x4       /* 1W x 2H */
#define GR_ASPECT_1x4 0x5       /* 1W x 4H */
#define GR_ASPECT_1x8 0x6       /* 1W x 8H */

typedef int32_t GrBuffer_t;
#define GR_BUFFER_FRONTBUFFER   0x0
#define GR_BUFFER_BACKBUFFER    0x1
#define GR_BUFFER_AUXBUFFER     0x2
#define GR_BUFFER_DEPTHBUFFER   0x3
#define GR_BUFFER_ALPHABUFFER   0x4
#define GR_BUFFER_TRIPLEBUFFER  0x5

typedef int32_t GrChromakeyMode_t;
#define GR_CHROMAKEY_DISABLE    0x0
#define GR_CHROMAKEY_ENABLE     0x1

typedef int32_t GrCmpFnc_t;
#define GR_CMP_NEVER    0x0
#define GR_CMP_LESS     0x1
#define GR_CMP_EQUAL    0x2
#define GR_CMP_LEQUAL   0x3
#define GR_CMP_GREATER  0x4
#define GR_CMP_NOTEQUAL 0x5
#define GR_CMP_GEQUAL   0x6
#define GR_CMP_ALWAYS   0x7

typedef int32_t GrColorFormat_t;
#define GR_COLORFORMAT_ARGB     0x0
#define GR_COLORFORMAT_ABGR     0x1

#define GR_COLORFORMAT_RGBA     0x2
#define GR_COLORFORMAT_BGRA     0x3

typedef int32_t GrCullMode_t;
#define GR_CULL_DISABLE         0x0
#define GR_CULL_NEGATIVE        0x1
#define GR_CULL_POSITIVE        0x2

typedef int32_t GrDepthBufferMode_t;
#define GR_DEPTHBUFFER_DISABLE                  0x0
#define GR_DEPTHBUFFER_ZBUFFER                  0x1
#define GR_DEPTHBUFFER_WBUFFER                  0x2
#define GR_DEPTHBUFFER_ZBUFFER_COMPARE_TO_BIAS  0x3
#define GR_DEPTHBUFFER_WBUFFER_COMPARE_TO_BIAS  0x4

typedef int32_t GrDitherMode_t;
#define GR_DITHER_DISABLE       0x0
#define GR_DITHER_2x2           0x1
#define GR_DITHER_4x4           0x2

typedef int32_t GrFogMode_t;
#define GR_FOG_DISABLE          0x0
#define GR_FOG_WITH_ITERATED_ALPHA 0x1
#define GR_FOG_WITH_TABLE       0x2
#define GR_FOG_MULT2            0x100
#define GR_FOG_ADD2             0x200

typedef uint32_t GrLock_t;
#define GR_LFB_READ_ONLY  0x00
#define GR_LFB_WRITE_ONLY 0x01
#define GR_LFB_IDLE       0x00
#define GR_LFB_NOIDLE     0x10

typedef int32_t GrLfbBypassMode_t;
#define GR_LFBBYPASS_DISABLE    0x0
#define GR_LFBBYPASS_ENABLE     0x1

typedef int32_t GrLfbWriteMode_t;
#define GR_LFBWRITEMODE_565        0x0 /* RGB:RGB */
#define GR_LFBWRITEMODE_555        0x1 /* RGB:RGB */
#define GR_LFBWRITEMODE_1555       0x2 /* ARGB:ARGB */
#define GR_LFBWRITEMODE_RESERVED1  0x3
#define GR_LFBWRITEMODE_888        0x4 /* RGB */
#define GR_LFBWRITEMODE_8888       0x5 /* ARGB */
#define GR_LFBWRITEMODE_RESERVED2  0x6
#define GR_LFBWRITEMODE_RESERVED3  0x7
#define GR_LFBWRITEMODE_RESERVED4  0x8
#define GR_LFBWRITEMODE_RESERVED5  0x9
#define GR_LFBWRITEMODE_RESERVED6  0xa
#define GR_LFBWRITEMODE_RESERVED7  0xb
#define GR_LFBWRITEMODE_565_DEPTH  0xc /* RGB:DEPTH */
#define GR_LFBWRITEMODE_555_DEPTH  0xd /* RGB:DEPTH */
#define GR_LFBWRITEMODE_1555_DEPTH 0xe /* ARGB:DEPTH */
#define GR_LFBWRITEMODE_ZA16       0xf /* DEPTH:DEPTH */
#define GR_LFBWRITEMODE_ANY        0xFF


typedef int32_t GrOriginLocation_t;
#define GR_ORIGIN_UPPER_LEFT    0x0
#define GR_ORIGIN_LOWER_LEFT    0x1
#define GR_ORIGIN_ANY           0xFF

typedef struct {
    int                size;
    void               *lfbPtr;
    uint32_t              strideInBytes;
    GrLfbWriteMode_t   writeMode;
    GrOriginLocation_t origin;
} GrLfbInfo_t;

typedef int32_t GrLOD_t;
#define GR_LOD_256              0x0
#define GR_LOD_128              0x1
#define GR_LOD_64               0x2
#define GR_LOD_32               0x3
#define GR_LOD_16               0x4
#define GR_LOD_8                0x5
#define GR_LOD_4                0x6
#define GR_LOD_2                0x7
#define GR_LOD_1                0x8

typedef int32_t GrMipMapMode_t;
#define GR_MIPMAP_DISABLE               0x0 /* no mip mapping  */
#define GR_MIPMAP_NEAREST               0x1 /* use nearest mipmap */
#define GR_MIPMAP_NEAREST_DITHER        0x2 /* GR_MIPMAP_NEAREST + LOD dith */


typedef int32_t GrSmoothingMode_t;
#define GR_SMOOTHING_DISABLE    0x0
#define GR_SMOOTHING_ENABLE     0x1

typedef int32_t GrTextureClampMode_t;
#define GR_TEXTURECLAMP_WRAP    0x0
#define GR_TEXTURECLAMP_CLAMP   0x1

typedef int32_t GrTextureCombineFnc_t;
#define GR_TEXTURECOMBINE_ZERO          0x0 /* texout = 0 */
#define GR_TEXTURECOMBINE_DECAL         0x1 /* texout = texthis */
#define GR_TEXTURECOMBINE_OTHER         0x2 /* this TMU in passthru mode */
#define GR_TEXTURECOMBINE_ADD           0x3 /* tout = tthis + t(this+1) */
#define GR_TEXTURECOMBINE_MULTIPLY      0x4 /* texout = tthis * t(this+1) */
#define GR_TEXTURECOMBINE_SUBTRACT      0x5 /* Sutract from upstream TMU */
#define GR_TEXTURECOMBINE_DETAIL        0x6 /* detail--detail on tthis */
#define GR_TEXTURECOMBINE_DETAIL_OTHER  0x7 /* detail--detail on tthis+1 */
#define GR_TEXTURECOMBINE_TRILINEAR_ODD 0x8 /* trilinear--odd levels tthis*/
#define GR_TEXTURECOMBINE_TRILINEAR_EVEN 0x9 /*trilinear--even levels tthis*/
#define GR_TEXTURECOMBINE_ONE           0xa /* texout = 0xFFFFFFFF */

typedef int32_t GrTextureFilterMode_t;
#define GR_TEXTUREFILTER_POINT_SAMPLED  0x0
#define GR_TEXTUREFILTER_BILINEAR       0x1

typedef int32_t GrTextureFormat_t;
#define GR_TEXFMT_8BIT                  0x0
#define GR_TEXFMT_RGB_332 GR_TEXFMT_8BIT
#define GR_TEXFMT_YIQ_422               0x1
#define GR_TEXFMT_ALPHA_8               0x2 /* (0..0xFF) alpha     */
#define GR_TEXFMT_INTENSITY_8           0x3 /* (0..0xFF) intensity */
#define GR_TEXFMT_ALPHA_INTENSITY_44    0x4
#define GR_TEXFMT_P_8                   0x5 /* 8-bit palette */
#define GR_TEXFMT_RSVD0                 0x6
#define GR_TEXFMT_RSVD1                 0x7
#define GR_TEXFMT_16BIT                 0x8
#define GR_TEXFMT_ARGB_8332 GR_TEXFMT_16BIT
#define GR_TEXFMT_AYIQ_8422             0x9
#define GR_TEXFMT_RGB_565               0xa
#define GR_TEXFMT_ARGB_1555             0xb
#define GR_TEXFMT_ARGB_4444             0xc
#define GR_TEXFMT_ALPHA_INTENSITY_88    0xd
#define GR_TEXFMT_AP_88                 0xe /* 8-bit alpha 8-bit palette */
#define GR_TEXFMT_RSVD2                 0xf

typedef uint32_t GrTexTable_t;
#define GR_TEXTABLE_NCC0    0x0
#define GR_TEXTABLE_NCC1    0x1
#define GR_TEXTABLE_PALETTE 0x2

typedef uint32_t GrNCCTable_t;
#define GR_NCCTABLE_NCC0    0x0
#define GR_NCCTABLE_NCC1    0x1

typedef uint32_t GrTexBaseRange_t;
#define GR_TEXBASE_256      0x0
#define GR_TEXBASE_128      0x1
#define GR_TEXBASE_64       0x2
#define GR_TEXBASE_32_TO_1  0x3

#define GLIDE_STATE_PAD_SIZE 312
#ifdef GLIDE_LIB
typedef struct _GrState_s GrState;
#else
typedef struct _GrState_s {
  char pad[GLIDE_STATE_PAD_SIZE];
} GrState;
#endif

/*
** -----------------------------------------------------------------------
** STRUCTURES
** -----------------------------------------------------------------------
*/
/*
** 3DF texture file structs
*/
typedef struct
{
  uint32_t               width, height;
  int                 small_lod, large_lod;
  GrAspectRatio_t     aspect_ratio;
  GrTextureFormat_t   format;
} Gu3dfHeader;

typedef struct
{
  uint8_t  yRGB[16];
  int16_t iRGB[4][3];
  int16_t qRGB[4][3];
  uint32_t packed_data[12];
} GuNccTable;

typedef struct {
    uint32_t data[256];
} GuTexPalette;

typedef union {
    GuNccTable   nccTable;
    GuTexPalette palette;
} GuTexTable;

typedef struct
{
  Gu3dfHeader  header;
  GuTexTable   table;
  void        *data;
  uint32_t        mem_required;    /* memory required for mip map in bytes. */
} Gu3dfInfo;

typedef struct {
    GrLOD_t           smallLod;
    GrLOD_t           largeLod;
    GrAspectRatio_t   aspectRatio;
    GrTextureFormat_t format;
    void              *data;
} GrTexInfo;

typedef struct
{
  int           sst;                    /* SST where this texture map was stored  */
  BOOL        valid;                  /* set when this table entry is allocated*/
  int           width, height;
  GrAspectRatio_t aspect_ratio;         /* aspect ratio of the mip map.  */
  void          *data;                  /* actual texture data  */

  GrTextureFormat_t  format;                    /* format of the texture table */
  GrMipMapMode_t     mipmap_mode;               /* mip map mode for this texture */
  GrTextureFilterMode_t   magfilter_mode;       /* filtering to be used when magnified */
  GrTextureFilterMode_t   minfilter_mode;       /* filtering to be used with minified  */
  GrTextureClampMode_t    s_clamp_mode;         /* how this texture should be clamped in s */
  GrTextureClampMode_t    t_clamp_mode;         /* how this texture should be clamped in t */
  uint32_t         tLOD;                   /* Register value for tLOD register */
  uint32_t         tTextureMode;           /* Register value for tTextureMode register
                                           not including non-texture specific bits */
  uint32_t         lod_bias;               /* LOD bias of the mip map in preshifted 4.2*/
  GrLOD_t       lod_min, lod_max;       /* largest and smallest levels of detail  */
  int           tmu;                    /* tmu on which this texture resides */
  uint32_t         odd_even_mask;          /* mask specifying levels on this tmu  */
  uint32_t         tmu_base_address;       /* base addr (in TMU mem) of this texture */
  BOOL        trilinear;              /* should we blend by lod? */

  GuNccTable    ncc_table;              /* NCC compression table (optional) */
} GrMipMapInfo;

typedef int GrSstType;
#define GR_SSTTYPE_VOODOO    0
#define GR_SSTTYPE_SST96     1
#define GR_SSTTYPE_AT3D      2

typedef struct GrTMUConfig_St {
  int    tmuRev;                /* Rev of Texelfx chip */
  int    tmuRam;                /* 1, 2, or 4 MB */
} GrTMUConfig_t;

typedef struct GrVoodooConfig_St {
  int    fbRam;                         /* 1, 2, or 4 MB */
  int    fbiRev;                        /* Rev of Pixelfx chip */
  int    nTexelfx;                      /* How many texelFX chips are there? */
  BOOL sliDetect;                     /* Is it a scan-line interleaved board? */
  GrTMUConfig_t tmuConfig[GLIDE_NUM_TMU];   /* Configuration of the Texelfx chips */
} GrVoodooConfig_t;

typedef struct GrSst96Config_St {
  int   fbRam;                  /* How much? */
  int   nTexelfx;
  GrTMUConfig_t tmuConfig;
} GrSst96Config_t;

typedef struct GrAT3DConfig_St {
  int   rev;
} GrAT3DConfig_t;


typedef struct {
  int num_sst;                  /* # of HW units in the system */
  struct {
    GrSstType type;             /* Which hardware is it? */
    union SstBoard_u {
      GrVoodooConfig_t  VoodooConfig;
      GrSst96Config_t   SST96Config;
      GrAT3DConfig_t    AT3DConfig;
   } sstBoard;
 } SSTs[MAX_NUM_SST];          /* configuration for each board */
} GrHwConfiguration;

typedef struct GrSstPerfStats_s {
  uint32_t  pixelsIn;              /* # pixels processed (minus buffer clears) */
  uint32_t  chromaFail;            /* # pixels not drawn due to chroma key */
  uint32_t  zFuncFail;             /* # pixels not drawn due to Z comparison */
  uint32_t  aFuncFail;             /* # pixels not drawn due to alpha comparison */
  uint32_t  pixelsOut;             /* # pixels drawn (including buffer clears) */
} GrSstPerfStats_t;


typedef struct {
  float  sow;                   /* s texture ordinate (s over w) */
  float  tow;                   /* t texture ordinate (t over w) */
  float  oow;                   /* 1/w (used mipmapping - really 0xfff/w) */
}  GrTmuVertex;

/*
** GrVertex
** If these are changed the C & assembly language trisetup routines MUST
** be changed, for they will no longer work.
*/
typedef struct
{
  float x, y, z;                /* X, Y, and Z of scrn space -- Z is ignored */
  float r, g, b;                /* R, G, B, ([0..255.0]) */
  float ooz;                    /* 65535/Z (used for Z-buffering) */
  float a;                      /* Alpha [0..255.0] */
  float oow;                    /* 1/W (used for W-buffering, texturing) */
  GrTmuVertex  tmuvtx[GLIDE_NUM_TMU];
} GrVertex;

/* For indexing GrVertex as a float *.
   CHANGE THESE IF THE VERTEX STRUCTURE CHANGES!
   */
#define GR_VERTEX_X_OFFSET              0
#define GR_VERTEX_Y_OFFSET              1
#define GR_VERTEX_Z_OFFSET              2
#define GR_VERTEX_R_OFFSET              3
#define GR_VERTEX_G_OFFSET              4
#define GR_VERTEX_B_OFFSET              5
#define GR_VERTEX_OOZ_OFFSET            6
#define GR_VERTEX_A_OFFSET              7
#define GR_VERTEX_OOW_OFFSET            8
#define GR_VERTEX_SOW_TMU0_OFFSET       9
#define GR_VERTEX_TOW_TMU0_OFFSET       10
#define GR_VERTEX_OOW_TMU0_OFFSET       11
#define GR_VERTEX_SOW_TMU1_OFFSET       12
#define GR_VERTEX_TOW_TMU1_OFFSET       13
#define GR_VERTEX_OOW_TMU1_OFFSET       14
#if (GLIDE_NUM_TMU > 2)
	#define GR_VERTEX_SOW_TMU2_OFFSET       15
	#define GR_VERTEX_TOW_TMU2_OFFSET       16
	#define GR_VERTEX_OOW_TMU2_OFFSET       17
#endif

typedef uint32_t GrLfbSrcFmt_t;
#define GR_LFB_SRC_FMT_565          0x00
#define GR_LFB_SRC_FMT_555          0x01
#define GR_LFB_SRC_FMT_1555         0x02
#define GR_LFB_SRC_FMT_888          0x04
#define GR_LFB_SRC_FMT_8888         0x05
#define GR_LFB_SRC_FMT_565_DEPTH    0x0c
#define GR_LFB_SRC_FMT_555_DEPTH    0x0d
#define GR_LFB_SRC_FMT_1555_DEPTH   0x0e
#define GR_LFB_SRC_FMT_ZA16         0x0f
#define GR_LFB_SRC_FMT_RLE16        0x80

typedef int32_t GrPassthruMode_t;
#define GR_PASSTHRU_SHOW_VGA    0x0
#define GR_PASSTHRU_SHOW_SST1   0x1

typedef uint32_t GrHint_t;
#define GR_HINTTYPE_MIN                 0
#define GR_HINT_STWHINT                 0
#define GR_HINT_FIFOCHECKHINT           1
#define GR_HINT_FPUPRECISION            2
#define GR_HINT_ALLOW_MIPMAP_DITHER     3
#define GR_HINTTYPE_MAX                 3

typedef uint32_t GrSTWHint_t;
#define GR_STWHINT_W_DIFF_FBI   FXBIT(0)
#define GR_STWHINT_W_DIFF_TMU0  FXBIT(1)
#define GR_STWHINT_ST_DIFF_TMU0 FXBIT(2)
#define GR_STWHINT_W_DIFF_TMU1  FXBIT(3)
#define GR_STWHINT_ST_DIFF_TMU1 FXBIT(4)
#define GR_STWHINT_W_DIFF_TMU2  FXBIT(5)
#define GR_STWHINT_ST_DIFF_TMU2 FXBIT(6)

typedef uint32_t GrControl_t;
#define GR_CONTROL_ACTIVATE   0x1
#define GR_CONTROL_DEACTIVATE 0x2
#define GR_CONTROL_RESIZE     0x3
#define GR_CONTROL_MOVE       0x4

#define GR_GENERATE_FIFOCHECK_HINT_MASK(swHWM, swLWM) \
	(((swHWM & 0xffff) << 16) | (swLWM & 0xffff))

#endif // GLIDE2X_H
