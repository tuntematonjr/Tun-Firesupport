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
 * [] call tun_firesupport_fnc_save_bookmarks
 */
#include "script_component.hpp"

params ["_value"];
ok = "moi";
if (_value) then {
	//export
	ctrlSetText [BOOKMARK_EDITBOX_IDC, str GVAR(bookmarkValues)];
} else {
	//import
	ok = (ctrlText BOOKMARK_EDITBOX_IDC);
	{
		GVAR(bookmarkValues) pushBackUnique _x;
	} forEach (call compile ctrlText BOOKMARK_EDITBOX_IDC);

	[] call FUNC(update_bookmarks);
};
// [["kaikkea [00000:00000]","00000","00000","00000","00000",0,"Mortart 1",0,"HE Mortar Shells",0,"Standard",0,50,1],["sitä [1:01]","1","01","00000","00000",0,"Mortart 1",0,"HE Mortar Shells",0,"Standard",0,50,1],["tulee [12:012]","12","012","00000","00000",0,"Mortart 1",0,"HE Mortar Shells",0,"Standard",0,50,1],["luvattua [123:0125]","123","0125","00000","00000",0,"Mortart 1",0,"HE Mortar Shells",0,"Standard",0,50,1],["ennen [123:0125]","123","0125","00000","00000",0,"Mortart 1",0,"HE Mortar Shells",0,"Standard",0,50,1],["joulua [12354:01255]","12354","01255","00000","00000",0,"Mortart 1",0,"HE Mortar Shells",0,"Standard",0,50,1]]