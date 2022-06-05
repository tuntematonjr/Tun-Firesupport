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
 * [] call tun_firesupport_fnc_openConvertDialog
 */
#include "script_component.hpp"

private _displays = [52,53,37,12]; 
private _result = _displays findIf {!isNull findDisplay _x};
private _display = _displays select _result;
private _control = findDisplay _display createDisplay "tun_firesupport_convertDialog";
uiNamespace setVariable ["tun_firesupport_convertDialog", _control ];