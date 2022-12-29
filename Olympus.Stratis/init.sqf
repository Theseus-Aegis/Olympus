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

    // Medical Event Handlers
    [QGVAR(disableAI), {
        (_this select 0) disableAI "ALL";
    }] call CBA_fnc_addEventHandler;

    [QGVAR(applyDamage), {
        _this call ace_medical_fnc_addDamageToUnit;
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_directCall;
