/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Basic Marksman range items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxBasicMarksmaninit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_DMR [\
    "hlc_rifle_M14_Bipod_Rail",\
	"Rangefinder"\
]

#define AVAILABLE_DMR_MAGAZINES [\
    "hlc_20Rnd_762x51_T_M14"\
]

#define AVAILABLE_ITEMS [\
    "ACE_RangeCard",\
	"optic_sos"\
]

#define AVAILABLE_GEAR [\
    "V_Rangemaster_belt"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (itemCargo _crate) + AVAILABLE_ITEMS] call ace_arsenal_fnc_addVirtualItems;
[_crate, (magazineCargo _crate) + AVAILABLE_DMR_MAGAZINES] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_DMR] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
