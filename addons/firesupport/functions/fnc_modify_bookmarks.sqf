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
 * [] call tun_firesupport_fnc_modify_bookmarks
 */
#include "script_component.hpp"
params ["_value"];
private _listArray = tvCurSel ARTY_LIST_IDC;

switch (toLower _value) do {
	case "bookmark": { 
		if (count _listArray isNotEqualTo 2) exitWith { "Gun or ammo not selected" call CBA_fnc_notify; };
		//ADD bookmark
		private _name = ctrlText BOOKMARK_NAME_VALUE_IDC;
		private _easting = ctrlText EASTING_IDC;
		private _northing = ctrlText NORTHING_IDC;
		private _easting2 = ctrlText EASTING_END_IDC;
		private _northing2 = ctrlText NORTHING_END_IDC;
		private _gun = tvCurSel ARTY_LIST_IDC;
		private _gunText = tvText [ARTY_LIST_IDC, [_gun select 0]];
		private _ammoText = tvText [ARTY_LIST_IDC, _gun];
		private _mode = lbCurSel FIRING_TYPE_IDC;
		private _modeText = lbText [FIRING_TYPE_IDC,_mode];
		private _count = ctrlText COUNT_IDC;
		private _radius = ctrlText RANGE_IDC;
		private _delay = ctrlText DELAY_IDC;
		private _trp1 = cbChecked (findDisplay MAIN_IDD displayCtrl TRP1);
		private _trp2 = cbChecked (findDisplay MAIN_IDD displayCtrl TRP2);
		private _timeCheck = cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLETIME);
		private _hours = ctrlText TIMEHOURS;
		private _minutes = ctrlText TIMEMINUTES;
		private _seconds = ctrlText TIMESECONDS;
		private _volley =  cbChecked (findDisplay MAIN_IDD displayCtrl TOGGLEVOLLEY);
		private _trpList1 = lbCurSel TRP1_LIST;
		private _trpList2 = lbCurSel TRP2_LIST;
		private _trpList1Text = lbText [TRP1_LIST, _trpList1];
		private _trpList2text = lbText [TRP2_LIST, _trpList2];

		if (_trp1) then {
			_name = format["%1 [%2]",_name, _trpList1Text];
		} else {
			_name = format["%1 [%2:%3]",_name, _easting, _northing];
		};
		
		GVAR(bookmarkValues) pushBackUnique [_name, _easting, _northing, _easting2, _northing2, _gun, _gunText, _ammoText, _mode, _modeText, _count, _radius, _delay, _trp1, _trp2, _timeCheck, _hours, _minutes, _seconds, _volley, _trpList1, _trpList2, _trpList1Text, _trpList2text]; 
	};

	case "trp": { 
		private _name = ctrlText BOOKMARK_NAME_VALUE_IDC;
		private _easting = ctrlText EASTING_IDC;
		private _northing = ctrlText NORTHING_IDC;
		private _position = ([] call FUNC(getTargetPositon)) select 0;
		_name = format["TRP-%1 [%2:%3]",_name, _easting, _northing];
		GVAR(trpValues) pushBackUnique [_name, _easting, _northing, _position];
		GVAR(trpValues) sort true;
	};

	case "remove": { 
		private _index = lbCurSel BOOKMARK_LIST_IDC;
		private _data = lbData [BOOKMARK_LIST_IDC, _index];
		private _value = lbValue [BOOKMARK_LIST_IDC, _index];
		if (_data isEqualTo  "bookmark") then {
			//Remove bookmark
			GVAR(bookmarkValues) deleteAt _value;
		} else {
			GVAR(trpValues) deleteAt _value;
		};
	};
	default { };
};

[] call FUNC(update_bookmarks);