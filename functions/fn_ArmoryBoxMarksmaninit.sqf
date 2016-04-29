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
 * [crate] call TAC_Olympus_fnc_ArmoryBoxMarksmanInit
 */
#include "..\script_component.hpp"

params ["_crate"];

[_crate, [
    // Rifles
    ["rifle", "arifle_MXM_F", "Marksman Rifle", "", 3],
    ["rifle", "hlc_rifle_M14", "Marksman Rifle", "", 3],
    ["rifle", "hlc_rifle_M21", "Marksman Rifle", "", 3],
    ["rifle", "hlc_rifle_M14DMR", "Marksman Rifle", "", 3],
    ["rifle", "arifle_MXM_Black_F", "Marksman Rifle", "", 3],
    ["rifle", "srifle_DMR_06_camo_F", "Marksman Rifle", "", 3],
    ["rifle", "srifle_DMR_06_olive_F", "Marksman Rifle", "", 3],
    // Magazines
    ["ammo", "30Rnd_65x39_caseless_mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", "Marksman Ammo", "", 20],
    ["ammo", "ACE_30Rnd_65x39_caseless_green_mag_Tracer_D", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x51_Mag_Tracer", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x51_Mag_Tracer_Dim", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x51_Mag_SD", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x51_M118LR_Mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x51_Mk319_Mod_0_Mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x51_M993_AP_Mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x67_Mk248_Mod_0_Mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x67_Mk248_Mod_1_Mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", "Marksman Ammo", "", 20],
    ["ammo", "ACE_30Rnd_9x19_mag", "Marksman Ammo", "", 20],
    ["ammo", "29Round_300BLK_STANAG", "Marksman Ammo", "", 20],
    ["ammo", "29Round_300BLK_STANAG_T", "Marksman Ammo", "", 20],
    ["ammo", "29Round_300BLK_STANAG_S", "Marksman Ammo", "", 20],
    ["ammo", "hlc_20Rnd_762x51_B_M14", "Marksman Ammo", "", 20],
    ["ammo", "hlc_20Rnd_762x51_T_M14", "Marksman Ammo", "", 20],
    ["ammo", "hlc_20Rnd_762x51_b_amt", "Marksman Ammo", "", 20],
    ["ammo", "hlc_20Rnd_762x51_mk316_amt", "Marksman Ammo", "", 20],
    ["ammo", "hlc_20Rnd_762x51_bball_amt", "Marksman Ammo", "", 20],
    ["ammo", "hlc_20Rnd_762x51_T_amt", "Marksman Ammo", "", 20],
    ["ammo", "hlc_24Rnd_75x55_T_stgw", "Marksman Ammo", "", 20],
    // Attachments
    ["attachment", "hlc_Optic_ZFSG1", "Attachment", "", 5],
    ["attachment", "hlc_optic_accupoint_g3", "Attachment", "", 5],
    ["attachment", "hlc_optic_artel_m14", "Attachment", "", 5],
    ["attachment", "hlc_optic_LRT_m14", "Attachment", "", 5],
    ["attachment", "optic_KHS_blk", "Attachment", "", 5],
    ["attachment", "optic_KHS_hex", "Attachment", "", 5],
    ["attachment", "optic_KHS_old", "Attachment", "", 5],
    ["attachment", "optic_KHS_tan", "Attachment", "", 5],
    ["attachment", "RH_shortdot", "Attachment", "", 5],
    ["attachment", "RH_m3lr", "Attachment", "", 5],
    ["attachment", "RH_accupoint", "Attachment", "", 5],
    ["attachment", "RH_leu_mk4", "Attachment", "", 5],
    ["attachment", "bipod_01_F_snd", "Attachment", "", 5],
    ["attachment", "bipod_01_F_blk", "Attachment", "", 5],
    ["attachment", "bipod_01_F_mtp", "Attachment", "", 5]
]] call TACFUNC(armory,addItems);
