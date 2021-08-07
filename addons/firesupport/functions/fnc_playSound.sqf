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
 * ["something", player] call tun_firesupport_fnc_playSound
 */
#include "script_component.hpp"

params ["_sound", ["_new", true]];

if (_new) then {
	GVAR(soundQueue) pushBack _sound;
};

if (isNull GVAR(soundOBJ) && !GVAR(playingSounds)) then {
	GVAR(playingSounds) = true;
	private _sound = GVAR(soundQueue) select 0;
	GVAR(soundOBJ) = playsound _sound;
	GVAR(soundQueue) deleteAt 0;
	[{ isnull GVAR(soundOBJ) }, {
		if (count GVAR(soundQueue) > 0) then {
		
			GVAR(playingSounds) = false;
			[{
				[ nil, false ] call FUNC(playSound);
			}, nil, 1] call CBA_fnc_waitAndExecute;
		
		} else {
			GVAR(playingSounds) = false;
		};
	}] call CBA_fnc_waitUntilAndExecute;
};