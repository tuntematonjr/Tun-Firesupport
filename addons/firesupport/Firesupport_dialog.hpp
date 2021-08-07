//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.hpp"

class Firesupport_dialog
{
	idd = MAIN_IDD;
	movingEnable = true;
	
	class ControlsBackground
	{
		class tun_firesupport_background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.15;
			y = safeZoneY + safeZoneH * 0;
			w = safeZoneW * 0.7;
			h = safeZoneH * 1;
			style = 48+2;
			text = "\x\Tun\addons\artycomputer_models\data\ui\tablet_ui.paa";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = true;
			onDestroy = "[] call tun_firesupport_fnc_dialog_close";
			
		};
		
	};
	class Controls
	{
		class tun_firesupport_fire : RscButton
		{
			type = 1;
			idc = FIRE_IDC;
			x = safeZoneX + safeZoneW * 0.709375;
			y = safeZoneY + safeZoneH * 0.70925926;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			style = 0+2;
			text = "";
			//borderSize = 1;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.702,0.102,0.102,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {1,1,1,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.6,0,0,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			onButtonClick = "[] call tun_firesupport_fnc_fire";
			colorFocused2[] = {0.6,0,0,1};
			default = false;
			onMouseEnter = "[false] call tun_firesupport_fnc_check_values; ";
			
		};
		class tun_firesupport_radiusSlider : RscXSliderH
		{
			idc = SLIDER_RADIUS;
			x = safeZoneX + safeZoneW * 0.6296875;
			y = safeZoneY + safeZoneH * 0.30555556;
			w = safeZoneW * 0.0671875;
			h = safeZoneH * 0.025;
			onSliderPosChanged = "[true] call tun_firesupport_fnc_check_values";
		};
		class tun_firesupport_delaySlider : tun_firesupport_radiusSlider
		{
			idc = SLIDER_DELAY;
			x = safeZoneX + safeZoneW * 0.70885417;
			
		};
		class tun_firesupport_ammoSlider : tun_firesupport_radiusSlider
		{
			idc = SLIDER_AMMO;
			x = safeZoneX + safeZoneW * 0.55052084;
		};
		class tun_firesupport_minimap : RscMapControl
		{
			idc = MINIMAP_IDC;
			x = safeZoneX + safeZoneW * 0.55052084;
			y = safeZoneY + safeZoneH * 0.39907408;
			w = safeZoneW * 0.225;
			h = safeZoneH * 0.28703704;
			
		};
		class tun_firesupport_coord1TRP : tun_default_CheckBox
		{
			idc = TRP1;
			x = safeZoneX + safeZoneW * 0.525;
			y = safeZoneY + safeZoneH * 0.27870371;
			onCheckedChanged = "[true, false] call tun_firesupport_fnc_trpCheckbox;";
			tooltip = "$STR_tun_firesupport_trpToggle_tooltip";
		};
		class tun_firesupport_coord2TRP : tun_firesupport_coord1TRP
		{
			idc = TRP2;
			y = safeZoneY + safeZoneH * 0.34351852;
			onCheckedChanged = "[false, true] call tun_firesupport_fnc_trpCheckbox;";
		};
		class tun_firesupport_artylist : RscTree 
		{
			idc = ARTY_LIST_IDC;
			x = safeZoneX + safeZoneW * 0.22447917;
			y = safeZoneY + safeZoneH * 0.25092593;
			w = safeZoneW * 0.1421875;
			h = safeZoneH * 0.21481482;
			borderSize = 0.01;
			colorBorder[] = GUI_USER_COLORBACKGROUND;
			colorLines[] = {1,1,1,1};
			colorBackground[] = {0.2,0.2,0.2,0.2};
			onTreeSelChanged = "[] call tun_firesupport_fnc_setValues";
			
		};
		class tun_firesupport_firing_type : RscCombo 
		{
			idc = FIRING_TYPE_IDC;
			x = safeZoneX + safeZoneW * 0.55052084;
			y = safeZoneY + safeZoneH * 0.34351852;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02962963;
			onLBSelChanged = "[] call tun_firesupport_fnc_update_firemode";
			
		};
		class tun_firesupport_easting_value : tun_firesupport_coordinate_preset 
		{
			idc = EASTING_IDC;
			x = safeZoneX + safeZoneW * 0.378125;
			y = safeZoneY + safeZoneH * 0.27870371;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_easting";
			
		};
		class tun_firesupport_easting_text : tun_default_text 
		{
			idc = EASTING_TEXT;
			x = safeZoneX + safeZoneW * 0.378125;
			y = safeZoneY + safeZoneH * 0.25092593;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_easting";
			
		};
		class tun_firesupport_northing_value : tun_firesupport_easting_value 
		{
			idc = NORTHING_IDC;
			x = safeZoneX + safeZoneW * 0.453125;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_northing";
			
		};
		class tun_firesupport_northing_text : tun_firesupport_easting_text 
		{
			idc = NORTHING_TEXT;
			x = safeZoneX + safeZoneW * 0.453125;
			y = safeZoneY + safeZoneH * 0.25092593;
			text = "$STR_tun_firesupport_northing";
			
		};
		class tun_firesupport_easting_end_point_text : tun_firesupport_easting_text 
		{
			type = 0;
			idc = EASTING_END_TEXT_IDC;
			x = safeZoneX + safeZoneW * 0.378125;
			y = safeZoneY + safeZoneH * 0.31574075;
			text = "$STR_tun_firesupport_easting_end_point";
			
		};
		class tun_firesupport_easting_end_point_value : tun_firesupport_coordinate_preset 
		{
			idc = EASTING_END_IDC;
			x = safeZoneX + safeZoneW * 0.378125;
			y = safeZoneY + safeZoneH * 0.34351852;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_easting";
			
		};
		class tun_firesupport_northing_end_point_value : tun_firesupport_easting_end_point_value 
		{
			idc = NORTHING_END_IDC;
			x = safeZoneX + safeZoneW * 0.453125;
			tooltip = "$STR_tun_firesupport_coordinates_tooltip_northing";
			
		};
		class tun_firesupport_northing_end_point_text : tun_firesupport_easting_text 
		{
			type = 0;
			idc = NORTHING_END_TEXT_IDC;
			x = safeZoneX + safeZoneW * 0.453125;
			y = safeZoneY + safeZoneH * 0.31574075;
			text = "$STR_tun_firesupport_northing_end_point";
		};
		
		class tun_firesupport_ammo_count : tun_default_editBox 
		{
			idc = COUNT_IDC;
			x = safeZoneX + safeZoneW * 0.55052084;
			y = safeZoneY + safeZoneH * 0.27870371;
			w = safeZoneW * 0.0671875;
			h = safeZoneH * 0.025;
			text = "0";
			onKillFocus = "[false] call tun_firesupport_fnc_check_values";
			onMouseEnter = "[false] call tun_firesupport_fnc_check_values";
			onMouseExit = "[false] call tun_firesupport_fnc_check_values";
			tooltip = "$STR_tun_firesupport_ammocount_tooltip";
		};
		
		class tun_firesupport_delay_value : tun_firesupport_ammo_count 
		{
			idc = DELAY_IDC;
			x = safeZoneX + safeZoneW * 0.70885417;
			y = safeZoneY + safeZoneH * 0.27870371;
			tooltip = "$STR_tun_firesupport_delay_tooltip";
			
		};
		
		class tun_firesupport_radius_value : tun_firesupport_ammo_count 
		{
			idc = RANGE_IDC;
			x = safeZoneX + safeZoneW * 0.6296875;
			y = safeZoneY + safeZoneH * 0.27870371;
			tooltip = "$STR_tun_firesupport_radius_tooltip";
			
		};
		class tun_firesupport_ammo_text : tun_default_text 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.55052084;
			y = safeZoneY + safeZoneH * 0.25092593;
			w = safeZoneW * 0.0671875;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_ammocount";
			
		};
		class tun_firesupport_radius_text : tun_firesupport_ammo_text 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.6296875;
			y = safeZoneY + safeZoneH * 0.25092593;
			text = "$STR_tun_firesupport_radius";
			
		};
		class tun_firesupport_delay_text : tun_firesupport_ammo_text 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.70885417;
			y = safeZoneY + safeZoneH * 0.25092593;
			text = "$STR_tun_firesupport_delay";
			
		};
		class tun_firesupport_remaining_ammo_text : tun_default_text 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.2296875;
			y = safeZoneY + safeZoneH * 0.69351852;
			w = safeZoneW * 0.07239584;
			h = safeZoneH * 0.03425926;
			text = "$STR_tun_firesupport_remainign_ammo";
			
		};
		class tun_firesupport_remaining_ammo_value : RscText 
		{
			idc = REMAINIG_AMMO_IDC;
			x = safeZoneX + safeZoneW * 0.2296875;
			y = safeZoneY + safeZoneH * 0.72777778;
			w = safeZoneW * 0.07239584;
			h = safeZoneH * 0.03425926;
			text = "0";
			tooltip = "$STR_tun_firesupport_remaining_ammo_tooltip";
			colorBackground[] = {0.2,0.2,0.2,1};
			
		};
		class tun_firesupport_eta_text : tun_firesupport_remaining_ammo_text 
		{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31458334;
			text = "$STR_tun_firesupport_eta";
			
		};
		class tun_firesupport_eta_value : tun_firesupport_remaining_ammo_value 
		{
			idc = ETA_IDC;
			x = safeZoneX + safeZoneW * 0.31458334;
			text = "Value";
			tooltip = "$STR_tun_firesupport_eta_tooltip";
		};
		class tun_firesupport_header : RscText 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.22447917;
			y = safeZoneY + safeZoneH * 0.18518519;
			w = safeZoneW * 0.55104167;
			h = safeZoneH * 0.05;
			style = 32+2;
			text = "$STR_tun_firesupport_Header";
			shadow = 2;
			
		};
		class tun_firesupport_status : tun_default_text 
		{
			type = 0;
			idc = STATUS_IDC;
			x = safeZoneX + safeZoneW * 0.64270834;
			y = safeZoneY + safeZoneH * 0.70925926;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "Status";
			
		};
		class tun_firesupport_bookmark_list : RscListBox 
		{
			idc = BOOKMARK_LIST_IDC;
			x = safeZoneX + safeZoneW * 0.484375;
			y = safeZoneY + safeZoneH * 0.47870371;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.2;
			onLBSelChanged = "[] call tun_firesupport_fnc_selected_bookmark;";
			colorBackground[] = {0.2,0.2,0.2,0.5};
			colorDisabled[] = {0,0,0,0};
			colorSelection[] = {0,0,0,0};
			colorText[] = {1,1,1,1};			
		};
		class tun_firesupport_name_bookmark_text : tun_default_text 
		{
			type = 0;
			idc = BOOKMARK_NAME_TEXT_IDC;
			x = safeZoneX + safeZoneW * 0.41354167;
			y = safeZoneY + safeZoneH * 0.50462963;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_name_bookmark_text";
			tooltip = "$STR_tun_firesupport_name_text_tooltip";
			
		};
		class tun_firesupport_name_bookmark_value : tun_default_editBox 
		{
			idc = BOOKMARK_NAME_VALUE_IDC;
			x = safeZoneX + safeZoneW * 0.41354167;
			y = safeZoneY + safeZoneH * 0.52962963;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.025;
			text = "Name";
			tooltip = "$STR_tun_firesupport_name_text_tooltip";
			
		};
		class tun_firesupport_bookmark_editbox : tun_default_editBox 
		{
			idc = BOOKMARK_EDITBOX_IDC;
			style = 0 + 8 + 16;
			x = safeZoneX + safeZoneW * 0.22447917;
			y = safeZoneY + safeZoneH * 0.47870371;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.2;
			text = "[[],[]]";
			tooltip = "$STR_tun_firesupport_editbox_tooltip";
			
		};
		class tun_firesupport_mode : RscCombo 
		{
			idc = CHANGE_MODE;
			x = safeZoneX + safeZoneW * 0.41354167;
			y = safeZoneY + safeZoneH * 0.72777778;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.03425926;
			onLBSelChanged = "[] call tun_firesupport_fnc_toggle_mode";
			
		};
		class tun_firesupport_add_bookmark_button : RscButton 
		{
			type = 1;
			idc = BOOKMARK_ADD_BOOKMARK_IDC;
			x = safeZoneX + safeZoneW * 0.41354167;
			y = safeZoneY + safeZoneH * 0.56203704;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_bookmark_add";
			onButtonClick = "['bookmark'] call tun_firesupport_fnc_modify_bookmarks";
			tooltip = "$STR_tun_firesupport_bookmark_add_tooltip";
			
		};
		class tun_firesupport_remove_bookmark_button : tun_firesupport_add_bookmark_button 
		{
			idc = BOOKMARK_REMOVE_BOOKMARK_IDC;
			y = safeZoneY + safeZoneH * 0.62037037;
			text = "$STR_tun_firesupport_remove_bookmark";
			onButtonClick = "['remove'] call tun_firesupport_fnc_modify_bookmarks";
			tooltip = "$STR_tun_firesupport_bookmark_remove_tooltip";
			
		};
		class tun_firesupport_export_bookmark_button : RscButton 
		{
			idc = BOOKMARK_EXPORT_BOOKMARK_IDC;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.62037037;
			w = safeZoneW * 0.05260417;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_bookmark_export";
			onButtonClick = "[true] call tun_firesupport_fnc_save_bookmarks";
			tooltip = "$STR_tun_firesupport_bookmark_export_tooltip";
			
		};
		class tun_firesupport_import_bookmark_button : tun_firesupport_export_bookmark_button 
		{
			idc = BOOKMARK_IMPORT_BOOKMARK_IDC;
			y = safeZoneY + safeZoneH * 0.56203704;
			text = "$STR_tun_firesupport_bookmark_import";
			onButtonClick = "[false] call tun_firesupport_fnc_save_bookmarks";
			tooltip = "$STR_tun_firesupport_bookmark_import_tooltip";
			
		};
		class tun_firesupport_add_trp_button : tun_firesupport_export_bookmark_button 
		{
			idc = BOOKMARK_ADD_TRP_IDC;
			y = safeZoneY + safeZoneH * 0.50370371;
			text = "$STR_tun_firesupport_trp_add";
			onButtonClick = "['trp'] call tun_firesupport_fnc_modify_bookmarks";
			tooltip = "$STR_tun_firesupport_bookmark_trp_tooltip";
			
		};
		class tun_firesupport_trp1_list : RscCombo 
		{
			idc = TRP1_LIST;
			x = safeZoneX + safeZoneW * 0.378125;
			y = safeZoneY + safeZoneH * 0.27870371;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02962963;
			//onLBSelChanged = "";
		};
		class tun_firesupport_trp2_list : tun_firesupport_trp1_list 
		{
			idc = TRP2_LIST;
			y = safeZoneY + safeZoneH * 0.34351852;
		};
		
		class tun_firesupport_time_hours : tun_default_editBox 
		{
			idc = TIMEHOURS;
			type = 2;
			x = safeZoneX + safeZoneW * 0.38020834;
			y = safeZoneY + safeZoneH * 0.40833334;
			w = safeZoneW * 0.02708334;
			h = safeZoneH * 0.025;
			text = "HH";
			tooltip = "$STR_tun_firesupport_time_tooltip";
			maxChars = 2;
			onKillFocus = "[] call tun_firesupport_fnc_check_time";
			onMouseExit = "[] call tun_firesupport_fnc_check_time";
		};
		
		class tun_firesupport_time_minutes : tun_firesupport_time_hours 
		{
			idc = TIMEMINUTES;
			x = safeZoneX + safeZoneW * 0.41302084;
			text = "MM";
		};
		
		class tun_firesupport_time_seconds : tun_firesupport_time_hours 
		{
			idc = TIMESECONDS;
			x = safeZoneX + safeZoneW * 0.44791667;	
			text = "SS";
		};
		
		class tun_firesupport_toggletime : tun_default_CheckBox
		{
			idc = TOGGLETIME;
			x = safeZoneX + safeZoneW * 0.525;
			y = safeZoneY + safeZoneH * 0.40833334;
			tooltip = "$STR_tun_firesupport_toggletimetext_button_tooltip";
			onCheckedChanged = "[] call tun_firesupport_fnc_timeCheckbox;";
		};
		
		class tun_firesupport_togglevolleyfire : tun_default_CheckBox
		{

			idc = TOGGLEVOLLEY;
			x = safeZoneX + safeZoneW * 0.69010417;
			y = safeZoneY + safeZoneH * 0.34351852;
			tooltip = "$STR_tun_firesupport_toggleVolleyFire_tooltip";
			
		};
		
		class tun_firesupport_time_text : tun_default_text 
		{
			idc = TIMETEXT;
			x = safeZoneX + safeZoneW * 0.38020834;
			y = safeZoneY + safeZoneH * 0.37870371;
			w = safeZoneW * 0.09739584;
			h = safeZoneH * 0.025;
			text = "$STR_tun_firesupport_toggletimetext";
			tooltip = "$STR_tun_firesupport_toggletimetext_tooltip";
			
		};
		class tun_firesupport_queue_list : tun_firesupport_bookmark_list 
		{
			idc = QUEUELIST;
			onLBSelChanged = "";
			
			
		};
		class tun_firesupport_queue_remove_button : RscButton 
		{
			type = 1;
			idc = QUEUEREMOVE;
			x = safeZoneX + safeZoneW * 0.41354167;
			y = safeZoneY + safeZoneH * 0.56203704;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.05;
			text = "$STR_tun_firesupport_queue_remove";
			onMouseButtonClick = "[] call tun_firesupport_fnc_removeQueue";
			tooltip = "$STR_tun_firesupport_queue_remove_tooltip";
			
		};
	};
	
};

