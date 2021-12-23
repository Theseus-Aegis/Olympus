#include "..\..\script_component.hpp"
/*
 * Author: alganthe, JoramD
 * Shows instructor info display with subject medical information.
 *
 * Arguments:
 * 0: Stretchers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_stretchers] call TAC_Olympus_Medical_fnc_instructorDisplay
 */

params ["_stretchers"];

GVAR(instructorDisplayToggle) = true;
[{
    params ["_args", "_pfhID"];
    _args params ["_stretchers"];

    if (!GVAR(instructorDisplayToggle)) then {
        hintSilent "";
        GVAR(instructorDisplayToggle) = nil;
        _pfhID call CBA_fnc_removePerFrameHandler;
    } else {
        private _completeText = [];
        {
            _x params ["_stretcher", "_subjectName"];

            private _medSubject = _stretcher getVariable [format [QGVAR(medSubject_%1), _stretcher], []];

            if (_medsubject isEqualTo []) then {
                _completeText pushBack format ["<t align='center' size='1.8'>Subject %1</t><br/><t align='center' size='1.4'>Not present</t><br/>", _subjectName];
            } else {
                // Retrieve medical data first
                private _HR = _medSubject getVariable "ace_medical_heartRate";
                private _BP = _medSubject getVariable "ace_medical_bloodPressure";
                private _bloodVolume = (_medSubject getVariable "ace_medical_bloodVolume") / 6 * 100;
                private _pain = _medSubject getVariable "ace_medical_pain";
                private _isUnconscious = _medSubject getVariable "ace_isUnconscious";
                private _ivFluids = 0;
                {
                    _x params ["_amount"];
                    _ivFluids = _ivFluids + _amount;
                } forEach (_medSubject getVariable ["ace_medical_ivBags", []]);
                _ivFluids = _ivFluids toFixed 0;
                private _isDead = !alive _medSubject;

                private _roundBabyRoundRound = {
                    params ["_n"];
                    round (_n * 100) / 100
                };

                private _text = format [
                    "<t align='center' size='1.8'>%1</t><br/>
                    <t align='left' size='1.4'>Heart rate:</t><t align='right' size='1.4'>%2</t><br/>
                    <t align='left' size='1.4'>Blood pressure:</t><t align='right' size='1.4'>%3 / %4</t><br/>
                    <t align='left' size='1.4'>Blood volume:</t><t align='right' size='1.4'>%5</t><br/>
                    <t align='left' size='1.4'>Pain level:</t><t align='right' size='1.4'>%6</t><br/>
                    <t align='left' size='1.4'>Unconscious:</t><t align='right' size='1.4'>%7</t><br/>
                    <t align='left' size='1.4'>IV fluids:</t><t align='right' size='1.4'>%8ml</t><br/>
                    <t align='left' size='1.4'>Dead:</t><t align='right' size='1.4'>%9</t><br/>",

                    ["Subject", _subjectName] joinString " ",
                    _HR call _roundBabyRoundRound,
                    _BP select 1 call _roundBabyRoundRound,
                    _BP select 0 call _roundBabyRoundRound,
                    [_bloodVolume call _roundBabyRoundRound, "%"] joinString "",
                    _pain call _roundBabyRoundRound,
                    _isUnconscious,
                    _ivFluids,
                    _isDead
                ];
                _completeText pushBack _text;
            };
        } forEach _stretchers;

        hintSilent parseText (_completeText joinString "");
    };
}, 0, [_stretchers]] call CBA_fnc_addPerFrameHandler;
