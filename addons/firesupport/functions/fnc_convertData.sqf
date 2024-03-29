﻿/*
 * Author: [Tuntematon]
 * [Description]
 * Convert data between swt and this
 * Arguments:
 * 0: True = convert from tun to swt <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [true] call tun_firesupport_fnc_convertData
 */
#include "script_component.hpp"

params ["_dataType"];

private _finalValues = [];

if (_dataType) then {
	private _tunData = ctrlText ((uiNamespace getVariable "tun_firesupport_convertDialog") displayCtrl TUNDATA);
	if !("[" in _tunData && {"]" in _tunData}) exitWith { systemChat "Not array" };
	_tunData = call compile _tunData;
	if (IS_ARRAY(_tunData)) then {
		_tunData = _tunData select 1;
		private _type = swt_cfgMarkers_names find swt_markers_mark_type;
		private _color = swt_cfgMarkerColors_names find swt_markers_mark_color;
		{
			private _params = _x;
			if (count _params > 2 && IS_ARRAY(_params)) then {
				private _name = _params select 0;
				private _pos =  _params select 3;
				_finalValues pushBack [_name, _pos, _Type, _Color, 0, 1];
			};
		} forEach _tunData;
		((uiNamespace getVariable "tun_firesupport_convertDialog") displayCtrl SWTDATA) ctrlSetText (str _finalValues);
	};
} else {
	private _swtData = ctrlText ((uiNamespace getVariable "tun_firesupport_convertDialog") displayCtrl SWTDATA);
	if !("[" in _swtData && {"]" in _swtData}) exitWith { systemChat "Not array" };
	_swtData = call compile _swtData;
	if (IS_ARRAY(_swtData)) then {
		{
			private _params = _x;
			if (count _params > 1 && IS_ARRAY(_params)) then {
				_params params ["_name", "_pos"];
				private _fakePos = mapGridPosition _pos;
				private _lenght = (count _fakePos)/2;
				private _easting = _fakePos select [0,_lenght];
				private _northing = _fakePos select [_lenght];
				_name = format ["TRP-%1 [%2:%3]",_name, _easting, _northing];
				_finalValues pushBack [_name, _easting, _northing, _pos];
			};
		} forEach _swtData;
		((uiNamespace getVariable "tun_firesupport_convertDialog") displayCtrl TUNDATA) ctrlSetText (str [[],_finalValues]);
	};	
};