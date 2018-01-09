/*
 * Author: Rory, jonpas
 * Teleports the player from base (this) to teleport locations (objects).
 *
 * Arguments:
 * 0: Interaction object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_teleport
 */
#include "..\script_component.hpp"

// Define teleport locations here
private _teleportLocations = [
    // [objectVarName, "Display Name"]
    [teleportPosBase, "Base"],
    [teleportPosAdvRifle, "Adv. Rifle course"],
    [teleportPosMG, "MG course"],
    [teleportPosCQB, "CQB course"],
    [teleportPosUrban, "Urban City course"],
    [teleportPosGL, "RPG course"],
    [teleportPosMike, "40MM course"]
];

params ["_controller"];

{
    _x params ["_teleportObject", "_text"];

    private _action = [
        format [QGVAR(%1), _teleportObject],
        ["Fast travel to", _text] joinString " ",
        "",
        {
            (_this select 2) params ["_teleportObject", "_text"];
            titleText [["Fast travelling to", _text, "..."] joinString " ", "BLACK IN", 2];
            ACE_player setPosASL (getPosASL _teleportObject);
            titleFadeOut 1;
        },
        {
            (_this select 2) params ["_teleportObject"];
            ACE_player distance _teleportObject > 10
        },
        {},
        [_teleportObject, _text]
    ] call ACE_Interact_Menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ACE_Interact_Menu_fnc_addActionToObject;
} forEach _teleportLocations;
