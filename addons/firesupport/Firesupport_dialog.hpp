//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.hpp"
//"Default" call BIS_fnc_exportGUIBaseClasses;

class Firesupport_dialog
{
	idd = MAIN_IDD;
	movingEnable = true;
	
	class ControlsBackground
	{
		class tun_firesupport_baground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.04980469;
			y = safeZoneY + safeZoneH * -0.17;
			w = safeZoneW * 0.90039063;
			h = safeZoneH * 1.4;
			style =  ST_PICTURE + ST_CENTER;
			text = "\x\Tun\addons\artycomputer_models\data\ui\tablet_ui.paa";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = true;
			onDestroy = "$STR_tun_firesupport_on_close_action";
			
		};
		
	};
	class Controls
	{
		class tun_firesupport_remaining_ammo_bar
		{
			type = 8;
			idc = REMAINIG_AMMO_PROGRESBAR_IDC;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.725;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			style = 0;
			colorBar[] = {1,0,0,1};
			colorFrame[] = {0.4471,0.2471,0.3804,1};
			texture = "#(argb,8,8,3)color(1,1,1,1)";
			
		};		
		
		class tun_firesupport_minimap : RscMapControl
		{
			idc = MINIMAP_IDC;
			x = safeZoneX + safeZoneW * 0.53808594;
			y = safeZoneY + safeZoneH * 0.44444445;
			w = safeZoneW * 0.14355469;
			h = safeZoneH * 0.23263889;
		};
		
		class tun_firesupport_fire
		{
			type = 1;
			idc = FIRE_IDC;
			x = safeZoneX + safeZoneW * 0.61875;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			style = 0+2;
			text = "Fire!";
			borderSize = 0.01;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.702,0.102,0.102,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {1,1,1,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.6,0,0,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
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
			action = "$STR_tun_firesupport_fire_action";
			colorFocused2[] = {0.6,0,0,1};
			default = false;
			onMouseEnter = "$STR_tun_firesupport_update_everything";
			shadow = 1;
			
		};
		class tun_firesupport_artylist : tun_firesupport_default_combo 
		{
			type = 4;
			idc = ARTY_LIST_IDC;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.325;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02962963;
			onLBSelChanged = "$STR_tun_firesupport_artylist_selection_action";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class tun_firesupport_firing_type : tun_firesupport_default_combo 
		{
			type = 4;
			idc = FIRING_TYPE_IDC;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.325;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02962963;
			onLBSelChanged = "$STR_tun_firesupport_firemode_changed_action";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class tun_firesupport_ammo_type : tun_firesupport_default_combo 
		{
			type = 4;
			idc = AMMO_TYPE_IDC;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.325;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02962963;
			onLBSelChanged = "$STR_tun_firesupport_ammotype_lb_change_action";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class tun_firesupport_easting_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = EASTING_IDC;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_easting";
			
		};
		class tun_firesupport_easting_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.375;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_easting";
			
		};
		class tun_firesupport_northing_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = 22202;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_northing";
			
		};
		class tun_firesupport_northing_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.375;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_northing";
			
		};
		class tun_firesupport_ammo_count : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = COUNT_IDC;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "0";
			onKillFocus = "$STR_tun_firesupport_check_min_values_ammo";
			tooltip = "$STR_tun_firesupport_ammocount_tooltip";
			
		};
		class tun_firesupport_ammo_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.37592593;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_ammocount";
			
		};
		class tun_firesupport_radius_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.375;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_radius";
			
		};
		class tun_firesupport_radius_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = RANGE_IDC;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "0";
			onKillFocus = "$STR_tun_firesupport_check_min_values_radius";
			tooltip = "$STR_tun_firesupport_radius_tooltip";
			
		};
		class tun_firesupport_delay_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.61875;
			y = safeZoneY + safeZoneH * 0.375;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_delay";
			
		};
		class tun_firesupport_delay_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = DELAY_IDC;
			x = safeZoneX + safeZoneW * 0.61875;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "1";
			onKillFocus = "$STR_tun_firesupport_check_min_values_delay";
			onMouseEnter = "$STR_tun_firesupport_check_min_values_delay";
			onMouseExit = "$STR_tun_firesupport_check_min_values_delay";
			tooltip = "$STR_tun_firesupport_delay_tooltip";
			
		};
		class tun_firesupport_remaining_ammo_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.675;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_remainign_ammo";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75);
			
		};
		class tun_firesupport_remaining_ammo_value : tun_firesupport_coordinate_preset 
		{
			type = 0;
			idc = REMAINIG_AMMO_IDC;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			style = 2;
			text = "0";
			tooltip = "$STR_tun_firesupport_remaining_ammo_tooltip";
			
		};
		class tun_firesupport_eta_text : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.675;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_eta";
			
		};
		class tun_firesupport_eta_value : tun_firesupport_coordinate_preset 
		{
			type = 0;
			idc = ETA_IDC;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			style = 2;
			text = "Value";
			tooltip = "$STR_tun_firesupport_eta_tooltip";
			
		};
		class tun_firesupport_header : tun_default_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.05;
			style = 32+2;
			text = "$STR_tun_firesupport_Header";
			shadow = 2;
			
		};
		class tun_firesupport_easting_end_point_text : tun_default_text 
		{
			type = 0;
			idc = EASTING_END_TEXT_IDC;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_easting_end_point";
			
		};
		class tun_firesupport_easting_end_point_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = EASTING_END_IDC;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.475;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_easting";
			
		};
		class tun_firesupport_northing_end_point_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = NORTHING_END_IDC;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.475;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_northing";
			
		};
		class tun_firesupport_northing_end_point_text : tun_default_text 
		{
			type = 0;
			idc = NORTHING_END_TEXT_IDC;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_northing_end_point";
			
		};
		class tun_firesupport_status : tun_default_text 
		{
			type = 0;
			idc = STATUS_IDC;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "Status";
			
		};
		class tun_firesupport_bookmark_list : tun_firesupport_listbox 
		{
			type = 5;
			idc = BOOKMARK_LIST_IDC;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.2;
			onLBSelChanged = "$STR_tun_firesupport_bookmark_list_change";	
		};
		class tun_firesupport_name_bookmark_text : tun_default_text 
		{
			type = 0;
			idc = BOOKMARK_NAME_TEXT_IDC;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_name_bookmark_text";
			tooltip = "$STR_tun_firesupport_name_text_tooltip";
			
		};
		class tun_firesupport_name_bookmark_value : tun_firesupport_coordinate_preset 
		{
			type = 2;
			idc = BOOKMARK_NAME_VALUE_IDC;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.475;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "Name";
			maxChars = 20;
			tooltip = "$STR_tun_firesupport_name_text_tooltip";
			
		};
		class tun_firesupport_bookmark_editbox : RscEdit 
		{
			type = 2;
			idc = BOOKMARK_EDITBOX_IDC;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.525;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.125;
			style = 16;
			text = "";
			tooltip = "$STR_tun_firesupport_editbox_tooltip";
			
		};
		class tun_firesupport_bookmark_button : tun_firesupport_button_base 
		{
			type = 1;
			idc = BOOKMARK_OPEN_BUTTON_IDC;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_bookmark";
			action = "$STR_tun_firesupport_open_bookmark";
			
		};
		class tun_firesupport_add_bookmark_button : tun_firesupport_button_base 
		{
			type = 1;
			idc = BOOKMARK_ADD_BOOKMARK_IDC;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.525;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_bookmark_add";
			action = "$STR_tun_firesupport_add_bookmark_action";
			tooltip = "$STR_tun_firesupport_bookmark_add_tooltip";
			
		};
		class tun_firesupport_remove_bookmark_button : tun_firesupport_button_base 
		{
			type = 1;
			idc = BOOKMARK_REMOVE_BOOKMARK_IDC;
			x = safeZoneX + safeZoneW * 0.46875;
			y = safeZoneY + safeZoneH * 0.6;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_remove_bookmark";
			action = "$STR_tun_firesupport_remove_bookmark_action";
			tooltip = "$STR_tun_firesupport_bookmark_remove_tooltip";
			
		};
		class tun_firesupport_export_bookmark_button : tun_firesupport_button_base 
		{
			type = 1;
			idc = BOOKMARK_EXPORT_BOOKMARK_IDC;
			x = safeZoneX + safeZoneW * 0.409375;
			y = safeZoneY + safeZoneH * 0.6;
			w = safeZoneW * 0.05260417;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_bookmark_export";
			action = "$STR_tun_firesupport_export_bookmark_action";
			tooltip = "$STR_tun_firesupport_bookmark_export_tooltip";
			
		};
		class tun_firesupport_import_bookmark_button : tun_firesupport_button_base 
		{
			type = 1;
			idc = BOOKMARK_IMPORT_BOOKMARK_IDC;
			x = safeZoneX + safeZoneW * 0.409375;
			y = safeZoneY + safeZoneH * 0.525;
			w = safeZoneW * 0.05260417;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_bookmark_import";
			action = "$STR_tun_firesupport_import_bookmark_action";
			tooltip = "$STR_tun_firesupport_bookmark_import_tooltip";
			
		};
	};
};
