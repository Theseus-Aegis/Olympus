/*
 * Author: Jonpas
 * Resets medical exercise.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller] call TAC_Olympus_fnc_resetMedicalExercise
 */
#include "..\script_component.hpp"

params ["_controller"];

private _info = _controller getVariable QGVAR(MedicalExerciseInfo);
_info params ["_objects", "_victimsClass", "_victimsStartPos", "_mineClass", "_mineStartPos"];
_objects params ["_victims", "_mine"];


// Delete used victims
{
    deleteVehicle _x;
} forEach _victims;

// Create new victims at starting position
_victims = [];
{
    private _victim = (createGroup resistance) createUnit [_x, ASLToAGL (_victimsStartPos select _forEachIndex), [], 0, "NONE"];
    _victims pushBack _victim;
} forEach _victimsClass;


// Create new mine at starting position or use old one if still alive
if (isNull _mine) then {
    _mine = createVehicle [_mineClass, ASLToAGL _mineStartPos, [], 0, "CAN_COLLIDE"];
};

TRACE_2("Reset",_victims,_mine);

// Save information for reset and finally reset
_info = [
    [_victims, _mine],
    _victims apply {typeOf _x},
    _victims apply {getPosASL _x},
    typeOf _mine,
    getPosASL _mine
];

_controller setVariable [QGVAR(MedicalExerciseInfo), _info, true];
_controller setVariable [QGVAR(MedicalExerciseStarted), false, true];
