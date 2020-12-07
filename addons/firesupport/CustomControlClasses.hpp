//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)
#ifndef HG_CustomControlClasseshpp
#define HG_CustomControlClasseshpp 1
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
	canModify = true;
	maxChars = 5;
	shadow = 0;
	tooltipColorBox[] = {0.6,0,0,1};
	tooltipColorShade[] = {0,0,0,0};
	tooltipColorText[] = {1,1,1,1};
	
};
class tun_firesupport_default_combo
{
	style = 16;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	colorBackground[] = {0.4,0.4,0.4,1};
	colorDisabled[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelectBackground[] = {0.8,0.502,0.2,1};
	colorText[] = {1,1,1,1};
	font = "PuristaSemiBold";
	maxHistoryDelay = 0;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
	wholeHeight = 0.3;
	shadow = 0;
	tooltipColorBox[] = {0.2,0.2,0.2,1};
	tooltipColorShade[] = {0.2,0.2,0.2,1};
	tooltipColorText[] = {1,1,1,1};
	class ComboScrollBar
	{
		
	};
	
};
#endif
