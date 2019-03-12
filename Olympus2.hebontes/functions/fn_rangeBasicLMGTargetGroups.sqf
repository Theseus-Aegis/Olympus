/*
 * Author: Rory, Jonpas
 * Allows for the instructor to choose what group of targets pop up for basic LMG range
 *
 * Arguments:
 * 0: Interaction object.
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_rangeBasicLMGTargetGroups;
 */
#include "..\script_component.hpp"

#define TARGET_GROUP_1 rangeBasicLMGTarget01, rangeBasicLMGTarget02, rangeBasicLMGTarget03, rangeBasicLMGTarget04, rangeBasicLMGTarget05
#define TARGET_GROUP_2 rangeBasicLMGTarget06, rangeBasicLMGTarget07, rangeBasicLMGTarget08, rangeBasicLMGTarget09, rangeBasicLMGTarget10, rangeBasicLMGTarget11
#define TARGET_GROUP_3 rangeBasicLMGTarget12, rangeBasicLMGTarget13, rangeBasicLMGTarget14, rangeBasicLMGTarget15
#define TARGET_GROUP_4 rangeBasicLMGTarget16, rangeBasicLMGTarget17, rangeBasicLMGTarget18, rangeBasicLMGTarget19, rangeBasicLMGTarget20
#define TARGET_GROUP_5 rangeBasicLMGTarget21, rangeBasicLMGTarget22, rangeBasicLMGTarget23, rangeBasicLMGTarget24, rangeBasicLMGTarget25

#define ALL_TARGETS TARGET_GROUP_1, TARGET_GROUP_2, TARGET_GROUP_3, TARGET_GROUP_4, TARGET_GROUP_5
#define ALL_TARGET_GROUPS [[ALL_TARGETS], [ALL_TARGETS], [TARGET_GROUP_1], [TARGET_GROUP_2], [TARGET_GROUP_3], [TARGET_GROUP_4], [TARGET_GROUP_5]]

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
    [QGVAR(targetsDown), "All Down", 1],
    [QGVAR(group1up), "Group 1 Up", 0],
    [QGVAR(group2up), "Group 2 Up", 0],
    [QGVAR(group3up), "Group 3 Up", 0],
    [QGVAR(group4up), "Group 4 Up", 0],
    [QGVAR(group5up), "Group 5 Up", 0]
];
