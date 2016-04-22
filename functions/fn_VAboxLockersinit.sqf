/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with specific items only.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxLockersInit
 */
#include "..\script_component.hpp"

//Lists of items to include
#define AVAILABLE_UNIFORMS [\
    "U_B_HeliPilotCoveralls",\
    "U_I_HeliPilotCoveralls",\
    "tacs_Uniform_Combat_LS_BS_GP_BB",\
    "tacs_Uniform_Combat_LS_BS_GP_TB",\
    "tacs_Uniform_Combat_LS_BS_TP_BB",\
    "tacs_Uniform_Combat_LS_BS_TP_TB",\
    "tacs_Uniform_Combat_LS_GS_BP_BB",\
    "tacs_Uniform_Combat_LS_GS_TP_BB",\
    "tacs_Uniform_Combat_LS_BS_DGP_BB",\
    "tacs_Uniform_Combat_LS_TS_BP_BB",\
    "tacs_Uniform_Combat_LS_TS_GP_BB",\
    "tacs_Uniform_Combat_LS_TS_GP_TB",\
    "tacs_Uniform_Combat_LS_CDBS_GP_TB",\
    "tacs_Uniform_Combat_LS_CLBS_GP_BB",\
    "tacs_Uniform_Combat_LS_CLRS_TP_BB",\
    "tacs_Uniform_Combat_LS_CPS_BP_BB",\
    "tacs_Uniform_Combat_RS_BS_GP_BB",\
    "tacs_Uniform_Combat_RS_BS_GP_TB",\
    "tacs_Uniform_Combat_RS_BS_TP_BB",\
    "tacs_Uniform_Combat_RS_BS_TP_TB",\
    "tacs_Uniform_Combat_RS_GS_BP_BB",\
    "tacs_Uniform_Combat_RS_GS_TP_BB",\
    "tacs_Uniform_Combat_RS_BS_DGP_BB",\
    "tacs_Uniform_Combat_RS_TS_BP_BB",\
    "tacs_Uniform_Combat_RS_TS_GP_BB",\
    "tacs_Uniform_Combat_RS_TS_GP_TB",\
    "tacs_Uniform_Combat_RS_CDBS_GP_TB",\
    "tacs_Uniform_Combat_RS_CLBS_GP_BB",\
    "tacs_Uniform_Combat_RS_CLRS_TP_BB",\
    "tacs_Uniform_Combat_RS_CPS_BP_BB",\
    "tacs_Uniform_Garment_LS_BS_BP_BB",\
    "tacs_Uniform_Garment_LS_BS_GP_BB",\
    "tacs_Uniform_Garment_LS_BS_EP_TB",\
    "tacs_Uniform_Garment_LS_GS_GP_BB",\
    "tacs_Uniform_Garment_LS_GS_BP_BB",\
    "tacs_Uniform_Garment_LS_GS_EP_TB",\
    "tacs_Uniform_Garment_LS_ES_EP_TB",\
    "tacs_Uniform_Garment_LS_ES_BP_BB",\
    "tacs_Uniform_Garment_LS_ES_GP_BB",\
    "tacs_Uniform_Garment_LS_TS_TP_TB",\
    "tacs_Uniform_Garment_LS_GS_TP_TB",\
    "tacs_Uniform_Garment_LS_TS_GP_BB",\
    "tacs_Uniform_Garment_LS_BS_TP_TB",\
    "tacs_Uniform_Garment_LS_TS_BP_BB",\
    "tacs_Uniform_Garment_RS_BS_BP_BB",\
    "tacs_Uniform_Garment_RS_BS_GP_BB",\
    "tacs_Uniform_Garment_RS_BS_EP_TB",\
    "tacs_Uniform_Garment_RS_GS_GP_BB",\
    "tacs_Uniform_Garment_RS_GS_BP_BB",\
    "tacs_Uniform_Garment_RS_GS_EP_TB",\
    "tacs_Uniform_Garment_RS_ES_EP_TB",\
    "tacs_Uniform_Garment_RS_ES_BP_BB",\
    "tacs_Uniform_Garment_RS_ES_GP_BB",\
    "tacs_Uniform_Garment_RS_TS_TP_TB",\
    "tacs_Uniform_Garment_RS_GS_TP_TB",\
    "tacs_Uniform_Garment_RS_TS_GP_BB",\
    "tacs_Uniform_Garment_RS_BS_TP_TB",\
    "tacs_Uniform_Garment_RS_TS_BP_BB",\
    "tacs_Uniform_Polo_TP_LS_TP_TB",\
    "tacs_Uniform_Polo_TP_TS_GP_BB",\
    "tacs_Uniform_Polo_TP_BS_TP_TB",\
    "tacs_Uniform_Polo_TP_BS_LP_BB",\
    "tacs_Uniform_Polo_TP_LS_GP_BB",\
    "tacs_Uniform_Polo_TP_OS_TP_BB",\
    "tacs_Uniform_Polo_TP_OS_LP_BB",\
    "tacs_Uniform_Polo_TP_GS_TP_TB",\
    "tacs_Uniform_Polo_TP_WS_TP_TB",\
    "tacs_Uniform_Polo_TP_WS_LP_BB",\
    "tacs_Uniform_Polo_TP_WS_GP_BB",\
    "tacs_Uniform_Polo_CP_LS_TP_OB",\
    "tacs_Uniform_Polo_CP_RS_LP_BB",\
    "tacs_Uniform_Polo_CP_BS_TP_BB",\
    "tacs_Uniform_TShirt_JP_GS_LP_BB",\
    "tacs_Uniform_TShirt_JP_GS_TP_BB",\
    "tacs_Uniform_TShirt_JP_BS_LP_BB",\
    "tacs_Uniform_TShirt_JP_BS_TP_BB",\
    "tacs_Uniform_TShirt_JP_LS_TP_BB",\
    "tacs_Uniform_TShirt_JP_WS_LP_BB"\
]

#define AVAILABLE_GOGGLES [\
    "G_Shades_Black",\
    "G_Shades_Blue",\
    "G_Sport_Blackred",\
    "G_Spectacles",\
    "G_Spectacles_Tinted",\
    "G_Combat",\
    "G_Lowprofile",\
    "G_Shades_Green",\
    "G_Shades_Red",\
    "G_Sport_BlackWhite",\
    "G_Sport_Blackyellow",\
    "G_Sport_Greenblack",\
    "G_Sport_Checkered",\
    "G_Sport_Red",\
    "G_Tactical_Black",\
    "G_Bandanna_aviator",\
    "G_Bandanna_blk",\
    "G_Bandanna_khk",\
    "G_Bandanna_oli",\
    "G_Bandanna_shades",\
    "G_Bandanna_sport",\
    "G_Bandanna_tan",\
    "ACE_NVG_Gen1",\
    "ACE_NVG_Gen2",\
    "ACE_NVG_Gen4",\
    "ACE_NVG_Wide",\
    "G_Aviator",\
    "NVGoggles_OPFOR",\
    "NVGoggles",\
    "NVGoggles_INDEP",\
    "tacs_Goggles_Black",\
    "tacs_Goggles_Green",\
    "tacs_Goggles_Tan"\
]

#define AVAILABLE_BACKPACKS [\
    "B_AssaultPack_blk",\
    "B_AssaultPack_cbr",\
    "B_AssaultPack_mcamo",\
    "B_AssaultPack_ocamo",\
    "B_AssaultPack_rgr",\
    "B_AssaultPack_sgg",\
    "B_FieldPack_ocamo_Medic",\
    "B_Carryall_ocamo",\
    "B_Carryall_oli",\
    "B_Carryall_cbr",\
    "B_Kitbag_sgg",\
    "B_Kitbag_mcamo",\
    "B_FieldPack_blk",\
    "B_FieldPack_ocamo",\
    "B_FieldPack_oucamo",\
    "B_FieldPack_cbr",\
    "tacs_Backpack_AssaultExpanded_Black",\
    "tacs_Backpack_AssaultExpanded_Green",\
    "tacs_Backpack_AssaultExpanded_Tan",\
    "tacs_Backpack_Carryall_DarkBlack",\
    "tacs_Backpack_Kitbag_DarkBlack"\
]

#define AVAILABLE_HEADGEAR [\
    "H_Booniehat_khk_hs",\
    "H_Booniehat_khk",\
    "H_HelmetB",\
    "H_HelmetB_light",\
    "H_HelmetB_paint",\
    "H_PilotHelmetHeli_B",\
    "H_PilotHelmetHeli_O",\
    "H_CrewHelmetHeli_B",\
    "H_Cap_red",\
    "H_Cap_blu",\
    "H_Cap_oli",\
    "H_Cap_headphones",\
    "H_Cap_tan",\
    "H_Cap_blk",\
    "H_Cap_brn_SPECOPS",\
    "H_Cap_tan_specops_US",\
    "H_Cap_khaki_specops_UK",\
    "H_Cap_grn",\
    "H_Cap_blk_Raven",\
    "H_Cap_oli_hs",\
    "H_Cap_usblack",\
    "H_Bandanna_khk",\
    "H_Bandanna_khk_hs",\
    "H_Bandanna_cbr",\
    "H_Bandanna_sgg",\
    "H_Bandanna_sand",\
    "H_Bandanna_gry",\
    "H_Bandanna_blu",\
    "H_Bandanna_camo",\
    "H_Bandanna_mcamo",\
    "H_Booniehat_oli",\
    "H_Watchcap_blk",\
    "H_Watchcap_camo",\
    "H_Watchcap_cbr",\
    "H_Watchcap_khk",\
    "H_Booniehat_DMARPAT",\
    "H_Booniehat_GCAMO",\
    "H_Booniehat_rgr",\
    "H_CrewHelmetHeli_O",\
    "H_HelmetB_plain_blk",\
    "H_Helmet_Kerry",\
    "H_HelmetB_black",\
    "H_HelmetB_desert",\
    "H_HelmetB_grass",\
    "H_HelmetB_sand",\
    "H_HelmetB_snakeskin",\
    "H_HelmetIA",\
    "tacs_Cap_Headphones_BlackLogo",\
    "tacs_Cap_BlackLogo",\
    "tacs_Cap_TanLogo",\
    "tacs_Cap_Earpiece_BlackLogo",\
    "tacs_Cap_Earpiece_TanLogo",\
    "tacs_Cap_Backwards_BlackLogo",\
    "tacs_Cap_Backwards_TanLogo",\
    "tacs_Helmet_Ballistic_DarkBlack",\
    "tacs_Helmet_PilotHeli_Tan",\
    "tacs_Hat_Boonie_RangerGreen",\
    "tacs_Hat_Boonie_DesertMARPAT",\
    "tacs_Hat_Boonie_Woodland",\
    "tacs_Hat_Boonie_UCP"\
]

#define AVAILABLE_VESTS [\
    "V_PlateCarrier1_rgr",\
    "V_PlateCarrier2_rgr",\
    "V_TacVest_brn",\
    "V_TacVest_oli",\
    "V_PlateCarrierH_CTRG",\
    "V_PlateCarrierL_CTRG",\
    "V_RebreatherB",\
    "V_Rangemaster_belt",\
    "V_BandollierB_khk",\
    "V_BandollierB_cbr",\
    "V_BandollierB_rgr",\
    "V_BandollierB_blk",\
    "V_BandollierB_oli",\
    "V_PlateCarrier3_rgr",\
    "V_PlateCarrierGL_rgr",\
    "V_PlateCarrier1_blk",\
    "V_PlateCarrierSpec_rgr",\
    "V_Chestrig_khk",\
    "V_Chestrig_rgr",\
    "V_Chestrig_blk",\
    "V_Chestrig_oli",\
    "V_TacVest_khk",\
    "V_TacVest_blk",\
    "V_TacVest_camo",\
    "V_TacVestIR_blk",\
    "V_TacVestCamo_khk",\
    "V_HarnessO_brn",\
    "V_HarnessOGL_brn",\
    "V_HarnessO_gry",\
    "V_HarnessOGL_gry",\
    "V_HarnessOSpec_brn",\
    "V_HarnessOSpec_gry",\
    "V_PlateCarrierIA1_dgtl",\
    "V_PlateCarrierIA2_dgtl",\
    "tacs_Vest_PlateCarrierFull_Black",\
    "tacs_Vest_PlateCarrierFull_Green",\
    "tacs_Vest_PlateCarrier_Black",\
    "tacs_Vest_PlateCarrier_Green",\
    "tacs_Vest_PlateCarrier_Coyote",\
    "tacs_Vest_PlateCarrier_Khaki",\
    "tacs_Vest_PlateCarrier_MARPAT",\
    "tacs_Vest_Tactical_DarkBlack"\
]

//Init stuff
params ["_crate"];

["AmmoboxInit", [_crate, false, {true}]] spawn BIS_fnc_arsenal;

//Populate with predefined items and whatever is already in the crate
[_crate, (backpackCargo _crate) + AVAILABLE_BACKPACKS] call BIS_fnc_addVirtualBackpackCargo;
[_crate, (itemCargo _crate) + AVAILABLE_HEADGEAR + AVAILABLE_GOGGLES + AVAILABLE_UNIFORMS + AVAILABLE_VESTS] call BIS_fnc_addVirtualItemCargo;
