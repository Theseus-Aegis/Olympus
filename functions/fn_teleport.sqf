/*
 * Author: Rory
 * Teleports the player from base (this) to teleport locations (objects).
 *
 * Arguments:
 * 0: Main Teleport object. (this)
 * 1: Teleport location object 1 (objectname)
 * 2: Teleport location object 2 (objectname)
 * 3: Teleport location object 3 (objectname)
 * 4: Teleport location object 4 (objectname)
 * 5: Teleport location object 5 (objectname)
 *
 * Return Value:
 * None
 *
 * Example:
 * [baseTeleport,CQB,MG,pole3,pole4,pole5] call TAC_Olympus_fnc_teleport
 */
#include "..\script_component.hpp"

params ["_tpBase","_tpCQB","_tpMG","_tp","_teleport4","_teleport5"];


private _teleportToBase = [
    QGVAR(TeleportToBase),
    "Teleport to base",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _tpBase
] call ACE_Interact_Menu_fnc_createAction;

private _teleportToCQB = [
    QGVAR(TeleportToCQB),
    "Teleport to CQB area",
    "",
    {
        ACE_player setPosASL (getPosASL (_this select 2));
    },
    {true},
    {},
    _tpCQB
] call ACE_Interact_Menu_fnc_createAction;

[_mainTeleport, 0, ["ACE_MainActions"],
    [
    _teleportToBase,
    _teleportToCQB
    ]
] call ACE_Interact_Menu_fnc_addActionToObject;
