class vip_sms_dlg_mineMenu {

	idd = 12100;
	enableSimulation = 1;
	enableDisplay = 0;
	movingEnable = true;

	onLoad = "_this call vip_sms_fnc_cl_menuOpen; false";
	onUnload = "vip_sms_var_cl_mineList = []; vip_sms_var_cl_3DIcon = []";
	onChildDestroyed = "";
	
	class ControlsBackground {
		class TextWindowTitle {
			access = 0;
			idc = -1;
			type = CT_STATIC;
			style = ST_CENTER;
			moving = 1;
			default = 0;
			blinkingPeriod = 0;

			x = 9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 6 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;

			colorBackground[] = {0.2,0.2,0.2,1};

			text = "Explosives";
			sizeEx = 1 * GUI_GRID_CENTER_H;
			font = GUI_FONT_NORMAL;
			shadow = 1;
			lineSpacing = 1;
			fixedWidth = 0;
			colorText[] = {1,1,1,1};
			colorShadow[] = {0,0,0,0.5};
		};
		
		class Background: vip_rsc_box {
			idc = -1;
			moving = 1;
			x = 9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = GUI_GRID_CENTER_Y;
			w = 22 * GUI_GRID_CENTER_W;
			h = 21 * GUI_GRID_CENTER_H;
			colorBackground[] = {0.35,0.5,0.35,0.75};
			colorText[] = {0,0,0,0};
		};
	};
	
	class Controls {
	
		class ButtonExit: vip_rsc_button {

			idc = 99;

			x = 24 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 19 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 6 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;

			text = "Exit";

			onButtonClick = "closeDialog 0; false";
		};
		
		class ButtonUpdate: vip_rsc_button {

			idc = 0;

			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Update";

			onButtonClick = "_this call vip_sms_fnc_cl_menuUpdate; true";
		};
		
		class ButtonDisarm: vip_rsc_button {

			idc = 1;

			x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Disarm";

			onButtonClick = "[_this select 0, 0] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonRemove: vip_rsc_button {

			idc = 2;

			x = 24 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Remove";

			onButtonClick = "[_this select 0, 1] spawn vip_sms_fnc_cl_menuAction; true";
		};
			
		class ButtonArm: vip_rsc_button {

			idc = 3;

			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 7 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Arm";

			onButtonClick = "[_this select 0, 2] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonTripwire: vip_rsc_button {

			idc = 4;

			x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 7 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Arm (Tripwire)";

			onButtonClick = "[_this select 0, 3] call vip_sms_fnc_cl_menuAction; false";
		};
		
		class ButtonRemoteArm: vip_rsc_button {

			idc = 5;

			x = 24 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
			y = 7 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Arm (Remote)";

			onButtonClick = "[_this select 0, 4] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonTimerSet: vip_rsc_button {

			idc = 6;

			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Set Timer";

			onButtonClick = "[_this select 0, 5] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonRotateLeft: vip_rsc_button {

			idc = 7;

			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Rotate -5°";

			onButtonClick = "[_this select 0, 6] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonRotateRight: vip_rsc_button {

			idc = 8;

			x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;

			text = "Rotate +5°";

			onButtonClick = "[_this select 0, 7] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonRemoteDetonate: vip_rsc_button {

			idc = 9;

			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
			y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			colorText[] = {1,0,0,1};

			text = "DETONATE";
			
			soundClick[] = {"a3\sounds_f\weapons\closure\sfx3",0.25,1}; 

			onButtonClick = "[_this select 0, 9] call vip_sms_fnc_cl_menuAction; true";
		};
		
		class ButtonRemoteSafety: vip_rsc_button {

			idc = 10;

			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
			y = 15 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			colorText[] = {1,0.5,0,1};

			text = "SAFETY OFF";
			
			soundClick[] = {"a3\sounds_f\weapons\closure\sfx3",0.25,2}; 

			onButtonClick = "[_this select 0, 8] call vip_sms_fnc_cl_menuAction; true";
		};
		
//TEXTS

		class TextMine: vip_rsc_text {
			idc = 20;
			
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			sizeEx = 1 * GUI_GRID_CENTER_H;
			font = GUI_FONT_NORMAL;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {1,1,1,1};
			
			text = "Select Explosive:";
		};
		
		class TextStatus: vip_rsc_text {
			idc = 21;
			
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			sizeEx = 1 * GUI_GRID_CENTER_H;
			font = GUI_FONT_NORMAL;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {1,1,1,1};
			
			text = "Current Status:";
		};
		
		class TextStatus2: vip_rsc_text {
			idc = 22;
			
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			sizeEx = 1 * GUI_GRID_CENTER_H;
			font = GUI_FONT_NORMAL;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {1,1,1,1};
			
			text = "";
		};
	
		class TextTimerBG: vip_rsc_text {
			idc = 23;
			
			x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 6 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			colorBackground[] = {0.8,0.8,0.8,1};
			
			text = "";
		};
		
		class TextTimer {
			idc = 24;
			type = CT_EDIT;
			style = ST_LEFT+ST_FRAME;
			autocomplete = "";
			
			x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 6 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			sizeEx = 1 * GUI_GRID_CENTER_H;
			font = GUI_FONT_NORMAL;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorSelection[] = {0.5,0.5,0.5,0.75};
			colorDisabled[] = {0,0,0,0.25};
			colorText[] = {0,0,0,1};
			
			text = "";
		};
		
		class TextRemotes: vip_rsc_text {
			idc = 25;
			
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 13 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			sizeEx = 1 * GUI_GRID_CENTER_H;
			font = GUI_FONT_NORMAL;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {1,1,1,1};
			
			text = "Select Remote:";
		};

//LISTS

		class ListMines: vip_rsc_listbox {
			idc = 26;

			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
			y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; 
			w = 9 * GUI_GRID_CENTER_W; 
			h = 1 * GUI_GRID_CENTER_H; 

			onLBSelChanged = "_this call vip_sms_fnc_cl_menuUpdate; false";
		};
		
		class ListRemotes: vip_rsc_listbox {
			idc = 27;
			
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
			y = 13 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			
			onLBSelChanged = "false";
		};
	};
};