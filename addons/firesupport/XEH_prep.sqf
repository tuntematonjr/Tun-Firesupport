#include "script_component.hpp"

#undef PREP
#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction

PREP(calculate_eta);
PREP(check_min_values);
PREP(dialog_close);
PREP(fire);
PREP(get_realpos);
PREP(gun_ammo_dialog);
PREP(modify_bookmarks);
PREP(module_gun);
PREP(open_dialog);
PREP(save_bookmarks);
PREP(selected_bookmark);
PREP(toggle_bookmarks);
PREP(update_ammo_count);
PREP(update_bookmarks);
PREP(update_everything);
PREP(update_firemode);
