#include "script_component.hpp"
//GVAR(required_items) = GVAR(required_items) splitString ",";

// if (hasInterface) then {
// 	private _condition = {
// 		{
// 			private _item = _x;
// 			items player findIf {_x == "ace_microdagr"} != -1
// 		} forEach GVAR(required_items)
// 	};
// 	private _action = ["Open Firesupport","Open Firesupport","", { [] call FUNC(open_dialog); }, _condition] call ace_interact_menu_fnc_createAction;
// 	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
// };
