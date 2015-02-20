class f_rest_overlay
{
	class RscPicture;
	idd = -1;
	enableSimulation = 1;
	movingEnable = false;
	enableDisplay = 1;
	fadein = 0;
	fadeout = 0;
	duration = 939139414;
	onLoad = "uiNamespace setVariable ['f_resting_overlay_id',_this select 0];";
	class controls
	{
		class f_rest_picture : RscPicture
		{
			idc = 3883;
			type = 0;
			style = 48;
			shadow = 0;
			color[]={1,1,1,1};
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			text = "f\swr\weapon.paa";
			font = "PuristaMedium";
			sizeEx = 0;
			lineSpacing = 0;
			fixedWidth = 0;
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.088 * safezoneH;
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
		};
	};
};