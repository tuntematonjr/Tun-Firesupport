#ifndef HG_CustomControlClassesh
#define HG_CustomControlClassesh 1
//Create a header guard to prevent duplicate include.

class tun_default_text
{
	style = 2;
	colorBackground[] = {0,0.102,0.502,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	tooltipColorBox[] = {0.6,0.6,0.6,1};
	tooltipColorText[] = {0.702,0.102,0.102,1};
	
};
class tun_firesupport_coordinate_preset
{
	style = 0+2;
	text = "000";
	autocomplete = "";
	colorBackground[] = {0.2,0.2,0.2,1};
	colorDisabled[] = {0,0,0,0};
	colorSelection[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	access = 0;
	canModify = true;
	maxChars = 5;
	shadow = 0;
	tooltip = "Only Numbers";
	tooltipColorBox[] = {0.6,0,0,1};
	tooltipColorShade[] = {0,0,0,0};
	tooltipColorText[] = {1,1,1,1};
	
};
#endif
