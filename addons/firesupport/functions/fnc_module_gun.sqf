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
#include "script_component.hpp"

private _module = param [0,objNull,[objNull]];


private _gun_hash = [nil,0] call CBA_fnc_hashCreate;
private _gun_ammo_hash = [nil,0] call CBA_fnc_hashCreate;

//TODO lisää conffiin että voi muuttaa
private _classname = _module getVariable ["className", "Missing classname"];
private _name = _module getVariable ["displayName", "Missing name"];
private _countdown = _module getVariable ["countDown", 60];
private _side = _module getVariable ["side", sideLogic];
private _min_spread = _module getVariable ["spreadMin", 100];
private _min_delay = _module getVariable ["delayMin", 1];

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
	private _ammo = _obj getVariable "Ammo";
	private _count = _obj getVariable "Count";
	[_gun_ammo_hash, _ammo, _count] call CBA_fnc_hashSet;

	_gun addMagazineTurret [_ammo, [0], 0];

} forEach synchronizedObjects _module;



switch ( toLower _side) do {
	case "west": {
		GVAR(guns_west) pushBack _gun_hash;
	};

	case "east": {
		GVAR(guns_east) pushBack _gun_hash;
	};

	case "resistance": {
		GVAR(guns_resistance) pushBack _gun_hash;
	};

	case "civilian": {
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
[_gun_hash, "countDown", _countdown] call CBA_fnc_hashSet;