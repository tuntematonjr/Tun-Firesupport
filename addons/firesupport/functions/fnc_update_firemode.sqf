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
 * ["something", player] call tun_firesupport_fnc_update_firemode
 */
#include "script_component.hpp"
if (isnull (findDisplay MAIN_IDD)) exitWith { };
private _firing_style = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];

switch (_firing_style) do {

	case (localize "STR_tun_firesupport_firemode_standard"): {
		ctrlShow [EASTING_END_IDC, false];
		ctrlShow [NORTHING_END_IDC, false];
		ctrlShow [EASTING_END_TEXT_IDC, false];
		ctrlShow [NORTHING_END_TEXT_IDC, false];
	};

	case (localize "STR_tun_firesupport_firemode_creeping_barrage");
	case (localize "STR_tun_firesupport_firemode_wall"): {
		ctrlShow [EASTING_END_IDC, true];
		ctrlShow [NORTHING_END_IDC, true];
		ctrlShow [EASTING_END_TEXT_IDC, true];
		ctrlShow [NORTHING_END_TEXT_IDC, true];
	};

	default {
		hint "Missing Update firemode";
	};
};