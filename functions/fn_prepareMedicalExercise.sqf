/*
 * Author: Rory, Jonpas
 * Adds actiosn to start and reset medical exercise.
 *
 * Arguments:
 * 0: Victims <ARRAY<OBJECT>>
 * 1: Controller <OBJECT>
 * 2: Mine <OBJECT>
 * 3: Waypoint <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[victim1, victim2], controller, mine, waypoint] call TAC_Olympus_fnc_prepareMedicalExercise
 */
#include "..\script_component.hpp"

params ["_victims", "_controller", "_mine", "_runWaypoint"];

// Save information for reset
private _info = [
    [_victims, _mine],
    _victims apply {typeOf _x},
    _victims apply {getPosASL _x},
    typeOf _mine,
    getPosASL _mine
];

_controller setVariable [QGVAR(MedicalExerciseInfo), _info, true];

// Add EH for AI movement
[QGVAR(move), {
    params ["_victim", "_runWaypoint"];
    (group _victim) move (getPos _runWaypoint);
}] call ace_common_fnc_addEventHandler;

// Start action
private _actionStart = [
    QGVAR(MedicalExerciseStart),
    "Start Medical Exercise",
    "",
    {(_this select 2) call FUNC(startMedicalExercise)},
    {!(((_this select 2) select 0) getVariable [QGVAR(MedicalExerciseStarted), false])},
    {},
    [_controller, _runWaypoint]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _actionStart] call ace_interact_menu_fnc_addActionToObject;

// Reset action
private _actionReset = [
    QGVAR(MedicalExerciseReset),
    "Reset Medical Exercise",
    "",
    {(_this select 2) call FUNC(resetMedicalExercise)},
    {((_this select 2) select 0) getVariable [QGVAR(MedicalExerciseStarted), false]},
    {},
    [_controller]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _actionReset] call ace_interact_menu_fnc_addActionToObject;
