#include "..\..\script_component.hpp"
/*
 * Author: JoramD
 * Check if patient is on stretcher.
 *
 * Arguments:
 * 0: Stretcher <OBJECT>
 *
 * Return Value:
 * Subject on stretcher exists <BOOL>
 *
 * Example:
 * [stretcher] call TAC_Olympus_Medical_fnc_checkSubject
 */

params ["_stretcher"];

private _medSubject = _stretcher getVariable [format [QGVAR(medSubject_%1), _stretcher], []];

!(_medSubject isEqualTo []);
