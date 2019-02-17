/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Basic Rifle range items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxBasicRifleinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_RIFLES [\
    "hlc_rifle_M4"\
]

#define AVAILABLE_RIFLE_MAGAZINES [\
    "hlc_30rnd_556x45_EPR"\
]

#define AVAILABLE_GEAR [\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_RIFLE_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_RIFLES] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
