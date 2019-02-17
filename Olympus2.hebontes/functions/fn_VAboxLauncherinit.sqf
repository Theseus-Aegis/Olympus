/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Launcher Range items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxLauncherinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_LAUNCHERS [\
    "launch_RPG32_F"\
]

#define AVAILABLE_GEAR [\
    "tacs_Backpack_Carryall_DarkBlack"\
]

#define AVAILABLE_LAUNCHER_MAGAZINES [\
    "RPG32_F"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_LAUNCHER_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_LAUNCHERS] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
