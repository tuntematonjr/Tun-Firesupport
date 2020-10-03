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
 * ["something", player] call tun_firesupport_fnc_check_min_values
 */
#include "script_component.hpp"

params ["_dialog", ["_force", false, [false]]];

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
if (_index == -1 ) exitWith { };

private _gun_hash = _variables select _index;

switch (_dialog) do {
	case "radius": {
		private _min_spread = [_gun_hash, "min_spread"] call CBA_fnc_hashGet;
		private _range = parseNumber ctrlText RANGE_IDC;
		if (_min_spread > _range || _force) then {
			ctrlSetText [RANGE_IDC, str _min_spread];
		};
	};

	case "delay": {
		private _min_delay = [_gun_hash, "min_delay"] call CBA_fnc_hashGet;
		private _delay = parseNumber ctrlText DELAY_IDC;
		if (_min_delay > _delay || _force) then {
			ctrlSetText [DELAY_IDC, str _min_delay];
		};
	};


	case "ammo": {
		private _ammo_hash = [_gun_hash, "gun_ammo_hash"] call CBA_fnc_hashGet;
		private _key = lbData [AMMO_TYPE_IDC, lbCurSel AMMO_TYPE_IDC];
		private _count_remaining = [_ammo_hash, _key] call CBA_fnc_hashGet;
		private _count = parseNumber ctrlText COUNT_IDC;

		if (_count > _count_remaining || _force) then {
			ctrlSetText [COUNT_IDC, str _count_remaining];
		};
	};

	default {
		/* STATEMENT */
	};
};