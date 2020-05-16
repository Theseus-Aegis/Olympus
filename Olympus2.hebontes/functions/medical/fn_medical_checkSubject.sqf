/*
 * Author: JoramD
 * Check if patient is on stretcher. Returns true if subject exists, false if not.
 *
 * Arguments:
 * 0: Stretcher <OBJECT>
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [stretcher] call TAC_Olympus_fnc_medical_checkSubject
 */
#include "..\..\script_component.hpp"

params ["_stretcher"];


private _medSubject = _stretcher getVariable [format [QGVAR(medSubject_%1), _stretcher], []];

!(_medSubject isEqualTo []);
