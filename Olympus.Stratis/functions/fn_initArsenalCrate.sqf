#include "..\script_component.hpp"
/*
 * Author: JoramD, Jonpas, Emythiel
 * Initializes 2 ACE Arsenals on an object (1 full, 1 partial) and selects an item array.
 * AVAILABLE OPTIONS: 40mm, demolitions, grenade, launcher, machineGun, marksman, medical, rangePistol, rangeRifle, weaponsHandling, full, personal.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 * 1: Chosen item array <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "rangeRifle"] call TAC_Olympus_fnc_initArsenalCrate;
 */

private _default = [];

private _40mm = [
    "1Rnd_HE_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "ACE_40mm_Flare_ir",
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "arifle_Mk20_GL_plain_F",
    "CUP_1Rnd_HE_GP25_M",
    "CUP_1Rnd_SMOKE_GP25_M",
    "CUP_1Rnd_SmokeRed_GP25_M",
    "CUP_1Rnd_StarFlare_Green_M203",
    "CUP_1Rnd_StarFlare_Red_M203",
    "CUP_arifle_AK101_GL",
    "CUP_arifle_L85A2_GL",
    "CUP_IlumFlareGreen_GP25_M",
    "CUP_IlumFlareRed_GP25_M",
    "CUP_IlumFlareWhite_GP25_M",
    "cup_optic_elcan_specterdr_black",
    "cup_optic_eotech553_black",
    "hlc_rifle_m4m203",
    "NVGoggles_OPFOR",
    "tacs_Backpack_AssaultExpanded_Black",
    "UGL_FlareGreen_F",
    "V_Rangemaster_belt"
];

private _rangePistol = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "tacgt_17Rnd_9x19mm_Walther_Ball",
    "tacs_Walther_P99",
    "V_Rangemaster_belt"
];

private _rangeRifle = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "CUP_arifle_M4A1_black",
    "tacgt_30Rnd_556x45_Ball_EMAG",
    "V_Rangemaster_belt"
];

private _engineer = [
    "ACE_Clacker",
    "ACE_DefusalKit",
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "ACE_M26_Clacker",
    "ACE_UAVBattery",
    "ACE_wirecutter",
    "AMP_Breaching_Charge_Mag",
    "DemoCharge_Remote_Mag",
    "H_HelmetSpecB",
    "iedd_item_notebook",
    "I_UavTerminal",
    "I_UGV_02_Demining_backpack_F",
    "SatchelCharge_Remote_Mag",
    "tacs_Backpack_Carryall_DarkBlack",
    "tacs_Vest_PlateCarrier_Green",
    "ToolKit"
];

private _grenade = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "HandGrenade",
    "tacs_Backpack_AssaultExpanded_Black",
    "V_Rangemaster_belt"
];

private _launcher = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "CUP_launch_M136",
    "CUP_launch_RPG7V",
    "CUP_OG7_M",
    "cup_optic_pgo7v3",
    "CUP_PG7VM_M",
    "CUP_PG7VR_M",
    "launch_MRAWS_green_F",
    "launch_MRAWS_green_rail_F",
    "launch_NLAW_F",
    "launch_RPG32_green_F",
    "MRAWS_HEAT_F",
    "RPG32_F",
    "tacgt_rpag_2",
    "tacs_Backpack_Carryall_DarkBlack"
];

private _medical = [
    "ACE_adenosine",
    "ACE_atropine",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_bloodIV",
    "ACE_bodyBag",
    "ACE_EarPlugs",
    "ACE_elasticBandage",
    "ACE_epinephrine",
    "ACE_fieldDressing",
    "ACE_morphine",
    "ACE_packingBandage",
    "ACE_painkillers",
    "ACE_personalAidKit",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_plasmaIV",
    "ACE_quikclot",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_salineIV",
    "ACE_splint",
    "ACE_surgicalKit",
    "ACE_tourniquet",
    "tacs_Backpack_Kitbag_Medic_Black",
    "tacs_Backpack_Kitbag_Medic_Coyote",
    "tacs_Backpack_Kitbag_Medic_Digital",
    "tacs_Backpack_Kitbag_Medic_Green",
    "tacs_Backpack_Kitbag_Medic_MTP",
    "tacs_Backpack_Kitbag_Medic_Sage",
    "tacs_Backpack_Kitbag_Medic_Tan",
    "tacs_Backpack_Kitbag_Medic_White"
];

private _machineGun = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "cup_optic_elcanm145",
    "hlc_m249_pip1",
    "tacgt_200Rnd_556x45_Ball_Belt",
    "tacgt_200Rnd_556x45_Ball_Tracer_Belt",
    "tacs_Backpack_Carryall_DarkBlack",
    "V_Rangemaster_belt"
];

private _marksman = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "ace_optic_mrco_2d",
    "ACE_RangeCard",
    "ACE_Vector",
    "arifle_MXM_Black_F",
    "cup_optic_elcan",
    "optic_hamr",
    "optic_mrco",
    "srifle_DMR_03_F",
    "tacgt_20Rnd_762x51_Ball",
    "tacgt_30Rnd_65x39_Ball_MX_Black",
    "tacs_EBR_Black_F",
    "V_Rangemaster_belt"
];

private _weaponsHandling = [
    "ACE_EarPlugs",
    "ACE_fieldDressing",
    "CUP_arifle_M4A1_black",
    "tacgt_17Rnd_9x19mm_Walther_Ball",
    "tacgt_30Rnd_556x45_Ball_EMAG",
    "tacs_Walther_P99",
    "V_Rangemaster_belt"
];

// Init stuff
params ["_crate", "_type"];

[_crate, -1] call ace_cargo_fnc_setSize;

// Check which array to use
private _chosen = [];
switch (_type) do {
    case "40mm": { _chosen = _40mm; };
    case "marksman": { _chosen = _marksman; };
    case "rangePistol": { _chosen = _rangePistol; };
    case "rangeRifle": { _chosen = _rangeRifle; };
    case "engineer": { _chosen = _engineer; };
    case "grenade": { _chosen = _grenade; };
    case "launcher": { _chosen = _launcher; };
    case "machineGun": { _chosen = _machineGun; };
    case "medical": { _chosen = _medical; };
    case "weaponsHandling": { _chosen = _weaponsHandling; };
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
            [_target, _player, false] call ACEFUNC(arsenal,openBox);
        },
        {true}
    ] call ACEFUNC(interact_menu,createAction);

    [_crate, 0, ["ACE_MainActions"], _Action] call ACEFUNC(interact_menu,addActionToObject);
} else {
   if !(_type == "full" || _type == "personal") then {
       ERROR_MSG_1("Incorrect item array (%1)",_type);
   };
};

// Add full arsenal option
private _fullAction = [
    QGVAR(fullArsenal),
    "Full Arsenal",
    "",
    {
        [_target, _player, true] call ACEFUNC(arsenal,openBox);
    },
    {true}
] call ACEFUNC(interact_menu,createAction);

[_crate, 0, ["ACE_MainActions"], _fullAction] call ACEFUNC(interact_menu,addActionToObject);

// Disable carrying and dragging
[_crate, false] call ace_dragging_fnc_setCarryable;
[_crate, false] call ace_dragging_fnc_setDraggable;

// Add personal arsenal option
if (_type == "personal") then {
    [player, _crate] call TAC_Olympus_fnc_personalArsenal
};
