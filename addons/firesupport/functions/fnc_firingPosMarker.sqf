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
 * [] call tun_firesupport_fnc_firingPosMarker
 */
#include "script_component.hpp"

if !(GVAR(enableFiringPosMarker)) exitWith { };
private _listArray = tvCurSel ARTY_LIST_IDC;
if (count _listArray isNotEqualTo 2) exitWith { };

private _markerStartPoint = GVAR(firingPosMarkerStart) select 0;
private _markerEndPoint = GVAR(firingPosMarkerEnd);
private _markerStartPointArea1 = GVAR(firingPosMarkerStart) select 1;
private _markerStartPointArea2 = GVAR(firingPosMarkerArea) select 0;
private _markerStartPointArea3 = GVAR(firingPosMarkerArea) select 1;

private _positions = [] call FUNC(getTargetPositon);
if (_positions isEqualTo "fail") exitWith { };

private _positionStart = _positions select 0;
private _positionEnd = _positions select 1;
private _firingStyle = lbText [FIRING_TYPE_IDC,lbCurSel FIRING_TYPE_IDC];
private _radius = parseNumber ctrlText RANGE_IDC;
private _color = "ColorRed";
private _alpha = 0.5;
private _brush = "grid";

//auto move map to target pos.
private _mapMoveToggle = (findDisplay MAIN_IDD displayCtrl TOGGLEMAPMOVE);

if (cbChecked _mapMoveToggle) then {
	private _control = (findDisplay MAIN_IDD) displayCtrl MINIMAP_IDC;
	private _scale = ctrlMapScale _control;
	ctrlMapAnimClear _control;
	_control ctrlMapAnimAdd [0.3, _scale, _positionStart];
	ctrlMapAnimCommit _control;
};

if (_markerStartPoint isEqualTo "") then {
	private _markerStartPoint = createMarkerLocal ["tun_firesupport_startPointMarker", _positionStart];
	_markerStartPoint setMarkerTypeLocal "mil_dot_noShadow";
	_markerStartPoint setMarkerTextLocal "1st pos";

	_markerStartPointArea1 = createMarkerLocal ["tun_firesupport_startPointMarkerArea1", _positionStart];
	_markerStartPointArea1 setMarkerShapeLocal "Ellipse";
	_markerStartPointArea1 setMarkerSizeLocal  [_radius, _radius];
	_markerStartPointArea1 setMarkerBrush _brush;
	_markerStartPointArea1 setMarkerAlphaLocal _alpha;
	_markerStartPointArea1 setMarkerColorLocal _color;
	GVAR(firingPosMarkerStart) = [_markerStartPoint, _markerStartPointArea1];
} else {
	_markerStartPoint setMarkerPosLocal _positionStart;

	_markerStartPointArea1 setMarkerPosLocal _positionStart;
	_markerStartPointArea1 setMarkerSizeLocal  [_radius, _radius];
};

if (_firingStyle isNotEqualTo (localize "STR_tun_firesupport_firemode_standard")) then {

	if ( _markerEndPoint isEqualTo "") then {
		private _markerEndPoint = createMarkerLocal ["tun_firesupport_endPointMarker", _positionEnd];
		_markerEndPoint setMarkerTypeLocal "mil_dot_noShadow";
		_markerEndPoint setMarkerTextLocal "2nd pos";
		GVAR(firingPosMarkerEnd) = _markerEndPoint;
	} else {
		_markerEndPoint setMarkerPosLocal _positionEnd;
	};

	private _dir = _positionStart getDir _positionEnd;
	private _distance = (_positionStart distance2D _positionEnd) / 2;
	private _newPos = _positionStart getPos [_distance, _dir];

	if (_markerStartPointArea2 isEqualTo "") then {
		_markerStartPointArea2 = createMarkerLocal ["tun_firesupport_startPointMarkerArea2", _newPos];
		_markerStartPointArea2 setMarkerShapeLocal "Rectangle";
		_markerStartPointArea2 setMarkerDir _dir;
		_markerStartPointArea2 setMarkerSizeLocal  [_radius, _distance];

		_markerStartPointArea3 = createMarkerLocal ["tun_firesupport_startPointMarkerArea3", _positionEnd];
		_markerStartPointArea3 setMarkerShapeLocal "Ellipse";
		_markerStartPointArea3 setMarkerSizeLocal  [_radius, _radius];

		{
			private _marker = _x;
			_marker setMarkerBrush _brush;
			_marker setMarkerAlphaLocal _alpha;
			_marker setMarkerColorLocal _color;
		} forEach [_markerStartPointArea2, _markerStartPointArea3];
		GVAR(firingPosMarkerArea) = [_markerStartPointArea2, _markerStartPointArea3];
	} else {
		_markerStartPointArea2 setMarkerPosLocal _newPos;
		_markerStartPointArea2 setMarkerDir _dir;
		_markerStartPointArea2 setMarkerSizeLocal  [_radius, _distance];
		
		_markerStartPointArea3 setMarkerPosLocal _positionEnd;
		_markerStartPointArea3 setMarkerSizeLocal  [_radius, _radius];
	};
} else {
	deleteMarkerLocal GVAR(firingPosMarkerEnd);
	deleteMarkerLocal (GVAR(firingPosMarkerArea) select 0);
	deleteMarkerLocal (GVAR(firingPosMarkerArea) select 1);

	GVAR(firingPosMarkerEnd) = "";
	GVAR(firingPosMarkerArea) = ["",""];
};