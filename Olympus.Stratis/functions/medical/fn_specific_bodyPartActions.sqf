#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Create body part interactions.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretcher <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [controller, stretcher] call TAC_Olympus_Medical_fnc_specific_bodyPartActions
 */

params ["_controller", "_stretcher"];

private _bodyParts = [
    //["bodyPart", "bodyPartName"]
    ["Head", "Head"],
    ["Body", "Body"],
    ["RightArm", "Right Arm"],
    ["LeftArm", "Left Arm"],
    ["RightLeg", "Right Leg"],
    ["LeftLeg", "Left Leg"]
];

private _actions = [];
{
    _x params ["_bodyPart", "_bodyPartName"];

    private _bodyPartAction = [
        format[QGVAR(bodyPartAction_%1), _bodyPart],
        _bodyPartName,
        "",
        {},
        {true},
        {(_this select 2) call TAC_Olympus_Medical_fnc_specific_projectileTypeActions},
        [_controller, _stretcher, _bodyPart]
    ] call ACEFUNC(interact_menu,createAction);

    _actions pushBack [_bodyPartAction, [], _controller];
} forEach _bodyParts;

_actions
