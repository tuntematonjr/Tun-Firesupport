#include "script_component.hpp"

class CfgPatches
{
    class Tun_Firesupport
    {
        units[] = { QGVAR(gun_classname) };
        weapons[] = {};
        requiredVersion = 1.94;
        requiredAddons[] = {"A3_Modules_F","3DEN","cba_main","cba_xeh","cba_settings","ace_common","ace_interaction","ace_interact_menu"};
        author = "Tuntematon";
        authorUrl = "https://armafinland.fi/";
    };
};

#include "Firesupport_dialog.hpp"
#include "CfgSounds.hpp"

class CfgFactionClasses
{
    class NO_CATEGORY;
    class GVAR(category) : NO_CATEGORY
    {
        displayName = $STR_tun_firesupport_module_category;
    };
};



class Extended_PostInit_EventHandlers {
    class Tun_Firesupport {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_PreInit_EventHandlers {
    class Tun_Firesupport {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
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
        displayName = $STR_tun_firesupport_module_gun;
        function = QFUNC(module_gun);
        scope = 2;// Editor visibility; 2 will show it in the menu, 1 will hide it.
        isGlobal = 1; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
        isTriggerActivated = 0;
        isDisposable = 0; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
        //icon = QPATHTOF(UI\Icon_Module_Slideshow_ca.paa);
        class Arguments {
            class className {
                displayName = $STR_tun_firesupport_module_gun_class_displayname;
                description = $STR_tun_firesupport_module_gun_class_description;
                typeName = "STRING";
                defaultValue = "B_Mortar_01_F";
            };
            
            class displayName {
                displayName = $STR_tun_firesupport_module_gun_name_displayname;
                description = $STR_tun_firesupport_module_gun_name_description;
                typeName = "STRING";
                defaultValue = "";
            };
            
            class countDown {
                displayName = $STR_tun_firesupport_module_gun_countDown_displayname;
                description = $STR_tun_firesupport_module_gun_countDown_description;
                typeName = "NUMBER";
                defaultValue = 60;
            };
            
            class delayMin {
                displayName = $STR_tun_firesupport_module_gun_delayMin_displayname;
                description = $STR_tun_firesupport_module_gun_delayMin_description;
                typeName = "NUMBER";
                defaultValue = 2;
            };
            
            class spreadMin {
                displayName = $STR_tun_firesupport_module_gun_spreadMin_displayname;
                description = $STR_tun_firesupport_module_gun_spreadMin_description;
                typeName = "NUMBER";
                defaultValue = 50;
            };
            
            class side {
                displayName = $STR_tun_firesupport_module_gun_side_displayname;
                description = $STR_tun_firesupport_module_gun_side_description;
                typeName = "STRING";
                defaultValue = "";
            };
            
            class minRange {
                displayName = $STR_tun_firesupport_module_gun_minRange_displayname;
                description = $STR_tun_firesupport_module_gun_minRange_description;
                typeName = "NUMBER";
                defaultValue = 0;
            };
            
            class maxRange {
                displayName = $STR_tun_firesupport_module_gun_maxRange_displayname;
                description = $STR_tun_firesupport_module_gun_maxRange_description;
                typeName = "NUMBER";
                defaultValue = 10000;
            };
            
            class marker {
                displayName = $STR_tun_firesupport_module_gun_markerToggle_displayname;
                description = $STR_tun_firesupport_module_gun_markerToggle_description;
                typeName = "BOOL";
                defaultValue = true;
            };

        };
        class ModuleDescription {
            description = $STR_tun_firesupport_module_description_gun;
        };
    };

    class GVAR(gun_ammo): ACE_Module {
        author = "Tuntematon";
        category = QGVAR(category);
        displayName = $STR_tun_firesupport_module_ammo;
        function = "";
        scope = 2;// Editor visibility; 2 will show it in the menu, 1 will hide it.
        isGlobal = 1; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
        isTriggerActivated = 0;
        isDisposable = 0; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
        //icon = QPATHTOF(UI\Icon_Module_Slideshow_ca.paa);
        class Arguments {
            class Ammo {
                displayName = $STR_tun_firesupport_module_ammo_displayname;
                description = $STR_tun_firesupport_module_ammo_description;
                typeName = "STRING";
                defaultValue = "8Rnd_82mm_Mo_shells";
            };
            class Count {
                displayName = $STR_tun_firesupport_module_ammo_count_displayName;
                description = $STR_tun_firesupport_module_ammo_count_description;
                typeName = "NUMBER";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = $STR_tun_firesupport_module_descriptio_ammo;
        };
    };
};