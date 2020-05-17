/*
 * Author: JoramD
 * Applies damage and logs info on what damage is applied.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Stretchers <ARRAY>
 * 2: BodyPart <STRING>
 * 3: ProjectileType <STRING>
 * 4: Severity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controller, stretcher, bodyPart, projectileType, severity] call TAC_Olympus_Medical_fnc_specific_applyDamage
 */
#include "..\..\script_component.hpp"

params ["_controller", "_stretcher", "_bodyPart", "_projectileType", "_severity"];


private _medSubject = _stretcher getVariable [format [QGVAR(medSubject_%1), _stretcher], []];

diag_log format ["[Olympus Medical] Adding specific damage: Subject: %1, Bodypart: %2, Projectile: %3, Severity: %4", _medSubject, _bodyPart, _projectileType, _severity];
[QGVAR(applyDamage), [_medSubject, _severity, _bodyPart, _projectileType], _medSubject] call CBA_fnc_targetEvent;
