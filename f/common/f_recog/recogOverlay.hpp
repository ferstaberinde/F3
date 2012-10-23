// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

#define RECOGOVERLAY_IDD 990
#define RECOGOVERLAY_TEXT0_IDC 991

#define CT_STATIC 0
#define ST_CENTER 0x02
#define CT_STRUCTURED_TEXT 13
#define FontM "TahomaB"

#define BORDER 0.05
#define WIDTH 0.4
#define HEIGHT 0.3

class Meter {
	type = 0;
	style = ST_CENTER;
	access = 0;
	font = FontM;
	sizeEx = 0.023;
	size = 0.06;
	idc = -1;

	colorBackground[] = { 1, 1, 0, 1 };
	colorText[] = { 0, 0, 0, 1 };

	w = 0.1;
	h = 0.1;
};

class RecogText {
	type = CT_STRUCTURED_TEXT;
	style = ST_CENTER;
	text = "";
	access = 0;
	font = FontM;
	sizeEx = 0.023;
	size = 0.06;

	colorBackground[] = { 1, 1, 1, 0.2 };
	colorText[] = { 0, 0, 0, 1 };

	x = BORDER;
	y = BORDER;
	w = WIDTH;
	h = HEIGHT;

	class Attributes {
		font = "TahomaB";
		color = "#FFFFFF";
		align = "center";
		valign = "middle";
		shadow = 1;
		shadowColor = "#000000";
		size = "1";
	};
};

	class recogOverlayRsc {
		idd = RECOGOVERLAY_IDD;
		movingEnable = 1;
		fadein = 0.0;
		fadeout = 0.0;
		duration = 1e6;
		access = 0;

		onLoad = "_this call recognizeOverlayCtrl;";

		class objects {
		};
		class controlsBackground {
		/*
			class recogBG {
				idc = -1;   // set to -1, unneeded
				type = CT_STATIC;   // constant
				style = ST_LEFT;   // constant
				text = "";
				font = FontM;
				sizeEx = 0.023;

				colorBackground[] = { 1, 1, 1, 0.3 };
				colorText[] = { 0, 0, 0, 1 };

				x = 0;
				y = 0;
				w = WIDTH + 2 * BORDER;
				h = HEIGHT + 2 * BORDER;
			};
		*/
		};
		class controls {
			class Recog0 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC;
			};
			class Recog1 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 1;
			};
			class Recog2 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 2;
			};
			class Recog3 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 3;
			};
			class Recog4 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 4;
			};
			class Recog5 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 5;
			};
			class Recog6 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 6;
			};
			class Recog7 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 7;
			};
			class Recog8 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 8;
			};
			class Recog9 : RecogText {
				idc = RECOGOVERLAY_TEXT0_IDC + 9;
			};
		};
	};

	class ScreenMeter {
		idd = -1;
		movingEnable = 1;
		fadein = 0.0;
		fadeout = 0.0;
		duration = 1e6;
		access = 0;

		class objects { };
		class controlsBackground { };
		class controls {
			class MeterY0 : Meter {
				x = 0.5;
				y = 0.0;
				text = "0.0";
			};
			class MeterY1 : Meter {
				x = 0.5;
				y = 0.2;
				text = "0.2";
			};
			class MeterY2 : Meter {
				x = 0.5;
				y = 0.4;
				text = "0.4";
			};
			class MeterY3 : Meter {
				x = 0.5;
				y = 0.6;
				text = "0.6";
			};
			class MeterY4 : Meter {
				x = 0.5;
				y = 0.8;
				text = "0.8";
			};
			class MeterY5 : Meter {
				x = 0.5;
				y = 1.0;
				text = "1.0";
			};

			class MeterX0 : Meter {
				y = 0.5;
				x = 0.0;
				text = "0.0";
			};
			class MeterX1 : Meter {
				y = 0.5;
				x = 0.2;
				text = "0.2";
			};
			class MeterX2 : Meter {
				y = 0.5;
				x = 0.4;
				text = "0.4";
			};
			class MeterX3 : Meter {
				y = 0.5;
				x = 0.6;
				text = "0.6";
			};
			class MeterX4 : Meter {
				y = 0.5;
				x = 0.8;
				text = "0.8";
			};
			class MeterX5 : Meter {
				y = 0.5;
				x = 1.0;
				text = "1.0";
			};
		};
	};
