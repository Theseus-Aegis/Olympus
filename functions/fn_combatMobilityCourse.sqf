/*
 * Author: Jonpas
 *
 * Handles the Movement Course.
 *
 * Arguments:
 * 0: New Timer Status (String)
 *
 * Return Value:
 * None
 */

#define COURSE_NAME "Combat Mobility Course"

_desiredStatus = _this select 0;
_startObj = move_startObj; // Starting location object
_endObj = move_endObj; // Finishing location object
_timeToFinish = 100; // Time until countdown

/**********************************************
  Course Started
**********************************************/

if (_desiredStatus == "start" && {isNil{player getVariable "TAC_mobilityCourse_startTime"}}) then {
  // Disable movement
  player switchMove "HubSpectator_stand";
  // Teleport to start position
  player setPosASL (getPosASL _startObj);
  // Countdown
  hint "Prepare!"; sleep 1;
  hint "3"; sleep 1;
  hint "2"; sleep 1;
  hint "1"; sleep 1;
  hint "GO!";
  // Enable movement
  player switchMove "AmovPercMstpSrasWrflDnon";

  // Put start time into a variable
  player setVariable ["TAC_mobilityCourse_startTime", time];

  /**********************************************
    Wait until Finish reached or Timed Out
  **********************************************/
  waitUntil {isNil{player getVariable "TAC_mobilityCourse_startTime"} || {time > (player getVariable "TAC_mobilityCourse_startTime") + _timeToFinish} || {player distance _endObj < 0.4}};

  // Exit if start time variable is nil
  if (isNil{player getVariable "TAC_mobilityCourse_startTime"}) exitWith {};

  // Exit if start timed out
  if (time > (player getVariable "TAC_mobilityCourse_startTime") + _timeToFinish) exitWith {
    hint "Last initiated course timed out!";
    player setVariable ["TAC_mobilityCourse_startTime", nil]; // Set start time variable to nil (for IF checks in this function)
  };

  /**********************************************
    Finished
  **********************************************/
  _completedTime = time - (player getVariable "TAC_mobilityCourse_startTime");

  hint format["You completed the %1 in \n%2 seconds!", COURSE_NAME, _completedTime];
  // BIS_fnc_MP necessary - 'systemChat' Effect = Local
  [format["%1 completed the %2 in %3 seconds!", name player, COURSE_NAME, _completedTime], "systemChat", nil, false] call BIS_fnc_MP;

  // Chronos stuff comes here

  // Set start time variable to nil (for IF checks in this function)
  player setVariable ["TAC_mobilityCourse_startTime", nil];
};

/**********************************************
  Course Failed
**********************************************/
if (_desiredStatus == "fail" && {!isNil{player getVariable "TAC_mobilityCourse_startTime"}}) then {
  hint "You failed the course!";
  // Set start time variable to nil (for IF checks in this function)
  player setVariable ["TAC_mobilityCourse_startTime", nil];
};


/**********************************************
  Course Stopped
**********************************************/
if (_desiredStatus == "fail" && {!isNil{player getVariable "TAC_mobilityCourse_startTime"}}) then {
  hint "You stopped the course!";
  // Set start time variable to nil (for IF checks in this function)
  player setVariable ["TAC_mobilityCourse_startTime", nil];
};
