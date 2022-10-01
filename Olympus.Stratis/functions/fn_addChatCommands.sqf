#include "..\script_component.hpp"
/*
 * Author: Mike, JoramD
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
        _object setDamage 0;
        _object setFuel 1;
        _object setVehicleAmmo 1;
        systemChat "[TAC] Repaired, refueled and rearmed vehicle";
    } else {
        systemChat "[TAC] Could not find vehicle to fix";
    };
}, "all"] call CBA_fnc_registerChatCommand;

["tac-cleanup", {
    params ["_distanceStr"];
    private _parsedInput = parseNumber _distanceStr;
    private _distance = [_parsedInput, 10] select (_parsedInput == 0);

    if (_distance > 0 && _distance <= 100) then {
        private _weaponHolders = nearestObjects [ace_player, ["GroundWeaponHolder", "WeaponHolderSimulated"], _distance];
        if (!(_weaponHolders isEqualTo [])) then {
            {deleteVehicle _x} forEach _weaponHolders;
            systemChat format ["[TAC] Removed all items within %1m", _distance];
        } else {
            systemChat format ["[TAC] Could not find items within %1m to remove", _distance];
        };
    } else {
        systemChat format ["[TAC] Invalid input, input must be between 1 and 100 meters (input was %1)", _parsedInput];
    };
}, "all"] call CBA_fnc_registerChatCommand;

["tac-grenade-reset", {
    grenade_area_building setDamage 0;
    {
        grenade_area_building animateSource [_x, 0, true];
    } forEach ["Door_1_sound_source", "Door_2_sound_source", "Door_3_sound_source", "Door_4_sound_source"];
    systemChat "[TAC] Reset the grenade building";
}, "all"] call CBA_fnc_registerChatCommand;
