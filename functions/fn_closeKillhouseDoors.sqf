/*
 * Author: Rory
 * Closes all open doors in the killhouse.
 *
 * Arguments:
 * 0: Name of the controller
 * 1: Name of the killhouse
 *
 * Return Value:
 * None
 *
 * Example:
 * [killHouseController1,smallKillhouse1] call TAC_Olympus_fnc_closeKillhouseDoors
 */

#include "..\script_component.hpp"

params ["_controller", "_killhouse"];

private _action = [
    QGVAR(CloseDoors),
    "Close Doors",
    "",
    {
        (_this select 2) animate ["Door1", 0];
        (_this select 2) animate ["Door2", 0];
        (_this select 2) animate ["Door4", 0];
        (_this select 2) animate ["Door3", 0];
        (_this select 2) animate ["Door5", 0];
        (_this select 2) animate ["Door6", 0];
        (_this select 2) animate ["Door7", 0];
        (_this select 2) animate ["Gate_L", 0];
        (_this select 2) animate ["Gate_R", 0];
    },
    {true},
    {},
    _killhouse
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _action] call ACE_Interact_Menu_fnc_addActionToObject;
