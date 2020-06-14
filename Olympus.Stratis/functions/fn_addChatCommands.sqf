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
        ["ace_common_systemChatGlobal", format ["[TAC] Healed %1", name ace_player], ace_player] call CBA_fnc_targetEvent;
    } else {
        private _foundPlayers = (call CBA_fnc_players) select {_name in (name _x)};

        if (count _foundPlayers < 1) then {
            ["ace_common_systemChatGlobal", "[TAC] Could not find player to heal", ace_player] call CBA_fnc_targetEvent;
        } else {
            if (count _foundPlayers > 1) then {
                ["ace_common_systemChatGlobal", "[TAC] Found multiple players to heal, please specify", ace_player] call CBA_fnc_targetEvent;
            } else {
                private _foundPlayer = _foundPlayers select 0;
                ["ace_medical_treatment_fullHealLocal", _foundPlayer, _foundPlayer] call CBA_fnc_targetEvent;
                ["ace_common_systemChatGlobal", format ["[TAC] Healed %1", name _foundPlayer], ace_player] call CBA_fnc_targetEvent;
            };
        };
    };
}, "all"] call CBA_fnc_registerChatCommand;
