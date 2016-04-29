/*
 * Author: Jonpas
 * Closes inventory on showcase interaction (variable on the holder/container).
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, container] call TAC_Olympus_fnc_closeInventoryOnShowcase
 */
#include "..\script_component.hpp"

params ["_player", "_container"];

// Exit if not showcase item
if !(_container getVariable [QGVAR(isShowcase), false]) exitWith {};

// Wait for inventory display to open and force close it or wait for timeout
[{
    params ["_args", "_idPFH"];
    _args params ["_timeStart"];

    // Timeout
    if (_timeStart + 5 < diag_tickTime) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    // Inventory display opened
    if !(findDisplay 602 isEqualTo displayNull) then {
        (findDisplay 602) closeDisplay 0;
        ["You may not touch items on a showcase!", 2] call ace_common_fnc_displayTextStructured;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [diag_tickTime]] call CBA_fnc_addPerFrameHandler;
