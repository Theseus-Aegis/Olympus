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
#define AVAILABLE_MG [\
    "hlc_m249_pip1"\
]

#define AVAILABLE_MG_MAGAZINES [\
    "hlc_200rnd_556x45_B_SAW",\
    "hlc_200rnd_556x45_Mdim_SAW",\
    "hlc_200rnd_556x45_M_SAW",\
    "hlc_200rnd_556x45_T_SAW"\
]

#define AVAILABLE_ATTACHMENTS [\
    "rh_compm2"\
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
[_crate, (itemCargo _crate) + AVAILABLE_ATTACHMENTS] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_MG_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_MG] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
