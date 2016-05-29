/*
 * Author: Rory
 * Closes all open doors in the killhouse.
 *
 * Arguments:
 * none

 * Return Value:
 * None
 *
 * Example:
 * [this] call TAC_Olympus_fnc_closeKillhouseDoors
 */

 params ["_doorController"];

 _doorController addAction ["Close Doors",
   {
    _this animate ["Door1", 0];
    _this animate ["Door2", 0];
    _this animate ["Door4", 0];
    _this animate ["Door3", 0];
    _this animate ["Door5", 0];
    _this animate ["Door6", 0];
    _this animate ["Door7", 0];
    _this animate ["Gate_L", 0];
    _this animate ["Gate_R", 0];
   },nil,1,false];
