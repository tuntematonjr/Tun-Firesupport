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
player setVariable [QGVAR(saveToggleVolley), (cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLEVOLLEY))];
player setVariable [QGVAR(saveToggleMapMove), (cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLEMAPMOVE))];

[GVAR(dialog_PFH)] call CBA_fnc_removePerFrameHandler;

deleteMarkerLocal (GVAR(firingPosMarkerStart) select 0);
deleteMarkerLocal GVAR(firingPosMarkerEnd);
deleteMarkerLocal (GVAR(firingPosMarkerStart) select 1);
deleteMarkerLocal (GVAR(firingPosMarkerArea) select 0);
deleteMarkerLocal (GVAR(firingPosMarkerArea) select 1);

GVAR(firingPosMarkerStart) = ["",""];
GVAR(firingPosMarkerEnd) = "";
GVAR(firingPosMarkerArea) = ["",""];

if !(GVAR(alwaysShowTRPmarkers)) then {
	[] call FUNC(deleteTRPmarkers);
};