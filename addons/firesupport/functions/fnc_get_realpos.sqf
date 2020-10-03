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
 * [_easting, _northing] call tun_firesupport_fnc_get_realpos
 */
#include "script_component.hpp"
params [["_easting", nil, [""]], ["_northing", nil, [""]]];

private _pos = [[_easting, _northing], true] call CBA_fnc_mapGridToPos;

_pos