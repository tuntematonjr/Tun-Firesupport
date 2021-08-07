#include "script_component.hpp"

#undef PREP
#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction

PREP(calculate_eta);
PREP(check_values);
PREP(dialog_close);
PREP(fire);
PREP(modify_bookmarks);
PREP(module_gun);
PREP(open_dialog);
PREP(save_bookmarks);
PREP(selected_bookmark);
PREP(toggle_mode);
PREP(update_bookmarks);
<<<<<<< Updated upstream
PREP(update_everything);
PREP(update_firemode);
=======
PREP(update_firemode);
PREP(trpCheckbox);
PREP(timeCheckbox);
PREP(setValues);
PREP(check_time);
PREP(updateStatus);
PREP(createShell);
PREP(firemission_standard);
PREP(firemission_end);
PREP(firemission_queue);
PREP(removeQueue);
PREP(firemission_creepingBarrage);
PREP(firemission_wall);
PREP(playSound);

>>>>>>> Stashed changes
