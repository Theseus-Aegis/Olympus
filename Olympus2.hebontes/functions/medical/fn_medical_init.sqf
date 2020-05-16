/*
 * Author: JoramD
 * Medical training function.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, medicalSpawnPos] call TAC_Olympus_fnc_medical_init
 */
#include "..\..\script_component.hpp"

params ["_controller", "_spawnPos"];


private _stretchers = [
    // [stretcher, "subjectName"]
    [stretcher1, "one"],
    [stretcher2, "two"]
];

// Subject spawning
private _spawnMainAction = [
    QGVAR(spawnMainAction),
    "Spawn subjects",
    "",
    {},
    {true}
] call ACE_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _spawnMainAction] call ace_interact_menu_fnc_addActionToObject;

{
    _x params ["_stretcher", "_subjectName"];

    [_controller, _spawnPos, _stretcher, _subjectName] call TAC_Olympus_fnc_medical_createSubject;
} forEach _stretchers;

// Subject removal
private _removeMainAction = [
    QGVAR(removeMainAction),
    "Remove subjects",
    "",
    {},
    {true}
] call ACE_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _removeMainAction] call ace_interact_menu_fnc_addActionToObject;

{
    _x params ["_stretcher", "_stretcherName"];

    [_controller, _stretcher, _stretcherName] call TAC_Olympus_fnc_medical_removeSubject;
} forEach _stretchers;

// Specific damage
[_controller, _stretchers] call TAC_Olympus_fnc_medical_applySpecificDamage;

// Random damage
[_controller, _stretchers] call TAC_Olympus_fnc_medical_applyRandomDamage;
