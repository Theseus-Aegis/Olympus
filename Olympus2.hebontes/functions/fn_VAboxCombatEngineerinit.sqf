/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with Combat Engineer course items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxCombatEngineerinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_DETECTORS [\
    "ACE_VMH3",\
	"ACE_VMM3"\
]

#define AVAILABLE_ITEMS [\
    "ACE_DefusalKit",\
	"ACE_M26_Clacker",\
	"ACE_Clacker",\
	"MineDetector",\
	"ACE_wirecutter",\
	"DemoCharge_Remote_Mag",\
	"ATMine_Range_Mag",\
	"SatchelCharge_Remote_Mag",\
	"ClaymoreDirectionalMine_Remote_Mag",\
	"APERSBoundingMine_Range_Mag",\
	"SLAMDirectionalMine_Wire_Mag",\
	"APERSTripMine_Wire_Mag",\
	"APERSMine_Range_Mag"\
]

#define AVAILABLE_GEAR [\
    "tacs_Backpack_Carryall_DarkBlack",\
	"H_HelmetSpecB",\
	"V_EOD_blue_F"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (itemCargo _crate) + AVAILABLE_ITEMS] call ace_arsenal_fnc_addVirtualItems;
[_crate, (weaponCargo _crate) + AVAILABLE_DETECTORS] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
