/*
 * Author: [Tuntematon]
 * [Description]
 * Set bookmark values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_selected_bookmark
 */
#include "script_component.hpp"

private _index = lbCurSel BOOKMARK_LIST_IDC;
if ((count GVAR(bookmarkValues)-1) < _index) exitWith { };

private _values = GVAR(bookmarkValues) select lbCurSel BOOKMARK_LIST_IDC;

_values params ["_name", "_easting", "_northing", "_easting2", "_northing2", "_gun", "_gunText", "_ammoText", "_mode", "_modeText", "_count", "_radius", "_delay", "_trp1", "_trp2", "_timeCheck", "_hours", "_minutes", "_seconds", "_volley", "_trpList1", "_trpList2", "_trpList1Text", "_trpList2text"];
private _trpList1TextConfirm = lbText [TRP1_LIST, _trpList1];
private _trpList2textConfirm = lbText [TRP2_LIST, _trpList2];

ctrlSetText [EASTING_IDC, _easting];
ctrlSetText [NORTHING_IDC, _northing];
ctrlSetText [EASTING_END_IDC, _easting2];
ctrlSetText [NORTHING_END_IDC, _northing2];

(findDisplay MAIN_IDD displayCtrl TRP1) cbSetChecked _trp1;
(findDisplay MAIN_IDD displayCtrl TRP2) cbSetChecked _trp2;
(findDisplay MAIN_IDD displayCtrl TOGGLETIME) cbSetChecked _timeCheck;
(findDisplay MAIN_IDD displayCtrl TOGGLEVOLLEY) cbSetChecked _volley;

[_trpList1, _trpList2] call FUNC(trpCheckbox);
[] call FUNC(timeCheckbox);

private _errorText = "";

if (_gunText isNotEqualTo tvText [ARTY_LIST_IDC, [_gun select 0]]) then {
	_errorText = "Bookmark gun is missing!\n";
};

if (_trpList1TextConfirm isEqualTo  _trpList1Text) then {
	lbSetCurSel [TRP1_LIST,_trpList1];
} else {
	_errorText = "Bookmark TRP1 is missing!\n";
};

if (_trpList2TextConfirm isEqualTo  _trpList2Text) then {
	lbSetCurSel [TRP2_LIST,_trpList2];
} else {
	_errorText = "Bookmark TRP2 is missing!\n";
};

if (_ammoText isEqualTo  tvText [ARTY_LIST_IDC, _gun]) then {
	tvSetCurSel [ARTY_LIST_IDC, _gun];
} else {
	_errorText = _errorText + "Bookmark ammo type is missing!\n";
};

if (_modeText isEqualTo  lbText [FIRING_TYPE_IDC, _mode]) then {
	lbSetCurSel [FIRING_TYPE_IDC, _mode];
} else {
	_errorText = _errorText + "Bookmark firemode is missing!";
};

if (count _errorText > 0) then {
	_errorText call CBA_fnc_notify;
};

ctrlSetText [RANGE_IDC, _radius];
ctrlSetText [DELAY_IDC, _delay];
ctrlSetText [COUNT_IDC, _count];
ctrlSetText [TIMEHOURS, _hours];
ctrlSetText [TIMEMINUTES, _minutes];
ctrlSetText [TIMESECONDS, _seconds];

[false] call FUNC(check_values);