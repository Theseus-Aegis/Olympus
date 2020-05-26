#include "..\script_component.hpp"
/*
 * Author: Rory
 * Sets basic loadout to a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>

 * Return Value:
 * None
 *
 * Example:
 * [unit] call TAC_Olympus_fnc_setBasicLoadout
 */

params ["_unit"];

_unit setUnitLoadout [
     [],
     [],
     [],
     [
          selectRandom ["tacs_Uniform_Polo_TP_LS_TP_TB", "tacs_Uniform_Polo_TP_GS_TP_TB", "tacs_Uniform_Polo_TP_BS_LP_BB"],
          [
                ["ACE_EarPlugs", 1],
                ["ACRE_PRC152", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1],
                ["ACE_fieldDressing", 1]
          ]
     ],
     [
        "V_Rangemaster_belt",
        []
     ],
     [],
     selectRandom ["tacs_Cap_BlackLogo", "tacs_Cap_TanLogo"],
     "",
     [],
     ["ItemMap", "", "", "ItemCompass", "ItemWatch", ""]
];
