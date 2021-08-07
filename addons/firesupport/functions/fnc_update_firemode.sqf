/*
 * Author: [Tuntematon]
 * [Description]
 * Update selected firemode
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_update_firemode
 */
#include "script_component.hpp"
if (isnull (findDisplay MAIN_IDD)) exitWith { };
private _firing_style = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];

switch (_firing_style) do {

	case (localize "STR_tun_firesupport_firemode_standard"): {
		ctrlEnable [EASTING_END_IDC, false];
		ctrlEnable [NORTHING_END_IDC, false];
		ctrlEnable [EASTING_END_TEXT_IDC, false];
		ctrlEnable [NORTHING_END_TEXT_IDC, false];
		ctrlEnable [TRP2, false];
	};

	case (localize "STR_tun_firesupport_firemode_creeping_barrage");
	case (localize "STR_tun_firesupport_firemode_wall"): {
		ctrlEnable [EASTING_END_IDC, true];
		ctrlEnable [NORTHING_END_IDC, true];
		ctrlEnable [EASTING_END_TEXT_IDC, true];
		ctrlEnable [NORTHING_END_TEXT_IDC, true];
		ctrlEnable [TRP2, true];
	};

	default {
		hint "Missing Update firemode";
	};
};