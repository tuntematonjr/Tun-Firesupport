//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)
#ifndef HG_CustomControlClasseshpp
#define HG_CustomControlClasseshpp 1
//Create a header guard to prevent duplicate include.

#include "Firesupport_idc.hpp"
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

#endif
