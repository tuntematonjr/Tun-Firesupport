#include "script_component.hpp"

class CfgPatches
{
	class tun_artycomputer_models
	{
		requiredVersion = 1.94;
		requiredAddons[] = {"A3_Weapons_F","cba_main","cba_xeh","cba_settings"};
		units[]={};
		weapons[]={"tun_tablet"};
		author = "Immonen & Nurmi";
        authorUrl = "https://armafinland.fi/";
	};
};

class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

	
	class tun_tablet: CBA_MiscItem
	{
		displayName="Military Tablet";
		scope=2;
		author="Immonen & Nurmi";
		picture= "\x\Tun\addons\artycomputer_models\data\tablet_icon.paa";
		model= "\x\Tun\addons\artycomputer_models\tablet.p3d";
		icon= "\x\Tun\addons\artycomputer_models\data\tablet_icon.paa";
		descriptionShort="Tablet used to run AFI (Advanced Firesupport Interface)";
		class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
	};
};

