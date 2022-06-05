/*
 * Author: [Tuntematon]
 * [Description]
 * Firing thing
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_fire
 */
#include "script_component.hpp"

private _listArray = tvCurSel ARTY_LIST_IDC;

//No gun selected
if (count _listArray < 1) exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent localize "STR_tun_firesupport_NoGunSelected";
};

//No ammo selected
if (count _listArray < 2) exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent localize "STR_tun_firesupport_NoAmmoSelected";
};

private _gunModuleID = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]);
private _ammoModuleID = (tvData [ARTY_LIST_IDC, _listArray]);
private _gunModule = _gunModuleID call BIS_fnc_objectFromNetId;
private _ammoModule = _ammoModuleID call BIS_fnc_objectFromNetId;
private _magazineClass = _ammoModule getVariable "Ammo";
private _remainingAmmo = _ammoModule getVariable "currentCount";
private _ammoClass = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");

private _volleyToggle  = cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLEVOLLEY);
private _trp1Toggle = cbChecked (findDisplay MAIN_IDD displayCtrl TRP1);
private _trp2Toggle  = cbChecked (findDisplay MAIN_IDD displayCtrl TRP2);
private _timeToggle  = cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLETIME);
private _easting = ctrlText EASTING_IDC;
private _northing = ctrlText NORTHING_IDC;
private _easting_end = ctrlText EASTING_END_IDC;
private _northing_end = ctrlText NORTHING_END_IDC;
private _shellCount = parseNumber ctrlText COUNT_IDC;
private _radius = parseNumber ctrlText RANGE_IDC;
private _delay = parseNumber ctrlText DELAY_IDC;
private _firing_style = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];

//Due to shit desing, no timed strikes to queue.
if (_gunModule getVariable [QGVAR(is_firing), false] && _timeToggle) exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent localize "STR_tun_firesupport_NoTimedStrikesQueue";
};

private _trp1Index = lbCurSel TRP1_LIST;
private _trp2Index = lbCurSel TRP2_LIST;

//No trp selected
if (((_trp1Index isEqualTo -1) && _trp1Toggle) || ((_trp2Index isEqualTo -1) && _trp2Toggle))exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent localize "STR_tun_firesupport_NoTrpSelected";
};

//Get positions
private _positions = [] call FUNC(getTargetPositon);

if (_positions isEqualTo "fail") exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent "Failed to get firing positions!";
};

_position = _positions select 0;
_positionEnd = _positions select 1;

//Out of range
private _distanceRange = _gunModule distance _position;

private _minRange = _gunModule getVariable ["minRange", 0];
private _maxRange = _gunModule getVariable ["maxRange", 10000];
if (_distanceRange < _minRange || _distanceRange > _maxRange ) exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent localize "STR_tun_firesupport_OutOfRange";
};

//out of ammo
if ( _shellCount <= 0 || _remainingAmmo <= 0) exitWith {
	playSound "3DEN_notificationWarning";
	hintSilent localize "STR_tun_firesupport_NoShells";
};

if (_delay < 0.1) then {
	_delay = 0.1;
};

private _offset = (100 + (1 / (_delay / 10)^2))/100 * _delay * 1.1 - _delay;
private _delay_min = _delay - _offset;
private _delay_max = _delay + _offset;

if (_delay < 2) then {
	_delay_min = _delay - _delay * 0.7;
	_delay_max = _delay + _delay * 1.3;
};

private _values = [] call FUNC(calculate_eta);
private _eta = _values select 0;
private _etaMin = _values select 2;

if (_timeToggle) then {
	_eta = _eta + cba_missiontime;
};

private _firemissionCount = _gunModule getVariable QGVAR(firemissionCount);
private _ammoName = getText (configFile >> "CfgMagazines" >> _magazineClass >> "displayName");
private _name = format ["(%4) %1-%5 [%2:%3]", _firing_style, _easting, _northing, _firemissionCount, _ammoName];
INC(_firemissionCount);
_gunModule setVariable [QGVAR(firemissionCount), _firemissionCount, true];

private _reservedCount = _ammoModule getVariable ["reservedCount", -1];
_reservedCount = _reservedCount + _shellCount;
_ammoModule setVariable ["reservedCount", _reservedCount, true];

switch (_firing_style) do {

	case (localize "STR_tun_firesupport_firemode_standard"): {
		[true, _gunModule, [_name, _firing_style, [_eta, _etaMin], player, _timeToggle, [player, _name, _gunModule, _ammoModule, _position, _radius, _shellCount, [_delay_min, _delay_max], _volleyToggle]]] remoteExec [QFUNC(firemission_queue), 2];
	};

	case (localize "STR_tun_firesupport_firemode_creeping_barrage"): {

		private _dir = _position getDir _positionEnd;
		private _distance = _position distance2D _positionEnd;
		private _distance_steps = _distance / _shellCount;

		private _distance_start = 0;
		[true, _gunModule, [_name, _firing_style, [_eta, _etaMin], player, _timeToggle, [player, _name, _gunModule, _ammoModule, _position, _radius, _shellCount, [_delay_min, _delay_max], _volleyToggle, _dir, _distance_start, _distance_steps]]] remoteExec [QFUNC(firemission_queue), 2];

	};

	case (localize "STR_tun_firesupport_firemode_wall"): {

		private _dir = _position getDir _positionEnd;
		private _distance = _position distance2D _positionEnd;
		[true, _gunModule, [_name, _firing_style, [_eta, _etaMin], player, _timeToggle, [player, _name, _gunModule, _ammoModule, _position, _radius, _shellCount, [_delay_min, _delay_max], _volleyToggle, _dir, _distance]]] remoteExec [QFUNC(firemission_queue), 2];
	};

	default {

	};
};