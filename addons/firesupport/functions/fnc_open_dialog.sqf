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
 * ["something", player] call tun_firesupport_fnc_open_dialog
 */
#include "script_component.hpp"


createDialog "Firesupport_dialog";
waitUntil {!isnull (findDisplay 22200)};
findDisplay 22200 displayCtrl 22209 progressSetPosition 0.5;

private _easting = player getVariable [QGVAR(easting), "0"];
if ( _easting == "0" ) then { _easting = "00000"; };

private _northing = player getVariable [QGVAR(northing), "0"];
if ( _northing == "0" ) then { _northing = "00000"; };

private _easting_end = player getVariable [QGVAR(easting_end), "0"];
if ( _easting_end == "0" ) then { _easting_end = "00000"; };

private _northing_end = player getVariable [QGVAR(northing_end), "0"];
if ( _northing_end == "0" ) then { _northing_end = "00000"; };

ctrlSetText [EASTING_IDC, _easting];
ctrlSetText [NORTHING_IDC, _northing];
ctrlSetText [EASTING_END_IDC, _easting_end];
ctrlSetText [NORTHING_END_IDC, _northing_end];


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

	default
	{
		/* STATEMENT */
	};
};

//Add batteries
{
	private _hash = _x;

	private _gun_name = [_hash,"gun_name"] call CBA_fnc_hashGet;
	private _gun_classname = [_hash,"gun_classname"] call CBA_fnc_hashGet;

	private _index = lbAdd [ARTY_LIST_IDC, _gun_name];

	private _gunicon = getText (configFile >> "CfgVehicles" >> _gun_classname >> "picture");
	lbSetPicture [ARTY_LIST_IDC, _index, _gunicon];

	private _min_spread = [_hash,"min_spread"] call CBA_fnc_hashGet;
	lbSetValue [ARTY_LIST_IDC, _index, _min_spread];

} forEach _variables;


//Fire types
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_standard"];
lbAdd [FIRING_TYPE_IDC, localize "STR_tun_firesupport_firemode_creeping_barrage"];



lbSetCurSel [FIRING_TYPE_IDC, 0];


GVAR(dialog_PFH) = [{
	private _eta = [] call tun_firesupport_fnc_calculate_eta;
	ctrlSetText [ETA_IDC, _eta select 1];
}, 1] call CBA_fnc_addPerFrameHandler;


[] call FUNC(update_firemode);

ctrlShow [REMAINIG_AMMO_PROGRESBAR_IDC, false];
ctrlShow [STATUS_IDC, false];
//ctrlShow [FIRING_TYPE_IDC, false];