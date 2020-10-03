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
 * ["something", player] call tun_firesupport_fnc_gun_ammo_dialog
 */
#include "script_component.hpp"

["radius", true] call FUNC(check_min_values);
["ammo", true] call FUNC(check_min_values);

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

lbClear AMMO_TYPE_IDC;
lbSetCurSel [AMMO_TYPE_IDC, -1];

private _index = lbCurSel ARTY_LIST_IDC;
private _gun_hash = _variables select _index;
private _ammo_hash = [_gun_hash, "gun_ammo_hash"] call CBA_fnc_hashGet;



{
	private _ammo = _x;
	private _count = [_ammo_hash, _ammo] call CBA_fnc_hashGet;
	private _name = getText (configFile >> "CfgMagazines" >> _ammo >> "displayName");
	_index = lbAdd [AMMO_TYPE_IDC, _name];
	lbSetData [AMMO_TYPE_IDC, _index, _ammo];

} forEach ([_ammo_hash] call CBA_fnc_hashKeys);
