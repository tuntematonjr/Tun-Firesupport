/*
 * Author: [Tuntematon]
 * [Description]
 * Check values so they are not out of bounds
 * Arguments:
 * 0: Update slider <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [false] call tun_firesupport_fnc_check_values
 */
#include "script_component.hpp"

params [["_updateSlider",false]];

private _firingStyle = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];

if (_firingStyle isEqualTo (localize "STR_tun_firesupport_firemode_standard")) then {
	//private _distance = ctrlText EASTING_END_IDC;
	private _direction = ctrlText NORTHING_END_IDC;
	private _directionParset = parseNumber _direction;
	ctrlSetText [NORTHING_END_IDC, str _directionParset];

	if (_directionParset < 0) then {
		ctrlSetText [NORTHING_END_IDC, "0"];
	};

	if (count _direction > 3) then {
		ctrlSetText [NORTHING_END_IDC, _direction select [0,3]];
	};

	if (_directionParset isEqualTo 360) then {
		ctrlSetText [NORTHING_END_IDC, "0"];
	};

	if (_directionParset > 359 && _directionParset isNotEqualTo 360) then {
		ctrlSetText [NORTHING_END_IDC, "359"];
	};

};

private _listArray = tvCurSel ARTY_LIST_IDC;
if (count _listArray isNotEqualTo 2) exitWith { };
private _gunModule = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]) call BIS_fnc_objectFromNetId;
private _ammoModule = (tvData [ARTY_LIST_IDC, _listArray]) call BIS_fnc_objectFromNetId;

private _minSpread = _gunModule getVariable ["spreadMin", 50];
private _maxSpread = _gunModule getVariable ["spreadMax", 500];
private _mindelay = _gunModule getVariable ["delayMin", 1];
private _maxdelay = _gunModule getVariable ["delayMax", 60];
private _currentAmmoCount = _ammoModule getVariable ["currentCount", 0];
private _ammoValue = -1;
private _radiusValue = -1;
private _delayValue = -1;

if (_updateSlider) then {
	_ammoValue = round (sliderPosition SLIDER_AMMO);
	_radiusValue = round (sliderPosition SLIDER_RADIUS);
	_delayValue = (round ((sliderPosition SLIDER_DELAY) * 10)) / 10;
} else {
	_ammoValue = round (parseNumber (ctrlText COUNT_IDC));
	_radiusValue = round (parseNumber (ctrlText RANGE_IDC));
	_delayValue = (round ((parseNumber (ctrlText DELAY_IDC)) * 10)) / 10;
};

if (_ammoValue > _currentAmmoCount) then {
	_ammoValue = _currentAmmoCount;
};

if (_ammoValue < 0) then {
	_ammoValue = 0;
};

if (_radiusValue > _maxSpread) then {
	_radiusValue = _maxSpread;
};

if (_radiusValue < _minSpread) then {
	_radiusValue = _minSpread;
};

if (_delayValue > _maxdelay) then {
	_delayValue = _maxdelay;
};

if (_delayValue < _mindelay || 0.5 > _delayValue) then {
	_delayValue = _mindelay;
};

sliderSetPosition [SLIDER_AMMO, _ammoValue];
sliderSetPosition [SLIDER_RADIUS, _radiusValue];
sliderSetPosition [SLIDER_DELAY, _delayValue];

ctrlSetText [COUNT_IDC, str _ammoValue];
ctrlSetText [RANGE_IDC, str _radiusValue];
ctrlSetText [DELAY_IDC, str _delayValue];

[] call FUNC(firingPosMarker);


