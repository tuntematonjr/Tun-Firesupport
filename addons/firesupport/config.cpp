#include "script_component.hpp"

class CfgPatches
{
    class Tun_Firesupport
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.94;
        requiredAddons[] = {"cba_main","cba_xeh","cba_settings","ace_interaction","ace_interact_menu"};
        author = "Tuntematon";
        authorUrl = "https://armafinland.fi/";
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
            class Tun_Firesupport {
                displayName = "Firesupport";
                condition = "true"; //'tun_tablet' in items player
                exceptions[] = {};
                statement = "[] call tun_firesupport_fnc_open_dialog";
                icon = "\x\Tun\addons\artycomputer_models\data\tablet_icon.paa";
            };
        };
    };
};