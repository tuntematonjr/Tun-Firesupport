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
 * ["something", player] call tun_firesupport_fnc_calculate_eta
 */
#include "script_component.hpp"

private _arty_index = lbCurSel ARTY_LIST_IDC;
private _ammo_index = lbCurSel AMMO_TYPE_IDC;
private _easting = ctrlText EASTING_IDC;
private _northing = ctrlText NORTHING_IDC;
private _eta = "NONE";
private _eta_number = -1;
if ( _arty_index != -1 && _ammo_index != -1 ) then {

private _variables = switch (playerSide) do {

		case west: {
			GVAR(guns_west)
		};

		case east: {
			GVAR(guns_east)
		};

		case resistance: {
			GVAR(guns_resistance)
		};

		case civilian: {
			GVAR(guns_civilian)
		};

		default
		{
			/* STATEMENT */
		};
	};

	private _index = lbCurSel ARTY_LIST_IDC;
	private _gun_module = _variables select _index;

	private _magazine = lbData [AMMO_TYPE_IDC, lbCurSel AMMO_TYPE_IDC];
	private _initSpeed = getNumber (configfile >> "CfgMagazines" >> _magazine >> "initSpeed");

	private _pos = [_easting, _northing] call FUNC(get_realpos);
	private _countdown = _gun_module getVariable ["countDown", 60];

	private _distance = _gun_module distance _pos;

	private _minRange= _gun_module getVariable ["minRange", 0];
	private _maxRange = _gun_module getVariable ["maxRange", 10000];

	_eta = 10 +  (_distance / _initSpeed)  * 2;
	_eta_number = _eta + _countdown;

	_eta = if (_eta == -1) then {
		"CANT FIRE";
	} else {
		((str round (_eta + _countdown))  + " s");
	};

	if (_distance < _minRange || _distance > _maxRange  ) then {
		_eta = "Out of Range";
	};

	if (ctrlText REMAINIG_AMMO_IDC == "0") then {
		_eta = "Out of Ammo";
	};

	if (_gun_module getVariable [QGVAR(is_firing), false]) then {
		_eta = "Busy";
	};
};

if (GVAR(debug)) then {
	_eta = 5;
	_eta_number = 5;
};

[_eta_number,_eta]