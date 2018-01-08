#include "script_component.hpp"

// environmentController eventHandlers
[QGVAR(setTime), {skipTime ((_this select 0) - daytime + 24 ) % 24; forceWeatherChange;}] call CBA_fnc_addEventHandler;

[QGVAR(setDate), {setDate (_this select 0); forceWeatherChange;}] call CBA_fnc_addEventHandler;

[QGVAR(setFog), {1 setFog (_this select 0); forceWeatherChange;}] call CBA_fnc_addEventHandler;
