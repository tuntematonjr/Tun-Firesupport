/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * yes
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_firemission_wall
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
	["_delays", nil, [[]]],
	["_volley", false, [false]],
	["_dir", nil, [0]],
	["_distance_start", 0, [0]],
	["_distance_steps", 0, [0]]
];

private _ammoCount = _ammoModule getVariable ["currentCount", 0];
private _reservedCount = _ammoModule getVariable ["reservedCount", 0];
private _gunCount = _gunModule getVariable ["gunCount", []];
private _magazineClass = _ammoModule getVariable "Ammo";
private _ammoClass = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");
private _minDelay = _delays select 0;
private _maxDelay = _delays select 1;
private _finalDelay = _minDelay + (random (_maxDelay - _minDelay));

private _altitude = 300;
private _velocity = 150;
if (_shellCount > 0 && _ammoCount > 0) then {
	if (_volley) then {
		for "_i" from 1 to _gunCount do {
			if (_ammoCount > 0 && _shellCount > 0 && _reservedCount > 0) then {
				private _step_pos = _position getPos [_distance_start, _dir];
				[{
					_this call FUNC(createShell);
				}, [_step_pos, _radius, _altitude, _ammoClass, _velocity], ( random 2 )] call CBA_fnc_waitAndExecute;
				ADD(_distance_start, _distance_steps);
				DEC(_ammoCount);
				DEC(_shellCount);
				DEC(_reservedCount);
			};
		};
	} else {
		private _step_pos = _position getPos [_distance_start, _dir];
		[{
			_this call FUNC(createShell);
		}, [_step_pos, _radius, _altitude, _ammoClass, _velocity], ( random 2 )] call CBA_fnc_waitAndExecute;
		ADD(_distance_start, _distance_steps);
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
		["_dir", nil, [0]],
		["_distance_start", 0, [0]],
		["_distance_steps", 0, [0]]
	];
	
	private _isFiring = _gunModule getVariable [QGVAR(is_firing), false];
	private _firemissions = _gunModule getVariable [QGVAR(firemissions), [[""]]];
	private _nameList = (_firemissions select 0 ) select 0;

	if (_shellCount > 0 && _isFiring && _nameList isEqualTo _name) then {
		_this call FUNC(firemission_creepingBarrage);
	} else {
		if (_shellCount > 0) then {
			private _reservedCount = _ammoModule getVariable ["reservedCount", 0];
			_reservedCount = _reservedCount - _shellCount;
			_ammoModule setVariable ["reservedCount", _reservedCount, true];	
		};
		[_gunModule, _player, _ammoModule, _name] call FUNC(firemission_end);
	};
}, [_player, _name, _gunModule, _ammoModule, _position, _radius, _shellCount, _delays, _volley, _dir, _distance_start, _distance_steps], ( _finalDelay )] call CBA_fnc_waitAndExecute;