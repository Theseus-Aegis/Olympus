/*
 * Author: JoramD
 * Apply random damage to subject.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretcher <OBJECT>
 * 2: Subject Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, stretcher, stretcherName] call TAC_Olympus_fnc_medical_applyRandomDamage
 */
#include "..\..\script_component.hpp"

params ["_controller", "_stretcher", "_subjectName"];


private _randomDamageAction = [
    format [QGVAR(randomDamageAction_%1), _stretcher],
    format ["Damage subject %1", _subjectName],
    "",
    {},
    {
        (_this select 2) params ["_controller", "_stretcher"];

        [_stretcher] call TAC_Olympus_fnc_medical_checkSubject
    },
    {
        (_this select 2) params ["_controller", "_stretcher", "_fnc_severityActions"];

        [] call _fnc_severityActions;
    },
    [_controller, _stretcher, _fnc_severityActions]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions", QGVAR(randomDamageMainAction)], _randomDamageAction] call ACEFUNC(interact_menu,addActionToObject);


private _fnc_severityActions = {
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

                diag_log format ["[Olympus Medical] Adding Damage: Subject: %1 Severity: %2 Bodypart:%3 ProjectileType: %4", _medSubject, _selectedSeverity, _selectedBodyPart, _selectedProjectileType];
                [QGVAR(applyDamage), [_medSubject, _selectedSeverity, _selectedBodyPart, _selectedProjectileType], _medSubject] call CBA_fnc_targetEvent;
            },
            {true},
            {},
            [_controller, _stretcher, _randomNumbers]
        ] call ACEFUNC(interact_menu,createAction);

        _actions pushBack [_severityAction, [], _controller];
    } forEach _severity;

    _actions
};