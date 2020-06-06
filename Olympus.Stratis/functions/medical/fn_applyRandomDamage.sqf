#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Apply random damage to subject.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretcher <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, stretcher] call TAC_Olympus_Medical_fnc_applyRandomDamage
 */

params ["_controller", "_stretcher"];


private _severity = [
    //[[min, medium, max], "fancyName"]
    [[0.1, 0.5,1], "Lightly wounded"],
    [[1, 1.5, 2], "Moderatly wounded"],
    [[2, 2.5, 3], "Heavily Wounded"]
];

private _actions = [];
{
    _x params ["_randomNumbers", "_fancyName"];

    private _severityAction = [
        QGVAR(severityAction),
        _fancyName,
        "",
        {
            (_this select 2) params ["_controller", "_stretcher", "_randomNumbers"];

            private _medSubject = _stretcher getVariable [format [QGVAR(medSubject_%1), _stretcher], []];

            private _bodyParts = [
                //"bodyPart"
                "Head",
                "Body",
                "RightArm",
                "LeftArm",
                "RightLeg",
                "LeftLeg"
            ];

            private _projectileTypes = [
                //"projectileType"
                "bullet",
                "grenade",
                "explosive",
                "shell",
                "vehiclecrash",
                "collision",
                "backblast",
                "stab",
                "falling"
            ];

            private _selectedSeverity = random _randomNumbers;
            private _selectedBodyPart = selectRandom _bodyParts;
            private _selectedProjectileType = selectRandom _projectileTypes;

            INFO_4("Adding random damage: Subject: %1, Bodypart: %2, Projectile: %3, Severity: %4", _medSubject, _selectedBodyPart, _selectedProjectileType, _selectedSeverity);
            [QGVAR(applyDamage), [_medSubject, _selectedSeverity, _selectedBodyPart, _selectedProjectileType], _medSubject] call CBA_fnc_targetEvent;
        },
        {true},
        {},
        [_controller, _stretcher, _randomNumbers]
    ] call ACEFUNC(interact_menu,createAction);

    _actions pushBack [_severityAction, [], _controller];
} forEach _severity;

_actions
