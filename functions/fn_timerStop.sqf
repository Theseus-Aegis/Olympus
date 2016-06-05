/*
 * Author: Jonpas
 * Stops the timer and cleanups the variables.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Hint <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * controller call TAC_Olympus_fnc_timerStop
 */
#include "..\script_component.hpp"

params ["_controller", ["_hint", false]];

_controller setVariable [QGVAR(timerStarted), false, true];

GVAR(timerStart) = nil;

if (_hint) then {
    ["Timer Stopped"] call ace_common_fnc_displayTextStructured;
};
