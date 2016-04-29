/*
 * Author: Rory
 * Initializes Virtual Arsenal on an object with specific items only.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate] call TAC_Olympus_fnc_ArmoryBoxStagingInit
 */
#include "..\script_component.hpp"

params ["_crate"];

[_crate, [
    // Grenades
    ["item", "HandGrenade", "Throwable", "", 100],
    ["item", "HandGrenade_Stone", "Throwable", "", 100],
    ["item", "SmokeShell", "Throwable", "", 100],
    ["item", "SmokeShellGreen", "Throwable", "", 100],
    ["item", "SmokeShellYellow", "Throwable", "", 100],
    ["item", "SmokeShellOrange", "Throwable", "", 100],
    ["item", "smokeshellblue", "Throwable", "", 100],
    ["item", "smokeshellpurple", "Throwable", "", 100]
]] call TACFUNC(armory,addItems);
