//=======================================================================================
//
//	f_nametagConfig.sqf - Contains configurable values for WH nametags.
//
//	Note:	If CBA is enabled, many of these settings (DRAWCURSORONLY, for instance) can
//		 	be altered by individual clients to their preference. 
//
//	@ /u/Whalen207 | Whale #5963
//
//=======================================================================================

//---------------------------------------------------------------------------------------
//	Configuration Values. Feel free to modify.
//---------------------------------------------------------------------------------------

//	Main Values																	(Default values)
F_NT_DRAWCURSORONLY = false;	//	Only draw nametags on mouse cursor. 		(Default: false)
								//	Can save FPS in crowded areas.
								//	Clients can change with CBA settings menu.
								
F_NT_ACTIONKEY = "timeInc"; 	//	Key that can be pressed to toggle tags.		("timeInc")
								//	Default is "timeInc", which is normally
								//	the (=) key. Other keys available here:
								//	https://community.bistudio.com/wiki/inputAction/actions/bindings
								//	Don't want any key? Comment out the line.
								
F_NT_NIGHT = true;				//	Whether night will affect tag visibility.	(true)

//	Information Shown
F_NT_SHOW_GROUP 		= true;	//	Show group name under unit's name. 			(true)
F_NT_SHOW_ROLE			= false;//	Show unit's role (rifleman, driver). 		(true)
F_NT_SHOW_VEHICLEINFO 	= true;	//	Show vehicle info. Requires SHOW_ROLE.		(true)

//	Draw Distances
F_NT_DRAWDISTANCE_CURSOR = 20; 	//	Distance to draw nametags when pointing at a unit.	(20)
								//	Should be greater than DISTANCE_ALL.
								//	Can be altered significantly depending on player FOV.
F_NT_DRAWDISTANCE_NEAR = 10; 	//	Distance within which all nametags will be drawn.	(10)
								//	Increasing this will cost performance.
								//	Due to a bug this will seem ~3m shorter in third person.
								//	If you want to truly disable non-cursor tags, set this to 0.
//	Font Fade
F_NT_FADETIME = 1;				//	Fade time for cursor tags after player mouses away.	(1)

//	Text Configuration: Typeface
//	To manually alter these options, see functions\nametagResetFont.sqf.		
//	Options:
//	- "Roboto" (DEFAULT)
//	- "RobotoLight"
//	- "Purista"
//	- "PuristaLight"
//	- "Etelka"
//	- "Tahoma"
F_NT_FONT_FACE = "Roboto";			//	Typeface set for nametag system.			("Roboto")

//	Text Configuration: Size
F_NT_FONT_SIZE_RAW = 0.036;			//	Default raw font size.						(0.036)
									//	Used directly for names, and used with
									//	below modifiers for all else.
F_NT_FONT_SIZE_SEC_MULTI =	0.861;	//	Multiplier for group and role tags.			(0.861)
F_NT_FONT_SIZE_MULTI = 1;			//	A general multiplier that can be used		(1)
									//	if you don't like the other ones.
									//	Multipliers may be overriden by CBA settings.
//	Text Configuration: Spacing
F_NT_FONT_SPREAD_MULTI = 1;			//	Multiplier for vertical font spacing.		(1)
									//	may be overriden by CBA settings.
								
//	Text Configuration: Color
//	To manually alter these options, see functions\nametagResetFont.sqf.
//	Options:
//	- WHGreen
//	- ACERust
//	- TMTMTeal
//	- COALCrimson
//	- FAWhite
//	- STSand
//	- BromaPurple
F_NT_FONT_COLOR = "WHGreen";		//	Font color set for nametag system.			("WHGreen")

//	Text Configuration: Position
F_NT_FONT_HEIGHT_ONHEAD = true;		//	Attaches nametags to head (like ACE)		(false)
