/*
 * Author: [Tuntematon]
 * [Description]
 * Create shell
 * Arguments:
 * 0: Positon <ARRAY>
 * 1: Radius <NUMBER>
 * 2: Altitude <NUMBER>
 * 3: Ammo <STRING>
 * 4: Velocity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_createShell
 */
#include "script_component.hpp"

params ["_targetPos", "_radius", "_altitude", "_ammo", "_velocity"];

_finalPos = [_targetPos, random _radius, random 360] call BIS_fnc_relPos;
_shell = _ammo createVehicle [_finalPos select 0, _finalPos select 1, _altitude];
_shell setVectorUp [0,0,-1];
_shell setVelocity [0,0,-(abs _velocity)];

AAR_FOLLOWPROJECTILE(_ammo,_shell);