/*
 * Author: [Tuntematon]
 * [Description]
 * Enable timed missions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_timeCheckbox
 */
#include "script_component.hpp"

private _value = (cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLETIME));
ctrlEnable [TIMESECONDS, _value];
ctrlEnable [TIMEMINUTES, _value];
ctrlEnable [TIMEHOURS, _value];
ctrlEnable [TIMETEXT, _value];