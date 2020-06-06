#include "..\script_component.hpp"
/*
 * Author: Rory, Jonpas
 * Allows for the instructor to choose what group of targets pop up for basic LMG range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_rangeMachineGunTargetGroups
 */

#define TARGET_GROUP_1 rangeMachineGunTarget01, rangeMachineGunTarget02
#define TARGET_GROUP_2 rangeMachineGunTarget03, rangeMachineGunTarget04
#define TARGET_GROUP_3 rangeMachineGunTarget05, rangeMachineGunTarget06, rangeMachineGunTarget07, rangeMachineGunTarget08
#define TARGET_GROUP_4 rangeMachineGunTarget09, rangeMachineGunTarget10, rangeMachineGunTarget11 
#define TARGET_GROUP_5 rangeMachineGunTarget12, rangeMachineGunTarget13, rangeMachineGunTarget14, rangeMachineGunTarget15
#define TARGET_GROUP_6 rangeMachineGunTarget16, rangeMachineGunTarget17, rangeMachineGunTarget18, rangeMachineGunTarget19, rangeMachineGunTarget20, rangeMachineGunTarget21, rangeMachineGunTarget22, rangeMachineGunTarget23, rangeMachineGunTarget24
#define TARGET_GROUP_7 rangeMachineGunTarget25, rangeMachineGunTarget26, rangeMachineGunTarget27, rangeMachineGunTarget28, rangeMachineGunTarget29, rangeMachineGunTarget30
#define TARGET_GROUP_8 rangeMachineGunTarget31, rangeMachineGunTarget32, rangeMachineGunTarget33, rangeMachineGunTarget34, rangeMachineGunTarget35
#define TARGET_GROUP_9 rangeMachineGunTarget36, rangeMachineGunTarget37, rangeMachineGunTarget38, rangeMachineGunTarget39, rangeMachineGunTarget40

#define ALL_TARGETS TARGET_GROUP_1, TARGET_GROUP_2, TARGET_GROUP_3, TARGET_GROUP_4, TARGET_GROUP_5, TARGET_GROUP_6, TARGET_GROUP_7, TARGET_GROUP_8, TARGET_GROUP_9
#define ALL_TARGET_GROUPS [[ALL_TARGETS], [ALL_TARGETS], [TARGET_GROUP_1], [TARGET_GROUP_2], [TARGET_GROUP_3], [TARGET_GROUP_4], [TARGET_GROUP_5], [TARGET_GROUP_6], [TARGET_GROUP_7], [TARGET_GROUP_8], [TARGET_GROUP_9]]

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
    ] call ACEFUNC(interact_menu,createAction);

    [_controller, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
} forEach [
    [QGVAR(targetsUp), "All Up", 0],
    [QGVAR(targetsDown), "All Down", 1],
    [QGVAR(group1up), "Left 1", 0],
    [QGVAR(group2up), "Left 2", 0],
    [QGVAR(group3up), "Right 1", 0],
    [QGVAR(group4up), "Right 2", 0],
    [QGVAR(group5up), "Right 3", 0],
    [QGVAR(group6up), "Vehicles", 0],
    [QGVAR(group7up), "Beach", 0],
    [QGVAR(group8up), "Flanking Fire", 0],
    [QGVAR(group9up), "Enfilading Fire", 0]
];
