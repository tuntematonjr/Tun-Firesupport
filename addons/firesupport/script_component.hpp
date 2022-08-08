#define COMPONENT firesupport
#define PREFIX Tun

#define MAJOR 2
#define MINOR 1
#define PATCHLVL 0
#define BUILD 05062022

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.94

/*
	#define DEBUG_ENABLED_SYS_MAIN
*/

#define DEBUG_MODE_FULL

#ifdef DEBUG_ENABLED_MAIN
	#define DEBUG_MODE_FULL
#endif

#include "\z\ace\addons\main\script_macros.hpp"
#include "Firesupport_idc.hpp"


// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

//AAR update macro
#define AAR_UPDATE(OBJ,VARNAME,VALUE) if ( !isnil "afi_aar2" ) then { [OBJ, VARNAME, VALUE] call afi_aar2_fnc_addcustomdata; };
#define AAR_FOLLOWPROJECTILE(PROJECTILECLASSNAME,PROJECTILEOBJ)	if ( !isnil "afi_aar2" ) then { [objNull, "", PROJECTILECLASSNAME, PROJECTILEOBJ, objNull] call afi_aar2_fnc_add_projectile; };