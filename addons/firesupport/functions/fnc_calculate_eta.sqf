/*
 * Author: [Tuntematon]
 * [Description]
 * Update eta values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * [eta number, eta text] number, string
 *
 * Example:
 * [] call tun_firesupport_fnc_calculate_eta
 */
#include "script_component.hpp"

private _listArray = tvCurSel ARTY_LIST_IDC;
private _easting = ctrlText EASTING_IDC;
private _northing = ctrlText NORTHING_IDC;
private _etaText = "NONE";
private _etaNumber = -1;
private _minEta = -1;

if ( count _listArray isEqualTo  2 ) then {
	private _gunModule = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]) call BIS_fnc_objectFromNetId;
	private _ammoModule = (tvData [ARTY_LIST_IDC, _listArray]) call BIS_fnc_objectFromNetId;
	private _magazineClass = _ammoModule getVariable "Ammo";

	private _initSpeed = getNumber (configfile >> "CfgMagazines" >> _magazineClass >> "initSpeed");

	private _trp1Toggle = cbChecked (findDisplay MAIN_IDD displayCtrl TRP1);
	private _trp1Index = lbCurSel TRP1_LIST;
	if (_trp1Toggle) then {
		if (_trp1Index != -1) then {
			private _trp1Values = GVAR(trpValues) select _trp1Index;
			_easting = _trp1Values select 1;
			_northing = _trp1Values select 2;
		} else {
			_easting = "000";
			_northing = "000";
		};
	};

	private _pos = [[_easting, _northing], true] call CBA_fnc_mapGridToPos;
	private _countdown = _gunModule getVariable ["countDown", 60];
	private _distance = _gunModule distance _pos;
	private _minRange= _gunModule getVariable ["minRange", 0];
	private _maxRange = _gunModule getVariable ["maxRange", 10000];

	private _timeToggle  = cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLETIME);
	private _clockTimeAddition = 0;

	_etaText = round (10 +  (_distance / _initSpeed)  * 2  + _countdown);
	_minEta = _etaText;
	if (_timeToggle) then {
		private _daytime = daytime;
		private _hoursIngame = floor _daytime;
		private _minutesIngame = floor ((_daytime - _hoursIngame) * 60);
		private _secondsIngame = floor ((((_daytime - _hoursIngame) * 60) - _minutesIngame) * 60);
		private _totalSecondsIngame = (_hoursIngame * 60 * 60) + (_minutesIngame * 60) + _secondsIngame;

		private _hours = parseNumber ctrlText TIMEHOURS;
		private _minutes = parseNumber ctrlText TIMEMINUTES;
		private _seconds = parseNumber ctrlText TIMESECONDS;
		private _totalSeconds = (_hours * 60 * 60) + (_minutes * 60) + _seconds;

		if (_totalSeconds > _totalSecondsIngame) then { 
			_clockTimeAddition = _totalSeconds - _totalSecondsIngame; 
		} else { 
			_clockTimeAddition = 86400 - _totalSecondsIngame + _totalSeconds; 
		}; 

		if (_clockTimeAddition > _etaText) then {
			_etaText = _clockTimeAddition;
		};
	};

	_etaNumber = _etaText;

	_etaText = if (_etaText isEqualTo  -1) then {
		"CANT FIRE";
	} else {
		[_etaNumber, "MM:SS"] call BIS_fnc_secondsToString;
	};

	if (_distance < _minRange || _distance > _maxRange  ) then {
		_etaText = "Out of Range";
	};

	if (parseNumber ctrlText REMAINIG_AMMO_IDC isEqualTo  "0") then {
		_etaText = "Out of Ammo";
	};

	if (_trp1Index == -1) then {
		_etaText = "No TRP selected";
	};
};

if (GVAR(debug)) then {
	_etaText = "5";
	_etaNumber = 5;
};

[_etaNumber,_etaText, _minEta]