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
 * ["something", player] call tun_firesupport_fnc_create_gun
 */
#include "script_component.hpp"
params ["_name", "_classname", "_side", "_module"];


private _gun_hash = [nil,0] call CBA_fnc_hashCreate;
private _gun_ammo_hash = [nil,0] call CBA_fnc_hashCreate;
private _min_spread = _module getVariable ["tun_firesupport_min_spread", 100];
private _min_delay = _module getVariable ["tun_firesupport_min_delay", 1];

private _gun = _classname createVehicle position _module;

private _agent = createAgent ["C_man_1", getPosATL _gun, [], 0, "NONE"];
_agent moveInGunner _gun;
hideObjectGlobal _gun;
hideObjectGlobal _agent;
_gun enableSimulationGlobal false;
_agent enableSimulationGlobal false;


//tun_firesupport_ammo_type "Sh_82mm_AMOS",
//tun_firesupport_ammo_count

{
	private _obj = _x;
	if (_obj getVariable [QGVAR(ammo_type), ""] != "" ) then {
		private _ammo = _obj getVariable QGVAR(ammo_type);
		private _count = _obj getVariable QGVAR(ammo_count);
		[_gun_ammo_hash, _ammo, _count] call CBA_fnc_hashSet;

		_gun addMagazineTurret [_ammo, [0], 0];
	};
} forEach synchronizedObjects _module;



switch (_side) do {
	case west: {
		GVAR(guns_west) pushBack _gun_hash;
	};

	case east: {
		GVAR(guns_east) pushBack _gun_hash;
	};

	case resistance: {
		GVAR(guns_resistance) pushBack _gun_hash;
	};

	case civilian: {
		GVAR(guns_civilian) pushBack _gun_hash;
	};

	default {
		/* STATEMENT */
	};
};


[_gun_hash, "gun", _gun] call CBA_fnc_hashSet;
[_gun_hash, "gun_name", _name] call CBA_fnc_hashSet;
[_gun_hash, "gun_classname", _classname] call CBA_fnc_hashSet;
[_gun_hash, "gun_ammo_hash", _gun_ammo_hash] call CBA_fnc_hashSet;
[_gun_hash, "is_firing", false] call CBA_fnc_hashSet;
[_gun_hash, "min_spread", _min_spread] call CBA_fnc_hashSet;
[_gun_hash, "min_delay", _min_delay] call CBA_fnc_hashSet;