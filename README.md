Wiki is here https://github.com/tuntematonjr/Tun-Firesupport/wiki

Put following line to Description.ext
#include "Tun_Firesupport_Dialog.h"

In firesupport.sqf you can define what artillery pieces are avaible and ammo counts.

// Define globa lvariable with following syntax [name what shown in UI (must be string), array of artillery units, array of arrays which have ammo classname (string) and ammo count
tun_battery1 = ["tykit", [tykki1, tykki2, tykki3], [["32Rnd_155mm_Mo_shells", 20]]];
tun_battery2 = ["morkulat", [mor1, mor2, mor3], [["8Rnd_82mm_Mo_shells",30], ["8Rnd_82mm_Mo_Flare_white",40]]];

//For following globa lvariable. Collect all off your earlier defined globa lvariables in single array.
GVAR(batteries) = [tun_battery1, tun_battery2, tun_battery3];


//Put following line in unit init line. Currently only one Forward Observer is supported.
[this] call compile preprocessFileLineNumbers "scriptit/firesupport.sqf";
