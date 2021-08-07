/*
 * Author: [Tuntematon]
 * [Description]
 * Set initial values for selected gun and ammo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_setValues
 */
#include "script_component.hpp"

private _listArray = tvCurSel ARTY_LIST_IDC;
private _count = count _listArray;
private _gunModule = (tvData [ARTY_LIST_IDC, [(_listArray select 0)]]) call BIS_fnc_objectFromNetId;

if (_count > 0) then {
	private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];
	lbClear QUEUELIST;
	{
		private _text = _x select 0;
		lbAdd [QUEUELIST, _text];
	} forEach _firemissions;		
};

if (_count != 2) exitWith { };

private _ammoModule = (tvData [ARTY_LIST_IDC, _listArray]) call BIS_fnc_objectFromNetId;

private _countAmmo = _ammoModule getVariable ["currentCount", -1];
sliderSetRange [SLIDER_AMMO, 0, _countAmmo];
sliderSetPosition [SLIDER_AMMO, 0];
ctrlSetText [COUNT_IDC, "0"];

private _min_spread = _gunModule getVariable ["spreadMin", 50];
private _max_spread = _gunModule getVariable ["spreadMax", 500];
sliderSetRange [SLIDER_RADIUS, _min_spread, _max_spread];
sliderSetPosition [SLIDER_RADIUS, _min_spread];
ctrlSetText [RANGE_IDC, str _min_spread];

private _min_delay = _gunModule getVariable ["delayMin", 1];
private _max_delay = _gunModule getVariable ["delayMax", 60];
sliderSetRange [SLIDER_DELAY, _min_delay, _max_delay];
sliderSetPosition [SLIDER_DELAY, _min_delay];	
ctrlSetText [DELAY_IDC, str _min_delay];

ctrlSetText [REMAINIG_AMMO_IDC, str _countAmmo];