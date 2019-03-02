/*
 * Author: Rory, Kresky
 * Initializes Virtual Arsenal on an object with Medic course items
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxMedicinit
 */
#include "..\script_component.hpp"

// Lists of items to include
#define AVAILABLE_ITEMS [\
    "ACE_adenosine",\
	"ACE_atropine",\
	"ACE_fieldDressing",\
	"ACE_elasticBandage",\
	"ACE_quikclot",\
	"ACE_bloodIV",\
	"ACE_bloodIV_250",\
	"ACE_bloodIV_500",\
	"ACE_bodyBag",\
	"ACE_epinephrine",\
	"ACE_morphine",\
	"ACE_packingBandage",\
	"tac_medical_painkillers",\
	"ACE_personalAidKit",\
	"ACE_plasmaIV",\
	"ACE_plasmaIV_250",\
	"ACE_plasmaIV_500",\
	"ACE_salineIV",\
	"ACE_salineIV_250",\
	"ACE_salineIV_500",\
	"ACE_surgicalKit",\
	"ACE_tourniquet"\
]

#define AVAILABLE_GEAR [\
    "tacs_Backpack_Kitbag_Medic_Black",\
	"tacs_Backpack_Kitbag_Medic_Coyote",\
	"tacs_Backpack_Kitbag_Medic_Digital",\
	"tacs_Backpack_Kitbag_Medic_Green",\
	"tacs_Backpack_Kitbag_Medic_MTP",\
	"tacs_Backpack_Kitbag_Medic_Sage",\
	"tacs_Backpack_Kitbag_Medic_Tan",\
	"tacs_Backpack_Kitbag_Medic_White"\
]

// Init stuff
params ["_crate"];

// Populate with predefined items and whatever is already in the crate
[_crate, AVAILABLE_GEAR] call ace_arsenal_fnc_addVirtualItems;
[_crate, (itemCargo _crate) + AVAILABLE_ITEMS] call ace_arsenal_fnc_addVirtualItems;

[_crate] call TAC_Olympus_fnc_VAboxArsenalinit
