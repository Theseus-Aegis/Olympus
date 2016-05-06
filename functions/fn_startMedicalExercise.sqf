/*
 * Author: Rory, Jonpas
 * Moves AI units to position and sets specific damage on them.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Waypoint <WAYPOINT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, waypoint] call TAC_Olympus_fnc_startMedicalExercise
 */
#include "..\script_component.hpp"

params ["_controller", "_runWaypoint"];

_controller setVariable [QGVAR(MedicalExerciseStarted), true, true];

private _info = _controller getVariable QGVAR(MedicalExerciseInfo);
_info params ["_objects", "", "", "_mineClass", "_mineStartPos"];
_objects params ["_victims", "_mine"];

TRACE_1("Start",_info);

// Move victims to position
{
    // 'move' has local arguments
    [QGVAR(move), _x, [_x, _runWaypoint]] call ace_common_fnc_objectEvent;
} forEach _victims;

// Recreate mine if it got exploded accidentally
if (isNull _mine) then {
    _mine = createVehicle [_mineClass, ASLToAGL _mineStartPos, [], 0, "CAN_COLLIDE"];
    _info set [0, [_victims, _mine]];
    _controller setVariable [QGVAR(MedicalExerciseInfo), _info, true];
};

// Wait for units to get to waypoint and set damage on them
[{
    params ["_victims", "_runWaypoint", "_controller"];

    private _nearWaypointObjects = nearestObjects [ASLToAGL (getPosASL _runWaypoint), ["CAManBase"], 2];
    _nearWaypointObjects = _nearWaypointObjects select [0, 2];

    _controller getVariable [QGVAR(MedicalExerciseStarted), false] &&
    {([_victims select 0, _victims select 1] isEqualTo _nearWaypointObjects) || ([_victims select 1, _victims select 0] isEqualTo _nearWaypointObjects)}
}, {
    params ["_victims", "", "_controller"];

    // Exit if reset
    if !(_controller getVariable [QGVAR(MedicalExerciseStarted), false]) exitWith {};

    // Apply damage to all victims
    {
        [_x, 0.1, "hand_r", "stab"] call ace_medical_fnc_addDamageToUnit;
        [_x, 0.1, "leg_r", "grenade"] call ace_medical_fnc_addDamageToUnit;
        [_x, 0.1, "head", "explosive"] call ace_medical_fnc_addDamageToUnit;
        [_x, 0.1, "head", "shell"] call ace_medical_fnc_addDamageToUnit;
        [_x, 0.1, "head", "vehiclecrash"] call ace_medical_fnc_addDamageToUnit;
        [_x, 0.1, "head", "backblast"] call ace_medical_fnc_addDamageToUnit;
        [_x, 0.4] call ace_medical_fnc_adjustPainLevel;
    } forEach _victims;

    // Apply damage to specific victims
      //victim 1 (select 0)
        [_victims select 0] call ace_medical_fnc_setCardiacArrest;
      //victim 2 (select 1)
        [_victims select 1, true, 160, true] call ace_medical_fnc_setUnconscious;

}, [_victims, _runWaypoint, _controller]] call ace_common_fnc_waitUntilAndExecute;
