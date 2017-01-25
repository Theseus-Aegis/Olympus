#include "script_component.hpp"

// ACRE2 - Don't take antenna direction into account
//[true] call acre_api_fnc_ignoreAntennaDirection;
acre_sys_signal_omnidirectionalRadios = 1; // Temporary workaround for 2.3.0.933 build

// ACRE2 - Multiplier for terrain loss (1 = max)
//[0.5] call acre_api_fnc_setLossModelScale;
acre_sys_signal_terrainScaling = 0.5 // Temporary workaround for 2.3.0.933 build
