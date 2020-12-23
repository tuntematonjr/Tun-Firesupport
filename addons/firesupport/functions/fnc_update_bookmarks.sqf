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
 * [] call tun_firesupport_fnc_update_bookmarks
 */
#include "script_component.hpp"

lbClear BOOKMARK_LIST_IDC;

{
	private _name = _x select 0;
	lbAdd [BOOKMARK_LIST_IDC, _name];
} forEach GVAR(bookmarkValues);