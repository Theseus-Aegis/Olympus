#include "..\script_component.hpp"
/*
 * Author: Rory, Jonpas
 * Teleports the player from base (this) to teleport locations (objects).
 *
 * Arguments:
 * 0: Interaction object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_fastTravel
 */

// Define teleport locations here
private _teleportLocations = [
    // ["Category", objectVarName, "Display Name"]
    ["Hubs", tpPosAirport, "Airport"],
    ["Hubs", tpPosBase, "Base"],
    ["Hubs", tpPosMOUT, "MOUT"],
    ["Core", tpPosWeaponsHandling, "Weapons Handling"],
    ["Core", tpPosDriving, "Driving Course"],
    ["Specialist", tpPosDemolitions, "Demolitions"],
    ["Specialist", tpPos40mm, "Grenadier"],
    ["Specialist", tpPosMachineGun, "Machine Gun"],
    ["Specialist", tpPosMarksman, "Marksman"],
    ["Specialist", tpPosMedical, "Medic"]
];

params ["_controller"];

private _createdCategories = [];
{
    _x params ["_category", "_teleportObject", "_text"];

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
    ] call ACEFUNC(interact_menu,createAction);

    if (_category == "") then {
        [_controller, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
    } else {
        private _categoryActionName = format [QGVAR(FastTravel_%1), _category];
        if !(_category in _createdCategories) then {
            _createdCategories pushBack _category;

            private _categoryAction = [
                _categoryActionName,
                _category,
                "",
                {},
                {true}
            ] call ACEFUNC(interact_menu,createAction);

            [_controller, 0, ["ACE_MainActions"], _categoryAction] call ACEFUNC(interact_menu,addActionToObject);
        };

        [_controller, 0, ["ACE_MainActions", _categoryActionName], _action] call ACEFUNC(interact_menu,addActionToObject);
    };
} forEach _teleportLocations;
