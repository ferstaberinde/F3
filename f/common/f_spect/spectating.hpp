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
				thumb = "\a3\ui_f\data\gui\cfg\Scrollbar\thumb_ca.paa";
				arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
				arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
				border = "\a3\ui_f\data\gui\cfg\Scrollbar\border_ca.paa";
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
				colorDisabled[] = {0,0,0,1};
				thumb = "\a3\ui_f\data\gui\cfg\Scrollbar\thumb_ca.paa";
				arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
				arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
				border = "\a3\ui_f\data\gui\cfg\Scrollbar\border_ca.paa";
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
			colorDisabled[] = {0,0,0,1};
			sizeEx = 0.025;
			onMouseButtonUp  = "['*Dialog*'] spawn CameraMenuHandler;";
			// onLBSelChanged   = "KEGs_cameraIdx = (_this select 1); VM_CurrentCameraView = ''; ['*Dialog*'] spawn CameraMenuHandler;";
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
			colorDisabled[] = {0,0,0,1};
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {0,0,0,1};
				thumb = "\a3\ui_f\data\gui\cfg\Scrollbar\thumb_ca.paa";
				arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
				arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
				border = "\a3\ui_f\data\gui\cfg\Scrollbar\border_ca.paa";
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
			onMouseButtonUp  = "['*Dialog*'] spawn PlayerMenuHandler;";
			// onLBSelChanged   = "KEGs_tgtIdx = (_this select 1);  ['*Dialog*'] spawn PlayerMenuHandler;";
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
			x = SafeZoneX + BORDERXSIZE;y = SafeZoneY + SafeZoneH-BORDERSIZE; w = SafeZoneW-(BORDERXSIZE); h = BORDERSIZE;
			text = "Unknown";
			style = 0;
			sizeEx = 0.015; //0.030
			colorText[] = {1.0, 1.0, 1.0, 0.9};
		};

		// Help text
		class tHelp : KEGsRscText {
			type = 13;
			idc = IDC_HELP;
			x = SafeZoneX + BORDERXSIZE*3;y=SafeZoneY + BORDERSIZE*3; w = SafeZoneW-(2*BORDERXSIZE*3); h = SafeZoneH-(2*BORDERSIZE*2);
			text = "Spectating Script v1.05 by Kegetys<br/><br/>Click at the camera/target text at the top to open camera/target menus.<br/>Units on the map can be clicked to target them<br/><br/>Keyboard controls:<br/>A/D - Previous/Next target<br/>W/S - Previous/Next camera<br/>1-5 - Direct camera change<br/>N - 3D view: Toggle night vision on/off<br/>N - Full map: Toggle marker text off/names/types<br/>T - Toggle unit tags on/off<br/>F - Toggle AI filter on/off<br/>G - Toggle Group/Formation Leader filter on/off<br/>H - Toggle Map Markers Updates on/off<br/>Tab - Toggle UI on/off<br/>M - Toggle map on/full/off<br/>Numpad plus/minus - Increase/decrease full map marker size<br/>Space - Drop camera (W,S,A,D keys = movement)<br/>Space - Toggle gunsight (1st person view)<br/>Esc - Butterfly mode<br/><br/>Mouse controls:<br/>Right button - Rotate camera (free camera mode only)<br/>Left button - Move camera<br/>Left and right button - Zoom<br/><br/>Download the client-side addon from<br/>http://www.kegetys.net for enhanced functionality<br/> Improvement modifications by Dwarden </br>";
			style = 2;
			sizeEx = 0.025;
			size = 0.025;
			colorText[] = {1.0, 1.0, 1.0, 1.0};
			color[] = {0.0, 0.0, 0.0, 1.0};
			font = "LucidaConsoleB";
			class Attributes{
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



		// Dummy element for retrieving mouse events
	};
};
