#include "script_component.hpp"
/*
 * Author: Theseus Incorporated
 * Initialization of scripts local to player
 * Executed locally when player joins mission (includes both mission start and JIP)
 * Executed after initServer and before initPlayerServer and init.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Did JIP <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 */

params ["_player", "_didJIP"];

call FUNC(addChatCommands);

// Types "OLYMPUS" text on the screen, letter by letter, cursor blinking.
[
    [
        ["OLYMPUS", "<t size = '1.5' underline = '1'>%1</t><br/>"],
        ["Theseus Incorporated"],
        ["Stratis", "<t size = '1' font='puristaMedium'>%1</t>", 70]
    ], 1, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

// Sets default loadout to joining players
[_player] call FUNC(setBasicLoadout);

// Feature overview
[_player] call FUNC(featureOverview);
