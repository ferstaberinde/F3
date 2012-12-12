//
// Spectating Script for Armed Assault
// by Kegetys <kegetys [ät] dnainternet.net>
//

#include "common.hpp"

#define BORDERSIZE	0.06
#define BORDERXSIZE	0.015
#define CMENUWIDTH	0.19	// Camera menu width
#define TMENUWIDTH	0.200 // Target menu width
#define MENUHEIGHT	0.30
#define MAPWIDTH		0.3
#define MAPHEIGHT		0.30
#define MAPTXTSIZE	0.02
#define ELOGWIDTH		0.900
//#define ELOGHEIGHT	0.1525
#define ELOGHEIGHT	0.0

#define IDC_MAIN			55001
#define IDC_CAMERA		55002
#define IDC_TARGET		55003
#define IDC_NAME			55004
#define IDC_MENUCAM		55005
#define IDC_MENUTGT		55006
#define IDC_MENUCAMB	55007
#define IDC_MENUTGTB	55008
#define IDC_BG1				55009
#define IDC_BG2				55010
#define IDC_TITLE			55011
#define IDC_HELP			55012
#define IDC_MAP				55013
#define IDC_MAPFULL		55014
#define IDC_MAPFULLBG	55015
#define IDC_EVENTLOG	50016
#define IDC_DEBUG			55100

#define COL_ORANGE		{1, 0.5, 0, 1}
#define COL_GRAY			{0.2, 0.2, 0.2, 1}

class rscSpectate {
	idd = IDC_MAIN;
	movingEnable = false;

	class controls {
		class mouseHandler: KEGsRscControlsGroup {
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
			onMouseMoving = "[""MouseMoving"",_this] call spectate_events";
			onMouseButtonDown = "[""MouseButtonDown"",_this] call spectate_events";
			onMouseButtonUp = "[""MouseButtonUp"",_this] call spectate_events";
			onMouseZChanged = "[""MouseZChanged"",_this] call spectate_events";
			idc = 123;
			x = SafeZoneX; y = SafeZoneY;
			w = SafeZoneW; h = SafeZoneH;
			colorBackground[] = {0.2, 0.0, 0.0, 0.0};
		};
		// Borders and title text
		class BackgroundTop: KEGsRscText {
			idc = IDC_BG1;
			x = SafeZoneX; y = SafeZoneY;
			w = SafeZoneW; h = BORDERSIZE;
			colorBackground[] = {0.0, 0.0, 0.0, 1.0};
		};
		class BackgroundBottom: BackgroundTop {
			idc = IDC_BG2;
			y = SafeZoneY + SafeZoneH-BORDERSIZE;
		};
		class title : BackgroundTop {
			idc = IDC_TITLE;
			colorBackground[] = {0.0, 0.0, 0.0, 0.0};
			text = "SPECTATING";
			style = 2;
			sizeEx = 0.035;
			colorText[] = {1.0, 0.0, 0.0, 1.0};
			shadow = true;
			y = SafeZoneY;
			h = BORDERSIZE;
			font = "Zeppelin32";
		};

		// Camera menu
		class menuCameras : KEGsRscText {
			idc = IDC_MENUCAMB;
			style = ST_HUD_BACKGROUND;
			x = SafeZoneX + BORDERXSIZE;	y = SafeZoneY + BORDERSIZE;
			w = CMENUWIDTH;		h = MENUHEIGHT;
			text = "";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class menuCamerasLB : KEGsRscListBox {
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
			autoScrollRewind=0;
			autoScrollDelay=5;
			autoScrollSpeed=-1;
			maxHistoryDelay=1;
			idc = IDC_MENUCAM;
			x = SafeZoneX + BORDERXSIZE;	y = SafeZoneY + BORDERSIZE;
			w = CMENUWIDTH;		h = MENUHEIGHT;
			colorSelect[] = COL_ORANGE;
			colorSelect2[] = COL_ORANGE;
			colorSelectBackground[] = COL_GRAY;
			colorSelectBackground2[] = COL_GRAY;
			sizeEx = 0.025;
		};

		// Targets menu
		class menuTargets : KEGsRscText {
			idc = IDC_MENUTGTB;
			style = ST_HUD_BACKGROUND;
			x = SafeZoneX + SafeZoneW-BORDERXSIZE-TMENUWIDTH;
			y = SafeZoneY + BORDERSIZE;
			w = TMENUWIDTH;	h = MENUHEIGHT;
			text = "";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class menuTargetsLB : KEGsRscListBox {
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
			autoScrollRewind=0;
			autoScrollDelay=5;
			autoScrollSpeed=-1;
			maxHistoryDelay=1;
			idc = IDC_MENUTGT;
			x = SafeZoneX + SafeZoneW-BORDERXSIZE-TMENUWIDTH;
			y = SafeZoneY + BORDERSIZE;
			w = TMENUWIDTH;	h = MENUHEIGHT;
			colorSelect[] = COL_ORANGE;
			colorSelect2[] = COL_ORANGE;
			colorSelectBackground[] = COL_GRAY;
			colorSelectBackground2[] = COL_GRAY;
			colorScrollbar[] = COL_ORANGE;
			colorText[] = {1, 1, 1, 1};
			sizeEx = 0.025;
			period = 0;
		};

		// Top texts
		class tCamera : KEGsRscActiveText {
			idc = IDC_CAMERA;
			x = SafeZoneX + BORDERXSIZE; y = SafeZoneY;	w = SafeZoneW-(2*BORDERXSIZE); h = BORDERSIZE;
			text = "Camera";
			style = 0;
			sizeEx = 0.025;
			color[] = {1.0, 1.0, 1.0, 0.9};
			shadow = true;
			font = "Zeppelin32";
			onMouseButtonUp = "[""ToggleCameraMenu"",0] call spectate_events";
		};
		class tTarget : tCamera {
			idc = IDC_TARGET;
			text = "Target";
			style = 1;
			onMouseButtonUp = "[""ToggleTargetMenu"",0] call spectate_events";
		};

		// Bottom texts
		class tName : KEGsRscText {
			idc = IDC_NAME;
			x = SafeZoneX + BORDERXSIZE;y= SafeZoneH-BORDERSIZE; w = SafeZoneW-(BORDERXSIZE); h = BORDERSIZE;
			text = "Unknown";
			style = 0;
			sizeEx = 0.015; //0.030
			colorText[] = {1.0, 1.0, 1.0, 0.9};
			font = "Zeppelin32";
		};

		// Help text
		class tHelp : KEGsRscText {
			type = 13;
			idc = IDC_HELP;
			x = SafeZoneX + BORDERXSIZE*3;y=BORDERSIZE*3; w = SafeZoneW-(2*BORDERXSIZE*3); h = SafeZoneH-(2*BORDERSIZE*2);
			text = "Spectating Script v1.03 by Kegetys<br/><br/>Click at the camera/target text at the top to open camera/target menus.<br/>Units on the map can be clicked to target them<br/><br/>Keyboard controls:<br/>A/D - Previous/Next target<br/>W/S - Previous/Next camera<br/>1-5 - Direct camera change<br/>N - 3D view: Toggle night vision on/off<br/>N - Full map: Toggle marker text off/names/types<br/>T - Toggle unit tags on/off<br/>F - Toggle AI filter on/off<br/>G - Toggle Group/Formation Leader filter on/off<br/>H - Toggle Map Markers Updates on/off<br/>Tab - Toggle UI on/off<br/>M - Toggle map on/full/off<br/>Numpad plus/minus - Increase/decrease full map marker size<br/>Space - Drop camera (W,S,A,D keys = movement)<br/>Space - Toggle gunsight (1st person view)<br/>Esc - Butterfly mode<br/><br/>Mouse controls:<br/>Right button - Rotate camera (free camera mode only)<br/>Left button - Move camera<br/>Left and right button - Zoom<br/><br/>Download the client-side addon from<br/>http://www.kegetys.net for enhanced functionality<br/> Improvement modifications by Dwarden </br>";
			style = 2;
			sizeEx = 0.025;
			size = 0.025;
			colorText[] = {1.0, 1.0, 1.0, 1.0};
			color[] = {0.0, 0.0, 0.0, 1.0};
			font = "LucidaConsoleB";
			class Attributes{
				font = "Bitstream";
				color = "#ffffff";
				align = "left";
				shadow = true;
			};
		};

		// Debug text
		class tDebug : tCamera {
			idc = IDC_DEBUG;
			text = "";
			style = 2;
			x = SafeZoneX; y = SafeZoneY;
			w = SafeZoneW; h = SafeZoneH;
			action ="";
		};

		// Map
		class map : KEGsRscMapControl {
			colorOutside[] = {0,0,0,1};
			colorRailWay[] = {0,0,0,1};
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1;
			alphaFadeEndScale = 1.1;
			class Task : Task
			{
				icon = "\ca\ui\data\map_waypoint_ca.paa";
				size = 20;
				color[] = {0,0.9,0,1};
				importance = "1.2 * 16 * 0.05";
				coefMin = 0.9;
				coefMax = 4;
			};
			class CustomMark : CustomMark
			{
				icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0,0,1,1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			idc = IDC_MAP;
			x = SafeZoneX + SafeZoneW-MAPWIDTH; y = SafeZoneY + SafeZoneH-MAPHEIGHT;
			w = MAPWIDTH; h = MAPHEIGHT;
			colorBackground[] = {0.7, 0.7, 0.7, 0.75};
			//sizeEx = 0.02;
			sizeExLabel = MAPTXTSIZE;
			sizeExGrid = MAPTXTSIZE;
			sizeExUnits = MAPTXTSIZE;
			sizeExNames = MAPTXTSIZE;
			sizeExInfo = MAPTXTSIZE;
			sizeExLevel = MAPTXTSIZE;
			showCountourInterval = "false";

			onMouseZChanged = "[""MouseZChangedminimap"",_this] call spectate_events";

			class Command : Command {
				icon = "#(argb,8,8,3)color(1,1,1,1)";
				color[] = {0, 0, 0, 1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};

			class ActiveMarker : ActiveMarker {
				color[] = {0.3, 0.1, 0.9, 1};
				size = 50;
			};
		};

		// Fullscreen map
		class mapFullBG : BackgroundTop {
			idc = IDC_MAPFULLBG;
			x = SafeZoneX;y=SafeZoneY;
			w = SafeZoneW;h=SafeZoneH;
			colorBackground[] = {0.0, 0.0, 0.0, 1.0};
		};
		class mapFull : map {
			colorOutside[] = {0,0,0,1};
			colorRailWay[] = {0,0,0,1};
			maxSatelliteAlpha = 0;
			alphaFadeStartScale = 1;
			alphaFadeEndScale = 1.1;
			showCountourInterval = "true";
			idc = IDC_MAPFULL;
			x = SafeZoneX;y=SafeZoneY + BORDERSIZE;
			w = SafeZoneW;h=SafeZoneH-(BORDERSIZE*2);
			colorBackground[] = {0.85, 0.85, 0.85, 1.0};
		};

		// Fullscreen event log
		class mapFullEventLog : KEGsRscListBox {
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
			autoScrollRewind=0;
			autoScrollDelay=5;
			autoScrollSpeed=-1;
			maxHistoryDelay=1;
			idc = IDC_EVENTLOG;
			x = SafeZoneX; y = SafeZoneY + SafeZoneH-ELOGHEIGHT;
			w = ELOGWIDTH;		h = ELOGHEIGHT;
			colorText[] = {1, 1, 1, 0};
			colorSelect[] = {1, 1, 1, 0};
			colorSelect2[] = {1, 1, 1, 0};
			colorSelectBackground[] = {1, 1, 1, 0};
			colorSelectBackground2[] = {1, 1, 1, 0};
			colorBackground[] = {0, 0, 0, 0.5};
			colorScrollbar[] = {1, 1, 1, 0};
			sizeEx = 0.021;
		};

		// Dummy element for retrieving mouse events
	};
};
