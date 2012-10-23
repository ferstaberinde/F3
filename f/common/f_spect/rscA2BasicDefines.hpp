#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define ReadAndWrite 0

#define ProcTextWhite "#(argb,8,8,3)color(1,1,1,1)"
#define ProcTextEmpty "#(argb,8,8,3)color(1,1,1,0)"
#define ProcTextBlack "#(argb,8,8,3)color(0,0,0,1)"
#define ProcTextGray "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define ProcTextRed "#(argb,8,8,3)color(1,0,0,1)"
#define ProcTextGreen "#(argb,8,8,3)color(0,1,0,1)"
#define ProcTextBlue "#(argb,8,8,3)color(0,0,1,1)"

//Colors
#define Color_KackG 				{0.36, 0.4, 0.38, 1}
#define Color_KackY					{0.8, 0.7, 0.6, 1}
#define Color_KackB 				{0.51, 0.48, 0.46, 1}
#define Color_WhiteDark 			{1, 1, 1, 0.5}
#define Color_White					{1, 1, 1, 1}
#define Color_Black 				{0, 0, 0, 1}
#define Color_Gray 					{1, 1, 1, 0.5}
#define Color_GrayLight 			{0.6, 0.6, 0.6, 1}
#define Color_GrayDark 				{0.2, 0.2, 0.2, 1}
#define Color_DarkRed 				{0.5, 0.1, 0, 0.5}
#define Color_Green 				{0.8, 0.9, 0.4, 1}
#define Color_Orange 				{0.9, 0.45, 0.1, 1}
#define Color_Red 					{0.9, 0.2, 0.2, 1}
#define Color_Blue 					{0.2, 0.2, 0.9, 1}
#define Color_NoColor				{0, 0, 0, 0}

#define CA_UI_element_background 		{1, 1, 1, 0.7}
#define CA_UI_background 				{0.023529, 0, 0.0313725, 1}
#define CA_UI_help_background 			{0.2, 0.1, 0.1, 0.7}
#define CA_UI_title_background			{0.24, 0.47, 0.07, 1.0}
#define CA_UI_green						{0.84,1,0.55,1}

//Colors background
//#define CA_UI_background 			{0.6, 0.6, 0.6, 0.4}
#define CA_UI_background            {0.023529, 0, 0.0313725, 1}
#define Color_MainBack 				{1, 1, 1, 0.9} //hlavni pozadi

//Font Size
#define TextSize_IGUI_normal 		0.023 // test //19/768
#define TextSize_small 				0.022 //16/768
#define TextSize_normal 			0.024 //19/768
#define TextSize_medium 			0.027 //23/768
#define TextSize_large  			0.057 //44/768


////////////////////////////////////////////////////////////////////////////////////////
// External Class References are not supported in the Description.ext - therefore this section is commented out. 
// The hard-coded full classes based on v1.03 of Arma 2 is located in the next section.
// Both sections should not be used at the same time as you will probably discover errors. 
////////////////////////////////////////////////////////////////////////////////////////

/*  External Class References are not supported in the Description.ext - therefore this section is commented out. And hard-coded full classes based on v1.03 of Arma 2
class RscSlider;
class RscText;
class RscTextSmall;
class RscTitle;
class RscPicture;
class RscActiveText;
class RscStructuredText;
class RscListBox;
class RscButton;
class RscMapControl {
	class Task;
	class CustomMark;
	class Command;
	class ActiveMarker;
};
class RscControlsGroup; 
*/


////////////////////////////////////////////////////////////////////////////////////////
// This section below is hard-coded full classes based to v1.03 of Arma 2 designed for Description.ext. 
// When used for configs the section above is the safer use for all future releases of Arma 2
// Both sections should not be used at the same time as you will probably discover errors. 
////////////////////////////////////////////////////////////////////////////////////////

//Definice z Coru
//Standard static text.
class RscSlider
{	access = 0;
	type = 3;
	style = 1024;
	w = 0.3;
	color[] =
	{
		1,
		1,
		1,
		0.8
	};
	colorActive[] =
	{
		1,
		1,
		1,
		1
	};
	h = 0.025;
};

class RscText
{	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;style = ST_LEFT;
	w = 0.1; h = 0.05;
	font = Zeppelin32;
	sizeEx = TextSize_IGUI_normal;
	colorBackground[] = Color_NoColor;
	colorText[] = Color_Black;
	text = "";
};
//Small static text.
class RscTextSmall: RscText
{	h = 0.03;
	sizeEx = TextSize_small;
};
//Standard static text title.
class RscTitle: RscText
{	style = ST_CENTER;
	x = 0.15;y = 0.06;
	w = 0.7;
};
class RscPicture
{	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;style = ST_PICTURE;
	colorBackground[] = Color_NoColor;
	colorText[] = Color_White;
	font = Zeppelin32;
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
};
class RscActiveText
{	access = ReadAndWrite;
	type = CT_ACTIVETEXT;
	style = ST_CENTER;
	h = 0.05;
	w = 0.15;
	font = Zeppelin32;
	sizeEx = TextSize_IGUI_normal;
	color[] = Color_Black;
	colorActive[] = CA_UI_green;
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
	text = "";
	default = 0;
};

class RscListBox
{	access = 0;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] =
	{
		0.543,
		0.5742,
		0.4102,
		1
	};
	colorScrollbar[] =
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorSelect[] =
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorSelect2[] =
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorSelectBackground[] =
	{
		0,
		0,
		0,
		1
	};
	colorSelectBackground2[] =
	{
		0.543,
		0.5742,
		0.4102,
		1
	};
	colorBackground[] =
	{
		0,
		0,
		0,
		1
	};
	soundSelect[] =
	{
		"",
		0.1,
		1
	};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] =
		{
			1,
			1,
			1,
			0.6
		};
		colorActive[] =
		{
			1,
			1,
			1,
			1
		};
		colorDisabled[] =
		{
			1,
			1,
			1,
			0.3
		};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	type = 5;
	style = "0 + 0x10";
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] =
	{
		1,
		1,
		1,
		1
	};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

//Standard button.
class RscButton
{	// common control items
	access = ReadAndWrite;
	type = CT_BUTTON;style = ST_LEFT;
	x = 0; y = 0;
	w = 0.3; h = 0.1;

	// text properties
	text = "";
	font = Zeppelin32;
	sizeEx = 0.024;
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {0.4, 0.4, 0.4, 1};
	colorBackground[] = {1, 0.537, 0, 0.5};
	colorBackgroundActive[] = {1, 0.537, 0, 1};
	colorBackgroundDisabled[] = {0.58, 0.1147, 0.1108, 1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {1, 0.537, 0, 1};
	colorShadow[] = {0.023529, 0, 0.0313725, 1};
	colorBorder[] = {0.023529, 0, 0.0313725, 1};
	borderSize = 0.008; // when negative, the border is on the right side of background

	// sounds
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
};

//Standard structured text.
class RscStructuredText
{	access = ReadAndWrite;
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = 0;
	h = 0.05;
	text = "";
	size = TextSize_IGUI_normal;
	colorText[] = Color_Black;

	class Attributes
	{
		font = Zeppelin32;
		color = "#ffffff";
		align = "center";
		shadow = true;
	};
};

//Standard controls group.
class RscControlsGroup
{	type = 15;
	idc = -1;
	style = 0;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	class VScrollbar
	{
		color[] =
		{
			1,
			1,
			1,
			1
		};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
	class HScrollbar
	{
		color[] =
		{
			1,
			1,
			1,
			1
		};
		height = 0.028;
	};
	class ScrollBar
	{
		color[] =
		{
			1,
			1,
			1,
			0.6
		};
		colorActive[] =
		{
			1,
			1,
			1,
			1
		};
		colorDisabled[] =
		{
			1,
			1,
			1,
			0.3
		};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
	};
	class Controls {};
};

class RscMapControl
{	access = 0;
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] =
	{
		1,
		1,
		1,
		1
	};
	colorOutside[] =
	{
		0,
		0,
		0,
		1
	};
	colorText[] =
	{
		0,
		0,
		0,
		1
	};
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] =
	{
		0.46,
		0.65,
		0.74,
		0.5
	};
	colorForest[] =
	{
		0.45,
		0.64,
		0.33,
		0.5
	};
	colorRocks[] =
	{
		0,
		0,
		0,
		0.3
	};
	colorCountlines[] =
	{
		0.85,
		0.8,
		0.65,
		1
	};
	colorMainCountlines[] =
	{
		0.45,
		0.4,
		0.25,
		1
	};
	colorCountlinesWater[] =
	{
		0.25,
		0.4,
		0.5,
		0.3
	};
	colorMainCountlinesWater[] =
	{
		0.25,
		0.4,
		0.5,
		0.9
	};
	colorForestBorder[] =
	{
		0,
		0,
		0,
		0
	};
	colorRocksBorder[] =
	{
		0,
		0,
		0,
		0
	};
	colorPowerLines[] =
	{
		0.1,
		0.1,
		0.1,
		1
	};
	colorRailWay[] =
	{
		0.8,
		0.2,
		0,
		1
	};
	colorNames[] =
	{
		0.1,
		0.1,
		0.1,
		0.9
	};
	colorInactive[] =
	{
		1,
		1,
		1,
		0.5
	};
	colorLevels[] =
	{
		0.65,
		0.6,
		0.45,
		1
	};
	stickX[] =
	{
		0.2,
		{
			"Gamma",
			1,
			1.5
		}
	};
	stickY[] =
	{
		0.2,
		{
			"Gamma",
			1,
			1.5
		}
	};
	class Legend
	{
		colorBackground[] =
		{
			0.906,
			0.901,
			0.88,
			0
		};
		color[] =
		{
			0,
			0,
			0,
			1
		};
		x = "SafeZoneX";
		y = "SafeZoneY";
		w = 0.34;
		h = 0.152;
		font = "Zeppelin32";
		sizeEx = 0.03921;
	};
	class ActiveMarker
	{
		color[] =
		{
			0.3,
			0.1,
			0.9,
			1
		};
		size = 50;
	};
	class Command
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task
	{
		colorCreated[] =
		{
			0.95,
			0.95,
			0.95,
			1
		};
		colorCanceled[] =
		{
			0.606,
			0.606,
			0.606,
			1
		};
		colorDone[] =
		{
			0.424,
			0.651,
			0.247,
			1
		};
		colorFailed[] =
		{
			0.706,
			0.0745,
			0.0196,
			1
		};
		color[] =
		{
			0.863,
			0.584,
			0,
			1
		};
		icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark
	{
		color[] =
		{
			0.6471,
			0.6706,
			0.6235,
			1
		};
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree
	{
		color[] =
		{
			0.45,
			0.64,
			0.33,
			0.4
		};
		icon = "\ca\ui\data\map_tree_ca.paa";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		color[] =
		{
			0.45,
			0.64,
			0.33,
			0.4
		};
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush
	{
		color[] =
		{
			0.45,
			0.64,
			0.33,
			0.4
		};
		icon = "\ca\ui\data\map_bush_ca.paa";
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Church
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_church_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Chapel
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "\ca\ui\data\map_chapel_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Cross
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_cross_ca.paa";
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Rock
	{
		color[] =
		{
			0.1,
			0.1,
			0.1,
			0.8
		};
		icon = "\ca\ui\data\map_rock_ca.paa";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bunker
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "\ca\ui\data\map_bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fountain
	{
		color[] =
		{
			0.2,
			0.45,
			0.7,
			1
		};
		icon = "\ca\ui\data\map_fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class ViewTower
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Lighthouse
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		size = 14;
		importance = "3 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Quay
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_quay_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Fuelstation
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.75;
		coefMax = 4;
	};
	class Hospital
	{
		color[] =
		{
			0.78,
			0,
			0.05,
			1
		};
		icon = "\ca\ui\data\map_hospital_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class BusStop
	{
		color[] =
		{
			0.15,
			0.26,
			0.87,
			1
		};
		icon = "\ca\ui\data\map_busstop_ca.paa";
		size = 12;
		importance = "1 * 10 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Transmitter
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Stack
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Ruin
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "\ca\ui\data\map_ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class Tourism
	{
		color[] =
		{
			0,
			0,
			1,
			1
		};
		icon = "\ca\ui\data\map_tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};
	class Watertower
	{
		color[] =
		{
			0.2,
			0.45,
			0.7,
			1
		};
		icon = "\ca\ui\data\map_watertower_ca.paa";
		size = 20;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Waypoint
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\ca\ui\data\map_waypoint_ca.paa";
	};
	class WaypointCompleted
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
	};
	moveOnEdges = 1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY";
	w = "SafeZoneWAbs";
	h = "SafeZoneH";
	ptsPerSquareSea = 8;
	ptsPerSquareTxt = 10;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = "6.0f";
	ptsPerSquareForEdge = "15.0f";
	ptsPerSquareRoad = "3f";
	ptsPerSquareObj = 15;
	showCountourInterval = "false";
	maxSatelliteAlpha = 0.75;
	alphaFadeStartScale = 0.15;
	alphaFadeEndScale = 0.29;
	fontLabel = "Zeppelin32";
	sizeExLabel = 0.034;
	fontGrid = "Zeppelin32";
	sizeExGrid = 0.03;
	fontUnits = "Zeppelin32";
	sizeExUnits = 0.034;
	fontNames = "Zeppelin32";
	sizeExNames = 0.056;
	fontInfo = "Zeppelin32";
	sizeExInfo = 0.034;
	fontLevel = "Zeppelin32";
	sizeExLevel = 0.024;
	text = "\ca\ui\data\map_background2_co.paa";
};