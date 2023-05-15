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
    // ["Category", objectVarName, "Display Name", "Icon Path"]
    ["Hubs", tpPosAirport, "Airport", "ca\misc\data\icons\i_h_ca.paa"],
    ["Hubs", tpPosBase, "Base", "a3\modules_f_curator\data\iconcuratorsetobjectcosts_ca.paa"],
    ["Hubs", tpPosMOUT, "MOUT", "a3\missions_f_gamma\data\img\icon_exit_big_ca.paa"],
    ["Hubs", tpPosShootingRange, "Shooting Range", "x\zen\addons\modules\ui\target_ca.paa"],
    ["Core", tpPosWeaponsHandling, "Weapons Handling Base", "z\ace\addons\zeus\ui\icon_module_zeus_garrison_ca.paa"],
    ["Core", tpPosWeaponsHandlingRifle, "Weapons Handling Rifle", "a3\ui_f\data\gui\cfg\hints\rifle_ca.paa"],
    ["Core", tpPosWeaponsHandlingPistol, "Weapons Handling Pistol", "a3\ui_f\data\gui\cfg\hints\handgun_ca.paa"],
    ["Core", tpPosWeaponsHandlingGrenades, "Weapons Handling Grenades", "a3\weapons_f\data\ui\icon_gl_ca.paa"],
    ["Core", tpPosWeaponsHandlingLaunchers, "Weapons Handling Launchers", "a3\structures_f_bootcamp\vr\helpers\data\vr_symbol_launchers_ca.paa"],
    ["Core", tpPosDriving, "Driving Course", "x\tacs\addons\arcadian\ui\icon_arcadian.paa"],
    ["Specialist", tpPosEngineer, "Engineer", "a3\ui_f\data\igui\cfg\cursors\iconrepairat_ca.paa"],
    ["Specialist", tpPos40mm, "Grenadier", "z\ace\addons\arsenal\data\iconsecondarymuzzle.paa"],
    ["Specialist", tpPosMachineGun, "Machine Gun", "a3\weapons_f\data\ui\icon_mg_ca.paa"],
    ["Specialist", tpPosMarksman, "Marksman", "a3\data_f_heli\logos\arma3_mark_icon_ca.paa"],
    ["Specialist", tpPosMedical, "Medic", "a3\ui_f\data\map\vehicleicons\pictureheal_ca.paa"]
];

params ["_controller"];

private _createdCategories = [];
{
    _x params ["_category", "_teleportObject", "_text", "_iconPath"];

    private _action = [
        format [QGVAR(%1), _teleportObject],
        ["Fast travel to", _text] joinString " ",
        _iconPath,
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
        [_teleportObject, _text, _iconPath]
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
