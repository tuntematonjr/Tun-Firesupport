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
 * [] call tun_firesupport_fnc_toggle_bookmarks
 */
#include "script_component.hpp"

if !(GVAR(bookmarkOpen)) then {
	GVAR(bookmarkOpen) = true;

	ctrlShow [MINIMAP_IDC, false];

	ctrlShow [BOOKMARK_LIST_IDC, true];
	ctrlShow [BOOKMARK_ADD_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_NAME_TEXT_IDC, true];
	ctrlShow [BOOKMARK_NAME_VALUE_IDC, true];
	ctrlShow [BOOKMARK_REMOVE_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_EDITBOX_IDC, true];
	ctrlShow [BOOKMARK_IMPORT_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_EXPORT_BOOKMARK_IDC, true];

	ctrlSetText [BOOKMARK_OPEN_BUTTON_IDC, localize "STR_tun_firesupport_minimap"];

	[] call FUNC(update_bookmarks);

} else {
	GVAR(bookmarkOpen) = false;
	
	ctrlShow [MINIMAP_IDC, true];

	ctrlShow [BOOKMARK_LIST_IDC, false];
	ctrlShow [BOOKMARK_ADD_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_NAME_TEXT_IDC, false];
	ctrlShow [BOOKMARK_NAME_VALUE_IDC, false];
	ctrlShow [BOOKMARK_REMOVE_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_EDITBOX_IDC, false];
	ctrlShow [BOOKMARK_IMPORT_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_EXPORT_BOOKMARK_IDC, false];

	ctrlSetText [BOOKMARK_OPEN_BUTTON_IDC, localize "STR_tun_firesupport_bookmark"];
};