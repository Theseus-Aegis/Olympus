#include "..\script_component.hpp"
/*
 * Author: Tyrone, JoramD
 * Adds various chat commands.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call TAC_Olympus_fnc_addChatCommands
 */

["tac-heal", {
    params ["_name"];

    if (_name == "") then {
        [ace_player] call ACEFUNC(medical_treatment,fullHealLocal);
        systemChat format ["[TAC] Healed %1", name ace_player];
    } else {
        private _foundPlayers = (call CBA_fnc_players) select {_name in (name _x)};

        if (count _foundPlayers < 1) then {
            systemChat "[TAC] Could not find player to heal";
        } else {
            if (count _foundPlayers > 1) then {
                systemChat "[TAC] Found multiple players to heal, please specify";
            } else {
                private _foundPlayer = _foundPlayers select 0;
                ["ace_medical_treatment_fullHealLocal", _foundPlayer, _foundPlayer] call CBA_fnc_targetEvent;
                systemChat format ["[TAC] Healed %1", name _foundPlayer];
            };
        };
    };
}, "all"] call CBA_fnc_registerChatCommand;

["tac-fix", {
    private _object = cursorObject;
    if (_object isKindOf "LandVehicle" || {_object isKindOf "Air"} || {_object isKindOf "Ship"}) then {
        cursorObject setDamage 0;
        cursorObject setFuel 1;
        cursorObject setVehicleAmmo 1;
        systemChat "[TAC] Repaired, refueled and rearmed vehicle";
    } else {
        systemChat "[TAC] Could not find vehicle to fix";
    };
}, "all"] call CBA_fnc_registerChatCommand;
