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

private _targetGroup1 = [
    machinegun_range_trigger_target_1,
    machinegun_range_trigger_target_2,
    machinegun_range_trigger_target_3,
    machinegun_range_trigger_target_4
];

private _targetGroup2 = [
    machinegun_range_trigger_target_5,
    machinegun_range_trigger_target_6,
    machinegun_range_trigger_target_7,
    machinegun_range_trigger_target_8
];

private _targetGroup3 = [
    machinegun_range_trigger_target_9,
    machinegun_range_trigger_target_10,
    machinegun_range_trigger_target_11,
    machinegun_range_trigger_target_12,
    machinegun_range_trigger_target_13
];

private _targetGroup4 = [
    machinegun_range_trigger_target_14,
    machinegun_range_trigger_target_15,
    machinegun_range_trigger_target_16,
    machinegun_range_trigger_target_17,
    machinegun_range_trigger_target_18,
    machinegun_range_trigger_target_19
];

private _targetGroup5 = [
    machinegun_range_trigger_target_20,
    machinegun_range_trigger_target_21,
    machinegun_range_trigger_target_22,
    machinegun_range_trigger_target_23,
    machinegun_range_trigger_target_24
];

private _targetGroup6 = [
    machinegun_range_trigger_target_25,
    machinegun_range_trigger_target_26,
    machinegun_range_trigger_target_27,
    machinegun_range_trigger_target_28,
    machinegun_range_trigger_target_29
];

private _allTargets = [_targetGroup1, _targetGroup2, _targetGroup3, _targetGroup4, _targetGroup5, _targetGroup6];

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
    [QGVAR(targetsUp), "Pop targets UP", 0],
    [QGVAR(targetsDown), "Pop targets DOWN", 1]
];
