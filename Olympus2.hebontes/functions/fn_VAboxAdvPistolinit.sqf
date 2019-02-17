/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Advanced Pistol course items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxAdvPistolinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_PISTOL [\
    "hlc_pistol_P226R_357Combat"\
]

#define AVAILABLE_PISTOL_MAGAZINES [\
    "hlc_12Rnd_357SIG_B_P226"\
]

#define AVAILABLE_GEAR [\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_PISTOL_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_PISTOL] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
