/*
 * Author: JoramD
 * Apply specific damage to subject.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretchers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, stretchers] call TAC_Olympus_fnc_medical_applySpecificDamage
 */
#include "..\..\script_component.hpp"

params ["_controller", "_stretchers"];


private _specificDamageMainAction = [
    QGVAR(specificDamageMainAction),
    "Apply specific damage",
    "",
    {},
    {true}
] call ACE_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _specificDamageMainAction] call ace_interact_menu_fnc_addActionToObject;

{
    _x params ["_stretcher", "_subjectName"];

    private _specificDamageAction = [
        format[QGVAR(specificDamageAction_%1), _stretcher],
        format ["Damage subject %1", _subjectName],
        "",
        {},
        {
            (_this select 2) params ["_controller", "_stretcher"];

            [_stretcher] call TAC_Olympus_fnc_medical_checkSubject
        },
        {
            (_this select 2) params ["_controller", "_stretcher"];


            private _bodyParts = [
                //["bodyPart", "bodyPartName"]
                ["Head", "Head"],
                ["Body", "Body"],
                ["RightArm", "Right Arm"],
                ["LeftArm", "Left Arm"],
                ["RightLeg", "Right Leg"],
                ["LeftLeg", "Left Leg"]
            ];

            private _actions = [];
            {
                _x params ["_bodyPart", "_bodyPartName"];

                private _bodyPartAction = [
                    format[QGVAR(bodyPartAction_%1), _bodyPart],
                    _bodyPartName,
                    "",
                    {},
                    {true},
                    {
                        (_this select 2) params ["_controller", "_stretcher", "_bodyPart"];

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
                                {
                                    (_this select 2) params ["_controller", "_stretcher", "_bodyPart", "_projectileType"];

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

                                                diag_log format ["[Olympus Medical] Adding Damage: Subject: %1, Bodypart: %2, Projectile: %3, Severity: %4", _medSubject, _bodyPart, _projectileType, _severity];
                                                [QGVAR(applyDamage), [_medSubject, _severity, _bodyPart, _projectileType], _medSubject] call CBA_fnc_targetEvent;
                                            },
                                            {true},
                                            {},
                                            [_controller, _stretcher, _bodyPart, _projectileType, _severity]
                                        ] call ACE_interact_menu_fnc_createAction;

                                        _actions pushBack [_severityAction, [], _controller];
                                    } forEach _severity;

                                    _actions
                                },
                                [_controller, _stretcher, _bodyPart, _projectileType]
                            ] call ACE_interact_menu_fnc_createAction;

                            _actions pushBack [_projectileTypeAction, [], _controller];
                        } forEach _projectileTypes;

                        _actions
                    },
                    [_controller, _stretcher, _bodyPart]
                ] call ACE_interact_menu_fnc_createAction;

                _actions pushBack [_bodyPartAction, [], _controller];
            } forEach _bodyParts;

            _actions
        },
        [_controller, _stretcher]
    ] call ACE_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions", QGVAR(specificDamageMainAction)], _specificDamageAction] call ace_interact_menu_fnc_addActionToObject;
} forEach _stretchers;
