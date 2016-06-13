#define BACKGROUND_COLOR {0.059,0.059,0.059,1}
#define PRIMARYCOLOR {0.918,0.655,0.141,1}
class RscSpectListBox {
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
    colorBackground[] = {0, 0, 0, 1};
    soundSelect[] = {"", 0.1, 1};
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    class ListScrollBar {
        color[] = {1, 1, 1, 0.6};
        colorActive[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
    style = 528;
    font = "TahomaB";
    sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 50) * 1)";
    shadow = 0;
    colorShadow[] = {0, 0, 0, 0.5};
    color[] = {1, 1, 1, 0.1};
    colorDisabled[] = {1, 1, 1, 0.25};
    period = 1.2;
    maxHistoryDelay = 99999999999999999;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};
class RscSpectFrame {
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = PRIMARYCOLOR;
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";

};
class RscSpectMapControl
{
    access = 0;
    alphaFadeEndScale = 2;
    alphaFadeStartScale = 2;
    colorBackground[] = {0.969,0.957,0.949,1};
    colorCountlines[] = {0.572,0.354,0.188,0.25};
    colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
    colorForest[] = {0.624,0.78,0.388,0.5};
    colorForestBorder[] = {0,0,0,0};
    colorGrid[] = {0.1,0.1,0.1,0.6};
    colorGridMap[] = {0.1,0.1,0.1,0.6};
    colorInactive[] = {1,1,1,0.5};
    colorLevels[] = {0.286,0.177,0.094,0.5};
    colorMainCountlines[] = {0.572,0.354,0.188,0.5};
    colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
    colorMainRoads[] = {0.9,0.5,0.3,1};
    colorMainRoadsFill[] = {1,0.6,0.4,1};
    colorNames[] = {0.1,0.1,0.1,0.9};
    colorOutside[] = {0,0,0,1};
    colorPowerLines[] = {0.1,0.1,0.1,1};
    colorRailWay[] = {0.8,0.2,0,1};
    colorRoads[] = {0.7,0.7,0.7,1};
    colorRoadsFill[] = {1,1,1,1};
    colorRocks[] = {0,0,0,0.3};
    colorRocksBorder[] = {0,0,0,0};
    colorSea[] = {0.467,0.631,0.851,0.5};
    colorText[] = {0,0,0,1};
    colorTracks[] = {0.84,0.76,0.65,0.15};
    colorTracksFill[] = {0.84,0.76,0.65,1};
    font = "TahomaB";
    fontGrid = "TahomaB";
    fontInfo = "PuristaMedium";
    fontLabel = "PuristaMedium";
    fontLevel = "TahomaB";
    fontNames = "PuristaLight";
    fontUnits = "TahomaB";
    h = "SafeZoneH - 1.5 *                  (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    idc = 51;
    maxSatelliteAlpha = 0.85;
    moveOnEdges = 1;
    ptsPerSquareCLn = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareObj = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 20;
    scaleDefault = 0.16;
    scaleMax = 1;
    scaleMin = 0.001;
    shadow = 0;
    showCountourInterval = 0;
    sizeEx = 0.04;
    sizeExGrid = 0.02;
    sizeExInfo = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    sizeExLabel = "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    sizeExLevel = 0.02;
    sizeExNames = "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
    sizeExUnits = "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    stickX[] = {0.2,["Gamma",1,1.5]};
    stickY[] = {0.2,["Gamma",1,1.5]};
    style = 48;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    type = 101;
    w = "SafeZoneWAbs";
    x = "SafeZoneXAbs";
    y = "SafeZoneY + 1.5 *                  (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    class Legend {
        colorBackground[] = {1, 1, 1, 0.5};
        color[] = {0, 0, 0, 1};
        x = "SafeZoneX +                    (           ((safezoneW / safezoneH) min 1.2) / 40)";
        y = "SafeZoneY + safezoneH - 4.5 *                  (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w = "10 *                   (           ((safezoneW / safezoneH) min 1.2) / 40)";
        h = "3.5 *                  (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font = "PuristaMedium";
        sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
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
        color[] = {0, 0, 0, 0};
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "";
    };
    class WaypointCompleted {
        color[] = {0, 0, 0, 0};
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "";
    };
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
class RscSpectPic
{
    idc = -1;
    type = 0;
    style = 48; //1 2 3...176
    tileH = 2; //Tile Picture height (style = 144)
    tileW = 5; //Tile Picture width (style = 144)
    x = 0.25;
    y = 0.25;
    h = 0.5;
    w = 0.5;
    font = "EtelkaNarrowMediumPro";
    sizeEx = 0.05;
    colorBackground[] = {1,1,1,1}; //white background
    colorText[] = {1,1,1,1}; //grey foreground
    text = "#(argb,8,8,3)color(0.918,0.655,0.141,1)";
    lineSpacing = 1; //required for multi-line style
};
class RscSpectButton {
    access = 0;
    borderSize = 0.001 * safezoneW;
    colorBorder[] = PRIMARYCOLOR;
    colorBackgroundActive[] = {0.314,0.314,0.314,1};
    colorBackgroundDisabled[] = BACKGROUND_COLOR;
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorFocused[] = BACKGROUND_COLOR;
    colorShadow[] = PRIMARYCOLOR;
    colorText[] = PRIMARYCOLOR;
    color[] = {1,1,1,1};
    colorBackground[] = BACKGROUND_COLOR;
    font = "PuristaLight";
    h = 0.039216;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 0;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscSpectButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscSpectButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscSpectButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscSpectButton\soundPush",0.09,1};
    style = 0x02 + 160;
    text = "";
    type = 1;
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
    tooltipColorShade[] = BACKGROUND_COLOR; // Tooltip background color
    tooltipColorText[] = PRIMARYCOLOR; // Tooltip text color
    tooltipColorBox[] = PRIMARYCOLOR; // Tooltip frame color
    w = 0.095589;
    x = 0;
    y = 0;
    };
    class RscSpectStructuredText {
    access = 0;
    h = 0.035;
    idc = -1;
    shadow = 1;
    color = "#EAA724";
    colorBackground[] = BACKGROUND_COLOR;
    size = "(           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 0;
    text = "";
    type = 13;
    w = 0.1;
    x = 0;
    y = 0;
};
class RscSpectIGUIBack {
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
class RscSpectText {
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
    font = "PuristaLight";
    SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
};
class RscSpectControlsGroup {
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
    class ListScrollBar  {
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


class RscSpectList
{
    access = 0;
    rowHeight = 0;
    rowWidth = 0;
    arrowEmpty = "";
    arrowFull = "";
    color[] = {1,1,1,1};
    colorActive[] = {1,0,0,0.8};
    colorBackground[] = {0,0,0,0};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {1,0,0,0};
    colorSelect[] = {1,1,1,0.8};
    colorSelectBackground[] = {1,1,1,0.7};
    colorText[] = {1,1,1,1};
    font = "TahomaB";
    h = 0.035;
    maxHistoryDelay = 1;
    shadow = 1;
    sizeEx = "(         (           (           ((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
  //  style = "0x10 + 0x200";
    type = 5;
     //   type = 5;
    style = 528;
    w = 0.12;
    wholeHeight = 0.45;
    x = 0;
    y = 0;
    class ListScrollBar
    {
        arrowEmpty = "";
        arrowFull = "";
        border = "";
        color[] = {1,1,1,0};
        colorActive[] = {1,1,1,0};
        colorDisabled[] = {1,1,1,0.1};
        shadow = 0;
        thumb = "";
    };
    autoScrollSpeed = 0;
    autoScrollDelay = 0;
    autoScrollRewind = 0;

};

class RscSpectCombo
{
    access = 0;
    arrowEmpty = "#(argb,8,8,3)color(0.918,0.655,0.141,1)";
    arrowFull = "#(argb,8,8,3)color(0.918,0.655,0.141,1)";
    color[] = PRIMARYCOLOR;
    colorActive[] = BACKGROUND_COLOR;
    colorBackground[] = BACKGROUND_COLOR;
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = BACKGROUND_COLOR;
    colorSelect[] = {1,1,1,1};
    colorSelectBackground[] = BACKGROUND_COLOR;
    colorText[] = PRIMARYCOLOR;
    font = "PuristaLight";
    h = 0.035;
    maxHistoryDelay = 1;
    shadow = 0;
    colorBorder[] = PRIMARYCOLOR;
    sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.0) / 1.0) / 25) * 1)";
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
    style = 0x02 + 160;
    type = 4;
    w = 0.12;
    wholeHeight = "5 * safezoneH";
    x = 0;
    y = 0;
    class ComboScrollBar
    {
        arrowEmpty = "";
        arrowFull = "";
        border = "";
        color[] = {1,1,1,0.0};
        colorActive[] = {1,1,1,0.0};
        colorDisabled[] = {1,1,1,0.0};
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    };

};

class f_spec_dialog {
	idd = 9228;
	movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
	fadein = 0;
	fadeout = 0;
    duration = 2147483647;
    onKeyDown = "[""KeyDown"",_this] call F_fnc_EventHandler";
    onKeyUp= "[""KeyUp"",_this] call F_fnc_EventHandler";
    onUnload = "[] spawn f_fnc_OnUnload";
	class controlsBackground {
		class mouseHandler: RscSpectControlsGroup {
            class ListScrollBar
            {
                color[] = {1,1,1,0.6};
                colorActive[] = {1,1,1,1};
                colorDisabled[] = {1,1,1,0.0};
                thumb = "";
                arrowFull = "";
                arrowEmpty = "";
                border = "";
            };
			onMouseButtonDown = "[""MouseButtonDown"",_this] call F_fnc_EventHandler";
			onMouseButtonUp = "[""MouseButtonUp"",_this] call F_fnc_EventHandler";
            onMouseZChanged = "[""MouseZChanged"",_this] call F_fnc_EventHandler";
            onMouseMoving = "['MouseMoving',_this] call F_fnc_EventHandler";
		    idc = 123;
            x = SafeZoneX; y = SafeZoneY;
            w = SafeZoneW; h = SafeZoneH;
		    colorBackground[] = {0.2, 0.0, 0.0, 0.0};
		};
        class OnEnterBox : RscSpectButton
        {
            idc = 4344;
            x = -0.1 * safezoneW + safezoneX;
            y = -0.1 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.2 * safezoneH;
        //    onMouseEnter = "[true] spawn f_fnc_showMenu;f_cam_menuShownTime=time;";
           // onMouseExit = "[false] spawn f_fnc_showMenu;";
            onMouseHolding = "f_cam_menuShownTime=time";
            onMouseMoving = "f_cam_menuShownTime=time";
            borderSize = 0;
            colorBorder[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            color[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
        };
        class Devider: RscSpectPic
        {
            idc = 4302;
            x = 0.00293747 * safezoneW + safezoneX;
            y = -0.00160002 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class SpectStrText: RscSpectStructuredText
        {
            idc = 1310;
            x = 0.341317 * safezoneW + safezoneX;
            y = 0.283882 * safezoneH + safezoneY;
            w = 0.317366 * safezoneW;
            h = 0.375858 * safezoneH;
            text = "";
           // text = "<br /> Use the mouse or the WASD to control the camera, H to show and close the help window.<br /> Press M for the map.<br /> ";
        };
        class SpecFrame: RscSpectFrame
        {
            idc = 1300;
            x = 0.341317 * safezoneW + safezoneX;
            y = 0.283882 * safezoneH + safezoneY;
            w = 0.317366 * safezoneW;
            h = 0.375858 * safezoneH;
           // text = "<br /> Use the mouse or the WASD to control the camera, H to show and close the help window.<br /> Press M for the map.<br /> ";
        };

	};
    class controls {
        class SpectButtonExit: RscSpectButton
        {
            idc = 1315;
            x = 0.6 * safezoneW + safezoneX;
            y = 0.609136 * safezoneH + safezoneY;
            w = 0.0352629 * safezoneW;
            h = 0.0287929 * safezoneH;
            text = "Okay";
            action = "ctrlShow [1315, !ctrlVisible 1315];ctrlShow [1310, !ctrlVisible 1310];ctrlShow [1300, !ctrlVisible 1300];";
        };
        class FilterAIButton: RscSpectButton
        {
            idc = 2111;
            x = 0.00046248 * safezoneW + safezoneX;
            y = -5.99921e-005 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.02 * safezoneH;
            text = "All units";
            tooltip = "Toggle AI";
            sizeEx = "(         (           (           ((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
            onButtonClick = "[_this select 0,0] call f_fnc_HandleMenu";
            onMouseHolding = "f_cam_menuShownTime=time";
            onMouseMoving = "f_cam_menuShownTime=time";

        };
        class SideFilterButton: RscSpectButton
        {
            idc = 2112;
            x = 0.0425375 * safezoneW + safezoneX;
            y = -5.99921e-005 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.02 * safezoneH;
            text = "All Sides";
            tooltip = "Filter by side";
            sizeEx = "(((((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
            onButtonClick = "[_this select 0,1] call f_fnc_HandleMenu";
            onMouseHolding = "f_cam_menuShownTime=time";
            onMouseMoving = "f_cam_menuShownTime=time";
        };
        class TagsNameButton: RscSpectButton
        {
            idc = 2113;
            x = 0.0846125 * safezoneW + safezoneX;
            y = -5.99921e-005 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.02 * safezoneH;
            text = "Tags";
            tooltip = "Toggle tags";
            sizeEx = "(((((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
            onButtonClick = "[_this select 0,2] call f_fnc_HandleMenu";
            onMouseHolding = "f_cam_menuShownTime=time";
            onMouseMoving = "f_cam_menuShownTime=time";
        };
        class FirstPersonButton: RscSpectButton
        {
            idc = 2114;
            x = 0.12679 * safezoneW + safezoneX;
            y = -5.99921e-005 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.02 * safezoneH;
            text = "First Person";
            tooltip = "Switch between First Person or Third person";
            sizeEx = "(((((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
            onButtonClick = "[_this select 0,3] call f_fnc_HandleMenu";
            onMouseHolding = "f_cam_menuShownTime=time";
            onMouseMoving = "f_cam_menuShownTime=time";
        };
        class SpecUnitBox: RscSpectList
        {
            idc = 2100;
            x = 0 * safezoneW + safezoneX;
            y = 0.03 * safezoneH + safezoneY;
            w = 0.1 * safezoneW;
            h = 0.9 * safezoneH;
            onLBSelChanged = "[""LBListSelChanged"",_this] call F_fnc_EventHandler";
        };
        class SpecModes: RscSpectCombo
        {
            idc = 2101;
            x = 0.178999 * safezoneW + safezoneX;
            y = -5.99921e-005 * safezoneH + safezoneY;
            w = 0.07 * safezoneW;
            h = 0.02 * safezoneH;
            sizeEx = "(((((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
            onLBSelChanged = "[""LBListSelChanged_modes"",_this] call F_fnc_EventHandler";
            onMouseHolding = "f_cam_menuShownTime=time";
            onMouseMoving = "f_cam_menuShownTime=time";
        };
        class SpecText: RscSpectText
        {
            idc = 1000;
            text = "Spectating:Unknown"; //--- ToDo: Localize;
            x = 0.430336 * safezoneW + safezoneX;
            y = 0.00159198 * safezoneH + safezoneY;
            w = 0.800 * safezoneW;
            h = 0.0200 * safezoneH;
        };
        class SpectMap : RscSpectMapControl
        {
            type = 100;
            idc = 1350;
            x = 0.00640556 * safezoneW + safezoneX;
            y = 0.772714 * safezoneH + safezoneY;
            w = 0.132213 * safezoneW;
            h = 0.21629 * safezoneH;
            onMouseZChanged = "[""MapZoom"",_this] call F_fnc_EventHandler;";
            onMouseButtonClick = "_this call F_fnc_OnMapClick";
            onDraw = "_this call F_fnc_DrawMarkers";
        };
        class FullSpectMap : RscSpectMapControl
        {
            idc = 1360;
            type = 100;
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
            onDraw = "_this call F_fnc_DrawMarkers";
            onMouseButtonClick = "_this call F_fnc_OnMapClick";

        };
    };
};
