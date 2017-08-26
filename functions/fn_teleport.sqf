/*
 * Author: Rory, jonpas
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
private _teleportPosGL = teleportPosGL;
private _teleportPos40MM = teleportPosMike;


params ["_controller"];

{
    _x params ["_teleportObject", "_text"];

    private _action = [
        format [QGVAR(%1), _teleportObject],
        ["Fast travel to", _text] joinString " ",
        "",
        {
            ACE_player setPosASL (getPosASL (_this select 2));
        },
        {
            ACE_player distance (_this select 2) < 10
        },
        {},
        _teleportObject
    ] call ACE_Interact_Menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ACE_Interact_Menu_fnc_addActionToObject;
} forEach [
    [teleportPosBase, "Base"],
    [teleportPosAdvRifle, "Adv. Rifle course"],
    [teleportPosMG, "MG course"],
    [teleportPosCQB, "CQB course"],
    [teleportPosUrban, "Urban City course"],
    [teleportPosGL, "RPG course"],
    [teleportPosMike, "40MM course"]
];
