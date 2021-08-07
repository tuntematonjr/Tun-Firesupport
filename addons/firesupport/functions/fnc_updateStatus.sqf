/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * 0: None
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [] call tun_firesupport_fnc_updateStatus
 */
#include "script_component.hpp"

private _listArray = tvCurSel ARTY_LIST_IDC;
private _gunModule = objNull;
if ((count _listArray > 0)) then {
	_gunModule = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]) call BIS_fnc_objectFromNetId;
	private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];
	private _selected = lbCurSel CHANGE_MODE;
	if (count _firemissions != lbSize QUEUELIST && _selected == 2) then {

		lbClear QUEUELIST;
		{
			private _text = _x select 0;
			lbAdd [QUEUELIST, _text];
		} forEach _firemissions;
	};
};


if (count _listArray < 2) exitWith { 
	ctrlSetText [STATUS_IDC, "STR_tun_firesupport_status_none" call BIS_fnc_localize]; 
};

private _status = _gunModule getVariable [QGVAR(status), "STR_tun_firesupport_status_none" call BIS_fnc_localize];

ctrlSetText [STATUS_IDC, _status];

if (_gunModule getVariable [QGVAR(is_firing), false]) then {
	ctrlSetText [FIRE_IDC, "STR_tun_firesupport_status_button_addQueue" call BIS_fnc_localize];
} else {
	ctrlSetText [FIRE_IDC, "STR_tun_firesupport_status_button_fire" call BIS_fnc_localize];
};

private _ammoModuleID = (tvData [ARTY_LIST_IDC, _listArray]);
private _ammoModule = _ammoModuleID call BIS_fnc_objectFromNetId;
private _currentAmmoCount = _ammoModule getVariable ["currentCount", -1];
private _reservedCount = _ammoModule getVariable ["reservedCount", -1];
private _text = format ["%1 (%2)",_currentAmmoCount, (_currentAmmoCount - _reservedCount)];
ctrlSetText [REMAINIG_AMMO_IDC, _text];

