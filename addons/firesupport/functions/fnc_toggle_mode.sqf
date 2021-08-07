/*
 * Author: [Tuntematon]
 * [Description]
 * Set ui mode
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_toggle_mode
 */
#include "script_component.hpp"

private _selected = lbCurSel CHANGE_MODE;


//Minimap
if (_selected isEqualTo  0) then {
	ctrlShow [MINIMAP_IDC, true];
} else {
	ctrlShow [MINIMAP_IDC, false];
};

//Bookmark
if (_selected isEqualTo  1) then {
	ctrlShow [BOOKMARK_LIST_IDC, true];
	ctrlShow [BOOKMARK_ADD_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_NAME_TEXT_IDC, true];
	ctrlShow [BOOKMARK_NAME_VALUE_IDC, true];
	ctrlShow [BOOKMARK_REMOVE_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_EDITBOX_IDC, true];
	ctrlShow [BOOKMARK_IMPORT_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_EXPORT_BOOKMARK_IDC, true];
	ctrlShow [BOOKMARK_ADD_TRP_IDC, true];

	[] call FUNC(update_bookmarks);
} else {
	ctrlShow [BOOKMARK_LIST_IDC, false];
	ctrlShow [BOOKMARK_ADD_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_NAME_TEXT_IDC, false];
	ctrlShow [BOOKMARK_NAME_VALUE_IDC, false];
	ctrlShow [BOOKMARK_REMOVE_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_EDITBOX_IDC, false];
	ctrlShow [BOOKMARK_IMPORT_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_EXPORT_BOOKMARK_IDC, false];
	ctrlShow [BOOKMARK_ADD_TRP_IDC, false];
};

//Fire missions
if (_selected isEqualTo 2) then {
	ctrlShow [QUEUELIST, true];
	ctrlShow [QUEUEREMOVE, true];
	private _curSel = tvCurSel ARTY_LIST_IDC;
	if ((count _curSel) > 0) then {
		private _gunModuleID = (tvData [ARTY_LIST_IDC, [(_curSel select 0)]]);
		private _gunModule = _gunModuleID call BIS_fnc_objectFromNetId;
		private _firemissions = _gunModule getVariable [QGVAR(firemissions), []];
		lbClear QUEUELIST;
		{
			private _text = _x select 0;
			lbAdd [QUEUELIST, _text];
		} forEach _firemissions;		
	};

} else {
	ctrlShow [QUEUELIST, false];
	ctrlShow [QUEUEREMOVE, false];
};