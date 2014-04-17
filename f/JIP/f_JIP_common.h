#ifndef COMMON_H
#define COMMON_H

#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_COMBO 4
#define NOSOUND {"", 0, 1}

class CommonSettings
{
    sizeEx = 0.03921;
    colorText[] = {0.97, 0.78,0.13, 1};
    colorFocused[] = {0.97, 0.78,0.13, 1};
    colorBackground[] = {0.25, 0.23, 0.20, 1};
    colorBackgroundActive[] = {0.27, 0.25, 0.25, 1};
    colorBackgroundFocused[] = {0.27, 0.25, 0.25, 1};
    colorBackgroundDisabled[] = {0.15, 0.15, 0.15, 1};
    colorDisabled[] = {0.25, 0.23, 0.20, 1};
    colorShadow[] = {0,0,0,1};
    colorBorder[] = {0,0,0,1};
    borderSize = 0;
	font = "PuristaLight";
    style = 0;
    x = SafeZoneX;
    y = SafeZoneY;
    w = 0.1;
    h = 0.1;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    soundEnter[] = NOSOUND;
    soundPush[] = NOSOUND;
    soundClick[] = NOSOUND;
    soundEscape[] = NOSOUND;
    text = "";
};

#endif
