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
 * ["something", player] call tun_firesupport_fnc_update_ammo_count
 */
#include "script_component.hpp"

if (isnull (findDisplay 22200)) exitWith { };

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

private _gun_hash = _variables select _index;
private _ammo_hash = [_gun_hash, "gun_ammo_hash"] call CBA_fnc_hashGet;

private _key = lbData [AMMO_TYPE_IDC, lbCurSel AMMO_TYPE_IDC];

private _count = [_ammo_hash, _key] call CBA_fnc_hashGet;
ctrlSetText [REMAINIG_AMMO_IDC, str _count];