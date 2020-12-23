#include "script_component.hpp"
#include "XEH_prep.sqf"



ISNILS(GVAR(guns_west),[]);
ISNILS(GVAR(guns_east),[]);
ISNILS(GVAR(guns_resistance),[]);
ISNILS(GVAR(guns_civilian),[]);
ISNILS(GVAR(bookmarkValues),[]);
ISNILS(GVAR(bookmarkOpen),false);




//Main settings
[
    QGVAR(is_required), // Unique setting name. Matches resulting variable name <STRING>
    "CHECKBOX", // Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    [localize "STR_tun_firesupport_cba_is_required", localize "STR_tun_firesupport_cba_is_required_tooltip"], // Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
   localize "STR_tun_firesupport_cba_Category_main", // Category for the settings menu + optional sub-category <STRING, ARRAY>
    true, // Extra properties of the setting depending of _settingType.
    1, // 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <ARRAY>
    {}, // Script to execute when setting is changed. (optional) <CODE>
    true //Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;


[
    QGVAR(debug), // Unique setting name. Matches resulting variable name <STRING>
    "CHECKBOX", // Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    [localize "STR_tun_firesupport_cba_debug", localize "STR_tun_firesupport_cba_debug"], // Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    localize "STR_tun_firesupport_cba_Category_main", // Category for the settings menu + optional sub-category <STRING, ARRAY>
    false, // Extra properties of the setting depending of _settingType.
    0, // 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <ARRAY>
    {}, // Script to execute when setting is changed. (optional) <CODE>
    false //Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_Settings_fnc_init;

// "mp_groundsupport_45_artillery_BHQ_0"
// mp_groundsupport_45_artillery_BHQ_1
// mp_groundsupport_45_artillery_BHQ_2
// mp_groundsupport_45_artillery_IHQ_0
// mp_groundsupport_45_artillery_IHQ_1
// mp_groundsupport_45_artillery_IHQ_2
// mp_groundsupport_45_artillery_OHQ_0
// mp_groundsupport_45_artillery_OHQ_1
// mp_groundsupport_45_artillery_OHQ_2