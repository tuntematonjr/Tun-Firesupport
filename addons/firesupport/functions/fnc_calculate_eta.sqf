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

	private _index_arty = lbCurSel ARTY_LIST_IDC;
	private _index_ammo = lbCurSel AMMO_TYPE_IDC;
	private _gun_hash = _variables select _index_arty;
	private _ammo_hash = [_gun_hash, "gun_ammo_hash"] call CBA_fnc_hashGet;
	private _countdown = [_gun_hash, "countDown"] call CBA_fnc_hashGet;
	private _ammo = lbData [AMMO_TYPE_IDC, _index_ammo];
	//private _ammo = [_ammo_hash, _key] call CBA_fnc_hashGet;

	private _pos = [_easting, _northing] call tun_firesupport_fnc_get_realpos;
	private _gun = [_gun_hash, "gun"] call CBA_fnc_hashGet;

	_eta = _gun getArtilleryETA [_pos, _ammo];
	_eta_number = _eta + _countdown;

	_eta = if (_eta == -1) then {
		"CANT FIRE";
	} else {
		((str round (_eta + _countdown))  + " s");
	};

	if (_pos inRangeOfArtillery [[_gun], _ammo]) then {
		_eta = "Out of Range";
	};

	if (ctrlText REMAINIG_AMMO_IDC == "0") then {
		_eta = "Out of Ammo";
	};

	if ([_gun_hash, "is_firing"] call CBA_fnc_hashGet) then {
		_eta = "Busy";
	};
};

[_eta_number,_eta]