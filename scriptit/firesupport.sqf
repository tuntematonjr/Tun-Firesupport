#include "script_component_firesupport.hpp"
params ["_unit"];
if (!hasInterface) exitWith { };
[{
    (!isNull player && time > 2)
},
{
	params ["_unit"];
	if !(local _unit) exitWith { };

tun_battery1 = ["122 H63", [tykki1, tykki2, tykki3], [["32Rnd_155mm_Mo_shells", 54], ["6Rnd_155mm_Mo_smoke", 18]]];
tun_battery2 = ["Mortar", [mor1, mor2, mor3], [["8Rnd_82mm_Mo_shells",72], ["8Rnd_82mm_Mo_Flare_white",72], ["8Rnd_82mm_Mo_Smoke_white",36]]];

GVAR(batteries) = [tun_battery1, tun_battery2];

GVAR(namespace) = call CBA_fnc_createNamespace;

//Do not change
GVAR(cooldowntime) = 20; //Minium cooldown time
GVAR(cooldownmultiplier) = 5; //How much time each round increase cooldown

GVAR(namespace) setVariable ["easting", "000"];
GVAR(namespace) setVariable ["northing", "000"];
{
	_x params ["_name", "_guns", "_ammos"];

	//Remove all maingun magazines
	{
		private _gun = _x;
		{
			//_gun removeMagazinesTurret [_x, [0]];
			[_gun, [_x, [0]]] remoteExec ["removeMagazinesTurret", _gun];
		} forEach (_gun magazinesTurret [0]);
	} forEach _guns;

	//Save ammocount
	{
		_ammo = _x select 0;
		_count = _x select 1;
		GVAR(namespace) setVariable [format ["%1_%2", _name, _ammo], _count];

		//add empty mag for ETA
		{
			//_x addMagazineTurret [_ammo, [0], 0];
			[_x, [_ammo, [0], 0]] remoteExec ["addMagazineTurret", _x];
		} forEach _guns;

	} forEach _ammos;


} forEach GVAR(batteries);



FUNC(call_support) = {


	if ( (ctrlText 2202) in ["CANT FIRE", "Out of Range", "Out of Ammo", "Busy"] ) exitWith {
		hintSilent (ctrlText 2202);
		playSound "zoom_fail";
	};

	_artillery = GVAR(batteries) select (lbCurSel 2200);
	private _pos = [] call FUNC(get_realpos);
	private _type = ((_artillery select 2 ) select (lbCurSel 2201)) select 0;
	private _amount = sliderPosition 2205;
	_guns = _artillery select 1;
	private _gun_count = count _guns;

	if ( _amount == 0 ) exitWith {
		playSound "zoom_fail";
	};

	//cooldown
	(_guns select 0) setVariable [QGVAR(doing_firemission), (time + (_amount * GVAR(cooldownmultiplier)) + GVAR(cooldowntime))];


	//update ammocount
	_var_name = [] call  FUNC(get_shell_varname);

	_original_count = GVAR(namespace) getVariable _var_name;
	_new_count = _original_count - _amount;

	GVAR(namespace) setVariable [_var_name, _new_count];
	[] call FUNC(dialog_slider_max_ammo);

	//Finaly firing some shit
	{
		private _gun = _x;
		{
			//_gun removeMagazinesTurret [_x, [0]];
			[_gun, [_x, [0]]] remoteExec ["removeMagazinesTurret", _gun];
		} forEach (_gun magazinesTurret [0]);

		_splitted_amount = floor (_amount / _gun_count);

		DEC(_gun_count);
		SUB(_amount,_splitted_amount);

		if (_splitted_amount > 0) then {
			//_gun addMagazineTurret [_type, [0], _splitted_amount];
			[_gun, [_type, [0], _splitted_amount]] remoteExec ["addMagazineTurret", _gun];
			//_gun commandArtilleryFire [_pos, _type, _splitted_amount];
			[_gun, [_pos, _type, _splitted_amount]] remoteExec ["commandArtilleryFire", _gun];
		};
	} forEach _guns;

	_eta_number = [] call FUNC(eta);




	/*_eta = [_eta, "M:SS"] call CBA_fnc_formatElapsedTime;

	ok = [_eta, _eta_number];*/

	playSound selectRandom ["RadioAmbient2", "RadioAmbient6", "RadioAmbient8"];
	//_marker = [format ["Tun_firesupport_marker_%1", _eta_number], [(_pos select 0), (_pos select 1)], "ICON", [1, 1],"TEXT:", format ["Fired at %2, ETA to splash %1s", round _eta_number, daytime toFixed 2],"TYPE:", "mil_dot"] call CBA_fnc_createMarker;
	//[{ deleteMarker _this }, _marker, (_eta_number + 30)] call CBA_fnc_waitAndExecute;
};


FUNC(get_shell_varname) = {

	_name_idc = lbCurSel 2200;
	_ammo_idc = lbCurSel 2201;

	_name =( GVAR(batteries) select _name_idc) select 0;
	_ammo = (((GVAR(batteries) select _name_idc) select 2) select _ammo_idc) select 0;

	_var_name = format ["%1_%2", _name, _ammo];

	_var_name

};

FUNC(save_coordinates) = {

	GVAR(namespace) setVariable ["easting", ctrlText 2203];
	GVAR(namespace) setVariable ["northing", ctrlText 2204];

};

FUNC(eta) = {
	//params ["_pos", "_artillery", "_type"];

	if ( lbCurSel 2200 != -1 && lbCurSel 2201 != -1 ) then {

		_pos = [] call FUNC(get_realpos);
		_artillery = GVAR(batteries) select (lbCurSel 2200);
		_type = ((_artillery select 2 ) select (lbCurSel 2201)) select 0;
		_guns = (_artillery select 1) ;
		_gun = _guns select 0;
		_eta = _gun getArtilleryETA [_pos, _type];
		_eta_number = _eta;
		if !(_type in getArtilleryAmmo _guns) then {
			{
				[_x, [_type, [0], 0]] remoteExec ["addMagazineTurret", _x];
			} forEach _guns;
		};

		_eta = if (_eta == -1) then {
			"CANT FIRE";
		} else {
			((str round _eta)  + " s");
		};

		if !(_pos inRangeOfArtillery [(_artillery select 1), _type]) then {
			_eta = "Out of Range";
		};

 		_remainingshels = GVAR(namespace) getVariable ([] call FUNC(get_shell_varname));

		if (_remainingshels == 0) then {
			_eta = "Out of Ammo";
		};


		if (_gun getVariable [QGVAR(doing_firemission), 0] > time) then {
			_eta = "Busy";
		};

		ctrlSetText [2202, _eta];

		_eta_number
	};
};

FUNC(get_realpos) = {
	_easting = ctrlText 2203;
	_northing = ctrlText 2204;
	_pos = [[_easting, _northing], true] call CBA_fnc_mapGridToPos;

	_pos
};


FUNC(add_AmmoTypes) = {
	lbClear 2201;
	_ammos = (GVAR(batteries) select lbCurSel 2200) select 2;
	{
		_ammoDisplayname = getText (configFile >> "CfgMagazines" >> (_x select 0) >> "displayName");
		//_text = format ["%1 (%2)", _ammoDisplayname, _x select 1]; Vanhentunut mutta jätetty muistiin jos tarvii.
		lbAdd [2201, _ammoDisplayname];
	} forEach _ammos ;
	lbSetCurSel [2201, 0];
};


FUNC(slider_update) = {


	_amount = sliderPosition 2205;

	_amount = round _amount;

	ctrlSetText [2206, str _amount];
	sliderSetPosition [2205, _amount];
};

FUNC(dialog_slider_max_ammo) = {

	_var_name = [] call FUNC(get_shell_varname);

	_count = GVAR(namespace) getVariable _var_name;

	sliderSetRange [2205, 0, _count];
	sliderSetPosition [2205, 0];

	if (_count == 0) then {
		_count = "Out of Ammo"
	} else {
		_count = str _count;
	};
	ctrlSetText [2206, _count];

};

FUNC(open_dialog) = {
	createDialog "Tun_Firesupport_Dialog";
	sliderSetRange [2205, 0, 50];
	sliderSetSpeed [2205, 1, 1];

	_easting = GVAR(namespace) getVariable ["easting", 00000];
	if ( _easting == "" ) then { _easting = "00000"; };

	_northing = GVAR(namespace) getVariable ["northing", 00000];
	if ( _northing == "" ) then { _easting = "00000"; };

	ctrlSetText [2203, _easting];
	ctrlSetText [2204, _northing];

	//Add batteries
 	{
 		_name = _x select 0;
 		_count = count (_x select 1);
 		_name = format ["%1 - %2 Guns", _name, _count];
 		_index = lbAdd [2200, _name];

 		_gun = (_x select 1) select 0;
 		_gunicon = getText (configFile >> "CfgVehicles" >> typeOf _gun >> "picture");
 		lbSetPicture [2200, _index, _gunicon];
 	} forEach GVAR(batteries);
};

//player addAction ["a useless action that does nothing", {[] call FUNC(open_dialog);}];


_action = ["Open Firesupport","Open Firesupport","", { [] call tun_firesupport_fnc_open_dialog; }, {("ItemGPS" in assignedItems player || "ACE_microDAGR" in items player)}] call ace_interact_menu_fnc_createAction;
[(typeOf _unit), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;


}, [_unit]] call CBA_fnc_waitUntilAndExecute;
