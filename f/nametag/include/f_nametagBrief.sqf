//====================================================================================
//
//	f_nametagBrief.sqf - Gives non-CBA players options in briefing to config nametags.
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Construct a briefing depending on present settings.
//------------------------------------------------------------------------------------

[] spawn 
{
	waitUntil {scriptDone f_script_briefing};

	_bstr = format ["<font size='18'>F3 NAMETAGS</font><br/><br/>Toggle name tags for friendly units by pressing %1.<br/><br/>Name tags are displayed when aiming at individual units up to and above %4m away, and constantly for all units within %3m.<br/><br/>Note that using CBA will disable this menu and replace it with an enchanced one under ADDON OPTIONS.
	",F_NT_ACTIONKEY_KEYNAME, F_NT_ACTIONKEY_KEY,F_NT_DRAWDISTANCE_NEAR,F_NT_DRAWDISTANCE_CURSOR];

	if !F_NT_MOD_CBA then
	{
		_bstr = _bstr + "<br/><br/><execute expression=""
				if (F_NT_DRAWCURSORONLY) then [{hintsilent 'Nearby tags activated!';F_NT_DRAWCURSORONLY= false},{F_NT_DRAWCURSORONLY = true;hintsilent 'Nearby tags deactivated!'}];""
				>TOGGLE NEARBY TAGS</execute><br/>Constantly displays name tags for nearby units.";
				
		if !(isNil "F_NT_FONT_HEIGHT_ONHEAD") then 
		{
				_bstr = _bstr + "<br/><br/><execute expression=""
				if (F_NT_FONT_HEIGHT_ONHEAD) then [{hintsilent 'Tags will now display on unit body.';F_NT_FONT_HEIGHT_ONHEAD = false},{F_NT_FONT_HEIGHT_ONHEAD = true;hintsilent 'Tags will now display above unit head.'}];""
				>TOGGLE TAG POSITION</execute><br/>Whether tags are rendered on chest or above head.";
		};
		
		if !(isNil "F_NT_SHOW_ROLE") then 
		{
				_bstr = _bstr + "<br/><br/><execute expression=""
				if (F_NT_SHOW_ROLE) then [{hintsilent 'Role display deactivated!';F_NT_SHOW_ROLE = false},{F_NT_SHOW_ROLE = true;hintsilent 'Role display activated!'}];""
				>TOGGLE ROLE DISPLAY</execute><br/>Displays the unit's role above their name.";
		};
		
		if !(isNil "F_NT_SHOW_GROUP") then 
		{
				_bstr = _bstr + "<br/><br/><execute expression=""
				if (F_NT_SHOW_GROUP) then [{hintsilent 'Group display deactivated!';F_NT_SHOW_GROUP = false},{F_NT_SHOW_GROUP = true;hintsilent 'Group display activated!'}];""
				>TOGGLE GROUP DISPLAY</execute><br/>Displays the group name below a unit's name.";
		};

		if !(isNil "F_NT_SHOW_VEHICLEINFO") then 
		{
				_bstr = _bstr + "<br/><br/><execute expression=""
				if (F_NT_SHOW_VEHICLEINFO) then [{hintsilent 'Vehicle type display deactivated!';F_NT_SHOW_VEHICLEINFO= false},{F_NT_SHOW_VEHICLEINFO = true;hintsilent 'Vehicle type display activated!'}];"">TOGGLE VEHICLE TYPE DISPLAY</execute><br/>Displays the vehicle type with the commander's name. Requires role display.";
		};

		//_bstr = _bstr + "<br/><br/><font size='18'>COLORS</font><br/>
		//<font color='#FFFFFF'>Friendly</font><br/>
		//<font color='#7FFFD4'>Fireteam</font><br/>
		//<font color='#FF143C'>Vehicle Crew</font>";

		
	};
	
	//	Add brief to map screen.
	player createDiaryRecord ["Diary", ["F3 Nametags (Options)",_bstr]];
};
