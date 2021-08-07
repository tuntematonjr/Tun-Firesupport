/*
 * Author: [Tuntematon]
 * [Description]
 * Check time values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_check_time
 */
#include "script_component.hpp"

private _hours = round ((ctrlText TIMEHOURS) call BIS_fnc_parseNumber);
private _minutes = round ((ctrlText TIMEMINUTES) call BIS_fnc_parseNumber);
private _seconds = round ((ctrlText TIMESECONDS) call BIS_fnc_parseNumber);

if (_hours > 24 || 0 > _hours) then {
	ctrlSetText [TIMEHOURS, "00"];
};

if (_minutes > 60 || 0 > _minutes) then {
	ctrlSetText [TIMEMINUTES, "00"];
};

if (_seconds > 60 || 0 > _seconds) then {
	ctrlSetText [TIMESECONDS, "00"];
};