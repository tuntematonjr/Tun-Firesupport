/*
 * Author: [Tuntematon]
 * [Description]
 *
 * Arguments:
 * 0: sound classname <STRING>
 * 1: True if sound is new and should be added to queue <BOOL>
 *
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tun_firesupport_fnc_playSound
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