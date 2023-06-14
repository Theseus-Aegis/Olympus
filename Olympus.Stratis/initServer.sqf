#include "script_component.hpp"

[{
    //Removes corpse after disconnect.
    addMissionEventHandler ["HandleDisconnect", {
        deleteVehicle (_this select 0);
    }];

    GVAR(spawnedVehiclesNamespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(spawnedVehiclesNamespace);

    // Server Control Event Handlers
    [QGVAR(restartMission), {
        if (!isServer) exitWith {};

        params ["_player"];

        private _alone = count (call CBA_fnc_players) <= 1;

        if (_alone) then {
            INFO_2("Restarting mission (requested by: %1 - %2)!",name _player,getPlayerUID _player);
            private _success = #SERVER_COMMAND_PASSWORD serverCommand "#restart";
            if (!_success) then {
                ERROR_2("Failed to restart mission (requested by: %1 - %2)!",name _player,getPlayerUID _player);
                [QGVAR(notify), ["Failed to restart mission!"], _player] call CBA_fnc_targetEvent;
            };
        } else {
            ERROR_2("Denied request to restart mission (requested by: %1 - %2)!",name _player,getPlayerUID _player);
            [QGVAR(notify), ["You may only restart mission if you are alone on the server!"], _player] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;

    [QGVAR(switchMission), {
        if (!isServer) exitWith {};

        params ["_player", "_mission"];

        private _alone = count (call CBA_fnc_players) <= 1;
        private _allowedMission = ALLOWED_MISSIONS findIf {_mission == _x select 0} > -1;

        if (_alone && {_allowedMission}) then {
            INFO_3("Switching mission to '%3' (requested by: %1 - %2)!",name _player,getPlayerUID _player,_mission);
            private _success = #SERVER_COMMAND_PASSWORD serverCommand (format ["#mission %1", _mission]);
            if (!_success) then {
                ERROR_2("Failed to switch mission (requested by: %1 - %2)!",name _player,getPlayerUID _player);
                [QGVAR(notify), ["Failed to switch mission!"], _player] call CBA_fnc_targetEvent;
            };
        } else {
            ERROR_3("Denied request to switch mission to '%3' (requested by: %1 - %2)!",name _player,getPlayerUID _player,_mission);
            [QGVAR(notify), ["You may only switch mission if you are alone on the server!"], _player] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_directCall;
