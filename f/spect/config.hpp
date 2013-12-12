class spect_RscListBox {
        access = 0;
        type = 5;
        w = 0.4;
        h = 0.4;
        rowHeight = 0;
        rowWidth = 0;
        colorText[] = {1, 1, 1, 1};
        colorScrollbar[] = {1, 0, 0, 0};
        colorSelect[] = {0, 0, 0, 1};
        colorSelect2[] = {0, 0, 0, 1};
        colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
        colorSelectBackground2[] = {1, 1, 1, 0.5};
        colorBackground[] = {0, 0, 0, 0.3};
        soundSelect[] = {"", 0.1, 1};
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        class ScrollBar {
            color[] = {1, 1, 1, 0.6};
            colorActive[] = {1, 1, 1, 1};
            colorDisabled[] = {1, 1, 1, 0.3};
            shadow = 0;
            thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
            arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
            arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
            border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        };
        style = 16;
        font = "PuristaMedium";
        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 50) * 1)";
        shadow = 0;
        colorShadow[] = {0, 0, 0, 0.5};
        color[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.25};
        period = 1.2;
        maxHistoryDelay = 1;
        autoScrollSpeed = -1;
        autoScrollDelay = 5;
        autoScrollRewind = 0;
    };
  class spect_RscFrame {
        type = 0;
        idc = -1;
        style = 64;
        shadow = 2;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        font = "PuristaMedium";
        sizeEx = 0.02;
        text = "";
    };
  class spect_Button {
    access = 0;
    borderSize = 0;
   
    colorBackgroundActive[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
    colorBorder[] = {0,0,0,1};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    color[] = {1,1,1,1};
    colorBackground[] = {0,0,0,1};
    font = "PuristaMedium";
    h = 0.039216;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    offsetX = 0.003;
    offsetY = 0.003;
    shadow = 0;
    sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    style = 2;
    text = "";
    type = 1;
    w = 0.095589;
    x = 0;
    y = 0;
  };
  class spect_IGUIBack {
        type = 0;
        idc = 124;
        style = 128;
        text = "";
        colorText[] = {0, 0, 0, 0};
        font = "PuristaMedium";
        sizeEx = 0;
        shadow = 0;
        x = 0.1;
        y = 0.1;
        w = 0.1;
        h = 0.1;
        colorbackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
    };
    class spect_RscText {
        access = 0;
        type = 0;
        idc = -1;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        text = "";
        fixedWidth = 0;
        x = 0;
        y = 0;
        h = 0.037;
        w = 0.3;
        style = 0;
        shadow = 1;
        colorShadow[] = {0, 0, 0, 0.5};
        font = "PuristaMedium";
        SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        linespacing = 1;
    };
class spect_RscControlsGroup {
	type = 15;
	idc = -1;
	style = 0;
	x = 0;
	y = 0;
	w = 1;
	h = 1;

	class VScrollbar  {
		color[] = {1,1,1,1 };
		width = 0.021000;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};

	class HScrollbar {
		color[] = {1, 1, 1, 1};
		height = 0.028;
	};

class ScrollBar  {
     arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	};

	class Controls {};
};


class spect_RscList
{
    access = 0;
    rowHeight = 0;
    rowWidth = 0;
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    color[] = {1,1,1,1};
    colorActive[] = {1,0,0,0.8};
    colorBackground[] = {0,0,0,0.8};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {1,0,0,0.8};
    colorSelect[] = {0,0,0,0.8};
    colorSelectBackground[] = {1,1,1,0.7};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    h = 0.035;
    maxHistoryDelay = 1;
    shadow = 0;
    sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
  //  style = "0x10 + 0x200";
    type = 5;
     //   type = 5;
        style = 0;
    w = 0.12;
    wholeHeight = 0.45;
    x = 0;
    y = 0;
    class ScrollBar
    {
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    };

};

class spect_RscCombo
{
    access = 0;
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    color[] = {1,1,1,1};
    colorActive[] = {1,0,0,1};
    colorBackground[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {1,0,0,1};
    colorSelect[] = {0,0,0,1};
    colorSelectBackground[] = {1,1,1,0.7};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    h = 0.035;
    maxHistoryDelay = 1;
    shadow = 0;
    sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
    style = "0x10 + 0x200";
    type = 4;
    w = 0.12;
    wholeHeight = 0.45;
    x = 0;
    y = 0;
    class ScrollBar
    {
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    };

};

class f_spec_dialog {
	idd = 9228;
	movingEnable = 0;
    enableSimulation = 1;
	fadein = 0;
	fadeout = 0;
	class controlsBackground {
        class SpecTopBar: spect_IGUIBack
        {
            idc = 2201;
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = safezoneW;
            h = safezoneH/20;
        };
		class mouseHandler: spect_RscControlsGroup {
            class ScrollBar
            {
                color[] = {1,1,1,0.6};
                colorActive[] = {1,1,1,1};
                colorDisabled[] = {1,1,1,0.0};
                thumb = "";
                arrowFull = "";
                arrowEmpty = "";
                border = "";
            };
			onMouseButtonDown = "[""MouseButtonDown"",_this] call f_cam_eventHandler";
			onMouseButtonUp = "[""MouseButtonUp"",_this] call f_cam_eventHandler";
            onMouseZChanged = "[""MouseZChanged"",_this] call f_cam_eventHandler";
		    idc = 123;
            x = SafeZoneX; y = SafeZoneY;
            w = SafeZoneW; h = SafeZoneH;
		    colorBackground[] = {0.2, 0.0, 0.0, 0.0};
		};
	};
    class controls {

//            x = 0.00640556 * safezoneW + safezoneX;
//            y = 0.0109959 * safezoneH + safezoneY;
        class SpectUnitButton : spect_Button
        {
            idc = 2110;
            x = 0.00640556 * safezoneW + safezoneX;
            y = 0.0110000 * safezoneH + safezoneY;
            w = 0.100 * safezoneW;
            h = 0.0200 * safezoneH;
            text = "Units";
            action = "ctrlShow [2100, !ctrlVisible 2100]"
        };
        class SpecUnitBox: spect_RscList
        {
            idc = 2100;
            x = 0.00640556 * safezoneW + safezoneX;
            y = 0.0310000 * safezoneH + safezoneY;
            w = 0.100 * safezoneW;
            h = 0.3 * safezoneH;
            onLBSelChanged = "[""LBListSelChanged"",_this] call f_cam_eventHandler";
        };
        class SpecModes: spect_RscCombo
        {
            idc = 2101;
            x = 0.883417 * safezoneW + safezoneX;
            y = 0.0109959 * safezoneH + safezoneY;
            w = 0.100 * safezoneW;
            h = 0.0200 * safezoneH;
            onLBSelChanged = "[""LBListSelChanged_modes"",_this] call f_cam_eventHandler";
        };
        class SpecText: spect_RscText
        {
            idc = 1000;
            text = "Spectating:Unknown"; //--- ToDo: Localize;
            x = 0.460336 * safezoneW + safezoneX;
            y = 0.00159198 * safezoneH + safezoneY;
            w = 0.100 * safezoneW;
            h = 0.0200 * safezoneH;
        };

    };
};
