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
params ["_gunModule", "_player", "_ammoModule", "_name"];

private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];
private _nameList = (_firemissions select 0 ) select 0;

if (_nameList isEqualTo _name) then {
	_firemissions deleteAt 0;
};

_gunModule setVariable [QGVAR(firemissions), _firemissions, true];
_gunModule setVariable [QGVAR(is_firing), false, true];
_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_free" call BIS_fnc_localize, true];

"tun_firemissionDone" remoteExec [QFUNC(playSound), _player];
private _ammoCount = _ammoModule getVariable ["currentCount", 0];
if (_ammoCount <=  0) then {
	"tun_outOfAmmo" remoteExec [QFUNC(playSound), _player];
	_ammoModule setVariable ["currentCount", 0, true];
	_ammoModule setVariable ["reservedCount", 0, true];
	_gunModule setVariable [QGVAR(firemissions), [], true];
};

[false, _gunModule] call FUNC(firemission_queue);