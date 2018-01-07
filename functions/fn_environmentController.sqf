/*
 * Author: JoramD
 * Allows switching between different time of day and month.
 *
 * Arguments:
 * 0: Crate <OBJECT>
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
    {

    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _timeAction] call ace_interact_menu_fnc_addActionToObject;


// 0200
private _0200Action = [
    QGVAR(0200Action),
    "0200",
    "",
    {
        skipTime (2 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0400
private _0400Action = [
    QGVAR(0400Action),
    "0400",
    "",
    {
        skipTime (4 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0600
private _0600Action = [
    QGVAR(0600Action),
    "0600",
    "",
    {
        skipTime (6 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0800
private _0800Action = [
    QGVAR(0800Action),
    "0800",
    "",
    {
        skipTime (8 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 1000
private _1000Action = [
    QGVAR(1000Action),
    "1000",
    "",
    {
        skipTime (10 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 1200
private _1200Action = [
    QGVAR(1200Action),
    "1200",
    "",
    {
        skipTime (12 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 1400
private _1400Action = [
    QGVAR(1400Action),
    "1400",
    "",
    {
        skipTime (14 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 1600
private _1600Action = [
    QGVAR(1600Action),
    "1600",
    "",
    {
        skipTime (16 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 1800
private _1800Action = [
    QGVAR(1800Action),
    "1800",
    "",
    {
        skipTime (18 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 2000
private _2000Action = [
    QGVAR(2000Action),
    "2000",
    "",
    {
        skipTime (20 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 2200
private _2200Action = [
    QGVAR(2200Action),
    "2200",
    "",
    {
        skipTime (22 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 2400
private _2400Action = [
    QGVAR(2400Action),
    "2400",
    "",
    {
        skipTime (24 - daytime + 24 ) % 24;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _0200Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _0400Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _0600Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _0800Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _1000Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _1200Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _1400Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _1600Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _1800Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _2000Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _2200Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(timeAction)], _2400Action] call ace_interact_menu_fnc_addActionToObject;


// Add date action
private _dateAction = [
    QGVAR(dateAction),
    "Set Date",
    "",
    {

    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _dateAction] call ace_interact_menu_fnc_addActionToObject;


// jan
private _janAction = [
    QGVAR(janAction),
    "January",
    "",
    {
        setDate [2018, 1, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// feb
private _febAction = [
    QGVAR(febAction),
    "February",
    "",
    {
        setDate [2018, 2, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// mar
private _marAction = [
    QGVAR(marAction),
    "March",
    "",
    {
        setDate [2018, 3, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// apr
private _aprAction = [
    QGVAR(aprAction),
    "April",
    "",
    {
        setDate [2018, 4, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// may
private _mayAction = [
    QGVAR(mayAction),
    "May",
    "",
    {
        setDate [2018, 5, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// jun
private _junAction = [
    QGVAR(junAction),
    "June",
    "",
    {
        setDate [2018, 6, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// jul
private _julAction = [
    QGVAR(julAction),
    "July",
    "",
    {
        setDate [2018, 7, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// aug
private _augAction = [
    QGVAR(augAction),
    "August",
    "",
    {
        setDate [2018, 8, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// sep
private _sepAction = [
    QGVAR(sepAction),
    "September",
    "",
    {
        setDate [2018, 9, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// oct
private _octAction = [
    QGVAR(octAction),
    "October",
    "",
    {
        setDate [2018, 10, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// nov
private _novAction = [
    QGVAR(novAction),
    "November",
    "",
    {
        setDate [2018, 11, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// dec
private _decAction = [
    QGVAR(decAction),
    "December",
    "",
    {
        setDate [2018, 12, 01, 12, 0];
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _janAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _febAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _marAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _aprAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _mayAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _junAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _julAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _augAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _sepAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _octAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _novAction] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(dateAction)], _decAction] call ace_interact_menu_fnc_addActionToObject;




// Add date action
private _fogAction = [
    QGVAR(fogAction),
    "Set Fog",
    "",
    {

    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _fogAction] call ace_interact_menu_fnc_addActionToObject;


// 0.0
private _fog0Action = [
    QGVAR(fog0Action),
    "0.0",
    "",
    {
        1 setFog 0;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.1
private _fog1Action = [
    QGVAR(fog1Action),
    "0.1",
    "",
    {
        1 setFog 0.1;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.2
private _fog2Action = [
    QGVAR(fog2Action),
    "0.2",
    "",
    {
        1 setFog 0.2;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.3
private _fog3Action = [
    QGVAR(fog3Action),
    "0.3",
    "",
    {
        1 setFog 0.3;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.4
private _fog4Action = [
    QGVAR(fog4Action),
    "0.4",
    "",
    {
        1 setFog 0.4;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.5
private _fog5Action = [
    QGVAR(fog5Action),
    "0.5",
    "",
    {
        1 setFog 0.5;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.6
private _fog6Action = [
    QGVAR(fog6Action),
    "0.6",
    "",
    {
        1 setFog 0.6;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.7
private _fog7Action = [
    QGVAR(fog7Action),
    "0.7",
    "",
    {
        1 setFog 0.7;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.8
private _fog8Action = [
    QGVAR(fog8Action),
    "0.8",
    "",
    {
        1 setFog 0.8;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 0.9
private _fog9Action = [
    QGVAR(fog9Action),
    "0.9",
    "",
    {
        1 setFog 0.9;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

// 1.0
private _fog10Action = [
    QGVAR(fog10Action),
    "1.0",
    "",
    {
        1 setFog 1;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog0Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog1Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog2Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog3Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog4Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog5Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog6Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog7Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog8Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog9Action] call ace_interact_menu_fnc_addActionToObject;
[_controller, 0, ["ACE_MainActions", QGVAR(fogAction)], _fog10Action] call ace_interact_menu_fnc_addActionToObject;
