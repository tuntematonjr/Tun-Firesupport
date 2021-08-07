/*
 * Author: [Tuntematon]
 * [Description]
 * Runs when firesupport dialog is closed
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_dialog_close
 */
#include "script_component.hpp"

private _values = [ctrlText EASTING_IDC,  ctrlText NORTHING_IDC, ctrlText EASTING_END_IDC, ctrlText NORTHING_END_IDC];

player setVariable [QGVAR(oldCoordinates), _values];

[GVAR(dialog_PFH)] call CBA_fnc_removePerFrameHandler;