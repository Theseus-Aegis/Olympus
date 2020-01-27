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
 * 4: Unit Classes <ARRAY>
 * 5: Unit Creation Chance (0 - 100) <NUMBER> (default: 30%)
 * 6: Special Unit Matrix <ARRAY> (default: [])
 *   1: Marker Class <STRING>
 *   2: Special Unit Classes <ARRAY>
 *   3: Special Unit Chance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "MOUT 1", "mout1", 99, ["B_helicrew_F"], 30] call TAC_Olympus_fnc_initMOUT
 * [this, "MOUT 1", "mout1", 99, ["B_helicrew_F"], 30, [["VR_3DSelector_01_complete_F", ["B_soldier_M_F"], 50]]] call TAC_Olympus_fnc_initMOUT
 */
#include "..\script_component.hpp"

params ["_controller", "_name", "_markerBaseName", "_markerCount", "_unitClasses", ["_unitChance", 30], ["_specialUnits", []]];

private _createAction = [
    format [QGVAR(%1_Create), _controller],
    format ["Create %1", _name],
    "",
    {
        params ["_controller", "", "_args"];
        _args params ["_markerBaseName", "_markerCount", "_unitClasses", "_unitChance", "_specialUnits"];

        private _units = [];
        private _specialMarkerClasses = _specialUnits apply {_x select 0};

        // Get marker variables and spawn units
        for "_i" from 0 to (_markerCount - 1) do {
            private _markerName = format ["%1_%2", _markerBaseName, _i];
            private _marker = missionNamespace getVariable [_markerName, objNull];

            if (!isNull _marker) then {
                // Spawn probability
                if (_unitChance >= random 100) then {
                    // Get data from marker
                    private _type = selectRandom _unitClasses;

                    // Special unit
                    private _specialIndex = _specialMarkerClasses find (typeOf _marker);
                    if (_specialIndex != -1) then {
                        (_specialUnits select _specialIndex) params ["", "_specialUnitClasses", "_specialUnitChance"];
                        if (_specialUnitChance >= random 100) then {
                            _type = selectRandom _specialUnitClasses;
                        };
                    };

                    // Spawn unit
                    private _unit = createVehicle [_type, _marker];
                    _units pushBack _unit;
                };
            };
        };

        _controller setVariable [QGVAR(MOUTUnits), _units];
    },
    {
        params ["_controller"];
        (_controller getVariable [QGVAR(MOUTUnits), []]) isEqualTo []
    },
    {},
    [_markerBaseName, _markerCount, _unitClasses, _unitChance, _specialUnits]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _createAction] call ace_interact_menu_fnc_addActionToObject;

private _clearAction = [
    format [QGVAR(%1_Clear), _controller],
    format ["Clear %1", _name],
    "",
    {
        params ["_controller"];

        // Clear units
        {
            deleteVehicle _x;
        } forEach (_controller getVariable [QGVAR(MOUTUnits), []]);

        _controller setVariable [QGVAR(MOUTUnits), []];
    },
    {
        params ["_controller"];
        !((_controller getVariable [QGVAR(MOUTUnits), []]) isEqualTo [])
    }
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _clearAction] call ace_interact_menu_fnc_addActionToObject;
