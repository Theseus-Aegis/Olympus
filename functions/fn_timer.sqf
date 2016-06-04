/*
 * Author: Jonpas
 * Handles timer.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Finish <OBJECT>
 * 2: Timeout <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, finish, 100] call TAC_Olympus_fnc_timer
 */
#include "..\script_component.hpp"

#define TIME_ROUND_CHARS 4

params ["_controller", "_finishObject", "_timeout"];

_controller setVariable [QGVAR(timerStarted), true, true];

// Countdown
{
    [{
        params ["_controller", "_text"];

        if !(_controller getVariable [QGVAR(timerStarted), false]) exitWith {};

        [_text] call ace_common_fnc_displayTextStructured;
    }, [_controller, (_x select 0)], (_x select 1)] call CBA_fnc_waitAndExecute;
} forEach [ ["Get Ready!", 0], ["3", 1], ["2", 2], ["1", 3]];

[{
    params ["_controller", "_finishObject", "_timeout"];

    if !(_controller getVariable [QGVAR(timerStarted), false]) exitWith {
        ["Timer Stopped"] call ace_common_fnc_displayTextStructured;
    };

    ["Go!"] call ace_common_fnc_displayTextStructured;
    GVAR(timerStart) = diag_tickTime;

    [{
        params ["_args", "_idPFH"];
        _args params ["_controller", "_finishObject", "_timeout"];

        GVAR(timer) = diag_tickTime;

        // Stopped
        if !(_controller getVariable [QGVAR(timerStarted), false]) exitWith {
            ["Timer Stopped"] call ace_common_fnc_displayTextStructured;
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        private _timeElapsed = GVAR(timer) - GVAR(timerStart);

        // Timeout
        if (_timeElapsed >= _timeout) exitWith {
            ["Timer Timed Out"] call ace_common_fnc_displayTextStructured;
            _controller call FUNC(timerStop);
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        // Finish
        if (ACE_player distance _finishObject < 0.5) exitWith {
            private _text = format ["Timer Finished<br/><br/>Time: %1s", _timeElapsed select [0, TIME_ROUND_CHARS]];
            [_text, 2.5] call ace_common_fnc_displayTextStructured;
            _controller call FUNC(timerStop);
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, [_controller, _finishObject, _timeout]] call CBA_fnc_addPerFrameHandler;
}, _this, 4] call CBA_fnc_waitAndExecute;
