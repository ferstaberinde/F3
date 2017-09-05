//====================================================================================
//
//	f_nametagInitTalking.sqf - Places monitors on all players to check if they are
//								speaking.
//
//	Adapted from code by Killzone Kid, and from ACE3 code.
//	- http://killzonekid.com/arma-scripting-tutorials-whos-talking/
//	- https://github.com/acemod/ACE3
//
//	Code previously from CSE. Credit to commy2.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	CBA version, if CBA is present.
//------------------------------------------------------------------------------------

if F_NT_MOD_CBA then
{
	[{
		//	Change setting only if new isn't equal to old.
		private _old = player getVariable ["wh_nt_isSpeaking", false];
		private _new = (!(isNull findDisplay 55));
		
		//	Broadcast variable across server.
		if (!(_oldSetting isEqualTo _newSetting)) then 
		{ player setVariable ["wh_nt_isSpeaking", _newSetting, true] };
	} , 0.25, []] call CBA_fnc_addPerFrameHandler;
}

//------------------------------------------------------------------------------------
//	Scheduled version, if CBA is not present.
//------------------------------------------------------------------------------------

else
{
	F_NT_TALKING_LOOP = [] spawn
	{
		_delay = 0.25;
		F_NT_TALKING_LOOP_RUN = true;
		
		//	While the above variable is true, run the loop.
		while {F_NT_TALKING_LOOP_RUN} do
		{
			//	Change setting only if new isn't equal to old.
			private _old = player getVariable ["wh_nt_isSpeaking", false];
			private _new = (!(isNull findDisplay 55));
			
			//	Broadcast variable across server.
			if (!(_oldSetting isEqualTo _newSetting)) then 
			{ player setVariable ["wh_nt_isSpeaking", _newSetting, true] };
			
			//	...and then wait for the delay before doing it again.
			sleep _delay;
		};
	};
};