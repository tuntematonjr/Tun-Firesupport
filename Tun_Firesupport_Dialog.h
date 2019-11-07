//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.h"
class Tun_Firesupport_Dialog
{
	idd = -1;
	
	class ControlsBackground
	{
		
	};
	class Controls
	{
		class tun_firesupport_tausta
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.18125;
			y = safeZoneY + safeZoneH * 0.07444445;
			w = safeZoneW * 0.6375;
			h = safeZoneH * 0.85;
			style = 48;
			text = "tablet.jpg";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class tun_firesupport_header
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.251875;
			y = safeZoneY + safeZoneH * 0.15222223;
			w = safeZoneW * 0.4775;
			h = safeZoneH * 0.05666667;
			style = 2;
			text = "Mobile Supreme Indirect Fire Support Request System For Blahh. A.K.A WIP";
			colorBackground[] = {0,0.102,0.502,1};
			colorText[] = {0.6118,0.949,0.7961,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 2;
			
		};
		class tun_firesupport_avaible_batteries
		{
			type = 5;
			idc = 2200;
			x = safeZoneX + safeZoneW * 0.25875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.1475;
			h = safeZoneH * 0.47555556;
			style = 16;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onLBSelChanged = "[] call tun_firesupport_fnc_add_AmmoTypes; [] call Tun_firesupport_fnc_eta;";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class tun_firesupport_avaible_ammo
		{
			type = 5;
			idc = 2201;
			x = safeZoneX + safeZoneW * 0.41375;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.47555556;
			style = 16;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onLBSelChanged = "[] call Tun_firesupport_fnc_eta; [] call tun_firesupport_fnc_dialog_slider_max_ammo;";
			onMouseEnter = "[] call Tun_firesupport_fnc_eta;";
			onMouseExit = "";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class tun_firesupport_eta
		{
			type = 0;
			idc = 2202;
			x = safeZoneX + safeZoneW * 0.60875;
			y = safeZoneY + safeZoneH * 0.69;
			w = safeZoneW * 0.0925;
			h = safeZoneH * 0.04;
			style = 2;
			text = "CANT FIRE";
			colorBackground[] = {0,0.102,0.502,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class tun_firesupport_call_fire
		{
			type = 1;
			idc = 2207;
			x = safeZoneX + safeZoneW * 0.59;
			y = safeZoneY + safeZoneH * 0.75222223;
			w = safeZoneW * 0.1325;
			h = safeZoneH * 0.05888889;
			style = 0+2;
			text = "FIRE!";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.302,0,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0.9255,0.8824,0.1725,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			action = "[] call tun_firesupport_fnc_call_support;";
			onButtonClick = "";
			onMouseEnter = "[] call Tun_firesupport_fnc_eta;";
			shadow = 1;
			
		};
		class tun_firesupport_amount_baground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.41375;
			y = safeZoneY + safeZoneH * 0.78;
			w = safeZoneW * 0.146875;
			h = safeZoneH * 0.04;
			style = 0;
			text = "";
			colorBackground[] = {0.302,0.302,0.302,1};
			colorText[] = {0,0,0,0};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class tun_firesupport_amount
		{
			type = 43;
			idc = 2205;
			x = safeZoneX + safeZoneW * 0.415625;
			y = safeZoneY + safeZoneH * 0.78777778;
			w = safeZoneW * 0.1425;
			h = safeZoneH * 0.02666667;
			style = 1024;
			arrowEmpty = "\A3\ui_f\data\GUI\Cfg\Slider\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\Cfg\Slider\arrowFull_ca.paa";
			border = "\A3\ui_f\data\GUI\Cfg\Slider\border_ca.paa";
			color[] = {0.498,0.6549,0.102,1};
			colorActive[] = {1,1,1,1};
			thumb = "\A3\ui_f\data\GUI\Cfg\Slider\thumb_ca.paa";
			onSliderPosChanged = "[] call tun_firesupport_fnc_slider_update; [] call Tun_firesupport_fnc_eta;";
			
		};
		class tun_firesupport_text_amount
		{
			type = 0;
			idc = 2206;
			x = safeZoneX + safeZoneW * 0.44125;
			y = safeZoneY + safeZoneH * 0.73222223;
			w = safeZoneW * 0.0875;
			h = safeZoneH * 0.04;
			style = 2;
			text = "1";
			colorBackground[] = {0.1333,0.3294,0.6667,1};
			colorText[] = {0.8667,0.6706,0.3333,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class tun_firesupport_easting : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = 2203;
			x = safeZoneX + safeZoneW * 0.59375;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.04;
			onDestroy = "[] call tun_firesupport_fnc_save_coordinates;";
			onKeyUp = "[] call Tun_firesupport_fnc_eta;";
			
		};
		class tun_firesupport_northing : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = 2204;
			x = safeZoneX + safeZoneW * 0.59375;
			y = safeZoneY + safeZoneH * 0.45444445;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.04;
			onKeyUp = "[] call Tun_firesupport_fnc_eta;";
			
		};
		class tun_firesupport_text_easting : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.59375;
			y = safeZoneY + safeZoneH * 0.27444445;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.04;
			text = "Easting";
			
		};
		class tun_firesupport_text_northing : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.59375;
			y = safeZoneY + safeZoneH * 0.40444445;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.04;
			text = "Northing";
			
		};
		class tun_firesupport_text_eta : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.62875;
			y = safeZoneY + safeZoneH * 0.63444445;
			w = safeZoneW * 0.0525;
			h = safeZoneH * 0.04;
			text = "ETA";
			
		};
		
	};
	
};
