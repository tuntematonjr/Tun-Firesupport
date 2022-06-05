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
 * ["something", player] call tun_firesupport_fnc_createTRPmarkers
 */
#include "script_component.hpp"

if !(GVAR(enableShowTRPmarkers)) then {};

[] call FUNC(deleteTRPmarkers);
private _hasSWT = isClass(configFile >> "CfgPatches" >> "swt_markers");
private _trpArray = GVAR(trpValues);
private _swtMarkers = missionNamespace getVariable ["swt_markers_allMarkers_params", []];
{
	private _name = _x select 0;

	if (_hasSWT && { (_swtMarkers findIf {_x select 2 isEqualTo _name}) isEqualTo -1 }) then {
		private _easting = _x select 1;
		private _northing = _x select 2;
		private _position = ([_easting, _northing] call FUNC(getTargetPositon)) select 0;

		_name = _name select [0, (_name find "[")];
		private _marker = createMarkerLocal [format ["Tun-Firesupport_%1",_name], _position];
		_marker setMarkerTypeLocal GVAR(trpMarkerType);
		_marker setMarkerTextLocal _name;
		GVAR(trpMarkers) pushBack _marker;
	};
} forEach _trpArray;