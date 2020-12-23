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
 * [] call tun_firesupport_fnc_modify_bookmarks
 */
#include "script_component.hpp"
params ["_value"];
if (_value) then {
	//ADD bookmark
	private _name = ctrlText BOOKMARK_NAME_VALUE_IDC;
	private _easting = ctrlText EASTING_IDC;
	private _northing = ctrlText NORTHING_IDC;
	private _easting2 = ctrlText EASTING_END_IDC;
	private _northing2 = ctrlText NORTHING_END_IDC;
	private _gun = lbCurSel ARTY_LIST_IDC;
	private _gunText = lbText [ARTY_LIST_IDC, _gun];
	private _ammo = lbCurSel AMMO_TYPE_IDC;
	private _ammoText = lbText [AMMO_TYPE_IDC, _ammo];
	private _mode = lbCurSel FIRING_TYPE_IDC;
	private _modeText = lbText [FIRING_TYPE_IDC,_mode];
	private _count = parseNumber ctrlText COUNT_IDC;
	private _radius = parseNumber ctrlText RANGE_IDC;
	private _delay = parseNumber ctrlText DELAY_IDC;

	_name = format["%1 [%2:%3]",_name, _easting, _northing];
	GVAR(bookmarkValues) pushBackUnique [_name, _easting, _northing, _easting2, _northing2, _gun, _gunText, _ammo, _ammoText, _mode, _modeText, _count, _radius, _delay];
} else {
	//Remove bookmark
	GVAR(bookmarkValues) deleteAt lbCurSel BOOKMARK_LIST_IDC;
};

[] call FUNC(update_bookmarks);