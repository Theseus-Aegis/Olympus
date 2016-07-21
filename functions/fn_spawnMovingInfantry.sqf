
#include "..\script_component.hpp"

params ["_controller","_spawnPoint","_wayPoint"];


private _action = [
    QGVAR(movingTargets1),
    "Spawn Group 1",
    "",
    {
          _group = createGroup EAST;
          _group setVariable ["testVariable", nil, false];
          "O_MU_islam_AT_F" createUnit [infantrySpawnMarker3_3, _group,
          "
          this disableAI 'AUTOTARGET';
          this disableAI 'AUTOCOMBAT';
          this addEventHandler ['killed', hint 'Killed by %3'];
          ",
          0.5,
          "PRIVATE"
          ];
          "O_MU_islam_R1_F" createUnit [infantrySpawnMarker3_1, _group,
          "
          this disableAI 'AUTOTARGET';
          this disableAI 'AUTOCOMBAT';
          this addEventHandler ['killed', hint 'Killed by %2'];
          ",
          0.5,
          "LIEUTENANT"
          ];
          "O_MU_islam_R2_F" createUnit [infantrySpawnMarker3_2, _group,
          "
          this disableAI 'AUTOTARGET';
          this disableAI 'AUTOCOMBAT';
          this addEventHandler ['killed', hint 'Killed by %1'];
          ",
          0.5,
          "PRIVATE"
          ];
          _group setCombatMode "BLUE";
          _group setBehaviour "SAFE";
          _group setFormation "FILE";

          _group move (getposASL infantryWaypoint3_1);
          _group deleteVehicle (getVariable ["testVariable", nil]);
    },
    {true},
    {}
] call ACE_Interact_Menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _action] call ACE_Interact_Menu_fnc_addActionToObject;
