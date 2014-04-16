#include "f_JIP_common.h"

class KitPicker
{
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "if (isNil 'KitPickInit') then {call compile preprocessFileLineNumbers 'f\JIP\f_JIP_kitPicker.sqf'}; _this call KitPickInit;";

    class controlsBackground
    {
        class BG : CommonSettings
        {
            idc = -1;
            type = CT_STATIC;
            moving = 1;
            w = 0.4;
            h = 0.25;
            x = SafeZoneX + 0.2;
            y = SafeZoneY + 0.2;
        };
        class Prefix : CommonSettings
        {
            idc = -1;
            type = CT_STATIC;
            moving = 1;
            w = 0.2;
            h = 0.05;
            x = SafeZoneX + 0.2;
            y = SafeZoneY + 0.2;
            text = "Kit picker";
        };
    }

    class controls
    {
        class KitList : CommonSettings
        {
            idc = 1;
            type = CT_COMBO;
            x = SafeZoneX + 0.23;
            y = SafeZoneY + 0.26;
            w = 0.35;
            h = 0.035;
            wholeHeight = 0.45;

            colorBackground[] = {0.43, 0.39 ,0.32, 1};
            colorBorder[] = {0.43, 0.39 ,0.32, 1};
            colorText[] = {0.97, 0.78, 0.13, 1};
            colorSelect[] = {0.97, 0.78, 0.13, 1};
            colorSelectBackground[] = {0.62, 0.57, 0.49, 1};
            colorSelectBackground2[] = {0.62, 0.57, 0.49, 1};
            soundSelect[] = NOSOUND;
            soundExpand[] = NOSOUND;
            soundCollapse[] = NOSOUND;

            maxHistoryDelay = 1.0;
            class ComboScrollBar
            {
                color[] = {1, 1, 1, 0.6};
                colorActive[] = {1, 1, 1, 1};
                colorDisabled[] = {1, 1, 1, 0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			 arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";

            onLBSelChanged = "call KitPicker_OnSelChanged";
        };

/*
        class CancelButton : CommonSettings
        {
            idc = 2;
            type = CT_BUTTON;
            w = 0.2;
            h = 0.05;
            x = SafeZoneX + 0.23;
            y = SafeZoneY + 0.37;
            text = "Cancel";
        };
*/

        class AcceptButton : CommonSettings
        {
            idc = 3;
            type = CT_BUTTON;
            w = 0.2;
            h = 0.05;
            x = SafeZoneX + 0.23;
            y = SafeZoneY + 0.31;
            text = "Use this gear";
            action = "call KitPicker_Pick";
        };
    };
};

