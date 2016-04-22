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
#include "..\script_component.hpp"

params ["_unit"];

private _randomUniform = selectRandom ["tacs_Uniform_Polo_TP_LS_TP_TB", "tacs_Uniform_Polo_TP_GS_TP_TB", "tacs_Uniform_Polo_TP_BS_LP_BB"];
private _randomHeadgear = selectRandom ["tacs_Cap_BlackLogo", "tacs_Cap_TanLogo"];

if (isServer) then {
    //removal of items
    removeAllWeapons _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    //adding basic gear
    _unit forceAddUniform _randomUniform;
    _unit addHeadgear _randomHeadgear;
    _unit addItem "ItemMap";
    _unit addItem "ItemCompass";
    _unit addItem "ItemWatch";
    _unit addItem "ACRE_PRC343";

    //assigns items to player
    _unit assignItem "ItemMap";
    _unit assignItem "ItemCompass";
    _unit assignItem "ItemWatch";
};
