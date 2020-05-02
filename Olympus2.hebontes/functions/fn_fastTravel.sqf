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
#include "..\script_component.hpp"

// Define teleport locations here
private _teleportLocations = [
    // ["Category", objectVarName, "Display Name"]
    ["Hubs", tpPosAirport, "Airport"],
    ["Hubs", tpPosBase, "Base"],
    ["Advanced Courses", tpPosAdvPistolRifle, "Adv. Pistol and Rifle"],
    ["Advanced Courses", tpPosEngineer, "Combat Engineer"],
    ["Advanced Courses", tpPosDrivingCourse, "Driving"],
    ["Advanced Courses", tpPosMOUT, "MOUT"],
    ["Advanced Courses", tpPosMOUTPrep, "MOUT Preparation"],
    ["Shooting Ranges", tpPos40mm, "40mm GL"],
    ["Shooting Ranges", tpPosHandGrenade, "Hand Grenade"],
    ["Shooting Ranges", tpPosLauncher, "Launcher"],
    ["Shooting Ranges", tpPosBasicLMG, "Machine Gun"],
    ["Shooting Ranges", tpPosMarksman, "Marksman"],
    ["Shooting Ranges", tpPosBasicPistol, "Pistol"],
    ["Shooting Ranges", tpPosBasicRifle, "Rifle"]
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
    ] call ace_interact_menu_fnc_createAction;

    if (_category == "") then {
        [_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
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
            ] call ace_interact_menu_fnc_createAction;

            [_controller, 0, ["ACE_MainActions"], _categoryAction] call ace_interact_menu_fnc_addActionToObject;
        };

        [_controller, 0, ["ACE_MainActions", _categoryActionName], _action] call ace_interact_menu_fnc_addActionToObject;
    };
} forEach _teleportLocations;
