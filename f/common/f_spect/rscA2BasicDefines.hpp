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
    class RscSlider {
        access = 0;
        type = 3;
        style = 1024;
        w = 0.3;
        color[] = {1, 1, 1, 0.8};
        colorActive[] = {1, 1, 1, 1};
        shadow = 0;
        h = 0.025;
    };

 class RscText {
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
    class RscTextSmall : RscText {
        h = 0.03;
        sizeEx = 0.027;
    };
    class RscTitle : RscText {
        x = 0.15;
        y = 0.06;
        w = 0.7;
        shadow = 0;
        style = 0;
        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        colorText[] = {0.95, 0.95, 0.95, 1};
    };
    class RscPicture {
        access = 0;
        type = 0;
        idc = -1;
        style = 48;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        font = "TahomaB";
        sizeEx = 0;
        lineSpacing = 0;
        text = "";
        fixedWidth = 0;
        shadow = 0;
        x = 0;
        y = 0;
        w = 0.2;
        h = 0.15;
    };
    class RscActiveText {
        access = 0;
        type = 11;
        style = 2;
        color[] = {0, 0, 0, 1};
        colorActive[] = {0.3, 0.4, 0, 1};
        soundEnter[] = {"", 0.1, 1};
        soundPush[] = {"", 0.1, 1};
        soundClick[] = {"", 0.1, 1};
        soundEscape[] = {"", 0.1, 1};
        text = "";
        default = 0;
        idc = -1;
        x = 0;
        y = 0;
        h = 0.035;
        w = 0.035;
        font = "PuristaMedium";
        shadow = 2;
        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        colorText[] = {0, 0, 0, 1};
    };

    class RscListBox {
        access = 0;
        type = 5;
        w = 0.4;
        h = 0.4;
        rowHeight = 0;
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
        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
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

//Standard button.
class RscButton {
        access = 0;
        type = 1;
        text = "";
        colorText[] = {1, 1, 1, 1};
        colorDisabled[] = {0.4, 0.4, 0.4, 1};
        colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
        colorBackgroundDisabled[] = {0.95, 0.95, 0.95, 1};
        colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
        colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
        colorShadow[] = {0, 0, 0, 1};
        colorBorder[] = {0, 0, 0, 1};
        soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
        soundPush[] = {"\A3\ui_f\data\sound\new1", 0, 0};
        soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
        soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
        style = 2;
        x = 0;
        y = 0;
        w = 0.095589;
        h = 0.039216;
        shadow = 2;
        font = "PuristaMedium";
        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        offsetX = 0.003;
        offsetY = 0.003;
        offsetPressedX = 0.002;
        offsetPressedY = 0.002;
        borderSize = 0;
    };

//Standard structured text.
class RscStructuredText {
        access = 0;
        type = 13;
        idc = -1;
        style = 0;
        colorText[] = {1, 1, 1, 1};
        class Attributes {
            font = "PuristaMedium";
            color = "#ffffff";
            align = "left";
            shadow = 1;
        };
        x = 0;
        y = 0;
        h = 0.035;
        w = 0.1;
        text = "";
        size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
        shadow = 1;
    };

//Standard controls group.
class RscControlsGroup {
        class VScrollbar {
            color[] = {1, 1, 1, 1};
            width = 0.021;
            autoScrollSpeed = -1;
            autoScrollDelay = 5;
            autoScrollRewind = 0;
            shadow = 0;
        };
        class HScrollbar {
            color[] = {1, 1, 1, 1};
            height = 0.028;
            shadow = 0;
        };
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
        class Controls {
        };
        type = 15;
        idc = -1;
        x = 0;
        y = 0;
        w = 1;
        h = 1;
        shadow = 0;
        style = 16;
    };

class RscMapControl {
        access = 0;
        type = 101;
        idc = 51;
        style = 48;
        colorBackground[] = {0.969, 0.957, 0.949, 1};
        colorOutside[] = {0, 0, 0, 1};
        colorText[] = {0, 0, 0, 1};
        font = "TahomaB";
        sizeEx = 0.04;
        colorSea[] = {0.467, 0.631, 0.851, 0.5};
        colorForest[] = {0.624, 0.78, 0.388, 0.5};
        colorRocks[] = {0, 0, 0, 0.3};
        colorCountlines[] = {0.572, 0.354, 0.188, 0.25};
        colorMainCountlines[] = {0.572, 0.354, 0.188, 0.5};
        colorCountlinesWater[] = {0.491, 0.577, 0.702, 0.3};
        colorMainCountlinesWater[] = {0.491, 0.577, 0.702, 0.6};
        colorForestBorder[] = {0, 0, 0, 0};
        colorRocksBorder[] = {0, 0, 0, 0};
        colorPowerLines[] = {0.1, 0.1, 0.1, 1};
        colorRailWay[] = {0.8, 0.2, 0, 1};
        colorNames[] = {0.1, 0.1, 0.1, 0.9};
        colorInactive[] = {1, 1, 1, 0.5};
        colorLevels[] = {0.286, 0.177, 0.094, 0.5};
        colorTracks[] = {0.84, 0.76, 0.65, 0.15};
        colorRoads[] = {0.7, 0.7, 0.7, 1};
        colorMainRoads[] = {0.9, 0.5, 0.3, 1};
        colorTracksFill[] = {0.84, 0.76, 0.65, 1};
        colorRoadsFill[] = {1, 1, 1, 1};
        colorMainRoadsFill[] = {1, 0.6, 0.4, 1};
        colorGrid[] = {0.1, 0.1, 0.1, 0.6};
        colorGridMap[] = {0.1, 0.1, 0.1, 0.6};
        stickX[] = {0.2, {"Gamma", 1, 1.5}};
        stickY[] = {0.2, {"Gamma", 1, 1.5}};
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
        moveOnEdges = 1;
        x = "SafeZoneXAbs";
        y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w = "SafeZoneWAbs";
        h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        shadow = 0;
        ptsPerSquareSea = 5;
        ptsPerSquareTxt = 3;
        ptsPerSquareCLn = 10;
        ptsPerSquareExp = 10;
        ptsPerSquareCost = 10;
        ptsPerSquareFor = 9;
        ptsPerSquareForEdge = 9;
        ptsPerSquareRoad = 6;
        ptsPerSquareObj = 9;
        showCountourInterval = 0;
        scaleMin = 0.001;
        scaleMax = 1;
        scaleDefault = 0.16;
        maxSatelliteAlpha = 0.85;
        alphaFadeStartScale = 0.35;
        alphaFadeEndScale = 0.4;
        fontLabel = "PuristaMedium";
        sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        fontGrid = "TahomaB";
        sizeExGrid = 0.02;
        fontUnits = "TahomaB";
        sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        fontNames = "PuristaMedium";
        sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
        fontInfo = "PuristaMedium";
        sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        fontLevel = "TahomaB";
        sizeExLevel = 0.02;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        class power {
            icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
            color[] = {1, 1, 1, 1};
        };
        class powersolar {
            icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
            color[] = {1, 1, 1, 1};
        };
        class powerwave {
            icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
            color[] = {1, 1, 1, 1};
        };
        class powerwind {
            icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
            color[] = {1, 1, 1, 1};
        };
        class shipwreck {
            icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
            size = 24;
            importance = 1;
            coefMin = 0.85;
            coefMax = 1;
            color[] = {1, 1, 1, 1};
        };
    };