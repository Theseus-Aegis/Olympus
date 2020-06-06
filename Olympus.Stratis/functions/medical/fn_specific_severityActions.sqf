#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Create severity interactions.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretcher <OBJECT>
 * 2: BodyPart <STRING>
 * 3: ProjectileType <STRING>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [controller, stretcher, bodyPart, projectileType] call TAC_Olympus_Medical_fnc_specific_severityActions
 */

params ["_controller", "_stretcher", "_bodyPart", "_projectileType"];

private _severity = [
    //[severity, "severityName"]
    [0.1, "1"],
    [0.35, "2"],
    [0.7, "3"],
    [1.05, "4"],
    [1.4, "5"],
    [1.75, "6"],
    [2.1, "7"],
    [2.45, "8"],
    [2.8, "9"],
    [3, "10"]
];

private _actions = [];
{
    _x params ["_severity", "_severityName"];

    private _severityAction = [
        format[QGVAR(severityAction_%1), _severityName],
        _severityName,
        "",
        {
            (_this select 2) params ["_controller", "_stretcher", "_bodyPart", "_projectileType", "_severity"];

            private _medSubject = _stretcher getVariable [format [QGVAR(medSubject_%1), _stretcher], []];

            INFO_4("Adding specific damage: Subject: %1, Bodypart: %2, Projectile: %3, Severity: %4", _medSubject, _bodyPart, _projectileType, _severity);
            [QGVAR(applyDamage), [_medSubject, _severity, _bodyPart, _projectileType], _medSubject] call CBA_fnc_targetEvent;
        },
        {true},
        {},
        [_controller, _stretcher, _bodyPart, _projectileType, _severity]
    ] call ACEFUNC(interact_menu,createAction);

    _actions pushBack [_severityAction, [], _controller];
} forEach _severity;

_actions
