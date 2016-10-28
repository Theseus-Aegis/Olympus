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

#define targetGroup1 machinegun_range_trigger_target_1, machinegun_range_trigger_target_2, machinegun_range_trigger_target_3, machinegun_range_trigger_target_4
#define targetGroup2 machinegun_range_trigger_target_5, machinegun_range_trigger_target_6, machinegun_range_trigger_target_7, machinegun_range_trigger_target_8
#define targetGroup3 machinegun_range_trigger_target_9, machinegun_range_trigger_target_10, machinegun_range_trigger_target_11, machinegun_range_trigger_target_12, machinegun_range_trigger_target_13
#define targetGroup4 machinegun_range_trigger_target_14, machinegun_range_trigger_target_15, machinegun_range_trigger_target_16, machinegun_range_trigger_target_17, machinegun_range_trigger_target_18, machinegun_range_trigger_target_19
#define targetGroup5 machinegun_range_trigger_target_20, machinegun_range_trigger_target_21, machinegun_range_trigger_target_22, machinegun_range_trigger_target_23, machinegun_range_trigger_target_24
#define targetGroup6 machinegun_range_trigger_target_25, machinegun_range_trigger_target_26, machinegun_range_trigger_target_27, machinegun_range_trigger_target_28, machinegun_range_trigger_target_29

private _allTargets = [targetGroup1, targetGroup2, targetGroup3, targetGroup4, targetGroup5, targetGroup6];
private _targetGroup1 = [machinegun_range_trigger_target_1, machinegun_range_trigger_target_2, machinegun_range_trigger_target_3, machinegun_range_trigger_target_4];
// Default targets down
{
    [_x, 1] call TACFUNC(shootingrange,animateTarget);
} forEach _allTargets;
//////////////

params ["_controller"];

{
    _x params ["_interactionVariable", "_interactionName", "_state"];

    private _action = [
        _interactionVariable,
        _interactionName,
        "",
        {
            (_this select 2) params ["_allTargets", "_state"];
            {
                [_x, _state] call TACFUNC(shootingrange,animateTarget);
                _x setVariable [QTACGVAR(shootingrange,stayDown), true, true];
            } forEach _allTargets;
        },
        {true},
        {},
        [_allTargets, _state]
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    [QGVAR(targetsUp), "All UP", 0],
    [QGVAR(targetsDown), "All DOWN", 1]
];

////////////////////////////////////////////////////////////////////

{
    _x params ["_interactionVariable", "_interactionName", "_state"];

    private _action = [
        _interactionVariable,
        _interactionName,
        "",
        {
            (_this select 2) params ["_targetGroup1", "_state"];
            {
                [_x, _state] call TACFUNC(shootingrange,animateTarget);
                _x setVariable [QTACGVAR(shootingrange,stayDown), true, true];
            } forEach _targetGroup1;
        },
        {true},
        {},
        [_targetGroup1, _state]
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    [QGVAR(group1up), "Group 1 Up", 0],
    [QGVAR(group2up), "Group 2 Up", 0],
    [QGVAR(group3up), "Group 3 Up", 0],
    [QGVAR(group4up), "Group 4 Up", 0],
    [QGVAR(group5up), "Group 5 Up", 0],
    [QGVAR(group1up), "Group 6 Up", 0]
];
