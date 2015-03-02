// Control types
#ifndef CT_STATIC
#define CT_STATIC           0
#endif
#ifndef CT_BUTTON
#define CT_BUTTON           1
#endif
#ifndef CT_EDIT
#define CT_EDIT             2
#endif
#ifndef CT_SLIDER
#define CT_SLIDER           3
#endif
#ifndef CT_COMBO
#define CT_COMBO            4
#endif
#ifndef CT_LISTBOX
#define CT_LISTBOX          5
#endif
#ifndef CT_TOOLBOX
#define CT_TOOLBOX          6
#endif
#ifndef CT_CHECKBOXES
#define CT_CHECKBOXES       7
#endif
#ifndef CT_PROGRESS
#define CT_PROGRESS         8
#endif
#ifndef CT_HTML
#define CT_HTML             9
#endif
#ifndef CT_STATIC_SKEW
#define CT_STATIC_SKEW      10
#endif
#ifndef CT_ACTIVETEXT
#define CT_ACTIVETEXT       11
#endif
#ifndef CT_TREE
#define CT_TREE             12
#endif
#ifndef CT_STRUCTURED_TEXT
#define CT_STRUCTURED_TEXT  13
#endif
#ifndef CT_CONTEXT_MENU
#define CT_CONTEXT_MENU     14
#endif
#ifndef CT_CONTROLS_GROUP
#define CT_CONTROLS_GROUP   15
#endif
#ifndef CT_SHORTCUTBUTTON
#define CT_SHORTCUTBUTTON   16
#endif
#ifndef CT_HITZONES
#define CT_HITZONES         17
#endif
#ifndef CT_XKEYDESC
#define CT_XKEYDESC         40
#endif
#ifndef CT_XBUTTON
#define CT_XBUTTON          41
#endif
#ifndef CT_XLISTBOX
#define CT_XLISTBOX         42
#endif
#ifndef CT_XSLIDER
#define CT_XSLIDER          43
#endif
#ifndef CT_XCOMBO
#define CT_XCOMBO           44
#endif
#ifndef CT_ANIMATED_TEXTURE
#define CT_ANIMATED_TEXTURE 45
#endif
#ifndef CT_OBJECT
#define CT_OBJECT           80
#endif
#ifndef CT_OBJECT_ZOOM
#define CT_OBJECT_ZOOM      81
#endif
#ifndef CT_OBJECT_CONTAINER
#define CT_OBJECT_CONTAINER 82
#endif
#ifndef CT_OBJECT_CONT_ANIM
#define CT_OBJECT_CONT_ANIM 83
#endif
#ifndef CT_LINEBREAK
#define CT_LINEBREAK        98
#endif
#ifndef CT_USER
#define CT_USER             99
#endif
#ifndef CT_MAP
#define CT_MAP              100
#endif
#ifndef CT_MAP_MAIN
#define CT_MAP_MAIN         101
#endif
#ifndef CT_LISTNBOX
#define CT_LISTNBOX         102
#endif
#ifndef CT_ITEMSLOT
#define CT_ITEMSLOT         103
#endif
#ifndef CT_CHECKBOX
#define CT_CHECKBOX         77
#endif

// Static styles
#ifndef ST_POS
#define ST_POS            0x0F
#endif
#ifndef ST_HPOS
#define ST_HPOS           0x03
#endif
#ifndef ST_VPOS
#define ST_VPOS           0x0C
#endif
#ifndef ST_LEFT
#define ST_LEFT           0x00
#endif
#ifndef ST_RIGHT
#define ST_RIGHT          0x01
#endif
#ifndef ST_CENTER
#define ST_CENTER         0x02
#endif
#ifndef ST_DOWN
#define ST_DOWN           0x04
#endif
#ifndef ST_UP
#define ST_UP             0x08
#endif
#ifndef ST_VCENTER
#define ST_VCENTER        0x0C
#endif

#ifndef ST_TYPE
#define ST_TYPE           0xF0
#endif
#ifndef ST_SINGLE
#define ST_SINGLE         0x00
#endif
#ifndef ST_MULTI
#define ST_MULTI          0x10
#endif
#ifndef ST_TITLE_BAR
#define ST_TITLE_BAR      0x20
#endif
#ifndef ST_PICTURE
#define ST_PICTURE        0x30
#endif
#ifndef ST_FRAME
#define ST_FRAME          0x40
#endif
#ifndef ST_BACKGROUND
#define ST_BACKGROUND     0x50
#endif
#ifndef ST_GROUP_BOX
#define ST_GROUP_BOX      0x60
#endif
#ifndef ST_GROUP_BOX2
#define ST_GROUP_BOX2     0x70
#endif
#ifndef ST_HUD_BACKGROUND
#define ST_HUD_BACKGROUND 0x80
#endif
#ifndef ST_TILE_PICTURE
#define ST_TILE_PICTURE   0x90
#endif
#ifndef ST_WITH_RECT
#define ST_WITH_RECT      0xA0
#endif
#ifndef ST_LINE
#define ST_LINE           0xB0
#endif
#ifndef ST_UPPERCASE
#define ST_UPPERCASE      0xC0
#endif
#ifndef ST_LOWERCASE
#define ST_LOWERCASE      0xD0
#endif

#ifndef ST_SHADOW
#define ST_SHADOW         0x100
#endif
#ifndef ST_NO_RECT
#define ST_NO_RECT        0x200
#endif
#ifndef ST_KEEP_ASPECT_RATIO
#define ST_KEEP_ASPECT_RATIO  0x800
#endif

#ifndef ST_TITLE
#define ST_TITLE          ST_TITLE_BAR + ST_CENTER
#endif

// Slider styles
#ifndef SL_DIR
#define SL_DIR            0x400
#endif
#ifndef SL_VERT
#define SL_VERT           0
#endif
#ifndef SL_HORZ
#define SL_HORZ           0x400
#endif

#ifndef SL_TEXTURES
#define SL_TEXTURES       0x10
#endif

// progress bar
#ifndef ST_VERTICAL
#define ST_VERTICAL       0x01
#endif
#ifndef ST_HORIZONTAL
#define ST_HORIZONTAL     0
#endif

// Listbox styles
#ifndef LB_TEXTURES
#define LB_TEXTURES       0x10
#endif
#ifndef LB_MULTI
#define LB_MULTI          0x20
#endif

// Tree styles
#ifndef TR_SHOWROOT
#define TR_SHOWROOT       1
#endif
#ifndef TR_AUTOCOLLAPSE
#define TR_AUTOCOLLAPSE   2
#endif

// MessageBox styles
#ifndef MB_BUTTON_OK
#define MB_BUTTON_OK      1
#endif
#ifndef MB_BUTTON_CANCEL
#define MB_BUTTON_CANCEL  2
#endif
#ifndef MB_BUTTON_USER
#define MB_BUTTON_USER    4
#endif
#ifndef MB_ERROR_DIALOG
#define MB_ERROR_DIALOG   8
#endif

// Fonts
#ifndef GUI_FONT_NORMAL
#define GUI_FONT_NORMAL			PuristaMedium
#endif
#ifndef GUI_FONT_BOLD
#define GUI_FONT_BOLD			PuristaSemibold
#endif
#ifndef GUI_FONT_THIN
#define GUI_FONT_THIN			PuristaLight
#endif
#ifndef GUI_FONT_MONO
#define GUI_FONT_MONO			EtelkaMonospacePro
#endif
#ifndef GUI_FONT_NARROW
#define GUI_FONT_NARROW			EtelkaNarrowMediumPro
#endif
#ifndef GUI_FONT_CODE
#define GUI_FONT_CODE			LucidaConsoleB
#endif
#ifndef GUI_FONT_SYSTEM
#define GUI_FONT_SYSTEM			TahomaB
#endif

//colours

#define COLOUR_GUI_TEXT {"profilenamespace getvariable ['GUI_TITLETEXT_RGB_R',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_G',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_B',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_A',1]"}

#define COLOUR_GUI_BG {"profilenamespace getvariable ['GUI_BCG_RGB_R',0.8]", "profilenamespace getvariable ['GUI_BCG_RGB_G',0.8]","profilenamespace getvariable ['GUI_BCG_RGB_B',0.8]","profilenamespace getvariable ['GUI_BCG_RGB_A',0.8]"}

#define COLOUR_IGUI_TEXT {"profilenamespace getvariable ['IGUI_TEXT_RGB_R',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_G',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_B',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_A',1]"}

#define COLOUR_IGUI_BG {"profilenamespace getvariable ['IGUI_BCG_RGB_R',0.8]", "profilenamespace getvariable ['IGUI_BCG_RGB_G',0.5]","profilenamespace getvariable ['IGUI_BCG_RGB_B',0]","profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8]"}

#define COLOUR_IGUI_WARN {"profilenamespace getvariable ['IGUI_TEXT_WARNING_R',0.8]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_G',0.5]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_B',0]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_A',0.8]"}

// Grids
#ifndef GUI_GRID_CENTER_WAbs
#define GUI_GRID_CENTER_WAbs		((safezoneW / safezoneH) min 1.2)
#endif
#ifndef GUI_GRID_CENTER_HAbs
#define GUI_GRID_CENTER_HAbs		(GUI_GRID_CENTER_WAbs / 1.2)
#endif
#ifndef GUI_GRID_CENTER_W
#define GUI_GRID_CENTER_W		(GUI_GRID_CENTER_WAbs / 40)
#endif
#ifndef GUI_GRID_CENTER_H
#define GUI_GRID_CENTER_H		(GUI_GRID_CENTER_HAbs / 25)
#endif
#ifndef GUI_GRID_CENTER_X
#define GUI_GRID_CENTER_X		(safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#endif
#ifndef GUI_GRID_CENTER_Y
#define GUI_GRID_CENTER_Y		(safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)
#endif

#define RESUNITS_X (safeZoneW / 100)
#define RESUNITS_Y (safeZoneH / 100)

class vip_rsc_picture {
	
	access = 0;
	idc = -1;
	type = CT_STATIC;
	style = ST_PICTURE;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
};

class vip_rsc_text {
	
	access = 0;
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = 0.08;
	lineSpacing = 1;
	text = "";
	fixedWidth = 0;
	moving = 0;
};

class vip_rsc_box {

	idc=-1;
	type = CT_STATIC;
	style = ST_CENTER;
	text = "";
	font = "TahomaB";
	sizeEx = 0.04;

	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};

	w = 1;
	h = 1;
};

class vip_rsc_button {

	access = 0;
	type = CT_BUTTON;
	style = ST_LEFT; 
	default = 0;
	blinkingPeriod = 0;

	x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 6 * GUI_GRID_CENTER_W;
	h = 1 * GUI_GRID_CENTER_H;

	colorBackground[] = {0.8,0.8,0.8,1};
	colorBackgroundDisabled[] = {0.8,0.8,0.8, 0.25};
	colorBackgroundActive[] = {1,1,1,1};
	colorFocused[] = {0.8,0.8,0.8,1};

	text = ""; 
	sizeEx = 1 * GUI_GRID_CENTER_H;
	font = GUI_FONT_NORMAL;
	shadow = 1;
	colorText[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.25};

	borderSize = 0.0;
	colorBorder[] = {1,1,1,1}; 

	colorShadow[] = {0,0,0,0.0};
	offsetX = 0.0075;
	offsetY = 0.01;
	offsetPressedX = 0.000; 
	offsetPressedY = 0.00;

	period = 0; 
	periodFocus = 0;
	periodOver = 0.5;

	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1}; 
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};

	//onButtonClick = "false";
};

class vip_rsc_listbox {

	access = 0;
	idc = 25;
	type = CT_COMBO;
	style = ST_LEFT + LB_TEXTURES; 
	default = 0; 
	blinkingPeriod = 0;

	x = 12 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
	y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 9 * GUI_GRID_CENTER_W; 
	h = 1 * GUI_GRID_CENTER_H;

	colorBackground[] = {0.2,0.2,0.2,1}; 
	colorSelectBackground[] = {1,0.5,0,1};

	sizeEx = GUI_GRID_CENTER_H; 
	font = GUI_FONT_NORMAL; 
	shadow = 0; 
	colorText[] = {1,1,1,1}; 
	colorDisabled[] = {1,1,1,0.5};
	colorSelect[] = {1,1,1,1}; 

	pictureColor[] = {1,0.5,0,1};
	pictureColorSelect[] = {1,1,1,1}; 
	pictureColorDisabled[] = {1,1,1,0.5};

	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";

	wholeHeight = 8 * GUI_GRID_CENTER_H;
	maxHistoryDelay = 1;

	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; 

	class ComboScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01; 

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; 
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; 
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};

	onLBSelChanged = "";
};

class vip_rsc_map {
	moveOnEdges=1;
	x="SafeZoneXAbs";
	y="SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w="SafeZoneWAbs";
	h="SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow=0;
	ptsPerSquareSea=5;
	ptsPerSquareTxt=20;
	ptsPerSquareCLn=10;
	ptsPerSquareExp=10;
	ptsPerSquareCost=10;
	ptsPerSquareFor=9;
	ptsPerSquareForEdge=9;
	ptsPerSquareRoad=6;
	ptsPerSquareObj=9;
	showCountourInterval=0;
	scaleMin=0.001;
	scaleMax=1;
	scaleDefault=0.16;
	maxSatelliteAlpha=0.85000002;
	alphaFadeStartScale=2;
	alphaFadeEndScale=2;
	colorBackground[]={0.96899998,0.95700002,0.949,1};
	colorSea[]={0.46700001,0.63099998,0.85100001,0.5};
	colorForest[]={0.62400001,0.77999997,0.38800001,0.5};
	colorForestBorder[]={0,0,0,0};
	colorRocks[]={0,0,0,0.30000001};
	colorRocksBorder[]={0,0,0,0};
	colorLevels[]={0.28600001,0.177,0.093999997,0.5};
	colorMainCountlines[]={0.57200003,0.354,0.18799999,0.5};
	colorCountlines[]={0.57200003,0.354,0.18799999,0.25};
	colorMainCountlinesWater[]={0.491,0.57700002,0.70200002,0.60000002};
	colorCountlinesWater[]={0.491,0.57700002,0.70200002,0.30000001};
	colorPowerLines[]={0.1,0.1,0.1,1};
	colorRailWay[]={0.80000001,0.2,0,1};
	colorNames[]={0.1,0.1,0.1,0.89999998};
	colorInactive[]={1,1,1,0.5};
	colorOutside[]={0,0,0,1};
	colorTracks[]={0.83999997,0.75999999,0.64999998,0.15000001};
	colorTracksFill[]={0.83999997,0.75999999,0.64999998,1};
	colorRoads[]={0.69999999,0.69999999,0.69999999,1};
	colorRoadsFill[]={1,1,1,1};
	colorMainRoads[]={0.89999998,0.5,0.30000001,1};
	colorMainRoadsFill[]={1,0.60000002,0.40000001,1};
	colorGrid[]={0.1,0.1,0.1,0.60000002};
	colorGridMap[]={0.1,0.1,0.1,0.60000002};
	fontLabel="PuristaMedium";
	sizeExLabel="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid="TahomaB";
	sizeExGrid=0.02;
	fontUnits="TahomaB";
	sizeExUnits="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames="EtelkaNarrowMediumPro";
	sizeExNames="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo="PuristaMedium";
	sizeExInfo="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel="TahomaB";
	sizeExLevel=0.02;
	text="#(argb,8,8,3)color(1,1,1,1)";
	class Legend
	{
		x="SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y="SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w="10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h="3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font="PuristaMedium";
		sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		colorBackground[]={1,1,1,0.5};
		color[]={0,0,0,1};
	};
	class Task
	{
		icon="\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated="\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled="\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone="\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed="\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		color[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
		};
		colorCreated[]={1,1,1,1};
		colorCanceled[]={0.69999999,0.69999999,0.69999999,1};
		colorDone[]={0.69999999,1,0.30000001,1};
		colorFailed[]={1,0.30000001,0.2,1};
		size=27;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Waypoint
	{
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[]={0,0,0,1};
	};
	class WaypointCompleted
	{
		icon="\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[]={0,0,0,1};
	};
	class CustomMark
	{
		icon="\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size=24;
		importance=1;
		coefMin=1;
		coefMax=1;
		color[]={0,0,0,1};
	};
	class Command
	{
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size=18;
		importance=1;
		coefMin=1;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class Bush
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		size="14/2";
		importance="0.2 * 14 * 0.05 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Rock
	{
		icon="\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[]={0.1,0.1,0.1,0.80000001};
		size=12;
		importance="0.5 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class SmallTree
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		size=12;
		importance="0.6 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Tree
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		size=12;
		importance="0.9 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class busstop
	{
		icon="\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class fuelstation
	{
		icon="\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class hospital
	{
		icon="\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class church
	{
		icon="\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class lighthouse
	{
		icon="\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class power
	{
		icon="\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class powersolar
	{
		icon="\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class powerwave
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class powerwind
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class quay
	{
		icon="\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class transmitter
	{
		icon="\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class watertower
	{
		icon="\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class Cross
	{
		icon="\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={0,0,0,1};
	};
	class Chapel
	{
		icon="\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={0,0,0,1};
	};
	class Shipwreck
	{
		icon="\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={0,0,0,1};
	};
	class Bunker
	{
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size=14;
		importance="1.5 * 14 * 0.05";
		coefMin=0.25;
		coefMax=4;
		color[]={0,0,0,1};
	};
	class Fortress
	{
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
		color[]={0,0,0,1};
	};
	class Fountain
	{
		icon="\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size=11;
		importance="1 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
		color[]={0,0,0,1};
	};
	class Ruin
	{
		icon="\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size=16;
		importance="1.2 * 16 * 0.05";
		coefMin=1;
		coefMax=4;
		color[]={0,0,0,1};
	};
	class Stack
	{
		icon="\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size=20;
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
		color[]={0,0,0,1};
	};
	class Tourism
	{
		icon="\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size=16;
		importance="1 * 16 * 0.05";
		coefMin=0.69999999;
		coefMax=4;
		color[]={0,0,0,1};
	};
	class ViewTower
	{
		icon="\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size=16;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
		color[]={0,0,0,1};
	};
};