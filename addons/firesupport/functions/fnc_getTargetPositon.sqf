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
 * [_easting, _northing, _eastingEnd, _northingEnd, _skipFiremode] call tun_firesupport_fnc_getTargetPositon
 */
#include "script_component.hpp"

params [
	["_easting", ctrlText EASTING_IDC],
	["_northing", ctrlText NORTHING_IDC],
	["_eastingEnd", ctrlText EASTING_END_IDC],
	["_northingEnd", ctrlText NORTHING_END_IDC],
	["_skipFiremode", false]
];


private _trp1Toggle = cbChecked (findDisplay MAIN_IDD displayCtrl TRP1);
private _trp2Toggle  = cbChecked (findDisplay MAIN_IDD displayCtrl TRP2);
private _firing_style = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];

private _trp1Index = lbCurSel TRP1_LIST;
private _trp2Index = lbCurSel TRP2_LIST;
private _return = "fail";

//No trp selected
if !(((_trp1Index isEqualTo -1) && _trp1Toggle) || ((_trp2Index isEqualTo -1) && _trp2Toggle)) then {
	//TRP & positions
	if (_trp1Toggle) then {
		private _trp1Values = GVAR(trpValues) select _trp1Index;
		_easting = _trp1Values select 1;
		_northing = _trp1Values select 2;
	};

	if (_trp2Toggle) then {
		private _trp2Values = GVAR(trpValues) select _trp2Index;
		_eastingEnd = _trp2Values select 1;
		_northingEnd = _trp2Values select 2;
	};

	private _positionStart = [[_easting, _northing], false] call CBA_fnc_mapGridToPos;
	private _positionEnd = [0,0,0];

	if !(_skipFiremode) then {
		if (_firing_style isEqualTo (localize "STR_tun_firesupport_firemode_standard")) then {
			_positionStart = _positionStart getPos [parseNumber _eastingEnd, parseNumber _northingEnd];
		} else {

			_positionEnd = [[_eastingEnd, _northingEnd], false] call CBA_fnc_mapGridToPos;
		};
	};
	MAP(_positionStart,_x + 1);
	MAP(_positionEnd,_x + 1);
	_return = [_positionStart, _positionEnd];
};

_return