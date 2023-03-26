#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Allows controlling server (restart and switch missions).
 *
 * Arguments:
 * 0: Interaction object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_serverControl
 */

params ["_controller"];

// Restart
private _restartAction = [
    QGVAR(restartAction),
    "Restart Mission",
    "a3\missions_f_oldman\data\img\weathermanager\weather_day_0_ca.paa", // TODO
    {
        params ["", "_player"]
        [QGVAR(restartServer), [_player]] call CBA_fnc_serverEvent;
    },
    {true}
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _restartAction] call ACEFUNC(interact_menu,addActionToObject);

// Switch Mission
private _switchMissionAction = [
    QGVAR(switchMissionAction),
    "Switch to Icarus", // "Switch Mission",
    "a3\missions_f_oldman\data\img\weathermanager\weather_day_0_ca.paa", // TODO
    {
        params ["", "_player"]
        [QGVAR(switchMission), [_player, "icarus.altis"]] call CBA_fnc_serverEvent;
    },
    {true},
    {
        // Uncomment if we ever have more than 1 mission to switch to
        //private _actions = [];
        //{
        //    private _action = [
        //        format [QGVAR(switchMission_%1), _x],
        //        _y,
        //        "",
        //        {
        //            params ["", "_player", "_mission"]
        //            [QGVAR(switchMission), [_player, _mission]] call CBA_fnc_serverEvent;
        //        },
        //        {true},
        //        {},
        //        _x
        //    ] call ACEFUNC(interact_menu,createAction);
        //
        //    _actions pushBack [_action, [], _target];
        //} forEach (createHashMapFromArray ALLOWED_MISSIONS);
        //
        //_actions
    }
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _switchMissionAction] call ACEFUNC(interact_menu,addActionToObject);
