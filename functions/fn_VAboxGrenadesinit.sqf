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

//Populate with predefined items and whatever is already in the crate
[_crate, (magazineCargo _crate) + AVAILABLE_GRENADES] call ace_arsenal_fnc_addVirtualItems;

//Adds arsenal option
_crate addAction ["Arsenal",{
    [_this select 0, player, false] call ace_arsenal_fnc_openBox;
},_crate, 2, true, true];

//Adds full arsenal option
_crate addAction ["Full Arsenal",{
    [_this select 0, player, true] call ace_arsenal_fnc_openBox;
},_crate, 1, false, true, "", "2 > ACE_player distance _target"];
