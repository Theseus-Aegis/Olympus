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

#define AVAILABLE_GRENADES [\
    "HandGrenade",\
    "HandGrenade_Stone",\
    "SmokeShell",\
    "SmokeShellGreen",\
    "SmokeShellYellow",\
    "SmokeShellOrange",\
    "SmokeShellBlue",\
    "SmokeShellPurple"\
]

//Init stuff
params ["_crate"];

["AmmoboxInit", [_crate, false, {true}]] spawn BIS_fnc_arsenal;

//Populate with predefined items and whatever is already in the crate
[_crate, (magazineCargo _crate) + AVAILABLE_GRENADES] call BIS_fnc_addVirtualMagazineCargo;
