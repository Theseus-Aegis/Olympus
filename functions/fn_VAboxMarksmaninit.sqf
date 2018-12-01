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
 * [crate] call TAC_Olympus_fnc_VAboxMarksmanInit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_DMR [\
    "hlc_rifle_M14_Bipod_Rail"\
]

#define AVAILABLE_DMR_MAGAZINES [\
    "20Rnd_762x51_Mag",\
    "hlc_20Rnd_762x51_B_M14",\
    "hlc_20Rnd_762x51_Mdim_M14",\
    "hlc_50Rnd_762x51_MDIM_M14",\
    "hlc_50Rnd_762x51_B_M14",\
    "hlc_20Rnd_762x51_Tdim_M14",\
    "hlc_20Rnd_762x51_mk316_M14",\
    "hlc_20Rnd_762x51_barrier_M14",\
    "hlc_20Rnd_762x51_S_M14",\
    "hlc_20Rnd_762x51_T_M14"\
]

#define AVAILABLE_ATTACHMENTS [\
    "optic_SOS",\
    "optic_SOS_khk_F",\
    "ACE_optic_SOS_2D",\
    "ace_optic_sos_pip"\
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
[_crate, (magazineCargo _crate) + AVAILABLE_DMR_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_DMR] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
