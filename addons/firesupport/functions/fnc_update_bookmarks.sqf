/*
 * Author: [Tuntematon]
 * [Description]
 * Update Bookmars
 * Arguments:
 * None
 *
 * Return Value:
 * None
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

[] call FUNC(createTRPmarkers);