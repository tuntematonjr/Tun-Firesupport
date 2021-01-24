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

if (GVAR(BookmarkSkip)) then {
	_force = false;
	GVAR(BookmarkSkip) = false;
};

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

private _gun_module= _variables select _index;

private _classname = _gun_module getVariable ["className", "Missing classname"];
private _name = _gun_module getVariable ["displayName", "Missing name"];
private _countdown = _gun_module getVariable ["countDown", 60];
private _side = _gun_module getVariable ["side", sideLogic];
private _min_spread = _gun_module getVariable ["spreadMin", 100];
private _min_delay = _gun_module getVariable ["delayMin", 1];

switch (_dialog) do {
	case "radius": {
		private _min_spread = _gun_module getVariable ["spreadMin", 100];
		private _range = parseNumber ctrlText RANGE_IDC;
		if (_min_spread > _range || _force) then {
			ctrlSetText [RANGE_IDC, str _min_spread];
		};
	};

	case "delay": {
		private _min_delay = _gun_module getVariable ["delayMin", 1];
		private _delay = parseNumber ctrlText DELAY_IDC;
		if (_min_delay > _delay || _force) then {
			ctrlSetText [DELAY_IDC, str _min_delay];
		};
	};


	case "ammo": {
		private _index = lbCurSel AMMO_TYPE_IDC;
		if (_index != -1 ) then { 
			private _ammo_module = (synchronizedObjects _gun_module) select lbCurSel AMMO_TYPE_IDC;
			private _count_remaining = _ammo_module getVariable "currentCount";
			private _count = parseNumber ctrlText COUNT_IDC;

			if (_count > _count_remaining || _force) then {
				ctrlSetText [COUNT_IDC, str _count_remaining];
			};
		} else {
			ctrlSetText [COUNT_IDC, " "];
		};
	};

	default {
		/* STATEMENT */
	};
};

