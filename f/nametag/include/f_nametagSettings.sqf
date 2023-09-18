//====================================================================================
//
//	f_nametagSettings.sqf - Contains optional CBA addon settings.
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//	Check if CBA is present.
if F_NT_MOD_CBA then
{
	//	Setting for disabling the entire system.
	[
		"F_NT_NAMETAGS_ON",		// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"F3 Nametag System", 		// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		true 						// Setting type-specific data.
	] call CBA_Settings_fnc_init;

	//	Setting for changing the typeface.
	[
		"F_NT_FONT_FACE",			// Internal setting name and value set.
		"LIST", 					// Setting type.
		"Font Face", 				// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		[
			[F_NT_FONT_FACE,"Roboto","RobotoLight","Purista","PuristaLight","Etelka","Tahoma"],
			["Default","Roboto (Bold) *","Roboto (Light)","Purista (Bold)","Purista (Light)","Etelka Narrow","Tahoma (Bold)"],
			0
		], 							// Setting type-specific data.
		nil,
		{ call f_fnc_nametagResetFont; }
									// Executed at mission start and every change.
	] call CBA_Settings_fnc_init;

	//	Setting for changing typeface color.
	[
		"F_NT_FONT_COLOR",			// Internal setting name and value set.
		"LIST", 					// Setting type.
		"Font Color", 				// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		[
			[F_NT_FONT_COLOR,"WHGreen","ACERust","TMTMTeal","COALCrimson","FAWhite","STSand","BromaPurple"],
			["Default","WH Green *","ACE Rust","TMTM Teal","COAL Crimson","FA White","ST Sand","BromA Purple"],
			0
		],							// Setting type-specific data.
		nil,
		{ call f_fnc_nametagResetFont; }
									// Executed at mission start and every change.
	] call CBA_Settings_fnc_init;

	//	Setting to dynamically alter font size.
	[
		"F_NT_FONT_SIZE_MULTI",	// Internal setting name and value set.
		"SLIDER", 					// Setting type.
		"Font Size", 				// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		[0.75, 1.25, 1, 2], 		// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ call f_fnc_nametagResetFont; }
									// Executed at mission start and every change.
	] call CBA_Settings_fnc_init;

	//	Setting to dynamically alter font spread.
	[
		"F_NT_FONT_SPREAD_MULTI",	// Internal setting name and value set.
		"SLIDER", 					// Setting type.
		"Font Spread", 				// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		[0.75, 1.25, 1, 2], 		// Setting type-specific data.
		nil, 						// Nil or 0 for changeable, 1 to reset to default, 2 to lock.
		{ call f_fnc_nametagResetFont; }
									// Executed at mission start and every change.
	] call CBA_Settings_fnc_init;

	//	Setting to flip drawcursoronly.
	[
		"F_NT_DRAWCURSORONLY",		// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Cursor Only (Saves FPS)",	// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		F_NT_DRAWCURSORONLY 		// Setting type-specific data.
	] call CBA_Settings_fnc_init;


	//	Option to not show group tags.
	[
		"F_NT_SHOW_GROUP",			// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Show Group Names",			// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		F_NT_SHOW_GROUP, 						// Setting type-specific data.
		nil, 						// Nil or 0 for changeable.
		{}
	] call CBA_Settings_fnc_init;

	//	Option to not show role tags.
	[
		"F_NT_SHOW_ROLE",			// Internal setting name and value set.
		"CHECKBOX", 				// Setting type.
		"Show Unit Roles",			// Name shown in menu.
		"F3 Nametags", 				// Category shown in menu.
		F_NT_SHOW_ROLE, 			// Setting type-specific data.
		nil, 						// Nil or 0 for changeable.
		{}
	] call CBA_Settings_fnc_init;

	//	Attaches nametags to player heads, like ACE.
	//	Missionmaker can change the default setting.
	[
	"F_NT_FONT_HEIGHT_ONHEAD",	// Internal setting name and value set.
	"CHECKBOX", 				// Setting type.
	"Show Above Head",			// Name shown in menu.
	"F3 Nametags", 				// Category shown in menu.
	F_NT_FONT_HEIGHT_ONHEAD 	// Setting type-specific data.
	] call CBA_Settings_fnc_init;
};