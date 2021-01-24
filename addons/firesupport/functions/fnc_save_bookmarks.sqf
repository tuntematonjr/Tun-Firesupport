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
 * [] call tun_firesupport_fnc_save_bookmarks
 */
#include "script_component.hpp"

params ["_value"];

if (_value) then {
	//export
	ctrlSetText [BOOKMARK_EDITBOX_IDC, str GVAR(bookmarkValues)];
} else {
	//import
	{
		GVAR(bookmarkValues) pushBackUnique _x;
	} forEach (call compile ctrlText BOOKMARK_EDITBOX_IDC);

	[] call FUNC(update_bookmarks);
};