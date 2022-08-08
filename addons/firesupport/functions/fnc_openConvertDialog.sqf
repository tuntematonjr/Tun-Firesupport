/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * 0: None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_openConvertDialog
 */
#include "script_component.hpp"

private _displays = [52,53,37,12]; 
private _result = _displays findIf {!isNull findDisplay _x};
private _display = _displays select _result;
private _control = findDisplay _display createDisplay "tun_firesupport_convertDialog";
uiNamespace setVariable ["tun_firesupport_convertDialog", _control ];