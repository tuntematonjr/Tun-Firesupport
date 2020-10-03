#include "script_component.hpp"

class CfgPatches
{
    class Tun_Respawn
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
    class Tun_Respawn {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_PreInit_EventHandlers {
    class Tun_Respawn {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PreStart_EventHandlers {
    class Tun_Respawn {
        init = QUOTE( call COMPILE_FILE(XEH_preStart) );
    };
};



class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class CBA_MiscItem: itemcore {};

    class TUN_firesupport_tablet: CBA_MiscItem {
        author = "Tuntematon";
        scope = 2;
        displayName = "Firesupport Tablet";
        // descriptionShort = CSTRING(itemDescription);
        // model = QPATHTOF(data\MicroDAGR.p3d);
        // picture = QPATHTOF(images\microDAGR_item.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };
};