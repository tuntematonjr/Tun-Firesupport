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
lbClear TRP1_LIST;
lbClear TRP2_LIST;

{
	private _name = _x select 0;
	private _index = lbAdd [BOOKMARK_LIST_IDC, _name];
	lbSetData [BOOKMARK_LIST_IDC, _index, "bookmark"];
	lbSetValue [BOOKMARK_LIST_IDC, _index, _forEachIndex];
} forEach GVAR(bookmarkValues);

{
	private _name = _x select 0;
	private _index = lbAdd [BOOKMARK_LIST_IDC, _name];
	lbSetData [BOOKMARK_LIST_IDC, _index, "trp"];
	lbSetValue [BOOKMARK_LIST_IDC, _index, _forEachIndex];

	lbAdd [TRP1_LIST, _name];
	lbAdd [TRP2_LIST, _name];
} forEach GVAR(trpValues);