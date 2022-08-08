/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_createTRPmarkers
 */
#include "script_component.hpp"

if !(GVAR(enableShowTRPmarkers)) then {};

[] call FUNC(deleteTRPmarkers);
private _hasSWT = isClass(configFile >> "CfgPatches" >> "swt_markers");
private _trpArray = GVAR(trpValues);
private _swtMarkers = missionNamespace getVariable ["swt_markers_allMarkers_params", []];
{
	_x params ["_name", "_easting", "_northing", "_position"];

	if (_hasSWT && { (_swtMarkers findIf {_x select 2 isEqualTo _name}) isEqualTo -1 }) then {
		//_name = _name select [0, (_name find "[")];
		private _marker = createMarkerLocal [format ["Tun-Firesupport_%1", _name], _position];
		_marker setMarkerTypeLocal GVAR(trpMarkerType);
		_marker setMarkerTextLocal _name;
		GVAR(trpMarkers) pushBack _marker;
	};
} forEach _trpArray;