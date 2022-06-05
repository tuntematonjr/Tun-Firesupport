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

[true, true] call FUNC(trpCheckbox);

private _oldCoordinates = player getVariable [QGVAR(oldCoordinates),["00000","00000","0","0"]];

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
	private _gunModule = _x;

	private _gunName = _gunModule getVariable ["displayName", "Missing name"];;
	private _gunClassname = _gunModule getVariable ["className", "Missing classname"];
	private _gunCount = _gunModule  getVariable ["gunCount", 1];
	_gunName = format ["%1 (%2)", _gunName, _gunCount];
	private _index = tvAdd  [ARTY_LIST_IDC, [], _gunName];

	private _gunIcon = getText (configFile >> "CfgVehicles" >> _gunClassname >> "picture");
	tvSetPictureRight [ARTY_LIST_IDC, [_index], _gunIcon];

	private _netID = _gunModule call BIS_fnc_netId;
	tvSetData [ARTY_LIST_IDC, [_index], _netID];

	{
		private _obj = _x;
		private _ammo = _obj getVariable "Ammo";
		private _count = _obj getVariable "currentCount";
		private _name = getText (configFile >> "CfgMagazines" >> _ammo >> "displayName");
		private _indexAmmo = tvAdd [ARTY_LIST_IDC, [_index], _name];
		private _netID = _obj call BIS_fnc_netId;
		tvSetData [ARTY_LIST_IDC, [_index,_indexAmmo], _netID];
	} forEach synchronizedObjects _gunModule;
} forEach _variables;

//Fire types
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_standard"];
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_creeping_barrage"];
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_wall"];

lbSetCurSel [FIRING_TYPE_IDC, 0];

GVAR(dialog_PFH) = [{
	private _eta = [] call FUNC(calculate_eta);
	ctrlSetText [ETA_IDC, _eta select 1];
	[] call FUNC(updateStatus);
}, 0.1] call CBA_fnc_addPerFrameHandler;

//View mode
lbAdd [CHANGE_MODE,"Minimap"];
lbAdd [CHANGE_MODE,"Bookmark"];
lbAdd [CHANGE_MODE,"Fire missions"];
lbSetCurSel [CHANGE_MODE, 0];

//slider
sliderSetSpeed [SLIDER_AMMO, 1, 1];
sliderSetSpeed [SLIDER_RADIUS, 1, 1];
sliderSetSpeed [SLIDER_DELAY, 0.1, 0.1];


(findDisplay MAIN_IDD displayCtrl TOGGLEVOLLEY) cbSetChecked (player getVariable [QGVAR(saveToggleVolley), true]);
(findDisplay MAIN_IDD displayCtrl TOGGLEMAPMOVE) cbSetChecked (player getVariable [QGVAR(saveToggleMapMove), true]);

[] call FUNC(update_firemode);
[] call FUNC(timeCheckbox);
[] call FUNC(createTRPmarkers);

//Start layout
ctrlShow [BOOKMARK_LIST_IDC, false];
ctrlShow [BOOKMARK_ADD_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_NAME_TEXT_IDC, false];
ctrlShow [BOOKMARK_NAME_VALUE_IDC, false];
ctrlShow [BOOKMARK_REMOVE_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_EDITBOX_IDC, false];
ctrlShow [BOOKMARK_IMPORT_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_EXPORT_BOOKMARK_IDC, false];
ctrlShow [BOOKMARK_ADD_TRP_IDC, false];
// ctrlShow [TRP2, false];
// ctrlShow [TIMEHOURS, false];
// ctrlShow [TIMEMINUTES, false];
// ctrlShow [TIMESECONDS, false];
// ctrlShow [TIMETEXT, false];