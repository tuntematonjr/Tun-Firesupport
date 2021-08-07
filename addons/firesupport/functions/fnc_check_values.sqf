/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Multiple input types <STRING|ARRAY|CODE>
 * 3: Optional input <BOOL> (default: true)
 * 4: Optional input with multiple types <CODE|STRING> (default: {true})
 * 5: Not mandatory input <STRING> (default: nil)
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [false] call tun_firesupport_fnc_check_values
 */
#include "script_component.hpp"

params [["_updateSlider",false]];

private _listArray = tvCurSel ARTY_LIST_IDC;
if (count _listArray isNotEqualTo 2) exitWith { };
private _gunModule = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]) call BIS_fnc_objectFromNetId;
private _ammoModule = (tvData [ARTY_LIST_IDC, _listArray]) call BIS_fnc_objectFromNetId;

private _min_spread = _gunModule getVariable ["spreadMin", 50];
private _max_spread = _gunModule getVariable ["spreadMax", 500];
private _min_delay = _gunModule getVariable ["delayMin", 1];
private _max_delay = _gunModule getVariable ["delayMax", 60];
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

if (_radiusValue > _max_spread) then {
	_radiusValue = _max_spread;
};

if (_radiusValue < _min_spread) then {
	_radiusValue = _min_spread;
};

if (_delayValue > _max_delay) then {
	_delayValue = _max_delay;
};

if (_delayValue < _min_delay || 0.5 > _delayValue) then {
	_delayValue = _min_delay;
};

sliderSetPosition [SLIDER_AMMO, _ammoValue];
sliderSetPosition [SLIDER_RADIUS, _radiusValue];
sliderSetPosition [SLIDER_DELAY, _delayValue];

ctrlSetText [COUNT_IDC, str _ammoValue];
ctrlSetText [RANGE_IDC, str _radiusValue];
ctrlSetText [DELAY_IDC, str _delayValue];
