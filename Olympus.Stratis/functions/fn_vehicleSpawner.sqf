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

// Make empty marker for featureOverview
createMarker [QGVAR(vehicleSpawnerMarker), _controller];

private _spawnAction = [
    QGVAR(SpawnVehicle),
    "Spawn Vehicle",
    "",
    {},
    {true},
    {
        (_this select 2) params ["_controller", "_spawnPos"];

        private _allowedVehicles = [
            // "classname"
            "tacs_Arcadian_B_Black",
            "tacs_Arcadian_B_Green",
            "tacs_Arcadian_B_Tan",
            "tacs_BWA3_B_Eagle_Black",
            "B_LSV_01_unarmed_F",
            "C_SUV_01_F",
            "C_Offroad_01_F",
            "C_Offroad_01_covered_F",
            "C_Offroad_02_unarmed_F",
            "C_Van_02_transport_F"
        ];

        private _actions = [];
        {
            _x params ["_classname"];
            private _vehicleName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

            private _spawnAction = [
                format [QGVAR(spawnAction_%1), _classname],
                format ["Spawn %1", _vehicleName],
                "",
                {
                    (_this select 2) params ["_controller", "_spawnPos", "_classname"];

                    if (count (_spawnPos nearEntities 5) == 1) then {
                        private _spawnedVehicle = createVehicle [_classname, _spawnPos, [], 0, "CAN_COLLIDE"];
                        _spawnedVehicle setDir 60;
                        clearItemCargoGlobal _spawnedVehicle;
                        clearBackpackCargoGlobal _spawnedVehicle;
                        clearWeaponCargoGlobal _spawnedVehicle;
                        clearMagazineCargoGlobal _spawnedVehicle;
                        _spawnedVehicle addItemCargoGlobal ["ToolKit", 1];
                        ["ACE_Wheel", _spawnedVehicle] call ACEFUNC(cargo,loadItem);
                        ["ACE_Wheel", _spawnedVehicle] call ACEFUNC(cargo,loadItem);

                        private _spawnedVehicles = _controller getVariable [QGVAR(spawnedVehicles), []];
                        _spawnedVehicles pushBack [_spawnedVehicle, name player];
                        _controller setVariable [QGVAR(SpawnedVehicles), _spawnedVehicles, true];
                    } else {
                        ["Could not spawn vehicle, there is already a vehicle on the spawn position"] call CBA_fnc_notify;
                    };
                },
                {true},
                {},
                [_controller, _spawnPos, _classname, _vehicleName]
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
            _x params ["_vehicle", "_playerName"];
            private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

            private _removeAction = [
                format [QGVAR(removeAction_%1), _vehicle],
                format ["Remove %1 (%2)", _vehicleName, _playerName],
                "",
                {
                    (_this select 2) params ["_controller", "_vehicle", "_playerName"];

                    if ((crew _vehicle) isEqualTo []) then {
                        deleteVehicle _vehicle;
                        private _spawnedvehicles = _controller getVariable [QGVAR(spawnedVehicles), []];
                        _spawnedvehicles deleteAt (_spawnedVehicles find [_vehicle, _playerName]);
                        _controller setVariable [QGVAR(spawnedVehicles), _spawnedvehicles, true];
                    } else {
                        ["Could not delete vehicle, there are still people in the vehicle"] call CBA_fnc_notify;
                    };
                },
                {true},
                {},
                [_controller, _vehicle, _playerName]
            ] call ACEFUNC(interact_menu,createAction);

            _actions pushBack [_removeAction, [], _controller];
        } forEach _spawnedVehicles;

        _actions
    },
    [_controller]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _removeAction] call ACEFUNC(interact_menu,addActionToObject);
