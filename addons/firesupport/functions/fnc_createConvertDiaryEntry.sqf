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
 * ["something", player] call tun_firesupport_fnc_createConvertDiaryEntry
 */
#include "script_component.hpp"

if (isClass(configFile >> "CfgPatches" >> "swt_markers")) then {
	player createDiarySubject ["STR_tun_firesupport_briefing_subject" call BIS_fnc_localize, "STR_tun_firesupport_briefing_subject" call BIS_fnc_localize];
	player createDiaryRecord ["STR_tun_firesupport_briefing_subject" call BIS_fnc_localize, ["STR_tun_firesupport_briefing_convertRecord" call BIS_fnc_localize,"STR_tun_firesupport_briefing_convertRecord_text" call BIS_fnc_localize
	]];
};