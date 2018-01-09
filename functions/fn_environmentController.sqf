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
 * [controller] call TAC_Olympus_fnc_environmentController
 */
#include "..\script_component.hpp"

params ["_controller"];


// Add time action
private _timeAction = [
    QGVAR(timeAction),
    "Set Time",
    "",
    {},
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _timeAction] call ace_interact_menu_fnc_addActionToObject;

private _timeSettings = [
    // [time, "Display Name"]
    [2, "0200"],
    [4, "0400"],
    [6, "0600"],
    [8, "0800"],
    [10, "1000"],
    [12, "1200"],
    [14, "1400"],
    [16, "1600"],
    [18, "1800"],
    [20, "2000"],
    [22, "2200"],
    [24, "2400"]
];

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
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _timeSettings;


// Add date action
private _dateAction = [
    QGVAR(dateAction),
    "Set Date",
    "",
    {},
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _dateAction] call ace_interact_menu_fnc_addActionToObject;

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

{
    _x params ["_dateFloat", "_dateText"];

    private _action = [
        format [QGVAR(date_%1), _dateText],
        _dateText,
        "",
        {
            (_this select 2) params ["_dateFloat"];
            private _date = numberToDate [2018, _dateFloat];
            [QGVAR(setDate), [_date]] call CBA_fnc_globalEvent;
        },
        {true},
        {},
        [_dateFloat]
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _dateSettings;


// Add fog action
private _fogAction = [
    QGVAR(fogAction),
    "Set Fog",
    "",
    {},
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _fogAction] call ace_interact_menu_fnc_addActionToObject;

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
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _fogSettings;
