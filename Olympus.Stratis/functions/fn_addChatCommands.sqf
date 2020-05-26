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
        private _fnc_findMatch = {
            params ["_name"];

            private _matches = [];

            {
                if ([_name, name _x] call BIS_fnc_inString) then {
                    _matches pushBack _x;
                };
            } forEach (call CBA_fnc_players);

            if (count _matches == 1) exitWith {_matches select 0};
            objNull
        };

        private _foundPlayer = _name call _fnc_findMatch;
        diag_log _foundPlayer;

        if (_foundPlayer isEqualTo objNull) then {
            ["ace_common_systemChatGlobal", "[TAC] Could not find player to heal", ace_player] call CBA_fnc_targetEvent;
        } else {
            [_foundPlayer] call ACEFUNC(medical_treatment,fullHealLocal);
            ["ace_common_systemChatGlobal", format ["[TAC] Healed %1", name _foundPlayer], ace_player] call CBA_fnc_targetEvent;
        };
    };
}, "all"] call CBA_fnc_registerChatCommand;
