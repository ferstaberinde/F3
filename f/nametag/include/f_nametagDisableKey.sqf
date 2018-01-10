//====================================================================================
//
//	f_nametagDisableKey.sqf - Sets up a key that can be used to flip the nametag
//							   system on and off with a press.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Setup the Action Key, default '='.
//------------------------------------------------------------------------------------

//	None of this will execute if the actionkey line in CONFIG is commented out.
if (!isNil "F_NT_ACTIONKEY") then
{
	F_NT_ACTIONKEY_KEYS = actionKeys F_NT_ACTIONKEY;// This key, a global variable.
	F_NT_ACTIONKEY_KEYNAMES = actionKeysNames F_NT_ACTIONKEY;	// Which is named this...
	
	//	Function that will determine when the disableKey is depressed.
	F_NT_KEYDOWN = 
	{
		private _key = _this select 1;
		private _handled = false;
		if(_key in F_NT_ACTIONKEY_KEYS) then
		{
			F_NT_NAMETAGS_ON = !F_NT_NAMETAGS_ON;
			_handled = true;
		};
		_handled;
	};

	//	Function that will determine when the disableKey is released.
	F_NT_KEYUP = 
	{
		private _key = _this select 1;
		private _handled = false;
		if(_key in F_NT_ACTIONKEY_KEYS) then
		{
			_handled = true;
		};
		_handled;
	};
	
	//	Add eventhandlers (functions above).
	(findDisplay 46) displayAddEventHandler   ["keydown", "_this call F_NT_KEYDOWN"];
	(findDisplay 46) displayAddEventHandler   ["keyup", "_this call F_NT_KEYUP"];
};
