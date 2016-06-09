/*
 * Author: Rory
 * Teleports the player from base (this) to teleport locations (objects).
 *
 * Arguments:
 * 0: Interaction object.
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_teleport
 */
#include "..\script_component.hpp"

//define teleport locations here
private _teleportPosBase = teleportPosBase;
private _teleportPosAdvRifle = teleportPosAdvRifle;
private _teleportPosMG = teleportPosMG;
private _teleportPosCQB = teleportPosCQB;
private _teleportPosUrban = teleportPosUrban;


params ["_controller"];

//TP to base
private _teleportToBaseAction = [
    QGVAR(teleportToBase),
    "Fast travel to Base",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _teleportPosBase
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _teleportToBaseAction] call ACE_Interact_Menu_fnc_addActionToObject;

//TP to advanced rifle course
private _teleportToAdvRifleAction = [
    QGVAR(teleportToAdvRifle),
    "Fast travel to Adv. Rifle course",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _teleportPosAdvRifle
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _teleportToAdvRifleAction] call ACE_Interact_Menu_fnc_addActionToObject;

//TP to MG course
private _teleportToMGAction = [
    QGVAR(teleportToMG),
    "Fast travel to MG course",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _teleportPosMG
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _teleportToMGAction] call ACE_Interact_Menu_fnc_addActionToObject;

//TP to CQB course
private _teleportToCQBAction = [
    QGVAR(teleportToCQB),
    "Fast travel to CQB course",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _teleportPosCQB
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _teleportToCQBAction] call ACE_Interact_Menu_fnc_addActionToObject;

//TP to CQB course
private _teleportToUrbanAction = [
    QGVAR(teleportToCQB),
    "Fast travel to Urban City course",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _teleportPosUrban
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _teleportToUrbanAction] call ACE_Interact_Menu_fnc_addActionToObject;
