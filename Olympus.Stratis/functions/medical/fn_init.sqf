#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Initializes medical training interactions.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Spawn Position <ARRAY/OBJECT/GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, medicalSpawnPos] call TAC_Olympus_Medical_fnc_init
 */

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
    [_controller, _spawnPos, _stretcher, _subjectName] call TAC_Olympus_Medical_fnc_createSubject;
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
    [_controller, _stretcher, _subjectName] call TAC_Olympus_Medical_fnc_removeSubject;
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

    private _specificDamageAction = [
        format[QGVAR(specificDamageAction_%1), _stretcher],
        format ["Damage subject %1", _subjectName],
        "",
        {},
        {
            (_this select 2) params ["_controller", "_stretcher"];
            [_stretcher] call TAC_Olympus_Medical_fnc_checkSubject
        },
        {(_this select 2) call TAC_Olympus_Medical_fnc_specific_bodyPartActions},
        [_controller, _stretcher]
    ] call ACEFUNC(interact_menu,createAction);

    [_controller, 0, ["ACE_MainActions", QGVAR(specificDamageMainAction)], _specificDamageAction] call ACEFUNC(interact_menu,addActionToObject);
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

    private _randomDamageAction = [
        format [QGVAR(randomDamageAction_%1), _stretcher],
        format ["Damage subject %1", _subjectName],
        "",
        {},
        {
            (_this select 2) params ["_controller", "_stretcher"];

            [_stretcher] call TAC_Olympus_Medical_fnc_checkSubject
        },
        {(_this select 2) call TAC_Olympus_Medical_fnc_applyRandomDamage},
        [_controller, _stretcher]
    ] call ACEFUNC(interact_menu,createAction);

    [_controller, 0, ["ACE_MainActions", QGVAR(randomDamageMainAction)], _randomDamageAction] call ACEFUNC(interact_menu,addActionToObject);
} forEach _stretchers;
