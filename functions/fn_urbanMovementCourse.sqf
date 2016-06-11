/*
 * Author: Rory, jonpas
 * Sets all pop-up targets in the street up or down
 *
 * Arguments:
 * 0: Interaction object.
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_urbanMovementCourse;
 */
#include "..\script_component.hpp"


_targets = [
urbantarget1,
urbantarget2,
urbantarget3,
urbantarget4,
urbantarget5,
urbantarget6,
urbantarget7,
urbantarget8,
urbantarget9,
urbantarget10,
urbantarget11,
urbantarget12,
urbantarget13,
urbantarget14,
urbantarget15,
urbantarget16,
urbantarget17,
urbantarget18,
urbantarget19,
urbantarget20,
urbantarget21,
urbantarget22,
urbantarget23,
urbantarget24,
urbantarget25,
urbantarget26,
urbantarget27,
urbantarget28
];

params ["_controller"];

{
    _x params ["_interactionVariable", "_interactionName", "_state"];

    private _action = [
        format [QGVAR(%1), _interactionVariable],
        "_interactionName",
        "",
        {
            (_this select 2) params ["_targets", "_state"];
            {
                [_x, _state] call TACFUNC(shootingrange,animateTarget);
            } forEach _targets;
        },
        {true},
        {},
        [_targets, _state]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ACE_Interact_Menu_fnc_addActionToObject;
} forEach [
    [targetsUP, "Pop targets UP", 1],
    [targetsDOWN, "Pop targets DOWN", 0]
];
