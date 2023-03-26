#include "script_component.hpp"
[{
    // Sets ACRE2 channel names
    {
        [_x, "default", "theseus"] call acre_api_fnc_copyPreset;
        [_x, "theseus", 1, "label", "ARES 1"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 2, "label", "ARES 2"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 3, "label", "ARES 3"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 4, "label", "ARES 4"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 5, "label", "COMMAND"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 11, "label", "HELIOS 1"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 12, "label", "HELIOS 2"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 13, "label", "HELIOS 3"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 14, "label", "HELIOS 4"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus", 15, "label", "HELIOS CMND"] call acre_api_fnc_setPresetChannelField;
        [_x, "theseus"] call acre_api_fnc_setPreset;
    } forEach ["ACRE_PRC152", "ACRE_PRC117F"];

    [QGVAR(notify), {
        params ["_message"];
        [_message] call CBA_fnc_notify;
    }] call CBA_fnc_addEventHandler;

    // Environment Control Event Handlers
    [QGVAR(setTime), {
        ["Environment changing..."] call CBA_fnc_notify;

        if (isServer) then {
            skipTime ((_this select 0) - daytime); // Skip time (Server Execution)
        };
        forceWeatherChange;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(setDate), {
        ["Environment changing..."] call CBA_fnc_notify;
        setDate (_this select 0); // Set date (Local Execution)

        if (isServer) then {
            forceWeatherChange;
        };
    }] call CBA_fnc_addEventHandler;

    [QGVAR(setFog), {
        ["Environment changing..."] call CBA_fnc_notify;

        if (isServer) then {
            0 setFog (_this select 0); // Set fog (Server Execution)
            forceWeatherChange;
        };
    }] call CBA_fnc_addEventHandler;

    [QGVAR(setOvercast), {
        ["Environment changing..."] call CBA_fnc_notify;
        0 setOvercast (_this select 0); // Set overcast (Local Execution)

        if (isServer) then {
            forceWeatherChange;
        };
    }] call CBA_fnc_addEventHandler;

    [QGVAR(setRain), {
        ["Environment changing..."] call CBA_fnc_notify;

        if (isServer) then {
            0 setRain (_this select 0); // Set rain (Server Execution)
            forceWeatherChange;
        };
    }] call CBA_fnc_addEventHandler;

    // Server Control Event Handlers
    [QGVAR(restartServer), {
        if (!isServer) exitWith {};

        params ["_player"];

        private _alone = count (call CBA_fnc_players) <= 1;

        if (_alone) then {
            INFO_2("Restarting server (requested by: %1 - %2)!",name _player,getPlayerUID _player);
            private _success = SERVER_COMMAND_PASSWORD serverCommand "#restart";
            if (!_success) then {
                ERROR_2("Failed to restart server (requested by: %1 - %2)!",name _player,getPlayerUID _player);
                [QGVAR(notify), ["Failed to restart server!"], _player] call CBA_fnc_targetEvent;
            };
        } else {
            ERROR_2("Denied request to restart server (requested by: %1 - %2)!",name _player,getPlayerUID _player);
            [QGVAR(notify), ["You may only restart server if you are alone on the server!"], _player] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;

    [QGVAR(switchMission), {
        if (!isServer) exitWith {};

        params ["_player", "_mission"];

        private _alone = count (call CBA_fnc_players) <= 1;
        private _allowedMission = ALLOWED_MISSIONS findIf {_mission == _x select 0} > -1;

        if (_alone && {_allowedMission}) then {
            INFO_3("Switching mission to '%3' (requested by: %1 - %2)!",name _player,getPlayerUID _player,_mission);
            private _success = SERVER_COMMAND_PASSWORD serverCommand (format ["#mission %1", _mission]);
            if (!_success) then {
                ERROR_2("Failed to switch mission (requested by: %1 - %2)!",name _player,getPlayerUID _player);
                [QGVAR(notify), ["Failed to switch mission!"], _player] call CBA_fnc_targetEvent;
            };
        } else {
            ERROR_3("Denied request to switch mission to '%3' (requested by: %1 - %2)!",name _player,getPlayerUID _player,_mission);
            [QGVAR(notify), ["You may only switch mission if you are alone on the server!"], _player] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;

    // Medical Event Handlers
    [QGVAR(disableAI), {
        (_this select 0) disableAI "ALL";
    }] call CBA_fnc_addEventHandler;

    [QGVAR(applyDamage), {
        _this call ace_medical_fnc_addDamageToUnit;
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_directCall;
