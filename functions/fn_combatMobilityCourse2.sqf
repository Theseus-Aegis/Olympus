/*
Author: Rory

Function: Add a timer activated by action and ended by "trigger"

Arguments:
0: New timer status (String)
1: Controller (interaction object)
2: Startpoint (helper object)
3: Endpoint (helper object)

*/

params ["_timer","_controller","_startMarker","_endMarker"];

_controller addAction ["Start Course", {

    if (_timer == "start" && {isNil{player getVariable "courseTimer"}}) then {
      player switchMove "HubSpectator_stand";
      player setPosASL (getPosASL _startMarker);

      [
      {hint "Get ready!"},
      [],
      3,
      ] call ace_common_fnc_waitAndExecute;

    };

}];
