/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with 40mm Grenade Launcher range items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAbox40mminit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_RIFLES [\
    "arifle_SPAR_01_GL_blk_F",\
	"Rangefinder"\
]

#define AVAILABLE_RIFLE_MAGAZINES [\
    "1Rnd_HE_Grenade_shell",\
	"1Rnd_SmokeBlue_Grenade_shell",\
	"1Rnd_SmokeGreen_Grenade_shell",\
	"1Rnd_SmokeRed_Grenade_shell",\
	"1Rnd_Smoke_Grenade_shell"\
]

#define AVAILABLE_GEAR [\
    "tacs_Backpack_AssaultExpanded_Black",\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_RIFLE_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_RIFLES] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit