/*
 * Author: Rory, Jonpas
 * Allows for instructor to control pop up targets on Driving course
 *
 * Arguments:
 * 0: Interaction object.
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_rangeDrivingCourseGroups;
 */
#include "..\script_component.hpp"

#define TARGET_GROUP_1 courseDrivingTarget01, courseDrivingTarget02, courseDrivingTarget03, courseDrivingTarget04, courseDrivingTarget05, courseDrivingTarget06
#define TARGET_GROUP_2 courseDrivingTarget07, courseDrivingTarget08, courseDrivingTarget09, courseDrivingTarget10

#define ALL_TARGETS TARGET_GROUP_1, TARGET_GROUP_2
#define ALL_TARGET_GROUPS [[ALL_TARGETS], [ALL_TARGETS], [TARGET_GROUP_1], [TARGET_GROUP_2]]

// Default targets down
{
    [_x, 1] call TACFUNC(shootingrange,animateTarget);
} forEach [ALL_TARGETS];
//////////////

params ["_controller"];

{
    _x params ["_interactionVariable", "_interactionName", "_state"];

    private _action = [
        _interactionVariable,
        _interactionName,
        "",
        {
            (_this select 2) params ["_allTargetGroups", "_state"];
            {
                [_x, _state] call TACFUNC(shootingrange,animateTarget);
                _x setVariable [QTACGVAR(shootingrange,stayDown), true, true];
            } forEach _allTargetGroups;
        },
        {true},
        {},
        [ALL_TARGET_GROUPS select _forEachIndex, _state]
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    [QGVAR(targetsUp), "All Up", 0],
    [QGVAR(targetsDown), "All Down", 1]
];
