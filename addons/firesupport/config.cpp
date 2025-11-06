#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = { QGVAR(gun_classname) };
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {MAIN_ADDON_STR,"A3_Modules_F","3DEN","cba_main","cba_xeh","cba_settings","ace_common","ace_interaction","ace_interact_menu","ace_modules"};
		authors[] = {"Tuntematon"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "Convert_dialog.hpp"
#include "Firesupport_dialog.hpp"
#include "CfgSounds.hpp"

class CfgFactionClasses
{
    class NO_CATEGORY;
    class GVAR(category) : NO_CATEGORY
    {
        displayName = "TUN Firesupport";
    };
};


class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(openDialog) {
                    displayName = "Firesupport";
                    condition = QUOTE('tun_tablet' in items _player);
                    statement = QUOTE([] call FUNC(open_dialog));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    icon = "\x\Tun\addons\artycomputer_models\data\tablet_icon.paa";
                };
            };
        };
    };


    class ACE_Module;
    class GVAR(gun_classname): ACE_Module {
        author = "Tuntematon";
        category = QGVAR(category);
        displayName = CSTRING(module_gun);
        function = QFUNC(module_gun);
        scope = 2;// Editor visibility; 2 will show it in the menu, 1 will hide it.
        isGlobal = 1; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
        isTriggerActivated = 0;
        isDisposable = 0; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
        //icon = QPATHTOF(UI\Icon_Module_Slideshow_ca.paa);
        class Arguments {
            class className {
                displayName = CSTRING(module_gun_class_displayname);
                description = CSTRING(module_gun_class_description);
                typeName = "STRING";
                defaultValue = "B_Mortar_01_F";
            };
            
            class displayName {
                displayName = CSTRING(module_gun_name_displayname);
                description = CSTRING(module_gun_name_description);
                typeName = "STRING";
                defaultValue = "";
            };
            
            class countDown {
                displayName = CSTRING(module_gun_countDown_displayname);
                description = CSTRING(module_gun_countDown_description);
                typeName = "NUMBER";
                defaultValue = 60;
            };
            
            class delayMin {
                displayName = CSTRING(module_gun_delayMin_displayname);
                description = CSTRING(module_gun_delayMin_description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            
            class delayMax {
                displayName = CSTRING(module_gun_delayMax_displayname);
                description = CSTRING(module_gun_delayMax_description);
                typeName = "NUMBER";
                defaultValue = 60;
            };
            
            class spreadMin {
                displayName = CSTRING(module_gun_spreadMin_displayname);
                description = CSTRING(module_gun_spreadMin_description);
                typeName = "NUMBER";
                defaultValue = 50;
            };
            
            class spreadMAX {
                displayName = CSTRING(module_gun_spreadMAX_displayname);
                description = CSTRING(module_gun_spreadMAX_description);
                typeName = "NUMBER";
                defaultValue = 500;
            };
            
            class side {
                displayName = CSTRING(module_gun_side_displayname);
                description = CSTRING(module_gun_side_description);
                typeName = "STRING";
                defaultValue = "";
            };
            
            class minRange {
                displayName = CSTRING(module_gun_minRange_displayname);
                description = CSTRING(module_gun_minRange_description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
            
            class maxRange {
                displayName = CSTRING(module_gun_maxRange_displayname);
                description = CSTRING(module_gun_maxRange_description);
                typeName = "NUMBER";
                defaultValue = 10000;
            };
            
            class gunCount {
                displayName = CSTRING(module_gun_gunCount_displayname);
                description = CSTRING(module_gun_gunCount_description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            
            class marker {
                displayName = CSTRING(module_gun_markerToggle_displayname);
                description = CSTRING(module_gun_markerToggle_description);
                typeName = "BOOL";
                defaultValue = 1;
            };

        };
        class ModuleDescription {
            description = CSTRING(module_description_gun);
        };
    };

    class GVAR(gun_ammo): ACE_Module {
        author = "Tuntematon";
        category = QGVAR(category);
        displayName = CSTRING(module_ammo);
        function = "";
        scope = 2;// Editor visibility; 2 will show it in the menu, 1 will hide it.
        isGlobal = 1; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
        isTriggerActivated = 0;
        isDisposable = 0; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
        //icon = QPATHTOF(UI\Icon_Module_Slideshow_ca.paa);
        class Arguments {
            class Ammo {
                displayName = CSTRING(module_ammo_displayname);
                description = CSTRING(module_ammo_description);
                typeName = "STRING";
                defaultValue = "8Rnd_82mm_Mo_shells";
            };
            class Count {
                displayName = CSTRING(module_ammo_count_displayname);
                description = CSTRING(module_ammo_count_description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(module_descriptio_ammo);
        };
    };
};