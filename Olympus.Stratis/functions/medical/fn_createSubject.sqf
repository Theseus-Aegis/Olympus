#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Spawn a subject.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Spawn Position <ARRAY|OBJECT|GROUP>
 * 2: Stretcher <OBJECT>
 * 3: Subject Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, spawnPos, stretcher, subjectName] call TAC_Olympus_Medical_fnc_createSubject
 */

params ["_controller", "_spawnPos", "_stretcher", "_subjectName"];
#define MEDICAL_SUBJECT_SIDE independent


private _spawnSubjectAction = [
    QGVAR(spawnSubjectAction),
    format ["Spawn subject %1", _subjectName],
    "",
    {
        (_this select 2) params ["_stretcher", "_spawnPos"];

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
        [_medSubject, true, 60, true] call ACEFUNC(medical,setUnconscious);
        [{(_this select 0) setPosASL (getPosASL (_this select 1));}, [_medSubject, _stretcher], 5] call CBA_fnc_waitAndExecute;
        [{(_this select 0) setDir (getDir (_this select 1));}, [_medSubject, _stretcher], 5] call CBA_fnc_waitAndExecute;
    },
    {
        (_this select 2) params ["_stretcher"];
        !([_stretcher] call TAC_Olympus_Medical_fnc_checkSubject)
    },
    {},
    [_stretcher, _spawnPos]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions", QGVAR(spawnMainAction)], _spawnSubjectAction] call ACEFUNC(interact_menu,addActionToObject);
