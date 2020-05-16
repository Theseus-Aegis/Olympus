/*
 * Author: Rory, Jonpas
 * Allows for the instructor to choose what group of targets pop up for 40mm GL range
 *
 * Arguments:
 * 0: Interaction object.
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_range40mmTargetGroups;
 */
#include "..\script_component.hpp"

#define TARGET_GROUP_1 range40mmTarget01, range40mmTarget02, range40mmTarget03
#define TARGET_GROUP_2 range40mmTarget04, range40mmTarget05
#define TARGET_GROUP_3 range40mmTarget06, range40mmTarget07, range40mmTarget08, range40mmTarget09
#define TARGET_GROUP_4 range40mmTarget10, range40mmTarget11, range40mmTarget12, range40mmTarget13, range40mmTarget14
#define TARGET_GROUP_5 range40mmTarget15, range40mmTarget16, range40mmTarget17, range40mmTarget18
#define TARGET_GROUP_6 range40mmTarget19, range40mmTarget20, range40mmTarget21, range40mmTarget22, range40mmTarget23
#define TARGET_GROUP_7 range40mmTarget24, range40mmTarget25, range40mmTarget26
#define TARGET_GROUP_8 range40mmTarget27, range40mmTarget28, range40mmTarget29, range40mmTarget30

#define ALL_TARGETS TARGET_GROUP_1, TARGET_GROUP_2, TARGET_GROUP_3, TARGET_GROUP_4, TARGET_GROUP_5, TARGET_GROUP_6, TARGET_GROUP_7, TARGET_GROUP_8
#define ALL_TARGET_GROUPS [[ALL_TARGETS], [ALL_TARGETS], [TARGET_GROUP_1], [TARGET_GROUP_2], [TARGET_GROUP_3], [TARGET_GROUP_4], [TARGET_GROUP_5], [TARGET_GROUP_6], [TARGET_GROUP_7], [TARGET_GROUP_8]]

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
    [QGVAR(group1up), "Building - 50m", 0],
    [QGVAR(group2up), "Indirect Fire - 100m", 0],
    [QGVAR(group3up), "Village - 100m", 0],
    [QGVAR(group4up), "Wrecks - 200m", 0],
    [QGVAR(group5up), "Bunker - 300m", 0],
    [QGVAR(group6up), "Wrecks - 400m", 0],
    [QGVAR(group7up), "Bunker - 450m", 0],
    [QGVAR(group8up), "House - 500m", 0]    
];
