#include "script_component.hpp"

// ACRE2 - Don't take antenna direction into account
[true] call acre_api_fnc_ignoreAntennaDirection;

// ACRE2 - Multiplier for terrain loss (1 = max)
[0.5] call acre_api_fnc_setLossModelScale;
