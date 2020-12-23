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
 * [] call tun_firesupport_fnc_selected_bookmark
 */
#include "script_component.hpp"


private _values = GVAR(bookmarkValues) select lbCurSel BOOKMARK_LIST_IDC;


_values params ["_name", "_eastin", "_northing", "_eastin2", "_northing2", "_gun", "_gunText", "_ammo", "_ammoText", "_mode", "_modeText", "_count", "_radius", "_delay"];

ctrlSetText [EASTING_IDC, _eastin];
ctrlSetText [NORTHING_IDC, _northing];
ctrlSetText [EASTING_END_IDC, _eastin2];
ctrlSetText [NORTHING_END_IDC, _northing2];

ctrlSetText [COUNT_IDC, _count];
ctrlSetText [RANGE_IDC, _radius];
ctrlSetText [DELAY_IDC, _delay];

private _errorText = "";

if (_gunText == lbText [ARTY_LIST_IDC, _gun]) then {
	lbSetCurSel [ARTY_LIST_IDC, _gun];
} else {
	_errorText = "Bookmark gun is missing!\n";
};

if (_ammoText == lbText [AMMO_TYPE_IDC, _ammo]) then {
	lbSetCurSel [AMMO_TYPE_IDC, _ammo];
} else {
	_errorText = _errorText + "Bookmark ammo type is missing!\n";
};

if (_modeText == lbText [FIRING_TYPE_IDC, _mode]) then {
	lbSetCurSel [FIRING_TYPE_IDC, _mode];
} else {
	_errorText = _errorText + "Bookmark firemode is missing!";
};

if (count _errorText > 0) then {
	hint  _errorText;
};