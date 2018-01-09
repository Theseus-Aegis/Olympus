#include "script_component.hpp"

// environmentController eventHandlers
[QGVAR(setTime), {
    skipTime ((_this select 0) - daytime + 24 ) % 24; // Skip forward to a specific
    forceWeatherChange;
    ["Environment changed!"] call ace_common_fnc_displayTextStructured;
}] call CBA_fnc_addEventHandler;

[QGVAR(setDate), {
    setDate (_this select 0); // Set date
    forceWeatherChange;
    ["Environment changed!"] call ace_common_fnc_displayTextStructured;
}] call CBA_fnc_addEventHandler;

[QGVAR(setFog), {
    1 setFog (_this select 0); // Set fog
    forceWeatherChange;
    ["Environment changed!"] call ace_common_fnc_displayTextStructured;
}] call CBA_fnc_addEventHandler;
