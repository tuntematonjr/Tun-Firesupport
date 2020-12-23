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
 * ["something", player] call tun_firesupport_fnc_fire
 */
#include "script_component.hpp"

//params [["_easting", nil, [0]], ["_northing", nil, [0]], ["_count", nil, [0]], ["_range", nil, [0]], ["_delay", nil, [0]], ["_easting_end", 0, [0]], ["_northing_end", 0, [0]]];

if ( (ctrlText STATUS_IDC) in ["CANT FIRE", "Out of Range", "Out of Ammo", "Busy"] ) exitWith {
	hintSilent (ctrlText STATUS_IDC);
	playSound "zoom_fail";
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
private _gun_hash = _variables select _index;
private _ammo_hash = [_gun_hash, "gun_ammo_hash"] call CBA_fnc_hashGet;




private _easting = ctrlText EASTING_IDC;
private _northing = ctrlText NORTHING_IDC;
private _type = lbData [AMMO_TYPE_IDC, lbCurSel AMMO_TYPE_IDC];
private _count = parseNumber ctrlText COUNT_IDC;
private _range = parseNumber ctrlText RANGE_IDC;
private _delay = parseNumber ctrlText DELAY_IDC;
private _easting_end = ctrlText EASTING_END_IDC;
private _northing_end = ctrlText NORTHING_END_IDC;
private _firing_style = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];

if ( _count <= 0 ) exitWith {
	playSound "3DEN_notificationWarning";
};
[_gun_hash, "is_firing", true] call CBA_fnc_hashSet;

private _ammo = getText (configFile >> "CfgMagazines" >> _type >> "ammo");

if (_delay < 1) then {
	_delay = 1;
};

if (_range < 10) then {
	_range = 10;
};

private _offset = (100 + (1 / (_delay / 10)^2))/100 * _delay * 1.1 - _delay;
private _delay_min = _delay - _offset;
private _delay_max = _delay + _offset;

if (_delay < 2) then {
	_delay_min = _delay - _delay * 0.7;
	_delay_max = _delay + _delay * 1.3;
};



private _eta = ([] call tun_firesupport_fnc_calculate_eta) select 0;
private _eta_when_done = _eta + (_count * _delay) + 10;

private _pos = [_easting, _northing] call tun_firesupport_fnc_get_realpos;
private _pos_end = [_easting_end, _northing_end] call tun_firesupport_fnc_get_realpos;

switch (_firing_style) do {

	case (localize "STR_tun_firesupport_firemode_standard"): {
		hint "firemission";
		[{
			hint "splash";
			//Real positions
			_this remoteExec ["BIS_fnc_fireSupportVirtual", 2];

		}, [_pos, _ammo, _range, _count, [_delay_min, _delay_max], {false}, nil, 300], _eta] call CBA_fnc_waitAndExecute;
	};

	case (localize "STR_tun_firesupport_firemode_creeping_barrage"): {

		private _dir = _pos getDir _pos_end;
		private _distance = _pos distance2D _pos_end;
		private _distance_steps = _distance / _count;
		private _delay_time = 0;
		private _distance_start = 0;

		for "_i" from 1 to _count step 1 do {
			private _step_pos = _pos getPos [_distance_start, _dir];
			_wait = _eta + (_delay_time - _offset) + ( random (_offset * 2) );
			ADD(_delay_time, _delay);
			ADD(_distance_start, _distance_steps);

			[{
				_this remoteExec ["BIS_fnc_fireSupportVirtual", 2];
			}, [_step_pos, _ammo, _range, 1, 1, {false}, nil, 300], _wait] call CBA_fnc_waitAndExecute;
		};
	};

	case (localize "STR_tun_firesupport_firemode_wall"): {

		private _dir = _pos getDir _pos_end;
		private _distance = _pos distance2D _pos_end;
		private _delay_time = 0;

		for "_i" from 1 to _count step 1 do {
			private _step_pos = _pos getPos [random _distance, _dir];
			_wait = _eta + (_delay_time - _offset) + ( random (_offset * 2) );
			ADD(_delay_time, _delay);

			[{
				_this remoteExec ["BIS_fnc_fireSupportVirtual", 2];
			}, [_step_pos, _ammo, _range, 1, 1, {false}, nil, 300], _wait] call CBA_fnc_waitAndExecute;
		};
	};

	default {
		hint "failed to chose firemode";
	};
};


[{
	private _gun_hash = _this select 0;
	private _count = _this select 1;
	private _type = _this select 2;
	private _ammo_hash = [_gun_hash, "gun_ammo_hash"] call CBA_fnc_hashGet;
	private _count_original = [_ammo_hash, _type] call CBA_fnc_hashGet;
	_count = _count_original - _count;
	[_gun_hash, "is_firing", false] call CBA_fnc_hashSet;
	[_ammo_hash, _type, _count] call CBA_fnc_hashSet;

	[] call FUNC(update_ammo_count);
}, [_gun_hash, _count, _type], _eta_when_done] call CBA_fnc_waitAndExecute;
