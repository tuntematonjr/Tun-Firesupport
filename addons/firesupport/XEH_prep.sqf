#include "script_component.hpp"

#undef PREP
#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction

PREP(fire);
PREP(get_realpos);
PREP(open_dialog);
PREP(module_gun);
PREP(gun_ammo_dialog);
PREP(dialog_close);
PREP(update_ammo_count);
PREP(calculate_eta);
PREP(check_min_values);
PREP(update_everything);
PREP(update_firemode);