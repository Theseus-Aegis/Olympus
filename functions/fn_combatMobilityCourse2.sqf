/*
Author: Rory

Function: Add a timer activated by action and ended by "trigger"

Arguments:
0: new timer status (String)
1: controller (interaction object)
2: startObject (helper object)
3: endObject (helper object)

time before the course resets automatically: 80 seconds
*/

params ["_controller","_startObject","_endObject"];
_resetTime = 100; // Auto reset course after this time.

_controller addAction ["Start Course", {

    _controller addAction ["Stop Course",{
          //Stops the course, when its running
          if (_timer == "end" && {!isNil{player getVariable "courseTimer"}}) then {
            hint format ["%1 stopped the course!", name player];
            player setVariable ["courseTimer", nil];
          };

}];

    if (_timer == "start" && {isNil{player getVariable "courseTimer"}}) then {
      player switchMove "HubSpectator_stand";
      player setPosASL (getPosASL _startMarker);
      hint "Get ready!";
      [
      {hint "3"},
        [],
        3
      ] call ace_common_fnc_waitAndExecute;
      [
        {hint "2"},
        [],
        1
      ] call ace_common_fnc_waitAndExecute;
      [
        {hint "1"},
        [],
        1
      ] call ace_common_fnc_waitAndExecute;
      [
        {hint "Go!"},
        [],
        1
      ] call ace_common_fnc_waitAndExecute;
      player switchMove "AmovPercMstpSrasWrflDnon";
      player setVariable ["courseTimer", time];

      if (isNil{player getVariable "courseTimer"}) exitWith {};   //Exit if start timed out

      //exit after resetTime is reached
      if (time > (player getVariable "courseTimer") + _resetTime) exitWith {
          hint format ["%1 failed to complete the course", name player];
          player setVariable ["courseTimer", nil];

          _completedTime = time - (player getVariable "courseTimer");
          hint format["%1 completed the course in \n%2 seconds.", name player, _completedTime];
      };
   };
}];
