/*
 * Author: Jonpas
 * Initializes the timer.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Finish <OBJECT>
 * 2: Timeout <NUMBER> (default: 100)
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, finish, 100] call TAC_Olympus_fnc_timerInit
 */
#include "..\script_component.hpp"

params ["_controller", "_finishObject", ["_timeout", 100, [0]] ];

// Start action
private _actionStart = [
    QGVAR(TimerStart),
    "Start Timer",
    "",
    {(_this select 2) call FUNC(timer)},
    {!(((_this select 2) select 0) getVariable [QGVAR(timerStarted), false])},
    {},
    [_controller, _finishObject, _timeout]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _actionStart] call ace_interact_menu_fnc_addActionToObject;

// Reset action
private _actionStop = [
    QGVAR(TimerStop),
    "Stop Timer",
    "",
    {(_this select 2) call FUNC(timerStop)},
    {(_this select 2) getVariable [QGVAR(timerStarted), false]},
    {},
    _controller
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _actionStop] call ace_interact_menu_fnc_addActionToObject;
