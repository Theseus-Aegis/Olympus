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
    _x enableSimulationGlobal true;

    // 'move' has local arguments
    [QGVAR(move), [_x, _runWaypoint], _x] call CBA_fnc_targetEvent;
} forEach _victims;

// Recreate mine if it got exploded accidentally
if (isNull _mine) then {
    _mine = createVehicle [_mineClass, ASLToAGL _mineStartPos, [], 0, "CAN_COLLIDE"];
    _info set [0, [_victims, _mine]];
    _controller setVariable [QGVAR(MedicalExerciseInfo), _info, true];
};

// Wait for units to get to waypoint and set damage on them
[{
    params ["_victims", "_controller", "_runWaypoint"];

    private _nearWaypointObjects = nearestObjects [ASLToAGL (getPosASL _runWaypoint), ["CAManBase"], 2];
    _nearWaypointObjects = _nearWaypointObjects select [0, 2];

    _controller getVariable [QGVAR(MedicalExerciseStarted), false] &&
    {([_victims select 0, _victims select 1] isEqualTo _nearWaypointObjects) || ([_victims select 1, _victims select 0] isEqualTo _nearWaypointObjects)}
}, {
    params ["_victims", "_controller"];

    // Exit if reset
    if !(_controller getVariable [QGVAR(MedicalExerciseStarted), false]) exitWith {};

    // Apply damage to all victims
    // 'addDamageToUnit', 'setCardiacArrest' and 'adjustPainLevel' have to be called local to the unit
    {
        [QGVAR(addDamageToUnit), [_x, 0.1, "body", "explosive"], _x] call CBA_fnc_targetEvent;
        [QGVAR(adjustPainLevel), [_x, 0.2], _x] call CBA_fnc_targetEvent;
    } forEach _victims;

    // Apply damage to specific victims
    // We need to wait a bit for damage to propagate and to make sure it is not registered from same source and ignored (HandleDamage oddities)
    // That's why we wait 1 second between each 'addDamageToUnit' call
    _victims params ["_victim1", "_victim2"];

    // Victim 1
    [QGVAR(setCardiacArrest), [_victim1], _victim1] call CBA_fnc_targetEvent;
    [{
        [QGVAR(addDamageToUnit), [_this, 0.1, "leg_l", "grenade"], _this] call CBA_fnc_targetEvent;
    }, _victim1, 1] call CBA_fnc_waitAndExecute;
    [{
        [QGVAR(addDamageToUnit), [_this, 0.2, "leg_r", "stab"], _this] call CBA_fnc_targetEvent;
    }, _victim1, 2] call CBA_fnc_waitAndExecute;
    [{
        [QGVAR(addDamageToUnit), [_this, 0.1, "hand_l", "bullet"], _this] call CBA_fnc_targetEvent;
    }, _victim1, 3] call CBA_fnc_waitAndExecute;

    // Victim 2
    [_victim2, true, 10, true] call ace_medical_fnc_setUnconscious; // Handles locality
    [{
        [QGVAR(addDamageToUnit), [_this, 0.2, "hand_r", "stab"], _this] call CBA_fnc_targetEvent;
    }, _victim2, 1] call CBA_fnc_waitAndExecute;
    [{
        [QGVAR(addDamageToUnit), [_this, 0.3, "leg_r", "explosive"], _this] call CBA_fnc_targetEvent;
    }, _victim2, 2] call CBA_fnc_waitAndExecute;
}, [_victims, _controller, _runWaypoint], 30, {
    params ["", "_controller"];
    _controller call FUNC(resetMedicalExercise);
}] call CBA_fnc_waitUntilAndExecute;
