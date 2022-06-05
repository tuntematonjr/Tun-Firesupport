//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.hpp"
class tun_firesupport_convertDialog
{
	idd = MAINCONVERT_IDD;
	enableSimulation = false;
	class ControlsBackground
	{
		class tun_firesupport_convert_background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.175;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.575;
			style = 0;
			text = "";
			colorBackground[] = GUI_BCG_MENU;
			colorText[] = {0.2431,0.1725,0.3333,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
	};
	class Controls
	{
		class tun_firesupport_convert_header : tun_firesupport_header_base
		{
			x = safeZoneX + safeZoneW * 0.325;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_converter_header";
			

		};
		class tun_firesupport_convert_swtEditBox : tun_default_editBox
		{
			idc = SWTDATA;
			x = safeZoneX + safeZoneW * 0.325;
			y = safeZoneY + safeZoneH * 0.52777778;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.19722223;
			text = "$STR_tun_firesupport_converter_swtEditBoxText";
			style = 16+2;		
		};
		class tun_firesupport_convert_tunEditBox : tun_firesupport_convert_swtEditBox
		{
			idc = TUNDATA;
			y = safeZoneY + safeZoneH * 0.26851852;
			text = "$STR_tun_firesupport_converter_firesupportEditBoxText";		
			
		};
		class tun_firesupport_swt_to_firesupport_button : RscButton
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3625;
			y = safeZoneY + safeZoneH * 0.47222223;
			w = safeZoneW * 0.096875;
			h = safeZoneH * 0.0462963;
			text = "To Firesupport";
			onButtonClick = "[false] call tun_firesupport_fnc_convertData";
			colorBackground[] = GUI_BCG_COLOR;
			colorBackgroundActive[]  = GUI_BCG_COLOR;
		};
		class tun_firesupport_firesupport_to_swt_button : tun_firesupport_swt_to_firesupport_button
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.540625;
			text = "To SWT";
			onButtonClick = "[true] call tun_firesupport_fnc_convertData";
		};
		
	};
	
};
