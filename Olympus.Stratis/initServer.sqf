#include "script_component.hpp"

[{
    //Removes corpse after disconnect.
    addMissionEventHandler ["HandleDisconnect", {
        deleteVehicle (_this select 0);
    }];

    GVAR(spawnedVehiclesNamespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(spawnedVehiclesNamespace);
}] call CBA_fnc_directCall;

// Broadcast staff userconfig to clients
GVAR(admins) = [ADMINS];
publicVariable QGVAR(admins);
GVAR(debug_admins) = [DEBUG_ADMINS];
publicVariable QGVAR(debug_admins);
