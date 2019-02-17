/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Advanced Rifle course items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxAdvRifleinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_RIFLE [\
    "hlc_rifle_bcmblackjack"\
]

#define AVAILABLE_RIFLE_MAGAZINES [\
    "29rnd_300BLK_STANAG"\
]

#define AVAILABLE_ATTACHMENTS [\
    "optic_mrco"\
]

#define AVAILABLE_GEAR [\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (itemCargo _crate) + AVAILABLE_ATTACHMENTS] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_RIFLE_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_RIFLE] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
