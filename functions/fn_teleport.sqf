/*
 * Author: Rory
 * Teleports the player from base (this) to teleport locations (objects).
 *
 * Arguments:
 * 0: Main Teleport object. (this)
 * 1: Teleport location object 1 (objectname)
 * 2: Teleport location object 2 (objectname)
 * 3: Teleport location object 3 (objectname)
 * 4: Teleport location object 4 (objectname)
 * 5: Teleport location object 5 (objectname)
 *
 * Return Value:
 * None
 *
 * Example:
 * [baseTeleport,CQB,MG,pole3,pole4,pole5] call TAC_Olympus_fnc_teleport
 */
#include "..\script_component.hpp"

//define interaction points
_tpToBase = teleportBase;
_tpToCQB = teleportCQB;
_tpToMG = teleportMG;
_tpToAdvRifle = teleportAdvRifle;
//array
_interactionPoints = [_tpToBase, _tpToCQB, _tpToMG, _tpToAdvRifle];

//define teleport positions
_tpToBasePos = teleportBasePos;
_tpToCQBPos = teleportCQBPos;
_tpToMGPos = teleportMGPos;
_tpToAdvRiflePos = teleportAdvRiflePos;
//array
_teleportPositions = [_tpToBasePos, _tpToCQBPos, _tpToMGPos, _tpToAdvRiflePos];

//define QGVARS
_qgvar = [Base, CQB, MG, AdvRifle];

{
    _qgvar = [Base, CQB, MG, AdvRifle];
    private _x = [
        format [QGVAR(teleport%1), _qgvar]
        "Teleport to base",
        "",
        {
            ACE_player setPosASL (getPosASL (_this select 2));
        },
        {true},
        {},
        _tpToBase
    ] call ACE_Interact_Menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions"], _teleportToBase] call ACE_Interact_Menu_fnc_addActionToObject;
} forEach _interactionPoints;
