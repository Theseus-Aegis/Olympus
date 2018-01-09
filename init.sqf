#include "script_component.hpp"

// environmentController eventHandlers
[QGVAR(setTime), {
    ["Environment changing..."] call ace_common_fnc_displayTextStructured;
    skipTime ((_this select 0) - daytime + 24 ) % 24; // Skip forward to a specific
    forceWeatherChange;
}] call CBA_fnc_addEventHandler;

[QGVAR(setDate), {
    ["Environment changing..."] call ace_common_fnc_displayTextStructured;
    setDate (_this select 0); // Set date
    forceWeatherChange;
}] call CBA_fnc_addEventHandler;

[QGVAR(setFog), {
    ["Environment changing..."] call ace_common_fnc_displayTextStructured;
    1 setFog (_this select 0); // Set fog
    forceWeatherChange;
}] call CBA_fnc_addEventHandler;
