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
 * ["something", player] call tun_firesupport_fnc_module_gun
 */
if (!isServer) exitWith { };
#include "script_component.hpp"

private _gun_module = param [0,objNull,[objNull]];


//TODO lisää conffiin että voi muuttaa
private _classname = _gun_module getVariable ["className", "Missing classname"];
private _name = _gun_module getVariable ["displayName", "Missing name"];
private _countdown = _gun_module getVariable ["countDown", 60];
private _side = _gun_module getVariable ["side", sideLogic];
private _min_spread = _gun_module getVariable ["spreadMin", 100];
private _min_delay = _gun_module getVariable ["delayMin", 1];
private _minRange= _gun_module getVariable ["minRange", 0];
private _maxRange = _gun_module getVariable ["maxRange", 10000];
private _markerConditio = _gun_module getVariable ["marker", true];
private _icon = "n_art";
private _color = "colorCivilian";


//tun_firesupport_ammo_type "Sh_82mm_AMOS",
//tun_firesupport_ammo_count

{
	private _obj = _x;
	private _ammo = _obj getVariable "Ammo";
	private _count = _obj getVariable "Count";
	_obj setVariable ["currentCount", _count, true];
} forEach synchronizedObjects _gun_module;


_gun_module setVariable [QGVAR(is_firing), false];

switch ( toLower _side) do {
	case "west": {
		GVAR(guns_west) pushBack _gun_module;
		publicVariable QGVAR(guns_west);
		_side = west;
		_icon = "b_art";
		_color = "colorBLUFOR";
	};

	case "east": {
		GVAR(guns_east) pushBack _gun_module;
		publicVariable QGVAR(guns_east);
		_side = east;
		_icon = "o_art";
		_color = "colorOPFOR";
	};

	case "resistance": {
		GVAR(guns_resistance) pushBack _gun_module;
		publicVariable QGVAR(guns_resistance);
		_side = resistance;
		_icon = "n_art";
		_color = "colorIndependent";
	};

	case "civilian": {
		GVAR(guns_civilian) pushBack _gun_module;
		publicVariable QGVAR(guns_civilian);
		_side = civilian;
		_icon = "n_art";
		_color = "colorCivilian";
	};

	default {
		/* STATEMENT */
	};
};

if (_markerConditio) then {
	private _pos = getpos _gun_module;
	[_name, _pos, "ICON", [1, 1], "TYPE:", _icon, "COLOR:", _color, "TEXT:", _name] remoteExecCall ["CBA_fnc_createMarker", _side, true];
};