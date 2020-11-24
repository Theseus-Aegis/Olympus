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

        private _accessibleItems = ["getAccessibleItemClasses", _player] call TACFUNC(apollo,getPlayerInfo);

        // Match config case
        _accessibleItems = _accessibleItems apply {configName (_x call CBA_fnc_getItemConfig)};

        // Add items to arsenal
        [_target, _accessibleItems] call ACEFUNC(arsenal,addVirtualItems);

        [_target, _player, false] call ACEFUNC(arsenal,openBox);

        INFO("Personal Arsenal loaded successfuly.");
    },
    {true}
] call ACEFUNC(interact_menu,createAction);

// Add custom arsenal action to object
[_crate, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
