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
 * [crate] call TAC_Olympus_fnc_VAboxPistolSMGInit
 */
#include "..\script_component.hpp"

//Lists of items to include
#define AVAILABLE_PISTOLS [\
    "hgun_P07_F",\
    "hgun_rook40_f",\
    "RH_cz75",\
    "RH_sw659",\
    "RH_usp",\
    "RH_mak",\
    "RH_m1911",\
    "RH_kimber",\
    "RH_kimber_nw",\
    "RH_uspm",\
    "RH_m9",\
    "RH_m9c",\
    "RH_g17",\
    "RH_tt33",\
    "RH_p226",\
    "RH_p226s",\
    "RH_g19",\
    "RH_g19t",\
    "RH_vp70",\
    "RH_fnp45",\
    "RH_fnp45t",\
    "RH_fn57_g",\
    "RH_fn57_t",\
    "RH_gsh18"\
]

#define AVAILABLE_PISTOL_MAGAZINES [\
    "RH_16Rnd_9x19_cz",\
    "RH_14Rnd_9x19_sw",\
    "RH_12Rnd_45cal_usp",\
    "RH_8Rnd_9x18_Mak",\
    "RH_7Rnd_45cal_m1911",\
    "RH_16Rnd_40cal_usp",\
    "RH_15Rnd_9x19_M9",\
    "RH_8Rnd_762_tt33",\
    "RH_15Rnd_9x19_SIG",\
    "RH_17Rnd_9x19_g17",\
    "RH_18Rnd_9x19_VP",\
    "RH_18Rnd_9x19_gsh",\
    "9Rnd_45ACP_Mag",\
    "16Rnd_9x21_Mag"\
]

#define AVAILABLE_SMGS [\
    "hlc_smg_9mmar",\
    "hlc_smg_mp5k_PDW",\
    "hlc_smg_mp5a2",\
    "hlc_smg_mp5a3",\
    "hlc_smg_mp5a4",\
    "hlc_smg_mp5n",\
    "hlc_smg_mp510",\
    "hlc_smg_mp5sd5",\
    "hlc_smg_mp5sd6",\
    "hlc_rifle_auga2para",\
    "hlc_rifle_auga2para_b",\
    "hlc_rifle_auga2para_t",\
    "hgun_PDW2000_F",\
    "SMG_01_F",\
    "SMG_02_F"\
]

#define AVAILABLE_SMG_MAGAZINES [	\
    "hlc_30Rnd_9x19_B_MP5",\
    "hlc_30Rnd_9x19_GD_MP5",\
    "hlc_30Rnd_9x19_SD_MP5",\
    "hlc_30Rnd_10mm_B_MP5",\
    "hlc_30Rnd_10mm_JHP_MP5",\
    "30Rnd_9x21_Mag",\
    "30Rnd_45ACP_Mag_SMG_01",\
    "30Rnd_45ACP_Mag_SMG_01_tracer_green",\
    "30Rnd_45ACP_Mag_SMG_01_Tracer_Red",\
    "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",\
    "30Rnd_9x21_Green_Mag",\
    "30Rnd_9x21_Mag",\
    "30Rnd_9x21_Red_Mag",\
    "30Rnd_9x21_Yellow_Mag"\
]

#define AVAILABLE_ATTACHMENTS [\
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
    "RH_leu_mk4",\
    "RH_c79",\
    "RH_c79_2D",\
    "RH_m145",\
    "RH_barska_rds",\
    "RH_cmore",\
    "RH_Ltdocter",\
    "RH_LTdocterl",\
    "RH_zpoint",\
    "RH_anpvs4",\
    "RH_anpvs10",\
    "RH_pas13cl",\
    "RH_pas13cm",\
    "RH_pas13cmg",\
    "RH_pas13ch",\
    "RH_peq15",\
    "RH_peq15_top",\
    "RH_peq15b",\
    "RH_peq15b_top",\
    "RH_peq2",\
    "RH_peq2_top",\
    "RH_SFM952V",\
    "RH_SFM952V_tan",\
    "RH_HBLM",\
    "RH_HBLM_tg",\
    "RH_HBLM_des",\
    "RH_HBLM_wdl",\
    "RH_TD_ACB",\
    "RH_TD_ACB_g",\
    "RH_TD_ACB_b",\
    "optic_Yorris",\
    "RH_gemtech9",\
    "RH_A26",\
    "RH_suppr9",\
    "RH_aacusp",\
    "RH_gemtech45",\
    "RH_osprey",\
    "RH_fhusp",\
    "RH_x2",\
    "RH_m6x",\
    "RH_pmsd",\
    "RH_pmir",\
    "RH_matchsd",\
    "RH_m9qd",\
    "RH_x300"\
]

//Init stuff
params ["_crate"];

["AmmoboxInit", [_crate, false, {true}]] spawn BIS_fnc_arsenal;

//Populate with predefined items and whatever is already in the crate
[_crate, (itemCargo _crate) + AVAILABLE_ATTACHMENTS] call BIS_fnc_addVirtualItemCargo;
[_crate, (magazineCargo _crate) + AVAILABLE_PISTOL_MAGAZINES + AVAILABLE_SMG_MAGAZINES] call BIS_fnc_addVirtualMagazineCargo;
[_crate, (weaponCargo _crate) + AVAILABLE_PISTOLS + AVAILABLE_SMGS] call BIS_fnc_addVirtualWeaponCargo;
