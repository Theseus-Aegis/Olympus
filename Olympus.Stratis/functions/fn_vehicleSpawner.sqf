#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Vehicle spawner
 *
 * Arguments:
 * 0: Controller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, spawnPad] call TAC_Olympus_fnc_vehicleSpawner
 */

params ["_controller", "_spawnPos"];

private _spawnAction = [
    QGVAR(SpawnVehicle),
    "Spawn Vehicle",
    "",
    {},
    {true},
    {
        (_this select 2) params ["_controller", "_spawnPos"];

        private _allowedVehicles = [
            // ["classname", "fancyName"]
            ["tacs_Arcadian_B_Black", "Arcadian GT (Black)"],
            ["tacs_Arcadian_B_Green", "Arcadian GT (Green)"],
            ["tacs_Arcadian_B_Tan", "Arcadian GT (Tan)"],
            ["tacs_BWA3_B_Eagle_Black", "Eagle IV (Black)"],
            ["B_LSV_01_unarmed_F", "Polaris DAGOR"],
            ["C_SUV_01_F", "SUV"],
            ["C_Offroad_01_F", "Offroad"],
            ["C_Offroad_01_covered_F", "Offroad (Covered)"],
            ["C_Offroad_02_unarmed_F", "Jeep Wrangler"],
            ["CUP_C_Golf4_kitty_Civ", "Golf"], // Tyrone made me do this
            ["C_Van_02_transport_F", "Van Transport"]
        ];

        private _actions = [];
        {
            _x params ["_classname", "_fancyName"];

            private _spawnAction = [
                format [QGVAR(spawnAction_%1), _classname],
                format ["Spawn %1", _fancyName],
                "",
                {
                    (_this select 2) params ["_controller", "_spawnPos", "_classname", "_fancyName"];

                    if (count (_spawnPos nearEntities 5) == 1) then {
                        private _spawnedVehicle = createVehicle [_classname, _spawnPos, [], 0, "CAN_COLLIDE"];
                        _spawnedVehicle setDir 60;

                        private _spawnedVehicles = _controller getVariable [QGVAR(spawnedVehicles), []];
                        _spawnedVehicles pushBack [_spawnedVehicle, name player, _fancyName];
                        _controller setVariable [QGVAR(SpawnedVehicles), _spawnedVehicles, true];
                    } else {
                        ["Could not spawn vehicle, there is already a vehicle on the spawn position", 1.5, ace_player, 15] call ACEFUNC(common,displayTextStructured);
                    };
                },
                {true},
                {},
                [_controller, _spawnPos, _classname, _fancyName]
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
    {},
    {
        (_this select 2) params ["_controller"];

        private _spawnedVehicles = _controller getVariable [QGVAR(spawnedVehicles), []];
        !(_spawnedVehicles isEqualTo [])
    },
    {
        (_this select 2) params ["_controller"];

        private _spawnedvehicles = _controller getVariable [QGVAR(spawnedVehicles), []];

        private _actions = [];
        {
            _x params ["_vehicle", "_playerName", "_vehicleFancyName"];

            private _removeAction = [
                format [QGVAR(removeAction_%1), _vehicle],
                format ["Remove %1 (%2)", _vehicleFancyName, _playerName],
                "",
                {
                    (_this select 2) params ["_controller", "_vehicle", "_playerName", "_vehicleFancyName"];

                    if ((count (crew _vehicle)) == 0) then {
                        deleteVehicle _vehicle;
                        private _spawnedvehicles = _controller getVariable [QGVAR(spawnedVehicles), []];
                        _spawnedvehicles deleteAt (_spawnedVehicles find [_vehicle, _playerName, _vehicleFancyName]);
                        _controller setVariable [QGVAR(spawnedVehicles), _spawnedvehicles, true];
                    } else {
                        ["Could not delete vehicle, there are still people in the vehicle", 1.5, ace_player, 15] call ACEFUNC(common,displayTextStructured);
                    };
                },
                {true},
                {},
                [_controller, _vehicle, _playerName, _vehicleFancyName]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_removeAction, [], _controller];
        } forEach _spawnedVehicles;

        _actions
    },
    [_controller]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _removeAction] call ACEFUNC(interact_menu,addActionToObject);
