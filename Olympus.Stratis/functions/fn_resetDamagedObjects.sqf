#include "..\script_component.hpp"
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

                [
                    {
                        params ["_type", "_position", "_targets", "_index"];
                        private _newTarget = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
                        _newTarget setVehicleLock "LOCKED";
                        _newTarget setVehicleAmmo 0;
                        clearMagazineCargoGlobal _newTarget;
                        clearWeaponCargoGlobal _newTarget;
                        clearItemCargoGlobal _newTarget;
                        _targets set [_index, _newTarget];
                    },
                    [_type, _position, _targets, _forEachIndex],
                    2
                ] call CBA_fnc_waitAndExecute;
            };
        } forEach _targets;
    },
    {true},
    {},
    _targets
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
