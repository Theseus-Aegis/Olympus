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
 * [crate] call TAC_Olympus_fnc_ArmoryBoxRifleInit
 */
#include "..\script_component.hpp"

params ["_crate"];

[_crate, [
    // Rifles
    ["rifle", "arifle_MX_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_MXC_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_MX_SW_F", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_RU556", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_Colt727", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_bcmjack", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_Bushmaster300", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_vendimus", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_SAMR", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_honeybase", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_honeybadger", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_l1a1slr", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_SLR", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_FAL5061", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_c1A1", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_LAR", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_falosw", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_g3sg1", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_g3a3", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_g3ka4", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_hk53", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_ak74", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_aks74", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_aks74u", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_ak47", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_akm", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_rpk", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_ak12", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_aughbar", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_aughbar_b", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_aughbar_t", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_auga2lsw", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_auga2lsw_t", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_auga2lsw_b", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_auga3", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_auga3_bl", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_auga3_b", "Assault Rifle", "", 1],
    ["rifle", "arifle_MX_Black_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_MXC_Black_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_MX_SW_Black_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_MXM_Black_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_TRG20_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_TRG21_F", "Assault Rifle", "", 1],
    ["rifle", "srifle_DMR_03_F", "Assault Rifle", "", 1],
    ["rifle", "srifle_DMR_03_khaki_F", "Assault Rifle", "", 1],
    ["rifle", "srifle_DMR_03_tan_F", "Assault Rifle", "", 1],
    ["rifle", "srifle_DMR_03_multicam_F", "Assault Rifle", "", 1],
    ["rifle", "srifle_DMR_03_woodland_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_Mk20_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_Mk20_plain_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_Mk20C_F", "Assault Rifle", "", 1],
    ["rifle", "arifle_Mk20C_plain_F", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_aku12", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_rpk12", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36A1", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36KA1", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36C", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36E1", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36KE1", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36V", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36KV", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36CV", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36KTAC", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36CTAC", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36MLIC", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36KMLIC", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_G36CMLIC", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_STGW57", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_stgw57_RIS", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_stgw57_command", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_sig5104", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_amt", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_M4", "Assault Rifle", "", 1],
    ["rifle", "hlc_rifle_CQBR", "Assault Rifle", "", 1],
    ["rifle", "tacs_MX_BlackCamo", "Assault Rifle", "", 1],
    // Magazines
    ["ammo", "9Rnd_45ACP_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "11Rnd_45ACP_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "200Rnd_65x39_cased_Box", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_200Rnd_65x39_cased_Box_Tracer_Dim", "Assault Rifle Ammo", "", 1],
    ["ammo", "16Rnd_9x21_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "30Rnd_65x39_caseless_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", "Assault Rifle Ammo", "", 1],
    ["ammo", "100Rnd_65x39_caseless_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_100Rnd_65x39_caseless_mag_Tracer_Dim", "Assault Rifle Ammo", "", 1],
    ["ammo", "30rnd_556x45_stanag", "Assault Rifle Ammo", "", 1],
    ["ammo", "6Rnd_45ACP_Cylinder", "Assault Rifle Ammo", "", 1],
    ["ammo", "20rnd_556x45_uw_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_65x39_caseless_green_mag_Tracer_D", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_556x45_Stanag_M995_AP_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_556x45_Stanag_Mk262_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_556x45_Stanag_Mk318_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_556x45_Stanag_Tracer_Dim", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x51_Mag_Tracer", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x51_Mag_Tracer_Dim", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x51_Mag_SD", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_762x51_M118LR_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_762x51_Mk316_Mod_0_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_762x51_Mk319_Mod_0_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_762x51_M993_AP_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x51_M118LR_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x51_Mk319_Mod_0_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x51_M993_AP_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x67_Mk248_Mod_0_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x67_Mk248_Mod_1_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_338_300gr_HPBT_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_338_API526_Mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_10Rnd_762x54_Tracer_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_30Rnd_9x19_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "ACE_16Rnd_9x19_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "29Round_300BLK_STANAG", "Assault Rifle Ammo", "", 1],
    ["ammo", "29Round_300BLK_STANAG_T", "Assault Rifle Ammo", "", 1],
    ["ammo", "29Round_300BLK_STANAG_S", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_EPR", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_SOST", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_SPR", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_B_fal", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_t_fal", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_S_fal", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_50Rnd_762x51_M_FAL", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_B_G3", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_T_G3", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_50Rnd_762x51_M_G3", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_B_M14", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_T_M14", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_545x39_B_AK", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_545x39_T_AK", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_545x39_EP_AK", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_45Rnd_545x39_t_rpk", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_762x39_b_ak", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_762x39_t_ak", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_45Rnd_762x39_t_rpk", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_45Rnd_762x39_m_rpk", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_100Rnd_762x51_B_M60E4", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_100Rnd_762x51_T_M60E4", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_100Rnd_762x51_M_M60E4", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_9x19_B_MP5", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_9x19_GD_MP5", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_9x19_SD_MP5", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_10mm_B_MP5", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_10mm_JHP_MP5", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_B_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_SOST_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_SPR_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_556x45_T_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_40Rnd_556x45_B_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_40Rnd_556x45_SOST_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_40Rnd_556x45_SPR_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_25Rnd_9x19mm_M882_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_25Rnd_9x19mm_JHP_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_25Rnd_9x19mm_subsonic_AUG", "Assault Rifle Ammo", "", 1],
    ["ammo", "30rnd_9x21_mag", "Assault Rifle Ammo", "", 1],
    ["ammo", "30rnd_45acp_mag_smg_01", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30Rnd_545x39_S_AK", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_10rnd_12g_buck_S12", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_10rnd_12g_slug_S12", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_200rnd_556x45_M_SAW", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_200rnd_556x45_T_SAW", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_200rnd_556x45_B_SAW", "Assault Rifle Ammo", "", 1],
    ["ammo", "150rnd_762x54_box", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30rnd_556x45_EPR_G36", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30rnd_556x45_SOST_G36", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_30rnd_556x45_SPR_G36", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_100rnd_556x45_EPR_G36", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_5rnd_3006_1903", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_24Rnd_75x55_B_stgw", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_24Rnd_75x55_ap_stgw", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_b_amt", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_mk316_amt", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_bball_amt", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_20Rnd_762x51_T_amt", "Assault Rifle Ammo", "", 1],
    ["ammo", "hlc_24Rnd_75x55_T_stgw", "Assault Rifle Ammo", "", 1],
    // Attachments
    ["attachment", "RH_HBLM", "Attachment", "", 1],
    ["attachment", "RH_HBLM_tg", "Attachment", "", 1],
    ["attachment", "RH_HBLM_des", "Attachment", "", 1],
    ["attachment", "RH_HBLM_wdl", "Attachment", "", 1],
    ["attachment", "RH_TD_ACB", "Attachment", "", 1],
    ["attachment", "RH_TD_ACB_g", "Attachment", "", 1],
    ["attachment", "RH_TD_ACB_b", "Attachment", "", 1],
    ["attachment", "optic_Yorris", "Attachment", "", 1],
    ["attachment", "optic_MRD", "Attachment", "", 1],
    ["attachment", "acc_flashlight", "Attachment", "", 1],
    ["attachment", "ACE_acc_pointer_red", "Attachment", "", 1],
    ["attachment", "ACE_acc_pointer_green_IR", "Attachment", "", 1],
    ["attachment", "ACE_acc_pointer_green", "Attachment", "", 1],
    ["attachment", "RH_peq15", "Attachment", "", 1],
    ["attachment", "RH_peq15_top", "Attachment", "", 1],
    ["attachment", "RH_peq15b", "Attachment", "", 1],
    ["attachment", "RH_peq15b_top", "Attachment", "", 1],
    ["attachment", "RH_peq2", "Attachment", "", 1],
    ["attachment", "RH_peq2_top", "Attachment", "", 1],
    ["attachment", "RH_SFM952V", "Attachment", "", 1],
    ["attachment", "RH_SFM952V_tan", "Attachment", "", 1],
    ["attachment", "RH_pmir", "Attachment", "", 1],
    ["attachment", "RH_A26", "Attachment", "", 1],
    ["attachment", "RH_x2", "Attachment", "", 1],
    ["attachment", "RH_m6x", "Attachment", "", 1],
    ["attachment", "optic_Aco", "Attachment", "", 1],
    ["attachment", "optic_ACO_grn", "Attachment", "", 1],
    ["attachment", "optic_Arco", "Attachment", "", 1],
    ["attachment", "optic_Hamr", "Attachment", "", 1],
    ["attachment", "optic_MRCO", "Attachment", "", 1],
    ["attachment", "optic_Holosight", "Attachment", "", 1],
    ["attachment", "ACE_optic_Arco_2D", "Attachment", "", 1],
    ["attachment", "ACE_optic_SOS_2D", "Attachment", "", 1],
    ["attachment", "ACE_optic_MRCO_2D", "Attachment", "", 1],
    ["attachment", "ACE_optic_Hamr_2D", "Attachment", "", 1],
    ["attachment", "hlc_optic_suit", "Attachment", "", 1],
    ["attachment", "hlc_optic_accupoint_g3", "Attachment", "", 1],
    ["attachment", "hlc_optic_kobra", "Attachment", "", 1],
    ["attachment", "hlc_optic_goshawk", "Attachment", "", 1],
    ["attachment", "optic_ACO_grn_smg", "Attachment", "", 1],
    ["attachment", "optic_Aco_smg", "Attachment", "", 1],
    ["attachment", "optic_Holosight_smg", "Attachment", "", 1],
    ["attachment", "RH_eotech553", "Attachment", "", 1],
    ["attachment", "RH_eotech553mag", "Attachment", "", 1],
    ["attachment", "RH_eotech553_tan", "Attachment", "", 1],
    ["attachment", "RH_eotech553mag_tan", "Attachment", "", 1],
    ["attachment", "RH_eotexps3", "Attachment", "", 1],
    ["attachment", "RH_eotexps3_tan", "Attachment", "", 1],
    ["attachment", "RH_eothhs1", "Attachment", "", 1],
    ["attachment", "RH_eothhs1_tan", "Attachment", "", 1],
    ["attachment", "RH_compm4s", "Attachment", "", 1],
    ["attachment", "RH_compm2", "Attachment", "", 1],
    ["attachment", "RH_compm2l", "Attachment", "", 1],
    ["attachment", "RH_compm2_tan", "Attachment", "", 1],
    ["attachment", "RH_compm2l_tan", "Attachment", "", 1],
    ["attachment", "RH_t1", "Attachment", "", 1],
    ["attachment", "RH_t1_tan", "Attachment", "", 1],
    ["attachment", "RH_reflex", "Attachment", "", 1],
    ["attachment", "RH_shortdot", "Attachment", "", 1],
    ["attachment", "RH_m3lr", "Attachment", "", 1],
    ["attachment", "RH_ta01nsn", "Attachment", "", 1],
    ["attachment", "RH_ta01nsn_2D", "Attachment", "", 1],
    ["attachment", "RH_ta31rco", "Attachment", "", 1],
    ["attachment", "RH_ta31rco_2D", "Attachment", "", 1],
    ["attachment", "RH_ta31rmr", "Attachment", "", 1],
    ["attachment", "RH_ta31rmr_2D", "Attachment", "", 1],
    ["attachment", "RH_ta01nsn_tan", "Attachment", "", 1],
    ["attachment", "RH_ta01nsn_tan_2D", "Attachment", "", 1],
    ["attachment", "RH_ta31rco_tan", "Attachment", "", 1],
    ["attachment", "RH_ta31rco_tan_2D", "Attachment", "", 1],
    ["attachment", "RH_ta31rmr_tan", "Attachment", "", 1],
    ["attachment", "RH_ta31rmr_tan_2D", "Attachment", "", 1],
    ["attachment", "RH_ta648", "Attachment", "", 1],
    ["attachment", "RH_accupoint", "Attachment", "", 1],
    ["attachment", "RH_c79", "Attachment", "", 1],
    ["attachment", "RH_c79_2D", "Attachment", "", 1],
    ["attachment", "RH_m145", "Attachment", "", 1],
    ["attachment", "RH_barska_rds", "Attachment", "", 1],
    ["attachment", "RH_cmore", "Attachment", "", 1],
    ["attachment", "RH_Ltdocter", "Attachment", "", 1],
    ["attachment", "RH_LTdocterl", "Attachment", "", 1],
    ["attachment", "RH_zpoint", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36dualoptic35x", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36dualoptic35x2d", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36Export35x", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36Export35x2d", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36Dualoptic15x", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36Dualoptic15x2d", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36Export15x", "Attachment", "", 1],
    ["attachment", "HLC_Optic_G36Export15x2d", "Attachment", "", 1],
    ["attachment", "hlc_optic_Kern", "Attachment", "", 1],
    ["attachment", "hlc_optic_Kern2d", "Attachment", "", 1],
    ["attachment", "bipod_01_F_snd", "Attachment", "", 1],
    ["attachment", "bipod_01_F_blk", "Attachment", "", 1],
    ["attachment", "bipod_01_F_mtp", "Attachment", "", 1],
    ["attachment", "RH_HBLM", "Attachment", "", 1],
    ["attachment", "RH_HBLM_tg", "Attachment", "", 1],
    ["attachment", "RH_HBLM_des", "Attachment", "", 1],
    ["attachment", "RH_HBLM_wdl", "Attachment", "", 1],
    ["attachment", "RH_TD_ACB", "Attachment", "", 1],
    ["attachment", "RH_TD_ACB_b", "Attachment", "", 1],
    ["attachment", "RH_TD_ACB_g", "Attachment", "", 1]
]] call TACFUNC(armory,addItems);
