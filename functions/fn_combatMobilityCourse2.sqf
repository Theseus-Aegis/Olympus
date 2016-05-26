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

_controller = combatMobilityController;
_startObject = combatMobilityStart;
_endObject = combatMobilityEnd;
_resetTime = 100; // Auto reset course after this time.

_controller addAction ["Start Course", {
    _controller = combatMobilityController;
    _startObject = combatMobilityStart;
    _endObject = combatMobilityEnd;
    _resetTime = 100;
    _controller addAction ["Stop Course",{
          //Stops the course, when its running
          if (!isNil{player getVariable "courseTimer"}) then {
            hint format ["%1 stopped the course!", name player];
            player setVariable ["courseTimer", nil];
          };
    }];

    if (isNil{player getVariable "courseTimer"}) then {
      player switchMove "HubSpectator_stand";
      player setPosASL (getPosASL _startObject);
      hint "Get ready!";

      [
      {hint "3";},
        [],
        3
      ] call ace_common_fnc_waitAndExecute;

      [
        {hint "2";},
        [],
        4
      ] call ace_common_fnc_waitAndExecute;

      [
        {hint "1";},
        [],
        5
      ] call ace_common_fnc_waitAndExecute;

      [
        {
          hint "Go!";
          player switchMove "AmovPercMstpSrasWrflDnon";
          player setVariable ["courseTimer", time];
        },
        [],
        6
      ] call ace_common_fnc_waitAndExecute;

      if (isNil{player getVariable "courseTimer"}) exitWith {};   //Exit if start timed out

      waitUntil {isNil{player getVariable "courseTimer"}
      || {time > (player getVariable "courseTimer") + _resetTime}
      || {player distance _endObject < 0.4}};

      //exit after resetTime is reached
      if (time > (player getVariable "courseTimer") + _resetTime) exitWith {
          hint format ["%1 failed to complete the course", name player];
          player setVariable ["courseTimer", nil];

          _completedTime = time - (player getVariable "courseTimer");
          hint format["%1 completed the course in \n%2 seconds.", name player, _completedTime];
      };
   };
},[],1,false,true];
