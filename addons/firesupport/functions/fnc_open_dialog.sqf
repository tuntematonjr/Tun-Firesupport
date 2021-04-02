/*
 * Author: [Tuntematon]
 * [Description]
 * Open firesupport dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_open_dialog
 */
#include "script_component.hpp"

if (GVAR(debug)) then {
	hint "debug mode enabled";
};

createDialog "Firesupport_dialog";
waitUntil {!isnull (findDisplay MAIN_IDD)};

private _oldCoordinates = player getVariable [GVAR(oldCoordinates),["00000","00000","00000","00000"]];

ctrlSetText [EASTING_IDC, (_oldCoordinates select 0) ];
ctrlSetText [NORTHING_IDC, (_oldCoordinates select 1) ];
ctrlSetText [EASTING_END_IDC, (_oldCoordinates select 2) ];
ctrlSetText [NORTHING_END_IDC, (_oldCoordinates select 3) ];

private _variables = switch (playerSide) do {

	case west: {
		GVAR(guns_west)
	};

	case east: {
		GVAR(guns_east)
	};

	case resistance: {
		GVAR(guns_resistance)
	};

	case civilian: {
		GVAR(guns_civilian)
	};

	default { };
};

//Add batteries
{
	private _module = _x;

	private _gun_name = _module getVariable ["displayName", "Missing name"];;
	private _gun_classname = _module getVariable ["className", "Missing classname"];

	private _index = lbAdd [ARTY_LIST_IDC, _gun_name];

	private _gunicon = getText (configFile >> "CfgVehicles" >> _gun_classname >> "picture");
	lbSetPicture [ARTY_LIST_IDC, _index, _gunicon];

	private _min_spread = _module getVariable ["spreadMin", 100];
	lbSetValue [ARTY_LIST_IDC, _index, _min_spread];
} forEach _variables;


//Fire types
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_standard"];
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_creeping_barrage"];
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_wall"];

lbSetCurSel [FIRING_TYPE_IDC, 0];

GVAR(dialog_PFH) = [{
	private _eta = [] call FUNC(calculate_eta);
	ctrlSetText [ETA_IDC, _eta select 1];
}, 0.25] call CBA_fnc_addPerFrameHandler;


[] call FUNC(update_firemode);

//BOOKMARK STUFF
GVAR(bookmarkOpen) = false;

ctrlShow [BOOKMARK_LIST_IDC, false];
ctrlShow [BOOKMARK_ADD_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_NAME_TEXT_IDC, false];
ctrlShow [BOOKMARK_NAME_VALUE_IDC, false];
ctrlShow [BOOKMARK_REMOVE_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_EDITBOX_IDC, false];
ctrlShow [BOOKMARK_IMPORT_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_EXPORT_BOOKMARK_IDC, false];