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
 * ["something", player] call tun_firesupport_fnc_dialog_close
 */
#include "script_component.hpp"

<<<<<<< Updated upstream


player setVariable [QGVAR(easting), ctrlText EASTING_IDC];

player setVariable [QGVAR(northing), ctrlText NORTHING_IDC];

player setVariable [QGVAR(easting_end), ctrlText EASTING_END_IDC];

player setVariable [QGVAR(northing_end), ctrlText NORTHING_END_IDC];


=======
private _values = [ctrlText EASTING_IDC,  ctrlText NORTHING_IDC, ctrlText EASTING_END_IDC, ctrlText NORTHING_END_IDC];

player setVariable [QGVAR(oldCoordinates), _values];
>>>>>>> Stashed changes

[GVAR(dialog_PFH)] call CBA_fnc_removePerFrameHandler;