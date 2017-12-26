/*
 * Author: JoramD
 * Initializes 2 ace arsenals on an object (1 full, 1 partial)
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_VAboxArsenalinit
 */
#include "..\script_component.hpp"

//Init stuff
params["_crate"];

//Adds arsenal option
private _action = [
  QGVAR(arsenal),
  "Arsenal",
  "",
  {[_this select 0, _this select 1, false] call ace_arsenal_fnc_openBox;},
  {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _Action] call ace_interact_menu_fnc_addActionToObject;

//Adds full arsenal option
private _fullAction = [
  QGVAR(fullArsenal),
  "Full Arsenal",
  "",
  {[_this select 0, _this select 1, true] call ace_arsenal_fnc_openBox;},
  {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _fullAction] call ace_interact_menu_fnc_addActionToObject;
