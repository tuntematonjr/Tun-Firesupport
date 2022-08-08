/*
 * Author: [Tuntematon]
 * [Description]
 * Remove selected firemission from queue
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_removeQueue
 */
#include "script_component.hpp"

private _listArray = tvCurSel ARTY_LIST_IDC;
private _curSelected = lbCurSel QUEUELIST;
if (count _listArray < 1 || _curSelected isEqualTo -1) exitWith { };

private _gunModule = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]) call BIS_fnc_objectFromNetId;
private _textQueue = lbText [QUEUELIST, _curSelected];
private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];
private _firemissionText = (_firemissions select _curSelected) select 0;

if (_textQueue isEqualTo _firemissionText) then {
	private _params = _firemissions select 0 select 5;
	private _ammoCount = _params select 6;
	private _ammoModule = _params select 3;
	
	private _status = _gunModule getVariable [QGVAR(status), ""];
	private _reservedCount = _ammoModule getVariable ["reservedCount", 0];
	_reservedCount = _reservedCount - _ammoCount;
	private _firemission = _firemissions select _curSelected;

	if (_curSelected isEqualTo 0) then {
		if (_status isEqualTo ("STR_tun_firesupport_status_calculating" call BIS_fnc_localize)) then {
			_firemissions deleteAt _curSelected;
			_ammoModule setVariable ["reservedCount", _reservedCount, true];
			_gunModule setVariable [QGVAR(firemissions), _firemissions, true];
			_gunModule setVariable [QGVAR(is_firing), false, true];
			_gunModule setVariable [QGVAR(status), "STR_tun_firesupport_status_free" call BIS_fnc_localize, true];
			[false, _gunModule] call FUNC(firemission_queue);
		};	

		if (_status isEqualTo ("STR_tun_firesupport_status_firing" call BIS_fnc_localize)) then {
			hintSilent ("STR_tun_firesupport_cancelMissions" call BIS_fnc_localize);
			[{
				_this params ["_gunModule", "_firemission"];
				private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];
				private _value = _firemissions find _firemission;
				if (_value isNotEqualTo -1) then {
					_firemissions deleteAt _value;
					_gunModule setVariable [QGVAR(firemissions), _firemissions, true];
				};
			}, [_gunModule, _firemission], 20] call CBA_fnc_waitAndExecute;
		};		
	} else {
		_firemissions deleteAt _curSelected;
		_ammoModule setVariable ["reservedCount", _reservedCount, true];
		_gunModule setVariable [QGVAR(firemissions), _firemissions, true];
	};

	lbClear QUEUELIST;
	{
		private _text = _x select 0;
		lbAdd [QUEUELIST, _text];
	} forEach _firemissions;
};
