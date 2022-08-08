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
private _firingStyleIsStandard = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC] isEqualTo (localize "STR_tun_firesupport_firemode_standard");

private _trp1Index = lbCurSel TRP1_LIST;
private _trp1IsSelected = _trp1Index isNotEqualTo -1;
private _trp2Index = lbCurSel TRP2_LIST;
private _trp2IsSelected = _trp2Index isNotEqualTo -1;

private _positionStart = [-1,-1,-1];
private _positionEnd = [-1,-1,-1];

if ((_trp1Toggle && !_trp1IsSelected) || (_trp2Toggle && !_trp2IsSelected && !_firingStyleIsStandard)) exitWith {
	"fail"
};

//TRP & positions
if (_trp1Toggle) then {
	private _trp1Values = GVAR(trpValues) select _trp1Index;
	_positionStart = _trp1Values select 3;
};

if (_trp2Toggle && _trp2IsSelected) then {
	private _trp2Values = GVAR(trpValues) select _trp2Index;
	_positionEnd = _trp2Values select 3;
};

if (_positionStart isEqualTo [-1,-1,-1]) then {
	_positionStart = [[_easting, _northing], false] call CBA_fnc_mapGridToPos;
	MAP(_positionStart,_x + 1);
};

if !(_skipFiremode) then {
	if (_firingStyleIsStandard) then {
		_positionStart = _positionStart getPos [parseNumber _eastingEnd, parseNumber _northingEnd]; // this is for tweaking start coordinates with distance and direction. So varnames are missleading in this.
	} else {
		if (_positionEnd isEqualTo [-1,-1,-1]) then {
			_positionStart = [[_eastingEnd, _northingEnd], false] call CBA_fnc_mapGridToPos;
			MAP(_positionEnd,_x + 1);
		};
	};
};

[_positionStart, _positionEnd];