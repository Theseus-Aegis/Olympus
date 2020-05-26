#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Create project type interactions.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretcher <OBJECT>
 * 2: BodyPart <STRING>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [controller, stretcher, bodyPart] call TAC_Olympus_Medical_fnc_specific_projectileTypeActions
 */

params ["_controller", "_stretcher", "_bodyPart"];

private _projectileTypes = [
    //["projectileType", "projectileTypeName"]
    ["bullet", "Bullet"],
    ["grenade", "Grenade"],
    ["explosive", "Explosion"],
    ["shell", "Explosive Shell"],
    ["vehiclecrash", "Vehicle Crash"],
    ["collision", "Collision"],
    ["backblast", "Backblast"],
    ["stab", "Stab"],
    ["falling", "Falling"]
];

private _actions = [];
{
    _x params ["_projectileType", "_projectileTypeName"];

    private _projectileTypeAction = [
        format[QGVAR(projectileTypeAction_%1), _projectileType],
        _projectileTypeName,
        "",
        {},
        {true},
        {(_this select 2) call TAC_Olympus_Medical_fnc_specific_severityActions},
        [_controller, _stretcher, _bodyPart, _projectileType]
    ] call ACEFUNC(interact_menu,createAction);

    _actions pushBack [_projectileTypeAction, [], _controller];
} forEach _projectileTypes;

_actions
