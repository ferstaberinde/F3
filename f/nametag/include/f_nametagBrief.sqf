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

	_bstr = format ["<font size='18'>FA NAMETAGS</font><br/><br/>Toggle name tags for friendly units by pressing %1.<br/><br/>Name tags are displayed when aiming at individual units up to and above %3m away, and constantly for all units within %2m.<br/><br/>Note that using CBA will disable this menu and replace it with an enchanced and expanded one under ADDON OPTIONS. Code contributed by Whale#5963.
	",F_NT_ACTIONKEY_KEYNAMES, F_NT_DRAWDISTANCE_NEAR,F_NT_DRAWDISTANCE_CURSOR];

	if !F_NT_MOD_CBA then
	{
		_bstr = _bstr + "<br/><br/>NEARBY TAGS?   ( <execute expression=""hintsilent 'Nearby tags activated!';F_NT_DRAWCURSORONLY=false;"">YES</execute> / <execute expression=""hintsilent 'Nearby tags deactivated.';F_NT_DRAWCURSORONLY=true;"">NO</execute> )
		<br/>Should nametags be shown for all units nearby, rather than just those under cursor?";
		
		_bstr = _bstr + "<br/><br/>SHOW GROUP? ( <execute expression=""hintsilent 'Tags will now display the unit group on mouseover.';
		F_NT_SHOW_GROUP = true;"">YES</execute> / <execute expression=""hintsilent 'Tags will no longer display group info on mouseover.';F_NT_SHOW_GROUP = false"">NO</execute> )
		<br/>Display the unit's group on mouseover?";
		
		_bstr = _bstr + "<br/><br/>FONT SIZE?   ( <execute expression=""hintsilent 'Nametag small size selected.';F_NT_FONT_SIZE_MULTI=0.8;call f_fnc_nametagResetFont;"">SMALL</execute> / <execute expression=""hintsilent 'Nametag default size selected.';F_NT_FONT_SIZE_MULTI=1.0;call f_fnc_nametagResetFont;"">MEDIUM</execute> / <execute expression=""hintsilent 'Nametag large size selected.';F_NT_FONT_SIZE_MULTI=1.2;call f_fnc_nametagResetFont;"">LARGE</execute>  )<br/>Font size of nametag text.";
	
	};
	
	//	Add brief to map screen.
	player createDiaryRecord ["Diary", ["FA Nametags (Options)",_bstr]];
};
