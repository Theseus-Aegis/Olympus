/*
 * Author: JoramD
 * Remove a subject.
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
 * [controller, stretcher, stretcherName] call TAC_Olympus_fnc_medical_removeSubject
 */
#include "..\..\script_component.hpp"

params ["_controller", "_stretcher", "_subjectName"];


private _removeSubjectAction = [
    QGVAR(removeSubjectAction),
    format ["Remove subject %1", _subjectName],
    "",
    {
        (_this select 2) params ["_controller", "_stretcher"];

        private _medSubject = _stretcher getVariable [format ["medSubject_%1", _stretcher], []];

        deleteVehicle _medSubject;

        _stretcher setVariable [format ["medSubject_%1", _stretcher], [], true];
    },
    {
        (_this select 2) params ["_controller", "_stretcher"];

        private _medSubject = _stretcher getVariable [format ["medSubject_%1", _stretcher], []];

        !(_medSubject isEqualTo [])
    },
    {},
    [_controller, _stretcher]
] call ACE_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions", QGVAR(removeMainAction)], _removeSubjectAction] call ace_interact_menu_fnc_addActionToObject;
