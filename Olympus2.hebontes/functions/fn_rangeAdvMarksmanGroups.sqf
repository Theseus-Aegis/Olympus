/*
 * Author: Jonpas
 * Spawns moving units for Advanced Marksman range
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Markers units will walk in (from closest to furthest) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, ["area1", "area2", "area3"]] call TAC_Olympus_fnc_rangeAdvMarksmanGroups
 */
#include "..\script_component.hpp"

params ["_controller", "_patrolAreas"];

// Exit if marker names are invalid
private _patrolAreasTest = _patrolAreas select {getMarkerColor _x == ""};
if !(_patrolAreasTest isEqualTo []) exitWith {
    diag_log format ["%1 Patrol Area markers do not exist!", _patrolAreasTest]
    //ERROR_1("%1 Patrol Area markers do not exist!",_patrolAreasTest);
};

TRACE_1("areas",_patrolAreas);
GVAR(advMarksmanTargetGroups) = call CBA_fnc_createNamespace;

{
    private _level = ["Close", "Medium", "Far"] select _forEachIndex;

    private _actionSpawn = [
        format [QGVAR(advMarksmanTargetsSpawn%1), _level],
        format ["Spawn Moving Targets - %1", _level],
        "",
        {
            (_this select 2) params ["_level", "_patrolArea"];

            // Find spawn position
            private _position = [_patrolArea] call CBA_fnc_randPosArea;

            // Spawn units
            private _group = createGroup east;
            private _hvt = _group createUnit ["O_MU_islam_AT_F", _position, [], 0, "FORM"];
            _group createUnit ["O_MU_islam_R1_F", _position, [], 0, "FORM"];
            _group createUnit ["O_MU_islam_R2_F", _position, [], 0, "FORM"];

            // Prepare units
            {
                _x disableAI "AUTOTARGET";
                _x disableAI "AUTOCOMBAT";
            } forEach (units _group);

            // Add killed EH to remove all others from that group when HVT is killed
            _hvt addEventHandler ["Killed", {
                private _group = group (_this select 0);
                {
                    deleteVehicle _x;
                } forEach (units _group);
                deleteGroup _group;
            }];

            // Start patrolling
            [_group, _patrolArea, "SAFE", "BLUE", "LIMITED", "COLUMN"] call CBA_fnc_taskSearchArea;

            // Save variable for removal
            GVAR(advMarksmanTargetGroups) setVariable [_level, _group];
        },
        {
            (_this select 2) params ["_level"];
            isNull ([GVAR(advMarksmanTargetGroups) getVariable _level] param [0, grpNull]);
        },
        {},
        [_level, _x]
    ] call ace_interact_menu_fnc_createAction;

    private _actionDespawn = [
        format [QGVAR(advMarksmanTargetsDespawn%1), _level],
        format ["Despawn Moving Targets - %1", _level],
        "",
        {
            (_this select 2) params ["_level"];

            private _group = [GVAR(advMarksmanTargetGroups) getVariable _level] param [0, grpNull];
            // Remove units and group
            {
                deleteVehicle _x;
            } forEach (units _group);
            deleteGroup _group;

            // Mark removed
            GVAR(advMarksmanTargetGroups) setVariable [_level, grpNull];
        },
        {
            (_this select 2) params ["_level"];
            !isNull ([GVAR(advMarksmanTargetGroups) getVariable _level] param [0, grpNull]);
        },
        {},
        [_level]
    ] call ace_interact_menu_fnc_createAction;

    [_controller, 0, ["ACE_MainActions"], _actionSpawn] call ace_interact_menu_fnc_addActionToObject;
    [_controller, 0, ["ACE_MainActions"], _actionDespawn] call ace_interact_menu_fnc_addActionToObject;
} forEach _patrolAreas;
