/*
 * Author: [Tuntematon]
 * [Description]
 * Enable TRP
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_trpCheckbox
 */
#include "script_component.hpp"

params [["_updateTRP1", false], ["_updateTRP2", false]];

private _trp1 = (findDisplay MAIN_IDD displayCtrl TRP1);
private _trp2 = (findDisplay MAIN_IDD displayCtrl TRP2);

if (_updateTRP1) then {
	if (cbChecked _trp1) then {
		ctrlSetText [EASTING_TEXT, "STR_tun_firesupport_selectTRP" call BIS_fnc_localize];
		ctrlShow [NORTHING_TEXT, false];
		ctrlShow [EASTING_IDC, false];
		ctrlShow [NORTHING_IDC, false];
		ctrlShow [TRP1_LIST, true];

		lbClear TRP1_LIST;
		{
			private _name = _x select 0;
			lbAdd [TRP1_LIST, _name];
		} forEach GVAR(trpValues);
	} else {
		ctrlSetText [EASTING_TEXT, "STR_tun_firesupport_easting" call BIS_fnc_localize];
		ctrlShow [NORTHING_TEXT, true];
		ctrlShow [EASTING_IDC, true];
		ctrlShow [NORTHING_IDC, true];
		ctrlShow [TRP1_LIST, false];	
	};	
};

if (_updateTRP2) then {
	if (ctrlShown _trp2) then {
		if (cbChecked _trp2) then {
			ctrlSetText [EASTING_END_TEXT_IDC, "STR_tun_firesupport_selectTRP_END" call BIS_fnc_localize];
			ctrlShow [NORTHING_END_TEXT_IDC, false];
			ctrlShow [EASTING_END_IDC, false];
			ctrlShow [NORTHING_END_IDC, false];
			ctrlShow [TRP2_LIST, true];
			
			lbClear TRP2_LIST;
			{
				private _name = _x select 0;
				lbAdd [TRP2_LIST, _name];
			} forEach GVAR(trpValues);
		} else {
			ctrlSetText [EASTING_END_TEXT_IDC, "STR_tun_firesupport_easting_end_point" call BIS_fnc_localize];
			ctrlShow [NORTHING_END_TEXT_IDC, true];
			ctrlShow [EASTING_END_IDC, true];
			ctrlShow [NORTHING_END_IDC, true];
			ctrlShow [TRP2_LIST, false];	
		};	
	};	
};