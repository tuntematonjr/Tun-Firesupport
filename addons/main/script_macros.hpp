#include "\z\ace\addons\main\script_macros.hpp"

#ifdef DISABLE_COMPILE_CACHE
	#undef PREP
	#define PREP(fncName)		DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
	#undef PREP
	#define PREP(fncName)		[QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define tunfire_FIND_MAPDISPLAY	([53, 52, 37, 12, nil] select ([53, 52, 37, 12] findIf {!isNull findDisplay _x}))

#define GITHUBLINK				"https://github.com/tuntematonjr/Tun-Utilities"
#define MAIN_ADDON_STR			QUOTE(MAIN_ADDON)

//This forces debug on everything.
//#define DEBUG_ENABLED_MAIN


#include "\a3\ui_f\hpp\defineCommonColors.inc"

// Default grid
#define GUI_GRID_WAbs		   ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_HAbs		   (GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W			  (GUI_GRID_WAbs / 40)
#define GUI_GRID_H			  (GUI_GRID_HAbs / 25)
#define GUI_GRID_X			  (safezoneX)
#define GUI_GRID_Y			  (safezoneY + safezoneH - GUI_GRID_HAbs)

// Default text sizes
#define GUI_TEXT_SIZE_SMALL		 (GUI_GRID_H * 0.8)
#define GUI_TEXT_SIZE_MEDIUM		(GUI_GRID_H * 1)
#define GUI_TEXT_SIZE_LARGE		 (GUI_GRID_H * 1.2)


//AAR update macro
#define AAR_UPDATE(OBJ,VARNAME,VALUE) if ( !isNil "afi_aar2" ) then { [OBJ, VARNAME, VALUE] call afi_aar2_fnc_addcustomdata; };
#define AAR_FOLLOWPROJECTILE(PROJECTILECLASSNAME,PROJECTILEOBJ)	if ( !isNil "afi_aar2" ) then { [objNull, "", PROJECTILECLASSNAME, PROJECTILEOBJ, objNull] call afi_aar2_fnc_add_projectile; };