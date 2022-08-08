/*
 * Author: [Tuntematon]
 * [Description]
 * Create diary record for converter
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_createConvertDiaryEntry
 */
#include "script_component.hpp"

if (isClass(configFile >> "CfgPatches" >> "swt_markers")) then {
	player createDiarySubject ["STR_tun_firesupport_briefing_subject" call BIS_fnc_localize, "STR_tun_firesupport_briefing_subject" call BIS_fnc_localize];
	player createDiaryRecord ["STR_tun_firesupport_briefing_subject" call BIS_fnc_localize, ["STR_tun_firesupport_briefing_convertRecord" call BIS_fnc_localize,"STR_tun_firesupport_briefing_convertRecord_text" call BIS_fnc_localize
	]];
};