/*
 * Author: Jonpas
 * Initialized a MOUT course with randomly spawned AI.
 * Only supports 1 MOUT course per controller!
 *
 * Arguments:
 * 0: Interaction object <OBJECT>
 * 1: Display Name <STRING>
 * 2: Unit Marker Base Name <STRING>
 * 3: Unit Marker Count <NUMBER>
 * 4: Unit Creation Chance (0 - 100) <NUMBER> (default: 30%)
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "MOUT 1", "mout1", 99, 30] call TAC_Olympus_fnc_initMOUT
 */
#include "..\script_component.hpp"

// Define available unit classes to spawn
#define TYPES ["B_helicrew_F"]

params ["_controller", "_name", "_markerBaseName", "_markerCount", "_chance"];

private _createAction = [
    format [QGVAR(%1_Create), _controller],
    format ["Create MOUT %1", _name],
    "",
    {
        (_this select 2) params ["_controller"];

        // Get marker variables and spawn units
        for "_x" from 0 to _markerCount - 1 do {
            private _markerName = format ["%1_%2", _markerBaseName, _x];
            private _marker = missionNamespace getVariable [_markerName, objNull];

            if (!isNull _marker) then {
                // Spawn probability
                if (_chance >= random 100) then {
                    // Get data from marker
                    private _type = selectRandom TYPES;
                    private _pos = getPosASL _marker;

                    private _unit = createVehicle [_type, _pos];
                };
            };
        };

        _controller setVariable [QGVAR(MOUTUnits), _units];
    },
    {
        (_this select 2) params ["_controller"];
        (_controller getVariable [QGVAR(MOUTUnits), []]) isEqualTo []
    },
    {},
    [_controller]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _createAction] call ace_interact_menu_fnc_addActionToObject;

private _clearAction = [
    format [QGVAR(%1_Clear), _controller],
    format ["Clear MOUT %1", _name],
    "",
    {
        (_this select 2) params ["_controller"];

        // Clear units
        {
            deleteVehicle _x;
        } forEach (_controller getVariable [QGVAR(MOUTUnits), []]);

        _controller setVariable [QGVAR(MOUTUnits), []];
    },
    {
        (_this select 2) params ["_controller"];
        !((_controller getVariable [QGVAR(MOUTUnits), []]) isEqualTo [])
    },
    {},
    [_controller]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _createAction] call ace_interact_menu_fnc_addActionToObject;
