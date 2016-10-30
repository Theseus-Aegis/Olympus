/*
 * Author: Rory, jonpas
 * Allows for the instructor to choose what group of targets pop up.
 *
 * Arguments:
 * 0: Interaction object.
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_TargetGroupPopUps;
 */
#include "..\script_component.hpp"

#define TARGET_GROUP_1 machinegun_range_trigger_target_1, machinegun_range_trigger_target_2, machinegun_range_trigger_target_3, machinegun_range_trigger_target_4
#define TARGET_GROUP_2 machinegun_range_trigger_target_5, machinegun_range_trigger_target_6, machinegun_range_trigger_target_7, machinegun_range_trigger_target_8
#define TARGET_GROUP_3 machinegun_range_trigger_target_9, machinegun_range_trigger_target_10, machinegun_range_trigger_target_11, machinegun_range_trigger_target_12, machinegun_range_trigger_target_13
#define TARGET_GROUP_4 machinegun_range_trigger_target_14, machinegun_range_trigger_target_15, machinegun_range_trigger_target_16, machinegun_range_trigger_target_17, machinegun_range_trigger_target_18, machinegun_range_trigger_target_19
#define TARGET_GROUP_5 machinegun_range_trigger_target_20, machinegun_range_trigger_target_21, machinegun_range_trigger_target_22, machinegun_range_trigger_target_23, machinegun_range_trigger_target_24
#define TARGET_GROUP_6 machinegun_range_trigger_target_25, machinegun_range_trigger_target_26, machinegun_range_trigger_target_27, machinegun_range_trigger_target_28, machinegun_range_trigger_target_29

#define ALL_TARGETS TARGET_GROUP_1, TARGET_GROUP_2, TARGET_GROUP_3, TARGET_GROUP_4, TARGET_GROUP_5, TARGET_GROUP_6
#define ALL_TARGET_GROUPS [[ALL_TARGETS], [ALL_TARGETS], [TARGET_GROUP_1], [TARGET_GROUP_2], [TARGET_GROUP_3], [TARGET_GROUP_4], [TARGET_GROUP_5], [TARGET_GROUP_6]]

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
    [QGVAR(group5up), "Group 5 Up", 0],
    [QGVAR(group6up), "Group 6 Up", 0]
];
