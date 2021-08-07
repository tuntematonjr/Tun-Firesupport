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
 * ["something", player] call tun_firesupport_fnc_createShell
 */
#include "script_component.hpp"

params ["_targetPos", "_radius", "_altitude", "_ammo", "_velocity"];

_finalPos = [_targetPos, random _radius, random 360] call BIS_fnc_relPos;
_shell = _ammo createVehicle [_finalPos select 0, _finalPos select 1, _altitude];
_shell setVectorUp [0,0,-1];
_shell setVelocity [0,0,-(abs _velocity)];

AAR_FOLLOWPROJECTILE(_ammo,_shell);