/*
 * Author: JoramD
 * Apply random damage to subject
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretchers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, stretchers] call TAC_Olympus_fnc_medical_applyRandomDamage
 */
#include "..\script_component.hpp"

params ["_controller", "_stretchers"];

private _randomDamageMainAction = [
    QGVAR(randomDamageMainAction),
    "Apply random damage",
    "",
    {},
    {true}
] call ACE_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _randomDamageMainAction] call ace_interact_menu_fnc_addActionToObject;


{
    _x params ["_stretcher", "_subjectName"];

    private _randomDamageAction = [
        format [QGVAR(randomDamageAction_%1), _stretcher],
        format ["Damage subject %1", _subjectName],
        "",
        {},
        {
            // Condition to check if patient is on stretcher
            (_this select 2) params ["_controller", "_stretcher"];

            private _medSubject = _stretcher getVariable [format ["medSubject_%1", _stretcher], []];

            !(_medSubject isEqualTo [])
        },
        {
            (_this select 2) params ["_controller", "_stretcher"];

            private _severity = [
                //[[min, medium, max], "fancyName"]
                [[0.1, 0.5,1], "Lightly wounded"],
                [[1, 1.5, 2], "Medium wounded"],
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

                        private _medSubject = _stretcher getVariable [format ["medSubject_%1", _stretcher], []];

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
                ] call ACE_interact_menu_fnc_createAction;

                _actions pushBack [_severityAction, [], _controller];
            } forEach _severity;

            _actions
        },
        [_controller, _stretcher]
    ] call ACE_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions", QGVAR(randomDamageMainAction)], _randomDamageAction] call ace_interact_menu_fnc_addActionToObject;
} forEach _stretchers;
