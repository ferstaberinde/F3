// F3 - Safe Start, Safety Toggle
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

//Exit if server
if(isDedicated) exitwith {};

switch (_this) do
{
	//Turn safety on
	case true:
	{
		// Delete bullets from fired weapons
		f_eh_safetyMan = player addEventHandler["Fired", {deletevehicle (_this select 6);}];

		// Disable guns for vehicles if player is in one
		if (vehicle player != player) then {
			player setVariable ["f_var_safetyVeh",vehicle player];
			f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
		};

		//Make playable units invincible, clientside
		{
			_x allowdamage false;
		} foreach playableunits;
	};

	//Turn safety off
	case false:
	{
		//Allow player to fire weapons
		player removeeventhandler ["Fired", f_eh_safetyMan];

		// Re-enable guns for vehicle if it was disabled
		if !(isNull(player getVariable ["f_var_safetyVeh",objNull])) then {
			(player getVariable "f_var_safetyVeh") removeeventhandler ["Fired", f_eh_safetyVeh];
			(player setVariable ["f_var_safetyVeh",objNull]);
		};

		//Make playable units vulnerable, clientside
		{
			_x allowdamage true;
		} foreach playableunits;
	};
};
