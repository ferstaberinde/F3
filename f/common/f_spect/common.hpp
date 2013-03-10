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
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
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

class KEGsRscMapControl : RscMapControl {
	access = ReadAndWrite;
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] = {0.56, 0.8, 0.98, 0.5};
	colorForest[] = {0.6, 0.8, 0.2, 0.5};
	colorRocks[] = {0.5, 0.5, 0.5, 0.5};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.5};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
	colorCountlinesWater[] = {0, 0.53, 1, 0.5};
	colorMainCountlinesWater[] = {0, 0.53, 1, 1};
	colorForestBorder[] = {0.4, 0.8, 0, 1};
	colorRocksBorder[] = {0.5, 0.5, 0.5, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.5};
	colorLevels[] = {0, 0, 0, 1};
	fontLabel = "PuristaMedium";
	sizeExLabel = 0.027;
	fontGrid = "PuristaMedium";
	sizeExGrid = 0.027;
	fontUnits = "PuristaMedium";
	sizeExUnits = 0.027;
	fontNames = "PuristaMedium";
	sizeExNames = 0.027;
	fontInfo = "PuristaMedium";
	sizeExInfo = 0.027;
	fontLevel = "PuristaMedium";
	sizeExLevel = 0.027;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.2, {"Gamma", 1, 1.5}};
	stickY[] = {0.2, {"Gamma", 1, 1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	      class Legend {
            colorBackground[] = {1, 1, 1, 0.5};
            color[] = {0, 0, 0, 1};
            x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
            y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
            h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            font = "PuristaMedium";
            sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        };
        class ActiveMarker {
            color[] = {0.3, 0.1, 0.9, 1};
            size = 50;
        };
        class Command {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
            size = 18;
            importance = 1;
            coefMin = 1;
            coefMax = 1;
        };
        class Task {
            colorCreated[] = {1, 1, 1, 1};
            colorCanceled[] = {0.7, 0.7, 0.7, 1};
            colorDone[] = {0.7, 1, 0.3, 1};
            colorFailed[] = {1, 0.3, 0.2, 1};
            color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
            icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
            iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
            iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
            iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
            iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
            size = 27;
            importance = 1;
            coefMin = 1;
            coefMax = 1;
        };
        class CustomMark {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
            size = 24;
            importance = 1;
            coefMin = 1;
            coefMax = 1;
        };
        class Tree {
            color[] = {0.45, 0.64, 0.33, 0.4};
            icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
            size = 12;
            importance = "0.9 * 16 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class SmallTree {
            color[] = {0.45, 0.64, 0.33, 0.4};
            icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
            size = 12;
            importance = "0.6 * 12 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class Bush {
            color[] = {0.45, 0.64, 0.33, 0.4};
            icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
            size = "14/2";
            importance = "0.2 * 14 * 0.05 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class Church {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Chapel {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Cross {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Rock {
            color[] = {0.1, 0.1, 0.1, 0.8};
            icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
            size = 12;
            importance = "0.5 * 12 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class Bunker {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
            size = 14;
            importance = "1.5 * 14 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class Fortress {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
            size = 16;
            importance = "2 * 16 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class Fountain {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
            size = 11;
            importance = "1 * 12 * 0.05";
            coefMin = 0.25;
            coefMax = 4;
        };
        class ViewTower {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
            size = 16;
            importance = "2.5 * 16 * 0.05";
            coefMin = 0.5;
            coefMax = 4;
        };
        class Lighthouse {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Quay {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Fuelstation {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Hospital {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class BusStop {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Transmitter {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Stack {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
            size = 20;
            importance = "2 * 16 * 0.05";
            coefMin = 0.9;
            coefMax = 4;
        };
        class Ruin {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
            size = 16;
            importance = "1.2 * 16 * 0.05";
            coefMin = 1;
            coefMax = 4;
        };
        class Tourism {
            color[] = {0, 0, 0, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
            size = 16;
            importance = "1 * 16 * 0.05";
            coefMin = 0.7;
            coefMax = 4;
        };
        class Watertower {
            color[] = {1, 1, 1, 1};
            icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
        };
        class Waypoint {
            color[] = {0, 0, 0, 1};
            size = 24;
            importance = 1;
            coefMin = 1;
            coefMax = 1;
            icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        };
        class WaypointCompleted {
            color[] = {0, 0, 0, 1};
            size = 24;
            importance = 1;
            coefMin = 1;
            coefMax = 1;
            icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
        };
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
