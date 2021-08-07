//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)
#ifndef HG_CustomControlClasseshpp
#define HG_CustomControlClasseshpp 1
//Create a header guard to prevent duplicate include.

#include "GUIBaseClasses.hpp"
#include "Firesupport_idc.hpp"
<<<<<<< Updated upstream

class tun_default_text
{
	style = 2;
	colorBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	tooltipColorBox[] = {0.6,0.6,0.6,1};
	tooltipColorText[] = {0.702,0.102,0.102,1};
	
};
class tun_firesupport_coordinate_preset
=======
class RscListBox;
class RscButtonMenu;
class RscButton;
class RscMapControl;
class RscEdit;
class RscText;
class RscTree;
class RscCombo;
class RscXSliderH;
class RscCheckBox;

#define GUI_USER_COLORBACKGROUND	{ 		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", 		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", 		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", 		1 	}

class tun_default_editBox : RscEdit
>>>>>>> Stashed changes
{
	autocomplete = "";
	borderSize = 0.01;
	colorBorder[] = GUI_USER_COLORBACKGROUND;
	colorBackground[] = {0.2,0.2,0.2,0.2};
	colorDisabled[] = {0,0,0,0};
	colorSelection[] = GUI_USER_COLORBACKGROUND;
	colorText[] = {1,1,1,1};
	canModify = true;
	shadow = 0;
};


class tun_firesupport_coordinate_preset : tun_default_editBox
{
	text = "000";
	maxChars = 5;
	w = safeZoneW * 0.0625;
	h = safeZoneH * 0.025;
};

<<<<<<< Updated upstream
class tun_firesupport_button_base : RscButton
{
	
};

class tun_firesupport_listbox : RscListBox
{
	
};
=======
class tun_default_text : RscText
{
	colorBackground[] = GUI_USER_COLORBACKGROUND;
	colorText[] = {1,1,1,1};	
};

class tun_default_CheckBox : RscCheckBox
{
	w = safeZoneW * 0.015;
	h = safeZoneH * 0.025;	
};

>>>>>>> Stashed changes
#endif
