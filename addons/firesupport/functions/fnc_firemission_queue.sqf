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

params [["_new", false, [false]], "_gunModule", "_values"];
private _isFiring = _gunModule getVariable [QGVAR(is_firing), false];
private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];

if (_new) then {
	_firemissions pushBack _values;
	_gunModule setVariable [QGVAR(firemissions), _firemissions, true];
};

if (!_isFiring && count _firemissions > 0) then {
	private _values = _firemissions select 0;
	private _firing_style = _values select 1;
	private _eta = _values select 2 select 0;
	private _etaMIN = _values select 2 select 1;
	private _player = _values select 3;
	private _timeToggle = _values select 4;
	private _params = _values select 5;

	if (_timeToggle) then {
		if (_eta < (_etaMIN + cba_missiontime)) then {
			_eta = cba_missiontime + _etaMIN;
		};
	} else {
		_eta = cba_missiontime + _eta;
	};

	_gunModule setVariable [QGVAR(is_firing), true, true];
	_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_calculating" call BIS_fnc_localize, true];
	"tun_targetlocation" remoteExec [QFUNC(playSound), _player];
	switch (_firing_style) do {
		case (localize "STR_tun_firesupport_firemode_standard"): { 
			[{cba_missiontime >= _this select 0}, {
				private _params = _this select 1;
				private _gunModule = _params select 2;
				private _name = _params select 1;
				private _firemissions = _gunModule getVariable [QGVAR(firemissions), [[""]]];
				private _nameList = (_firemissions select 0 ) select 0;
				if (_nameList isEqualTo  _name) then {
					private _player = _params select 0;
					"tun_splash" remoteExec [QFUNC(playSound), _player];
					_params call FUNC(firemission_standard);
					_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_firing" call BIS_fnc_localize, true];
				};
			}, [_eta, _params]] call CBA_fnc_waitUntilAndExecute;
		};
		
		case (localize "STR_tun_firesupport_firemode_creeping_barrage"): { 
			[{cba_missiontime >= _this select 0}, {
				private _params = _this select 1;
				private _gunModule = _params select 2;
				private _name = _params select 1;
				private _firemissions = _gunModule getVariable [QGVAR(firemissions), [[""]]];
				private _nameList = (_firemissions select 0 ) select 0;
				if (_nameList isEqualTo  _name) then {
					private _player = _params select 0;
					"tun_splash" remoteExec [QFUNC(playSound), _player];
					_params call FUNC(firemission_creepingBarrage);
					_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_firing" call BIS_fnc_localize, true];
				};
			}, [_eta, _params]] call CBA_fnc_waitUntilAndExecute;
		};

		case (localize "STR_tun_firesupport_firemode_wall"): { 
			[{cba_missiontime >= _this select 0}, {
				private _params = _this select 1;
				private _gunModule = _params select 2;
				private _name = _params select 1;
				private _firemissions = _gunModule getVariable [QGVAR(firemissions), [[""]]];
				private _nameList = (_firemissions select 0 ) select 0;
				if (_nameList isEqualTo  _name) then {
					private _player = _params select 0;
					"tun_splash" remoteExec [QFUNC(playSound), _player];
					_params call FUNC(firemission_wall);
					_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_firing" call BIS_fnc_localize, true];
				};
			}, [_eta, _params]] call CBA_fnc_waitUntilAndExecute;
		};

		default { };
	};
};