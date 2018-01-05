/*
 * Author: JoramD
 * Initializes 2 ACE Arsenals on an object (1 full, 1 partial).
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxArsenalInit
 */
#include "..\script_component.hpp"

params ["_crate"];

// Add arsenal option
private _action = [
    QGVAR(arsenal),
    "Arsenal",
    "",
    {
    params ["_target", "_player"];

    [{[_this select 0, _this select 1, false] call ace_arsenal_fnc_openBox}, [_target, _player]] call CBA_fnc_execNextFrame;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _Action] call ace_interact_menu_fnc_addActionToObject;

// Add full arsenal option
private _fullAction = [
    QGVAR(fullArsenal),
    "Full Arsenal",
    "",
    {
    params ["_target", "_player"];

    [{[_this select 0, _this select 1, true] call ace_arsenal_fnc_openBox}, [_target, _player]] call CBA_fnc_execNextFrame;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _fullAction] call ace_interact_menu_fnc_addActionToObject;
