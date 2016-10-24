/*
 * Author: Rory, jonpas
 * Sets all pop-up targets in the course up or down
 *
 * Arguments:
 * 0: Interaction object.
 * 1: Targets (array)
 *
 * Return Value:
 * None
 *
 * Example:
 * [this,[target1,target2,target3]] call TAC_Olympus_fnc_grenadeCourseTargets;
 */
#include "..\script_component.hpp"

params ["_controller","_targets"];

// Default targets down
{
    [_x, 1] call TACFUNC(shootingrange,animateTarget);
} forEach _targets;
//////////////

{
    _x params ["_interactionVariable", "_interactionName", "_state"];

    private _action = [
        _interactionVariable,
        _interactionName,
        "",
        {
            (_this select 2) params ["_targets", "_state"];
            {
                [_x, _state] call TACFUNC(shootingrange,animateTarget);
                _x setVariable [QTACGVAR(shootingrange,stayDown), true, true];
            } forEach _targets;
        },
        {true},
        {},
        [_targets, _state]
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    [QGVAR(targetsUp), "Pop targets UP", 0],
    [QGVAR(targetsDown), "Pop targets DOWN", 1]
];
