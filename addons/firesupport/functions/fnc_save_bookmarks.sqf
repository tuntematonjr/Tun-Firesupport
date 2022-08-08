/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * 0: True to export. False to import <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call tun_firesupport_fnc_save_bookmarks
 */
#include "script_component.hpp"

params ["_value"];

if (_value) then {
	//export
	ctrlSetText [BOOKMARK_EDITBOX_IDC, str [GVAR(bookmarkValues), GVAR(trpValues)]];
} else {
	//import
	private _value = (call compile ctrlText BOOKMARK_EDITBOX_IDC);
	GVAR(bookmarkValues) append (_value select 0);
	GVAR(trpValues) append (_value select 1);

	UNIQUE(GVAR(bookmarkValues));
	UNIQUE(GVAR(trpValues));
	GVAR(trpValues) sort true;
	[] call FUNC(update_bookmarks);
};
