#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Spawn a vehicle from pre-defined list.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Spawn Position <ARRAY|OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, spawnPos] call TAC_Olympus_fnc_spawnEngineerVehicle
 */

params ["_controller", "_spawnPos"];

private _spawnAction = [
    QGVAR(SpawnVehicle),
    "Spawn Vehicle",
    "",
    {},
    {
        (_this select 2) params ["_controller", "_spawnPos"];

        private _spawnedVehicle = _controller getVariable [QGVAR(spawnedVehicle), []];
        _spawnedVehicle isEqualTo []
    },
    {
        (_this select 2) params ["_controller", "_spawnPos"];

        private _allowedVehicles = [
            // ["classname", "fancyName"]
            ["tacs_BWA3_B_Eagle_Tan", "Eagle IV (Tan)"],
            ["I_MBT_03_cannon_F", "Leopard 2SG"]
        ];

        private _actions = [];
        {
            _x params ["_classname", "_fancyName"];

            private _spawnAction = [
                format [QGVAR(SpawnAction_%1), _classname],
                format ["Spawn %1", _fancyName],
                "",
                {
                    (_this select 2) params ["_controller", "_spawnPos", "_classname"];

                    private _spawnedVehicle = createVehicle [_classname, _spawnPos, [], 0, "CAN_COLLIDE"];
                    _spawnedVehicle setDir 180;
                    _spawnedVehicle setVehicleLock "LOCKED";
                    _spawnedVehicle setVehicleAmmo 0;
                    clearMagazineCargoGlobal _spawnedVehicle;
                    clearWeaponCargoGlobal _spawnedVehicle;
                    clearItemCargoGlobal _spawnedVehicle;

                    _controller setVariable [QGVAR(SpawnedVehicle), _spawnedVehicle, true];
                },
                {true},
                {},
                [_controller, _spawnPos, _classname]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_spawnAction, [], _controller];
        } forEach _allowedVehicles;

        _actions
    },
    [_controller, _spawnPos]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _spawnAction] call ACEFUNC(interact_menu,addActionToObject);

private _removeAction = [
    QGVAR(RemoveVehicle),
    "Remove Vehicle",
    "",
    {
        (_this select 2) params ["_controller"];

        private _spawnedVehicle = _controller getVariable [QGVAR(spawnedVehicle), []];
        deleteVehicle _spawnedVehicle;
        _controller setVariable [QGVAR(SpawnedVehicle), [], true];
    },
    {
        (_this select 2) params ["_controller"];

        private _spawnedVehicle = _controller getVariable [QGVAR(spawnedVehicle), []];
        !(_spawnedVehicle isEqualTo [])
    },
    {},
    [_controller]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _removeAction] call ACEFUNC(interact_menu,addActionToObject);
