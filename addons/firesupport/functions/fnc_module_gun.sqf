/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * 0: Module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [module] call tun_firesupport_fnc_module_gun
 */
if (!isServer) exitWith { };
#include "script_component.hpp"

private _gunModule = param [0,objNull,[objNull]];

//TODO lisää conffiin että voi muuttaa
private _classname = _gunModule getVariable ["className", "Missing classname"];
private _name = _gunModule getVariable ["displayName", "Missing name"];
private _side = _gunModule getVariable ["side", sideLogic];
private _markerConditio = _gunModule getVariable ["marker", true];
private _gunCount= _gunModule getVariable ["gunCount", 1];
private _icon = "n_art";
private _color = "colorCivilian";
// private _countdown = _gunModule getVariable ["countDown", 60];
// private _min_spread = _gunModule getVariable ["spreadMin", 50];
// private _max_spread = _gunModule getVariable ["spreadMax", 500];
// private _min_delay = _gunModule getVariable ["delayMin", 1];
// private _max_delay = _gunModule getVariable ["delayMax", 60];
// private _minRange= _gunModule getVariable ["minRange", 0];
// private _maxRange = _gunModule getVariable ["maxRange", 10000];


if (_gunCount < 1) then {
	_gunModule setVariable [QGVAR(gunCount), 1, true];
};


//Ammo module stuff
{
	private _obj = _x;
	private _ammo = _obj getVariable "Ammo";
	private _count = _obj getVariable "Count";
	_obj setVariable ["currentCount", _count, true];
	_obj setVariable ["reservedCount", 0, true];
} forEach synchronizedObjects _gunModule;


_gunModule setVariable [QGVAR(is_firing), false, true];
_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_free" call BIS_fnc_localize, true];
_gunModule setVariable [QGVAR(firemissions), [], true];
_gunModule setVariable [QGVAR(firemissionCount), 0, true];

switch ( toLower _side) do {
	case "west": {
		GVAR(guns_west) pushBack _gunModule;
		publicVariable QGVAR(guns_west);
		_side = west;
		_icon = "b_art";
		_color = "colorBLUFOR";
	};

	case "east": {
		GVAR(guns_east) pushBack _gunModule;
		publicVariable QGVAR(guns_east);
		_side = east;
		_icon = "o_art";
		_color = "colorOPFOR";
	};

	case "resistance": {
		GVAR(guns_resistance) pushBack _gunModule;
		publicVariable QGVAR(guns_resistance);
		_side = resistance;
		_icon = "n_art";
		_color = "colorIndependent";
	};

	case "civilian": {
		GVAR(guns_civilian) pushBack _gunModule;
		publicVariable QGVAR(guns_civilian);
		_side = civilian;
		_icon = "n_art";
		_color = "colorCivilian";
	};

	default {

	};
};

if (_markerConditio) then {
	private _pos = getpos _gunModule;
	[_name, _pos, "ICON", [1, 1], "TYPE:", _icon, "COLOR:", _color, "TEXT:", _name] remoteExecCall ["CBA_fnc_createMarker", _side, true];
};