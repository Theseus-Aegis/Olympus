#include "..\script_component.hpp"
/*
 * Author: JoramD, Jonpas
 * Loads available items using ApolloClient extension and fills arsenal.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, _this] call TAC_Olympus_fnc_personalArsenal
 */

params ["_player", "_crate"];

// Create custom arsenal action
private _action = [
    QGVAR(personalArsenal),
    "Personal Arsenal",
    "",
    {
        params ["_target", "_player"];

        private _accessibleItems = [];

        TRACE_1("Loading Client",_player);
        private _success = false;

        private _loadData = "tac_apollo_client" callExtension format ["%1%2", "getAccessibleItemClasses", getPlayerUID _player];
        TRACE_1("Load Data Start",_loadData);

        if (_loadData == "loaded") then {
            private _updateInfo = true;
            while {_updateInfo} do {
                private _loadData = "tac_apollo_client" callExtension "get";
                TRACE_1("Load Data",_loadData);

                if (_loadData == "error") then {
                    // Bad things happened, stop executing
                    _updateInfo = false;
                } else {
                    if (_loadData == "done") then {
                        // Initialization complete
                        _updateInfo = false;
                        _success = true;
                    } else {
                        // Add items to array
                        _accessibleItems pushBack _loadData;
                    };
                };
            };
        };

        if (_success) then {
            // Match config case
            _accessibleItems = _accessibleItems apply {configName (_x call CBA_fnc_getItemConfig)};

            // Add items to arsenal
            [_target, _accessibleItems] call ACEFUNC(arsenal,addVirtualItems);

            [_target, _player, false] call ACEFUNC(arsenal,openBox);

            INFO_1("Personal Arsenal loaded successfuly.");
        } else {
            ERROR_2("Failed to load available items for personalArsenal (Name: %1 - UID: %2)!",profileName,getPlayerUID _player);
            ["Could not load available items for Personal Arsenal"] call CBA_fnc_notify;
        };
    },
    {true}
] call ACEFUNC(interact_menu,createAction);

// Add custom arsenal action to object
[_crate, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
