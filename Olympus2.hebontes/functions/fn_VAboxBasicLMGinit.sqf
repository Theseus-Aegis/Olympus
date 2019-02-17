/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Basic LMG range items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxBasicLMGinit
 */
#include "..\script_component.hpp"

//Lists of items to include
#define AVAILABLE_MG [\
    "hlc_m249_pip1"\
]

#define AVAILABLE_MG_MAGAZINES [\
    "hlc_200rnd_556x45_M_SAW"\
]

#define AVAILABLE_ATTACHMENTS [\
    "bwa3_optic_compm2"\
]

#define AVAILABLE_GEAR [\
    "tacs_Backpack_Carryall_DarkBlack"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (itemCargo _crate) + AVAILABLE_ATTACHMENTS] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_MG_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_MG] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
