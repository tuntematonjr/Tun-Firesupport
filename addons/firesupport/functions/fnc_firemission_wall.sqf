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
 * ["something", player] call tun_firesupport_fnc_firemission_wall
 */
#include "script_component.hpp"

params [
	["_player", objNull, [objNull]],
	["_name", "", [""]],
	["_gunModule", objNull, [objNull]],
	["_ammoModule", objNull, [objNull]],
	["_position", [[0,0,0],[0,0,0]], [[]]],
	["_radius", 100, [999]],
	["_shellCount", 0, [999]],
	["_delays", 10, [999,[]]],
	["_volley", false, [false]],
	["_dir", 0, [0]],
	["_distance", 0, [0]]
];

private _ammoCount = _ammoModule getVariable ["currentCount", 0];
private _reservedCount = _ammoModule getVariable ["reservedCount", 0];
private _gunCount = _gunModule getVariable ["gunCount", []];
private _magazineClass = _ammoModule getVariable "Ammo";
private _ammoClass = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");
private _minDelay = _delays select 0;
private _maxDelay = _delays select 1;
private _delay = _delays select 2;
private _finalDelay = _minDelay + (random (_maxDelay - _minDelay));

private _altitude = 300;
private _velocity = 150;

if (_shellCount > 0 && _ammoCount > 0) then {
	if (_volley) then {
		for "_i" from 1 to _gunCount do {
			if (_ammoCount > 0 && _shellCount > 0 && _reservedCount > 0) then {
				private _step_pos = _position getPos [(random _distance), _dir];
				[{
					_this call FUNC(createShell);
				}, [_step_pos, _radius, _altitude, _ammoClass, _velocity], ( random 2 )] call CBA_fnc_waitAndExecute;
				DEC(_ammoCount);
				DEC(_shellCount);
				DEC(_reservedCount);
			};
		};
	} else {
		private _step_pos = _position getPos [(random _distance), _dir];
		[{
			_this call FUNC(createShell);
		}, [_step_pos, _radius, _altitude, _ammoClass, _velocity], ( random 2 )] call CBA_fnc_waitAndExecute;
		DEC(_ammoCount);
		DEC(_shellCount);
		DEC(_reservedCount);
	};
};

//Update ammocount
_ammoModule setVariable ["currentCount", _ammoCount, true];
_ammoModule setVariable ["reservedCount", _reservedCount, true];

[{
	_this params [
		["_player", objNull, [objNull]],
		["_name", "", [""]],
		["_gunModule", objNull, [objNull]],
		["_ammoModule", objNull, [objNull]],
		["_position", [[0,0,0],[0,0,0]], [[]]],
		["_radius", 100, [999]],
		["_shellCount", 0, [999]],
		["_delays", 10, [999,[]]],
		["_volley", false, [false]],
		["_dir", 0, [0]],
		["_distance", 0, [0]]
	];
	
	private _isFiring = _gunModule getVariable [QGVAR(is_firing), false];
	private _firemissions = _gunModule getVariable [QGVAR(firemissions), [[""]]];
	private _nameList = (_firemissions select 0 )select 0;

	if (_shellCount > 0 && _isFiring && _nameList isEqualTo _name) then {
		_this call FUNC(firemission_wall);
	} else {
		if (_shellCount > 0) then {
			private _reservedCount = _ammoModule getVariable ["reservedCount", 0];
			_reservedCount = _reservedCount - _shellCount;
			_ammoModule setVariable ["reservedCount", _reservedCount, true];	
		};
		[_gunModule, _player, _ammoModule, _name] call FUNC(firemission_end);
	};
}, [_player, _name, _gunModule, _ammoModule, _position, _radius, _shellCount, _delays, _volley, _dir, _distance], ( _finalDelay )] call CBA_fnc_waitAndExecute;


