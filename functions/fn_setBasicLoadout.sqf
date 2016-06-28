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

if (!local _unit) exitWith {};

private _randomUniform = selectRandom ["tacs_Uniform_Polo_TP_LS_TP_TB", "tacs_Uniform_Polo_TP_GS_TP_TB", "tacs_Uniform_Polo_TP_BS_LP_BB"];
private _randomHeadgear = selectRandom ["tacs_Cap_BlackLogo", "tacs_Cap_TanLogo"];

// Remove gear
removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

[{
    params ["_unit", "_randomUniform", "_randomHeadgear"];
    // Add basic gear
    _unit forceAddUniform _randomUniform;
    _unit addHeadgear _randomHeadgear;
    _unit addVest "V_Rangemaster_belt";
    _unit addItem "ACE_EarPlugs";

    _unit addItem "ItemMap";
    _unit assignItem "ItemMap";
    _unit addItem "ItemCompass";
    _unit assignItem "ItemCompass";
    _unit addItem "ItemWatch";
    _unit assignItem "ItemWatch";
    _unit addItem "ACRE_PRC343";
    _unit addItem "ACE_fieldDressing";
    _unit addItem "ACE_elasticBandage";
    _unit addItem "ACE_quikclot";
    _unit addItem "ACE_packingBandage";
    _unit addItem "ACE_fieldDressing";
    _unit addItem "ACE_elasticBandage";
    _unit addItem "ACE_quikclot";
    _unit addItem "ACE_packingBandage";
}, [_unit, _randomUniform, _randomHeadgear] call CBA_fnc_execNextFrame;
