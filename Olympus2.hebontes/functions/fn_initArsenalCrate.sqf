/*
 * Author: JoramD, Jonpas, Kresky
 * Initializes 2 ACE Arsenals on an object (1 full, 1 partial) and selects an item array.
 * AVAILABLE OPTIONS: 40mm, advancedPistol, advancedRifle, basicLMG, basicPistol, basicRifle, engineer, grenade, launcher, marksman, medical, full (Makes full arsenal and personalArsenal)
 *
 * Arguments:
 * 0: Crate <OBJECT>
 * 1: Chosen item array <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "basicRifle"] call TAC_Olympus_fnc_initArsenalCrate;
 */
#include "..\script_component.hpp"

private _default = [];

private _40mm = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "arifle_Mk20_GL_plain_F",
    "CUP_arifle_L85A2_GL",
    "hlc_rifle_m4m203",
    "CUP_arifle_AK101_GL",
    "cup_optic_elcan_specterdr_black",
    "cup_optic_eotech553_black",
    "hlc_VOG25_AK",
    "1Rnd_HE_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "UGL_FlareGreen_F",
    "tacs_Backpack_AssaultExpanded_Black",
    "NVGoggles_OPFOR"
];

private _advancedPistol = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "hlc_pistol_P226R_357Combat",
    "hlc_12Rnd_357SIG_B_P226"
];

private _advancedRifle = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "hlc_rifle_bcmblackjack",
    "29rnd_300BLK_STANAG",
    "optic_mrco"
];

private _basicLMG = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "hlc_m249_pip1",
    "hlc_200rnd_556x45_M_SAW",
    "bwa3_optic_compm2",
    "cup_optic_elcanm145",
    "bwa3_optic_zo4x30_microt2",
    "tacs_Backpack_Carryall_DarkBlack"
];

private _marksman = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "arifle_MXM_Black_F",
    "30Rnd_65x39_caseless_black_mag",
    "optic_hamr",
    "srifle_DMR_03_F",
    "20Rnd_762x51_Mag",
    "optic_mrco",
    "ace_optic_mrco_2d",
    "srifle_EBR_F",
    "cup_optic_elcan",
    "V_Rangemaster_belt",
    "Rangefinder",
    "ACE_RangeCard"
];

private _basicPistol = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "tacs_Walther_P99",
    "16Rnd_9x21_Mag"
];

private _basicRifle = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "CUP_arifle_M4A1_black",
    "30Rnd_556x45_Stanag_green"
];

private _engineer = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "tacs_Backpack_Carryall_DarkBlack",
    "H_HelmetSpecB",
    "V_EOD_blue_F",
    "ACE_VMH3",
    "ACE_VMM3",
    "ACE_DefusalKit",
    "ACE_M26_Clacker",
    "ACE_Clacker",
    "MineDetector",
    "ACE_wirecutter",
    "DemoCharge_Remote_Mag",
    "ATMine_Range_Mag",
    "SatchelCharge_Remote_Mag",
    "ClaymoreDirectionalMine_Remote_Mag",
    "APERSBoundingMine_Range_Mag",
    "SLAMDirectionalMine_Wire_Mag",
    "APERSTripMine_Wire_Mag",
    "APERSMine_Range_Mag"
];

private _grenade = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "V_Rangemaster_belt",
    "tacs_Backpack_AssaultExpanded_Black",
    "HandGrenade"
];

private _launcher = [
    "ACE_fieldDressing",
    "ACE_EarPlugs",
    "CUP_launch_M136",
    "CUP_launch_RPG7V",
    "CUP_PG7V_M",
    "launch_MRAWS_green_rail_F",
    "launch_NLAW_F",
    "launch_RPG32_green_F",
    "MRAWS_HEAT_F",
    "tacs_Backpack_Carryall_DarkBlack",
    "RPG32_F"
];

private _medical = [
    "ACE_EarPlugs",
    "tacs_Backpack_Kitbag_Medic_Black",
    "tacs_Backpack_Kitbag_Medic_Coyote",
    "tacs_Backpack_Kitbag_Medic_Digital",
    "tacs_Backpack_Kitbag_Medic_Green",
    "tacs_Backpack_Kitbag_Medic_MTP",
    "tacs_Backpack_Kitbag_Medic_Sage",
    "tacs_Backpack_Kitbag_Medic_Tan",
    "tacs_Backpack_Kitbag_Medic_White",
    "ACE_adenosine",
    "ACE_atropine",
    "ACE_fieldDressing",
    "ACE_elasticBandage",
    "ACE_quikclot",
    "ACE_bloodIV",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_bodyBag",
    "ACE_epinephrine",
    "ACE_morphine",
    "ACE_packingBandage",
    "tac_medical_painkillers",
    "ACE_personalAidKit",
    "ACE_plasmaIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_salineIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_splint",
    "ACE_surgicalKit",
    "ACE_tourniquet"
];

// Init stuff
params ["_crate", "_type"];

// Check which array to use
private _chosen = [];
switch (_type) do {
    case "40mm": { _chosen = _40mm; };
    case "advancedPistol": { _chosen = _advancedPistol; };
    case "advancedRifle": { _chosen = _advancedRifle; };
    case "basicLMG": { _chosen = _basicLMG; };
    case "marksman": { _chosen = _marksman; };
    case "basicPistol": { _chosen = _basicPistol; };
    case "basicRifle": { _chosen = _basicRifle; };
    case "engineer": { _chosen = _engineer; };
    case "grenade": { _chosen = _grenade; };
    case "launcher": { _chosen = _launcher; };
    case "medical": { _chosen = _medical; };
    default { _chosen = _default; };
};

// Add virtual items
[_crate, _chosen] call ace_arsenal_fnc_addVirtualItems;

// Add arsenal option if chosen is not default
if !(_chosen isEqualTo []) then {
    private _action = [
        QGVAR(arsenal),
        "Arsenal",
        "",
        {
            [_target, _player, false] call ace_arsenal_fnc_openBox;
        },
        {true}
    ] call ace_interact_menu_fnc_createAction;

    [_crate, 0, ["ACE_MainActions"], _Action] call ace_interact_menu_fnc_addActionToObject;
} else {
   if !(_type isEqualTo "full") then {
       ERROR_MSG_1("Incorrect item array (%1)",_type);
   };
};

// Add full arsenal option
private _fullAction = [
    QGVAR(fullArsenal),
    "Full Arsenal",
    "",
    {
        [_target, _player, true] call ace_arsenal_fnc_openBox;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _fullAction] call ace_interact_menu_fnc_addActionToObject;

// Disable carrying and dragging
[_crate, false] call ace_dragging_fnc_setCarryable;
[_crate, false] call ace_dragging_fnc_setDraggable;

// Add personal arsenal option to default arsenals
if (_type isEqualTo "full") then {
    [{!isNull player}, {[player, _this] call TAC_Olympus_fnc_personalArsenal}, _crate] call CBA_fnc_waitUntilAndExecute;
};
