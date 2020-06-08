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
        private _actions = [];
        for "_time" from 1 to 23 step 2 do {
            private _timeText = format ["%1:00", str _time];
            if (count _timeText < 5) then {
                _timeText = ["0", _timeText] joinString "";
            };

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
        };

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
        private _actions = [];
        for "_fogLevel" from 0 to 1.1 step 0.1 do {
            private _fogText = str _fogLevel;
            if (count _fogText < 3) then {
                _fogText = [_fogText, ".0"] joinString "";
            };

            private _action = [
                format [QGVAR(fog_%1), [_fogText, ".", ""] call CBA_fnc_replace],
                _fogText,
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
        };

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
        private _actions = [];
        for "_overcastLevel" from 0.0 to 1.1 step 0.1 do {
            private _overcastText = str _overcastLevel;
            if (count _overcastText < 3) then {
                _overcastText = [_overcastText, ".0"] joinString "";
            };

            private _action = [
                format [QGVAR(overcast_%1), [_overcastText, ".", ""] call CBA_fnc_replace],
                _overcastText,
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
        };

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
        private _actions = [];
        for "_rainLevel" from 0.0 to 1.1 step 0.1 do {
            private _rainText = str _rainLevel;
            if (count _rainText < 3) then {
                _rainText = [_rainText, ".0"] joinString "";
            };

            private _action = [
                format [QGVAR(rain_%1), [_rainText, ".", ""] call CBA_fnc_replace],
                _rainText,
                "",
                {
                    (_this select 2) params ["_rainLevel"];

                    if (overcast < 0.5) then {
                        ["Rain is not possible when overcast is set to less than 0.5"] call CBA_fnc_notify;
                    } else {
                        [QGVAR(setRain), [_rainLevel]] call CBA_fnc_globalEvent;
                    };
                },
                {true},
                {},
                [_rainLevel]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_action, [], _target];
        };

        _actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _rainAction] call ACEFUNC(interact_menu,addActionToObject);
