/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Basic Pistol range items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxBasicPistolinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_PISTOLS [\
    "tacs_Walther_P99"\
]

#define AVAILABLE_PISTOL_MAGAZINES [\
    "16Rnd_9x21_Mag"\
]

#define AVAILABLE_GEAR [\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_PISTOL_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_PISTOLS] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
