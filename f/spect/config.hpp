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
class SpectMapControl
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
    fontNames = "EtelkaNarrowMediumPro";
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
  class RscButton {
    access = 0;
    borderSize = 0;
    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
    colorBorder[] = {0,0,0,1};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
    colorShadow[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    h = 0.039216;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    offsetX = 0.003;
    offsetY = 0.003;
    shadow = 2;
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
  class spect_RscStructuredText {
    access = 0;
    colorText[] = {1,1,1,1};
    h = 0.035;
    idc = -1;
    shadow = 1;
    size = "(           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 0;
    text = "";
    type = 13;
    w = 0.1;
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
    class ListScrollBar
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
    autoScrollSpeed = 0;
    autoScrollDelay = 0;
    autoScrollRewind = 0;

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
    class ComboScrollBar
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
        class SpecWindow: spect_IGUIBack
        {
            idc = 2500;
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = safezoneW;
            h = safezoneH/20;
        };
        class SpectFrame: spect_RscFrame
        {
            idc = 1300;
            x = 0.332501 * safezoneW + safezoneX;
            y = 0.265089 * safezoneH + safezoneY;
            w = 0.334998 * safezoneW;
            h = 0.432237 * safezoneH;
        };
        class SpectGround: spect_IGUIBack
        {
            idc = 1305;
            x = 0.332501 * safezoneW + safezoneX;
            y = 0.265089 * safezoneH + safezoneY;
            w = 0.334998 * safezoneW;
            h = 0.432237 * safezoneH;
        };
		class mouseHandler: spect_RscControlsGroup {
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
            action = "ctrlShow [2100, !ctrlVisible 2100]";
        };
        class SpecUnitBox: spect_RscList
        {
            idc = 2100;
            x = 0.00640556 * safezoneW + safezoneX;
            y = 0.0310000 * safezoneH + safezoneY;
            w = 0.100 * safezoneW;
            h = 0.3 * safezoneH;
            onLBSelChanged = "[""LBListSelChanged"",_this] call F_fnc_EventHandler";
        };
        class SpecModes: spect_RscCombo
        {
            idc = 2101;
            x = 0.883417 * safezoneW + safezoneX;
            y = 0.0109959 * safezoneH + safezoneY;
            w = 0.100 * safezoneW;
            h = 0.0200 * safezoneH;
            onLBSelChanged = "[""LBListSelChanged_modes"",_this] call F_fnc_EventHandler";
        };
        class SpecText: spect_RscText
        {
            idc = 1000;
            text = "Spectating:Unknown"; //--- ToDo: Localize;
            x = 0.460336 * safezoneW + safezoneX;
            y = 0.00159198 * safezoneH + safezoneY;
            w = 0.800 * safezoneW;
            h = 0.0200 * safezoneH;
        };
        class SpectStrText: spect_RscStructuredText
        {
            idc = 1310;
            x = 0.341317 * safezoneW + safezoneX;
            y = 0.283882 * safezoneH + safezoneY;
            w = 0.317366 * safezoneW;
            h = 0.375858 * safezoneH;
            text = "";
           // text = "<br /> Use the mouse or the WASD to control the camera, H to show and close the help window.<br /> Press M for the map.<br /> ";
        };
        class SpectButtonExit: RscButton
        {
            idc = 1315;
            x = 0.62342 * safezoneW + safezoneX;
            y = 0.609136 * safezoneH + safezoneY;
            w = 0.0352629 * safezoneW;
            h = 0.0287929 * safezoneH;
            text = "Okay";
            action = "ctrlShow [1315, !ctrlVisible 1315];ctrlShow [1310, !ctrlVisible 1310];ctrlShow [1300, !ctrlVisible 1300];ctrlShow [1305, !ctrlVisible 1305]";
        };
        class SpectMap : SpectMapControl
        {
            idc = 1350;
            x = 0.00640556 * safezoneW + safezoneX;
            y = 0.772714 * safezoneH + safezoneY;
            w = 0.132213 * safezoneW;
            h = 0.21629 * safezoneH;
            onMouseZChanged = "[""MapZoom"",_this] call F_fnc_EventHandler;";
        };
        class FullSpectMap : SpectMapControl
        {
            idc = 1360;
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 1 * safezoneH;
            
        };
    };
};
