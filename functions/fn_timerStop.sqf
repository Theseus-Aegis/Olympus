/*
 * Author: Jonpas
 * Stops the timer and cleanups the variables.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * controller call TAC_Olympus_fnc_timerStop
 */
#include "..\script_component.hpp"

params ["_controller"];

_controller setVariable [QGVAR(timerStarted), false, true];

GVAR(timer) = nil;
GVAR(timerStart) = nil;
