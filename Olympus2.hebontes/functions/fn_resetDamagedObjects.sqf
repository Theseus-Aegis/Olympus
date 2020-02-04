/*
 * Author: Rory, Tyrone
 * Resets target damaged objects back to their original state
 *
 * Arguments:
 * 0: Controller (object)
 * 1: Objects to reset (array)
 *
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, [target1, target2, target3]] call TAC_Olympus_fnc_resetDamagedObjects
 */
#include "..\script_component.hpp"

params ["_controller", "_targets"];

private _action = [
    QGVAR(resetDamageAction),
    "Reset targets",
    "",
    {
        private _targets = param [2];
        {
            if (damage _x != 0) then {
                private _position = ASLToAGL (getPosASL _x);
                private _type = typeOf _x;
                deleteVehicle _x;

                // Run this in the next frame
                [
                    {
                        params ["_type", "_position", "_targets", "_index"];
                        private _newTarget = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
                        _targets set [_index, _newTarget];
                    },
                    [_type, _position, _targets, _forEachIndex]
                ] call CBA_fnc_execNextFrame;
            };
        } forEach _targets;
    },
    {true},
    {},
    _targets
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _action] call ACE_Interact_Menu_fnc_addActionToObject;
