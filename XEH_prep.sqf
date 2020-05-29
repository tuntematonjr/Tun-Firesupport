#include "script_component.hpp"

#undef PREP
#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction

//PREP(ace_actions);




FUNC(fire) = compile preprocessFileLineNumbers "functions\fnc_fire.sqf";
FUNC(get_realpos) = compile preprocessFileLineNumbers "functions\fnc_get_realpos.sqf";
FUNC(open_dialog) = compile preprocessFileLineNumbers "functions\fnc_open_dialog.sqf";
FUNC(create_gun) = compile preprocessFileLineNumbers "functions\fnc_create_gun.sqf";
FUNC(gun_ammo_dialog) = compile preprocessFileLineNumbers "functions\fnc_gun_ammo_dialog.sqf";
FUNC(dialog_close) = compile preprocessFileLineNumbers "functions\fnc_dialog_close.sqf";
FUNC(update_ammo_count) = compile preprocessFileLineNumbers "functions\fnc_update_ammo_count.sqf";
FUNC(calculate_eta) = compile preprocessFileLineNumbers "functions\fnc_calculate_eta.sqf";
FUNC(check_min_values) = compile preprocessFileLineNumbers "functions\fnc_check_min_values.sqf";
FUNC(update_everything) = compile preprocessFileLineNumbers "functions\fnc_update_everything.sqf";
FUNC(update_firemode) = compile preprocessFileLineNumbers "functions\fnc_update_firemode.sqf";

