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
 * [crate] call TAC_Olympus_fnc_VAboxMGInit
 */
#include "..\script_component.hpp"

//Lists of items to include
#define AVAILABLE_MG [\
    "LMG_Mk200_F",\
    "arifle_MX_SW_F",\
    "hlc_rifle_rpk",\
    "arifle_MX_SW_Black_F",\
    "hlc_rifle_rpk12",\
    "hlc_lmg_minimi_railed",\
    "hlc_m249_pip1",\
    "hlc_m249_pip2",\
    "hlc_m249_pip3",\
    "hlc_m249_pip4"\
]

#define AVAILABLE_MG_MAGAZINES [\
    "ACE_200Rnd_65x39_cased_Box_Tracer_Dim",\
    "30Rnd_65x39_caseless_mag",\
    "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",\
    "100Rnd_65x39_caseless_mag",\
    "ACE_100Rnd_65x39_caseless_mag_Tracer_Dim",\
    "30rnd_556x45_stanag",\
    "6Rnd_45ACP_Cylinder",\
    "20rnd_556x45_uw_mag",\
    "ACE_30Rnd_65x39_caseless_green_mag_Tracer_D",\
    "ACE_30Rnd_556x45_Stanag_M995_AP_mag",\
    "ACE_30Rnd_556x45_Stanag_Mk262_mag",\
    "ACE_30Rnd_556x45_Stanag_Mk318_mag",\
    "ACE_30Rnd_556x45_Stanag_Tracer_Dim",\
    "ACE_20Rnd_762x51_Mag_Tracer",\
    "ACE_20Rnd_762x51_Mag_Tracer_Dim",\
    "ACE_20Rnd_762x51_Mag_SD",\
    "ACE_10Rnd_762x51_M118LR_Mag",\
    "ACE_10Rnd_762x51_Mk316_Mod_0_Mag",\
    "ACE_10Rnd_762x51_Mk319_Mod_0_Mag",\
    "ACE_10Rnd_762x51_M993_AP_Mag",\
    "ACE_20Rnd_762x51_M118LR_Mag",\
    "ACE_20Rnd_762x51_Mk319_Mod_0_Mag",\
    "ACE_20Rnd_762x51_M993_AP_Mag",\
    "ACE_20Rnd_762x67_Mk248_Mod_0_Mag",\
    "ACE_20Rnd_762x67_Mk248_Mod_1_Mag",\
    "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag",\
    "ACE_10Rnd_338_300gr_HPBT_Mag",\
    "ACE_10Rnd_338_API526_Mag",\
    "ACE_10Rnd_762x54_Tracer_mag",\
    "ACE_30Rnd_9x19_mag",\
    "ACE_16Rnd_9x19_mag",\
    "29Round_300BLK_STANAG",\
    "29Round_300BLK_STANAG_T",\
    "29Round_300BLK_STANAG_S",\
    "hlc_30Rnd_556x45_EPR",\
    "hlc_30Rnd_556x45_SOST",\
    "hlc_30Rnd_556x45_SPR",\
    "hlc_20Rnd_762x51_B_fal",\
    "hlc_20Rnd_762x51_t_fal",\
    "hlc_20Rnd_762x51_S_fal",\
    "hlc_50Rnd_762x51_M_FAL",\
    "hlc_20Rnd_762x51_B_G3",\
    "hlc_20Rnd_762x51_T_G3",\
    "hlc_50Rnd_762x51_M_G3",\
    "hlc_20Rnd_762x51_B_M14",\
    "hlc_20Rnd_762x51_T_M14",\
    "hlc_30Rnd_545x39_B_AK",\
    "hlc_30Rnd_545x39_T_AK",\
    "hlc_30Rnd_545x39_EP_AK",\
    "hlc_45Rnd_545x39_t_rpk",\
    "hlc_30Rnd_762x39_b_ak",\
    "hlc_30Rnd_762x39_t_ak",\
    "hlc_45Rnd_762x39_t_rpk",\
    "hlc_45Rnd_762x39_m_rpk",\
    "hlc_30Rnd_9x19_B_MP5",\
    "hlc_30Rnd_9x19_GD_MP5",\
    "hlc_30Rnd_9x19_SD_MP5",\
    "hlc_30Rnd_10mm_B_MP5",\
    "hlc_30Rnd_10mm_JHP_MP5",\
    "hlc_30Rnd_556x45_B_AUG",\
    "hlc_30Rnd_556x45_SOST_AUG",\
    "hlc_30Rnd_556x45_SPR_AUG",\
    "hlc_30Rnd_556x45_T_AUG",\
    "hlc_40Rnd_556x45_B_AUG",\
    "hlc_40Rnd_556x45_SOST_AUG",\
    "hlc_40Rnd_556x45_SPR_AUG",\
    "hlc_25Rnd_9x19mm_M882_AUG",\
    "hlc_25Rnd_9x19mm_JHP_AUG",\
    "hlc_25Rnd_9x19mm_subsonic_AUG",\
    "30rnd_9x21_mag",\
    "30rnd_45acp_mag_smg_01",\
    "hlc_30Rnd_545x39_S_AK",\
    "hlc_10rnd_12g_buck_S12",\
    "hlc_10rnd_12g_slug_S12",\
    "hlc_200rnd_556x45_M_SAW",\
    "hlc_200rnd_556x45_T_SAW",\
    "hlc_200rnd_556x45_B_SAW",\
    "150rnd_762x54_box",\
    "hlc_30rnd_556x45_EPR_G36",\
    "hlc_30rnd_556x45_SOST_G36",\
    "hlc_30rnd_556x45_SPR_G36",\
    "hlc_100rnd_556x45_EPR_G36",\
    "hlc_5rnd_3006_1903",\
    "hlc_24Rnd_75x55_B_stgw",\
    "hlc_24Rnd_75x55_ap_stgw",\
    "hlc_20Rnd_762x51_b_amt",\
    "hlc_20Rnd_762x51_mk316_amt",\
    "hlc_20Rnd_762x51_bball_amt",\
    "hlc_20Rnd_762x51_T_amt",\
    "hlc_24Rnd_75x55_T_stgw"\
]

#define AVAILABLE_ATTACHMENTS [\
    "RH_HBLM",\
    "RH_HBLM_tg",\
    "RH_HBLM_des",\
    "RH_HBLM_wdl",\
    "RH_TD_ACB",\
    "RH_TD_ACB_g",\
    "RH_TD_ACB_b",\
    "optic_Yorris",\
    "optic_MRD",\
    "acc_flashlight",\
    "ACE_acc_pointer_red",\
    "ACE_acc_pointer_green_IR",\
    "ACE_acc_pointer_green",\
    "RH_peq15",\
    "RH_peq15_top",\
    "RH_peq15b",\
    "RH_peq15b_top",\
    "RH_peq2",\
    "RH_peq2_top",\
    "RH_SFM952V",\
    "RH_SFM952V_tan",\
    "RH_pmir",\
    "RH_A26",\
    "RH_x2",\
    "RH_m6x",\
    "optic_Aco",\
    "optic_ACO_grn",\
    "optic_Arco",\
    "optic_Hamr",\
    "optic_MRCO",\
    "optic_Holosight",\
    "ACE_optic_Arco_2D",\
    "ACE_optic_SOS_2D",\
    "ACE_optic_MRCO_2D",\
    "ACE_optic_Hamr_2D",\
    "hlc_optic_suit",\
    "hlc_optic_accupoint_g3",\
    "hlc_optic_kobra",\
    "hlc_optic_goshawk",\
    "optic_ACO_grn_smg",\
    "optic_Aco_smg",\
    "optic_Holosight_smg",\
    "RH_eotech553",\
    "RH_eotech553mag",\
    "RH_eotech553_tan",\
    "RH_eotech553mag_tan",\
    "RH_eotexps3",\
    "RH_eotexps3_tan",\
    "RH_eothhs1",\
    "RH_eothhs1_tan",\
    "RH_compm4s",\
    "RH_compm2",\
    "RH_compm2l",\
    "RH_compm2_tan",\
    "RH_compm2l_tan",\
    "RH_t1",\
    "RH_t1_tan",\
    "RH_reflex",\
    "RH_shortdot",\
    "RH_m3lr",\
    "RH_ta01nsn",\
    "RH_ta01nsn_2D",\
    "RH_ta31rco",\
    "RH_ta31rco_2D",\
    "RH_ta31rmr",\
    "RH_ta31rmr_2D",\
    "RH_ta01nsn_tan",\
    "RH_ta01nsn_tan_2D",\
    "RH_ta31rco_tan",\
    "RH_ta31rco_tan_2D",\
    "RH_ta31rmr_tan",\
    "RH_ta31rmr_tan_2D",\
    "RH_ta648",\
    "RH_accupoint",\
    "RH_c79",\
    "RH_c79_2D",\
    "RH_m145",\
    "RH_barska_rds",\
    "RH_cmore",\
    "RH_Ltdocter",\
    "RH_LTdocterl",\
    "RH_zpoint",\
    "HLC_Optic_G36dualoptic35x",\
    "HLC_Optic_G36dualoptic35x2d",\
    "HLC_Optic_G36Export35x",\
    "HLC_Optic_G36Export35x2d",\
    "HLC_Optic_G36Dualoptic15x",\
    "HLC_Optic_G36Dualoptic15x2d",\
    "HLC_Optic_G36Export15x",\
    "HLC_Optic_G36Export15x2d",\
    "hlc_optic_Kern",\
    "hlc_optic_Kern2d",\
    "bipod_01_F_snd",\
    "bipod_01_F_blk",\
    "bipod_01_F_mtp",\
    "RH_HBLM",\
    "RH_HBLM_tg",\
    "RH_HBLM_des",\
    "RH_HBLM_wdl",\
    "RH_TD_ACB",\
    "RH_TD_ACB_b",\
    "RH_TD_ACB_g"\
]

//Init stuff
params ["_crate"];

["AmmoboxInit", [_crate, false, {true}]] spawn BIS_fnc_arsenal;

//Populate with predefined items and whatever is already in the crate
[_crate, (itemCargo _crate) + AVAILABLE_ATTACHMENTS] call BIS_fnc_addVirtualItemCargo;
[_crate, (magazineCargo _crate) + AVAILABLE_MG_MAGAZINES] call BIS_fnc_addVirtualMagazineCargo;
[_crate, (weaponCargo _crate) + AVAILABLE_MG] call BIS_fnc_addVirtualWeaponCargo;
