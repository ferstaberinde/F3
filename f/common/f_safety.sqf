// F3 - Safe Start, Safety Toggle
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

//Exit if server
if(isDedicated) exitwith {};

_switch = _this select 0;
switch (_switch) do
{
	//Turn safety on
	case true:
	{
		//Delete bullets from fired weapons
		f_safety = player addEventHandler["Fired", {deletevehicle (_this select 6);}];
		
		//Make playable units invincible, clientside
		{
			_x allowdamage false;
		} foreach playableunits;
	};
	
	//Turn safety off
	case false:
	{
		//Allow player to fire weapons
		player removeeventhandler ["Fired", f_safety];
		
		//Make playable units vulnerable, clientside
		{
			_x allowdamage true;
		} foreach playableunits;
	};
};
