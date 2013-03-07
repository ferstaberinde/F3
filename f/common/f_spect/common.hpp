#include "rscA2BasicDefines.hpp"

#define ReadAndWrite		0
#define ReadAndCreate		1
#define ReadOnly		2
#define ReadOnlyVerified		3

#define true	1
#define false	0

class KEGsRscText {
	access = ReadAndWrite;
	type = 0;
	idc = -1;
	style = 0;
	w = 0.1;
	h = 0.05;
	font = "TahomaB";
	sizeEx = 0.04;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	text = "";
};

class KEGsRscListBox : RscListBox {
	access = ReadAndWrite;
	type = 5;
	style = 0;
	w = 0.4;
	h = 0.4;
	font = "TahomaB";
	sizeEx = 0.04;
	rowHeight = 0;
	colorText[] = {1, 1, 1, 1};
	colorScrollbar[] = {1, 1, 1, 1};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {1, 0.5, 0, 1};
	colorSelectBackground[] = {0.6, 0.6, 0.6, 1};
	colorSelectBackground2[] = {0.2, 0.2, 0.2, 1};
	colorBackground[] = {0, 0, 0, 1};
	soundSelect[] = {"", 0.1, 1};
	period = 1;
	
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		thumb = "\a3\ui_f\data\gui\cfg\Scrollbar\thumb_ca.paa";
		arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
		arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
		border = "\a3\ui_f\data\gui\cfg\Scrollbar\border_ca.paa";
	};
	
};

class KEGsRscActiveText {
	access = ReadAndWrite;
	type = 11;
	style = 2;
	h = 0.05;
	w = 0.15;
	font = "TahomaB";
	sizeEx = 0.04;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0.5, 0, 1};
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
	text = "";
	default = 0;
};
class KEGsRscControlsGroup : RscControlsGroup {
	type = 15;
	idc = -1;
	style = 0;
	x = SafeZoneX;
	y = SafeZoneY;
	w = SafeZoneW;
	h = SafeZoneH;
	
	class VScrollbar {
		color[] = {1, 1, 1, 1};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = false;	
	};
	
	class HScrollbar {
		color[] = {1, 1, 1, 1};
		height = 0.028;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = false;	
	};
	
	class Controls {};
};





