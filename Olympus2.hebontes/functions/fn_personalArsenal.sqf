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
 * [{!isNull player}, {[player, _this] call TAC_Olympus_fnc_personalArsenal}, this] call CBA_fnc_waitUntilAndExecute;
 */
#include "..\script_component.hpp"

params ["_player", "_crate"];

private _accessibleItems = [];
private _accessibleItemsFixed = [];

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
    {
        private _fixedClassname = configName (_x call CBA_fnc_getItemConfig);
        _accessibleItemsFixed pushBack _fixedClassname
    } forEach _accessibleItems;

    copyToClipboard str _accessibleItemsFixed;



    // Add items to arsenal
    [_crate, _accessibleItemsFixed] call ace_arsenal_fnc_addVirtualItems;

    // Create custom arsenal action
    private _action = [
        QGVAR(personalArsenal),
        "Personal Arsenal",
        "",
        {
            params ["_target", "_player"];
            [_target, _player, false] call ace_arsenal_fnc_openBox
        },
        {true}
    ] call ace_interact_menu_fnc_createAction;

    // Add custom arsenal action to object
    [_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    INFO_1("Personal Arsenal loaded successfuly.");
} else {
    ERROR_2("Failed to load available items for personalArsenal (Name: %1 - UID: %2)!",profileName,getPlayerUID _player);
    ["Could not load available items for Personal Arsenal", 1.5, ace_player, 10] call ace_common_fnc_displayTextStructured
};