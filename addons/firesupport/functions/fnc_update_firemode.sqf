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
		ctrlEnable [EASTING_END_IDC, true];
		ctrlEnable [NORTHING_END_IDC, true];
		ctrlEnable [EASTING_END_TEXT_IDC, true];
		ctrlEnable [NORTHING_END_TEXT_IDC, true];
		


		ctrlEnable [TRP2, false];
		(findDisplay MAIN_IDD displayCtrl TRP2) cbSetChecked false;
		[false, true] call FUNC(trpCheckbox);
		ctrlSetText [EASTING_END_TEXT_IDC, ("STR_tun_firesupport_correctionDistance" call BIS_fnc_localize)];
		ctrlSetText [NORTHING_END_TEXT_IDC, ("STR_tun_firesupport_correctionDirection" call BIS_fnc_localize)];
		(findDisplay MAIN_IDD displayCtrl EASTING_END_IDC) ctrlSetTooltip ("STR_tun_firesupport_correctionDistance_tooltip" call BIS_fnc_localize);
		(findDisplay MAIN_IDD displayCtrl NORTHING_END_IDC) ctrlSetTooltip ("STR_tun_firesupport_correctionDirection_tooltip" call BIS_fnc_localize);
		
	};

	case (localize "STR_tun_firesupport_firemode_creeping_barrage");
	case (localize "STR_tun_firesupport_firemode_wall"): {
		ctrlEnable [EASTING_END_IDC, true];
		ctrlEnable [NORTHING_END_IDC, true];
		ctrlEnable [EASTING_END_TEXT_IDC, true];
		ctrlEnable [NORTHING_END_TEXT_IDC, true];
		ctrlEnable [TRP2, true];
		[true, true] call FUNC(trpCheckbox);
		ctrlSetText [EASTING_END_TEXT_IDC, ("STR_tun_firesupport_easting_end_point" call BIS_fnc_localize)];
		ctrlSetText [NORTHING_END_TEXT_IDC, ("STR_tun_firesupport_northing_end_point" call BIS_fnc_localize)];
		(findDisplay MAIN_IDD displayCtrl EASTING_END_IDC) ctrlSetTooltip ("STR_tun_firesupport_coordinates_tooltip_easting" call BIS_fnc_localize);
		(findDisplay MAIN_IDD displayCtrl NORTHING_END_IDC) ctrlSetTooltip ("STR_tun_firesupport_coordinates_tooltip_northing" call BIS_fnc_localize);
	};

	default {
		hint "Missing Update firemode";
	};
};

[] call FUNC(firingPosMarker);