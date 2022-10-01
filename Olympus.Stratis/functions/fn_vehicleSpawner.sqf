#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Vehicle spawner
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Spawn Position <OBJECT>
 * 2: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, spawnPad, "ground"] call TAC_Olympus_fnc_vehicleSpawner
 */

params ["_controller", "_spawnPos", "_type"];

private _groundVehicles = [
    // "classname"
    "tacs_Arcadian_B_Black",
    "tacs_Arcadian_B_Green",
    "tacs_Arcadian_B_Tan",
    "tacs_Polaris_B_Black",
    "C_SUV_01_F",
    "tacs_Offroad_B_Black",
    "C_Offroad_01_covered_F", // Replace with Theseus variant when it releases
    "C_Offroad_02_unarmed_F",
    "tacs_Van_Transport_B_Black"
];

private _airVehicles = [
    // "classname"
    "tacs_MELB_B_MH6M_Theseus_Black",
    "tacs_MELB_B_AH6M_L_Theseus_Black",
    "tacs_MELB_B_AH6M_M_Theseus_Black",
    "tacs_MELB_B_AH6M_H_Theseus_Black",
    "tacs_Heli_B_Wildcat_Theseus_Unarmed",
    "tacs_Heli_B_Wildcat_Theseus",
    "CUP_B_UH60M_US",
    "B_Heli_Transport_03_F",
    "C_Plane_Civil_01_racing_F",
    "B_T_VTOL_01_vehicle_F"
];

private _seaVehicles = [
    // "classname"
    "CUP_B_RHIB_HIL",
    "tacs_RHIB_B_Theseus_Black",
    "B_Boat_Transport_01_F",
    "C_Scooter_Transport_01_F"
];

private _allowedVehicles = [];
switch (_type) do {
    case "ground": { _allowedVehicles = _groundVehicles; };
    case "air": { _allowedVehicles = _airVehicles; };
    case "sea" : { _allowedVehicles = _seaVehicles; };
    default { _allowedVehicles = _groundVehicles; };
};

private _spawnAction = [
    QGVAR(SpawnVehicle),
    "Spawn Vehicle",
    "a3\ui_f\data\gui\rsc\rscdisplayarsenal\spacegarage_ca.paa",
    {},
    {true},
    {
        (_this select 2) params ["_controller", "_spawnPos", "_allowedVehicles"];

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

                    if (count (_spawnPos nearEntities 5) == 0) then {
                        private _spawnedVehicle = createVehicle [_classname, _spawnPos, [], 0, "CAN_COLLIDE"];
                        _spawnedVehicle setDir (getDir _spawnPos);
                        clearItemCargoGlobal _spawnedVehicle;
                        clearBackpackCargoGlobal _spawnedVehicle;
                        clearWeaponCargoGlobal _spawnedVehicle;
                        clearMagazineCargoGlobal _spawnedVehicle;
                        _spawnedVehicle addItemCargoGlobal ["ToolKit", 1];
                        if (_object isKindOf "LandVehicle") then {
                            ["ACE_Wheel", _spawnedVehicle] call ACEFUNC(cargo,loadItem);
                            ["ACE_Wheel", _spawnedVehicle] call ACEFUNC(cargo,loadItem);
                        };

                        private _spawnedVehicles = GVAR(spawnedVehiclesNamespace) getVariable [QGVAR(spawnedVehicles), []];
                        _spawnedVehicles pushBack [_spawnedVehicle, name player];
                        GVAR(spawnedVehiclesNamespace) setVariable [QGVAR(SpawnedVehicles), _spawnedVehicles, true];
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
    [_controller, _spawnPos, _allowedVehicles]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _spawnAction] call ACEFUNC(interact_menu,addActionToObject);

private _removeAction = [
    QGVAR(RemoveVehicle),
    "Remove Vehicle",
    "z\ace\addons\arsenal\data\iconclearcontainer.paa",
    {},
    {
        (_this select 2) params ["_controller"];

        private _spawnedVehicles = GVAR(spawnedVehiclesNamespace) getVariable [QGVAR(spawnedVehicles), []];
        _spawnedVehicles = _spawnedVehicles select {!isNull (_x select 0)};
        GVAR(spawnedVehiclesNamespace) setVariable [QGVAR(spawnedVehicles), _spawnedvehicles, true];

        !(_spawnedVehicles isEqualTo [])
    },
    {
        (_this select 2) params ["_controller"];

        private _spawnedvehicles = GVAR(spawnedVehiclesNamespace) getVariable [QGVAR(spawnedVehicles), []];

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

                    if ((fullCrew _vehicle) select {alive (_x select 0)} isEqualTo []) then {
                        deleteVehicle _vehicle;
                        private _spawnedvehicles = GVAR(spawnedVehiclesNamespace) getVariable [QGVAR(spawnedVehicles), []];
                        _spawnedvehicles deleteAt (_spawnedVehicles find [_vehicle, _playerName]);
                        GVAR(spawnedVehiclesNamespace) setVariable [QGVAR(spawnedVehicles), _spawnedvehicles, true];
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
