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
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _spawnMainAction] call ACEFUNC(interact_menu,addActionToObject);

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
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _removeMainAction] call ACEFUNC(interact_menu,addActionToObject);

{
    _x params ["_stretcher", "_subjectName"];

    [_controller, _stretcher, _subjectName] call TAC_Olympus_fnc_medical_removeSubject;
} forEach _stretchers;

// Specific damage
private _specificDamageMainAction = [
    QGVAR(specificDamageMainAction),
    "Apply specific damage",
    "",
    {},
    {true}
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _specificDamageMainAction] call ACEFUNC(interact_menu,addActionToObject);

{
    _x params ["_stretcher", "_subjectName"];

    [_controller, _stretcher, _subjectName] call TAC_Olympus_fnc_medical_applySpecificDamage;
} forEach _stretchers;

// Random damage
private _randomDamageMainAction = [
    QGVAR(randomDamageMainAction),
    "Apply random damage",
    "",
    {},
    {true}
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _randomDamageMainAction] call ACEFUNC(interact_menu,addActionToObject);

{
    _x params ["_stretcher", "_subjectName"];

    [_controller, _stretcher, _subjectName] call TAC_Olympus_fnc_medical_applyRandomDamage;
} forEach _stretchers;
