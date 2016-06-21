/*--------------------------------------------------------------------
  Author: Theseus Incorporated

  initPlayerLocal.sqf
  Initialization of scripts local to player
  Executed locally when player joins mission (includes both mission start and JIP). Executed after initServer and before initPlayerServer and init.

  Arguments: [player:Object, didJIP:Boolean]
--------------------------------------------------------------------*/
#include "script_component.hpp"

// Types a structured text on the screen, letter by letter, cursor blinking.
[
    [
        ["OLYMPUS", "<t size = '1.5' underline = '1'>%1</t><br/>"],
        ["Theseus Incorporated"],
        ["Stratis", "<t size = '1' font='puristaMedium'>%1</t>", 70]
    ], 1, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

// =======================================

// Temp fix for target pop-ups, if 'nopop' is undefined targets will always pop back up
// @todo remove after TAC Mods 1.7.2 or higher
nopop = false;
