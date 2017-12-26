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
 * [crate] call TAC_Olympus_fnc_VAboxMarksmanInit
 */
#include "..\script_component.hpp"

//Lists of items to include
#define AVAILABLE_DMR [\
    "arifle_MXM_F",\
    "hlc_rifle_SAMR",\
    "hlc_rifle_M14",\
    "hlc_rifle_M21",\
    "hlc_rifle_M14DMR",\
    "arifle_MXM_Black_F",\
    "srifle_DMR_03_F",\
    "srifle_DMR_03_khaki_F",\
    "srifle_DMR_03_tan_F",\
    "srifle_DMR_03_multicam_F",\
    "srifle_DMR_03_woodland_F",\
    "srifle_DMR_06_camo_F",\
    "srifle_DMR_06_olive_F",\
    "arifle_MXM_khk_F",\
    "arifle_SPAR_03_blk_F",\
    "arifle_SPAR_03_khk_F",\
    "arifle_SPAR_03_snd_F",\
    "srifle_DMR_07_blk_F",\
    "srifle_DMR_07_ghex_F",\
    "srifle_DMR_07_hex_F",\
    "CUP_arifle_Mk20"\
]

#define AVAILABLE_DMR_MAGAZINES [\
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
    "optic_DMS",\
    "ACE_optic_SOS_2D",\
    "hlc_Optic_ZFSG1",\
    "optic_SOS",\
    "RH_shortdot",\
    "optic_DMS_ghex_F",\
    "optic_SOS_khk_F"\
]

//Init stuff
params ["_crate"];

//Populate with predefined items and whatever is already in the crate
[_crate, (magazineCargo _crate) + AVAILABLE_GRENADES] call ace_arsenal_fnc_addVirtualItems;

//Initialize arsenal
[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
