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
 * [crate] call TAC_Olympus_fnc_VAboxRifleInit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_RIFLES [\
    "hlc_rifle_Colt727"\
]

#define AVAILABLE_RIFLE_MAGAZINES [\
    "hlc_30rnd_556x45_EPR"\
]

#define AVAILABLE_GEAR [\
    "tacs_Backpack_AssaultExpanded_Black",\
    "tacs_Backpack_AssaultExpanded_Green",\
    "tacs_Backpack_AssaultExpanded_Tan",\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_RIFLE_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_RIFLES] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
