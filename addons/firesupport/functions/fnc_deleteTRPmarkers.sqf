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
 * [] call tun_firesupport_fnc_deleteTRPmarkers
 */
#include "script_component.hpp"

{
	deleteMarkerLocal _x;
} forEach GVAR(trpMarkers);

GVAR(trpMarkers) = [];