#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Allows changing environment settings (date, time and fog).
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller] call TAC_Olympus_fnc_environmentControl
 */

params ["_controller"];

// Add time action
private _timeAction = [
    QGVAR(timeAction),
    "Set Time",
    "",
    {},
    {true},
    {
        private _timeSettings = [
            // [time, "Display Name"]
            [1, "0100"],
            [3, "0300"],
            [5, "0500"],
            [7, "0700"],
            [9, "0900"],
            [11, "1100"],
            [13, "1300"],
            [15, "1500"],
            [17, "1700"],
            [19, "1900"],
            [21, "2100"],
            [23, "2300"]
        ];

        private _actions = [];
        {
            _x params ["_time", "_timeText"];

            private _action = [
                format [QGVAR(time_%1), _timeText],
                _timeText,
                "",
                {
                    (_this select 2) params ["_time"];
                    [QGVAR(setTime), [_time]] call CBA_fnc_globalEvent;
                },
                {true},
                {},
                [_time]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_action, [], _target];
        } forEach _timeSettings;

        _actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _timeAction] call ACEFUNC(interact_menu,addActionToObject);

// Add date action
private _dateAction = [
    QGVAR(dateAction),
    "Set Date",
    "",
    {},
    {true},
    {
        private _dateSettings = [
            // [dateFloat, "Display Name"]
            [0.00136988, "January"],
            [0.0863014, "February"],
            [0.163014, "March"],
            [0.247945, "April"],
            [0.247945, "May"],
            [0.415069, "June"],
            [0.49726, "July"],
            [0.582192, "August"],
            [0.667123, "September"],
            [0.749315, "October"],
            [0.834247, "November"],
            [0.916438, "December"]
        ];

        private _actions = [];
        {
            _x params ["_dateFloat", "_dateText"];

            private _action = [
                format [QGVAR(date_%1), _dateText],
                _dateText,
                "",
                {
                    (_this select 2) params ["_dateFloat"];
                    private _date = numberToDate [2020, _dateFloat];
                    [QGVAR(setDate), [_date]] call CBA_fnc_globalEvent;
                },
                {true},
                {},
                [_dateFloat]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_action, [], _target];
        } forEach _dateSettings;

        _actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _dateAction] call ACEFUNC(interact_menu,addActionToObject);

// Add fog action
private _fogAction = [
    QGVAR(fogAction),
    "Set Fog",
    "",
    {},
    {true},
    {
        private _fogSettings = [
            // [fogValue]
            [0.0],
            [0.1],
            [0.2],
            [0.3],
            [0.4],
            [0.5],
            [0.6],
            [0.7],
            [0.8],
            [0.9],
            [1.0]
        ];

        private _actions = [];
        {
            _x params ["_fogLevel"];

            private _action = [
                format [QGVAR(fog_%1), [str _fogLevel, ".", ""] call CBA_fnc_replace],
                str _fogLevel,
                "",
                {
                    (_this select 2) params ["_fogLevel"];
                    [QGVAR(setFog), [_fogLevel]] call CBA_fnc_globalEvent;
                },
                {true},
                {},
                [_fogLevel]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_action, [], _target];
        } forEach _fogSettings;

        _actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _fogAction] call ACEFUNC(interact_menu,addActionToObject);

// Add overcast option
private _overcastAction = [
    QGVAR(overcastAction),
    "Set Overcast",
    "",
    {},
    {true},
    {
        private _overcastSettings = [
            // [overcastValue]
            [0.0],
            [0.1],
            [0.2],
            [0.3],
            [0.4],
            [0.5],
            [0.6],
            [0.7],
            [0.8],
            [0.9],
            [1.0]
        ];

        private _actions = [];
        {
            _x params ["_overcastLevel"];

            private _action = [
                format [QGVAR(overcast_%1), [str _overcastLevel, ".", ""] call CBA_fnc_replace],
                str _overcastLevel,
                "",
                {
                    (_this select 2) params ["_overcastLevel"];
                    [QGVAR(setOvercast), [_overcastLevel]] call CBA_fnc_globalEvent;
                },
                {true},
                {},
                [_overcastLevel]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_action, [], _target];
        } forEach _overcastSettings;

        _actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _overcastAction] call ACEFUNC(interact_menu,addActionToObject);

// Add rain option
private _rainAction = [
    QGVAR(rainAction),
    "Set Rain",
    "",
    {},
    {true},
    {
        private _rainSettings = [
            // [rainValue]
            [0.0],
            [0.1],
            [0.2],
            [0.3],
            [0.4],
            [0.5],
            [0.6],
            [0.7],
            [0.8],
            [0.9],
            [1.0]
        ];

        private _actions = [];
        {
            _x params ["_rainLevel"];

            private _action = [
                format [QGVAR(rain_%1), [str _rainLevel, ".", ""] call CBA_fnc_replace],
                str _rainLevel,
                "",
                {
                    (_this select 2) params ["_rainLevel"];

                    if (overcast < 0.5) then {
                        ["Rain is not possible when overcast is set to less than 0.5"] call ace_common_fnc_displayTextStructured;
                    } else {
                        [QGVAR(setRain), [_rainLevel]] call CBA_fnc_globalEvent;
                    };
                },
                {true},
                {},
                [_rainLevel]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_action, [], _target];
        } forEach _rainSettings;

        _actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _rainAction] call ACEFUNC(interact_menu,addActionToObject);
