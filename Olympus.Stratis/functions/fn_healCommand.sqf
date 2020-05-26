/*
 * Author: Tyrone
 * Enables healing via #heal command in chat.
 *
 * Return Value:
 * None
 */
#include "..\script_component.hpp"

["heal",
    {
        [ace_player] call ACEFUNC(medical_treatment,fullHealLocal);
        ["ace_common_systemChatGlobal", "[TAC] Healed", ace_player] call CBA_fnc_targetEvent;
    }, "all"
] call CBA_fnc_registerChatCommand;
