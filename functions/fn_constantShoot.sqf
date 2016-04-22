/*
 * Author: Jonpas, Rory
 * Makes an AI shoot into a target periodically as long as a player is in the trigger.
 * Called from Trigger activation.
 *
 * Arguments:
 * 0: AI Shooter <OBJECT>
 * 1: Target <OBJECT>
 * 2: Units in trigger (thisList) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [shooter, target, thisList] call TAC_Olympus_fnc_constantShoot
 */
#include "..\script_component.hpp"

params ["_shooter", "_target", "_thisList"];

private _weapon = (weaponState _shooter) select 1;

_shooter doTarget _target;

[{
    params ["_args", "_pfhId"];
    _args params ["_shooter", "_weapon", "_thisList"];

    // Exit and remove PFH if player left trigger
    if ((_thisList select {isPlayer _x}) isEqualTo []) exitWith {
        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };

    _shooter forceWeaponFire [_weapon, "Single"];
}, 0.5, [_shooter, _weapon, _thisList]] call CBA_fnc_addPerFrameHandler;
