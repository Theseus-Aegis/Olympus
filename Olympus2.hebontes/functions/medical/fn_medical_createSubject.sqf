/*
 * Author: JoramD
 * Spawn a subject.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretcher <OBJECT>
 * 2: Stretcher Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, spawnPos, stretcher, subjectName] call TAC_Olympus_fnc_medical_createSubject
 */
#include "..\..\script_component.hpp"

#define MEDICAL_SUBJECT_SIDE independent

params ["_controller", "_spawnPos", "_stretcher", "_subjectName"];


private _spawnSubjectAction = [
    QGVAR(spawnSubjectAction),
    format ["Spawn subject %1", _subjectName],
    "",
    {
        (_this select 2) params ["_controller", "_stretcher", "_spawnPos"];

        private _medSubjectsGroup = createGroup [MEDICAL_SUBJECT_SIDE, true];
        private _medSubject = _medSubjectsGroup createUnit [
            "B_Survivor_F",
            _spawnPos,
            [],
            0,
            "CAN_COLLIDE"
        ];

        cutText ["<t size='2'>Spawning subject..</t>", "PLAIN DOWN", 1, true, true];

        _stretcher setVariable [format [QGVAR(medSubject_%1), _stretcher], _medSubject, true];

        [QGVAR(disableAI), [_medSubject]] call CBA_fnc_globalEvent;
        [_medSubject, true, 60, true] call ace_medical_fnc_setUnconscious;
        [{(_this select 0) setPosASL (getPosASL (_this select 1));}, [_medSubject, _stretcher], 5] call CBA_fnc_waitAndExecute;
        [{(_this select 0) setDir (getDir (_this select 1));}, [_medSubject, _stretcher], 5] call CBA_fnc_waitAndExecute;
    },
    {
        (_this select 2) params ["_controller", "_stretcher"];

        !([_stretcher] call TAC_Olympus_fnc_medical_checkSubject)
    },
    {},
    [_controller, _stretcher, _spawnPos]
] call ACE_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions", QGVAR(spawnMainAction)], _spawnSubjectAction] call ace_interact_menu_fnc_addActionToObject;
