//====================================================================================
//
//	fn_nametagResetFont.sqf - 	Interprets font sets into typefaces and weights.
//								Updates font size and spread depending on a dynamic 
//								spread coefficient and possible CBA setting alterations.
//						
//	> call f_fnc_nametagResetFont; <
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Interpret font presets and parse into primary and secondary typefaces and weights.
//------------------------------------------------------------------------------------

//	Spacing may very between fonts greatly. Etelka is especially broken.
//	Format: [Primary font, secondary font, spacing top, spacing bottom, shadow]
_fontData =
switch F_NT_FONT_FACE do
{
	case "Roboto": 		{["RobotoCondensedBold","RobotoCondensed",0.50,0.65,2]};
	case "RobotoLight": {["RobotoCondensed","RobotoCondensedLight",0.50,0.65,2]};
	case "Purista": 	{["PuristaBold","PuristaMedium",0.47,0.65,2]};
	case "PuristaLight":{["PuristaMedium","PuristaLight",0.47,0.65,2]};
	case "Etelka": 		{["EtelkaNarrowMediumPro","EtelkaNarrowMediumPro",0.4,0.7,2]};
	case "Tahoma": 		{["TahomaB","TahomaB",0.55,0.65,2]};
	default				{["RobotoCondensedBold","RobotoCondensed",0.50,0.65,2]};
};

F_NT_FONT_FACE_MAIN = (_fontData select 0);
F_NT_FONT_FACE_SEC  = (_fontData select 1);
F_NT_FONT_SHADOW	 = (_fontData select 4);


//------------------------------------------------------------------------------------
//	Interpret font color presets and parse accordingly.
//------------------------------------------------------------------------------------

//	Spacing may very between fonts greatly. Etelka is especially broken.
//	Format: [Main color, secondary color, crew color, same group team white color,
//			team red color, team green color, team blue color, team yellow color]
_colorData =
switch F_NT_FONT_COLOR do
{
	case "WHGreen": 		
	{[[0.68,0.90,0.36,0.85],[0.90,0.90,0.90,0.85],[0.95,0.80,0.10,0.85],
	[0.90,0.90,0.90,0.85],[0.90,0.25,0.25,0.85],[0.50,0.90,0.40,0.85],
	[0.45,0.45,0.90,0.85],[0.90,0.90,0.30,0.85]]};
	//case "UIColor": TODO: Implement
	//{[[(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0]),(profilenamespace getVariable ['IGUI_TEXT_RGB_G',0]),(profilenamespace getVariable ['IGUI_TEXT_RGB_B',0]),(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0])],[0.90,0.90,0.90,0.85],[0.95,0.80,0.10,0.85],
	//[0.90,0.90,0.90,0.85],[0.90,0.25,0.25,0.85],[0.50,0.90,0.40,0.85],
	//[0.45,0.45,0.90,0.85],[0.90,0.90,0.30,0.85]]};
	case "ACERust":
	{[[0.77, 0.51, 0.08, 0.95],[0.90,0.75,0,0.85],[0.77, 0.51, 0.08, 0.95],
	[1, 1, 1, 0.95],[1,0,0,0.95],[0,1,0,0.95],
	[0,0,1,0.95],[1,1,0,0.95]]};
	case "TMTMTeal":
	{[[0.35,0.80,0.90,0.85],[0.90,0.90,0.90,0.85],[0.15,0.70,0.90,0.85],
	[0.90,0.90,0.90,0.85],[0.90,0.25,0.25,0.85],[0.50,0.90,0.40,0.85],
	[0.45,0.45,0.90,0.85],[0.90,0.90,0.30,0.85]]};
	case "COALCrimson":
	{[[0.90,0.10,0.10,0.85],[0.80,0.78,0.78,0.85],[0.85,0.6,0.2,0.85],
	[0.90,0.90,0.90,0.85],[0.90,0.25,0.25,0.85],[0.50,0.90,0.40,0.85],
	[0.45,0.45,0.90,0.85],[0.90,0.90,0.30,0.85]]};
	case "FAWhite":
	{[[0.90,0.90,0.90,0.85],[0.90,0.90,0.90,0.85],[0.80,0.80,0.80,0.85],
	[0.90,0.90,0.90,0.85],[0.90,0.70,0.70,0.85],[0.70,0.90,0.70,0.85],
	[0.75,0.75,0.90,0.85],[0.80,0.80,0.55,0.85]]};
	case "STSand":
	{[[0.90,0.75,0,0.85],[0.90,0.90,0.90,0.85],[0.90,0.75,0,0.85],
	[0.90,0.90,0.90,0.85],[0.90,0.25,0.25,0.85],[0.50,0.90,0.40,0.85],
	[0.45,0.45,0.90,0.85],[0.90,0.90,0.30,0.85]]};
	case "BromaPurple":
	{[[0.85,0.50,0.90,0.85],[0.68,0.90,0.36,0.85],[0.85,0.50,0.90,0.85],
	[0.85,0.50,0.90,0.85],[0.90,0.4,0.4,0.85],[0.85,0.50,0.90,0.85],
	[0.6,0.6,0.90,0.85],[0.90,0.90,0.6,0.85]]};
	default
	{[[0.68,0.90,0.36,0.85],[0.90,0.90,0.90,0.85],[0.95,0.80,0.10,0.85],
	[0.90,0.90,0.90,0.85],[0.90,0.25,0.25,0.85],[0.50,0.90,0.40,0.85],
	[0.45,0.45,0.90,0.85],[0.90,0.90,0.30,0.85]]};
};

//	Distribute colors from data array to global color settings.
F_NT_FONT_COLOR_DEFAULT= (_colorData select 0);
F_NT_FONT_COLOR_OTHER	= (_colorData select 1);
F_NT_FONT_COLOR_CREW	= (_colorData select 2);

F_NT_FONT_COLOR_GROUP	= (_colorData select 3);
F_NT_FONT_COLOR_GROUPR = (_colorData select 4);
F_NT_FONT_COLOR_GROUPG = (_colorData select 5);
F_NT_FONT_COLOR_GROUPB = (_colorData select 6);
F_NT_FONT_COLOR_GROUPY = (_colorData select 7);


//------------------------------------------------------------------------------------
//	Update global font sizes.
//------------------------------------------------------------------------------------

F_NT_FONT_SIZE_MAIN = F_NT_FONT_SIZE_RAW  * F_NT_FONT_SIZE_MULTI;
F_NT_FONT_SIZE_SEC	 = F_NT_FONT_SIZE_MAIN * F_NT_FONT_SIZE_SEC_MULTI;


//------------------------------------------------------------------------------------
//	Update global font spread.
//------------------------------------------------------------------------------------

_spacingMultiplier = F_NT_FONT_SPREAD_MULTI * F_NT_FONT_SIZE_SEC;

//	Coefficients are used. Should be changed if you change the default font, probably.
_topMultiplier    = (_fontData select 2); // Default: (0.50)
_bottomMultiplier = (_fontData select 3); // Default: (0.65)

// Top and bottom are separate to avoid a wonky appearance.
F_NT_FONT_SPREAD_TOP_MULTI		= _spacingMultiplier * _topMultiplier;
F_NT_FONT_SPREAD_BOTTOM_MULTI	= _spacingMultiplier * _bottomMultiplier;
