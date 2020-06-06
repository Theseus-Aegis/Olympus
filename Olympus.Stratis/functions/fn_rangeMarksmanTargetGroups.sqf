#include "..\script_component.hpp"
/*
 * Author: Rory, Jonpas
 * Allows for the instructor to choose what group of targets pop up for the Marksman range.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_rangeMarksmanTargetGroups
 */

#define TARGET_GROUP_1 rangeMarksmanTarget01, rangeMarksmanTarget02, rangeMarksmanTarget03, rangeMarksmanTarget04, rangeMarksmanTarget05, rangeMarksmanTarget06, rangeMarksmanTarget07, rangeMarksmanTarget08, rangeMarksmanTarget09, rangeMarksmanTarget10, rangeMarksmanTarget11, rangeMarksmanTarget12, rangeMarksmanTarget13, rangeMarksmanTarget14, rangeMarksmanTarget15, rangeMarksmanTarget16, rangeMarksmanTarget17, rangeMarksmanTarget18, rangeMarksmanTarget19, rangeMarksmanTarget20
#define TARGET_GROUP_2 rangeMarksmanTarget21

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
    ] call ACEFUNC(interact_menu,createAction);

    [_controller, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
} forEach [
    [QGVAR(targetsUp), "All Up", 0],
    [QGVAR(targetsDown), "All Down", 1]
];
