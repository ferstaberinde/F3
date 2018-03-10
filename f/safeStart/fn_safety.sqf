// F3 - Safe Start, Safety Toggle
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

//Exit if server
if(isDedicated) exitwith {};

params [["_enableSafeStart", true, [true]]];

switch (_enableSafeStart) do
{
	//Turn safety on
	case true:
	{
		// Disable damage for vehicles if player is crewing a vehicle
		if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then {
			player setVariable ["f_var_safetyVeh",vehicle player];
			(player getVariable "f_var_safetyVeh") allowDamage false;
		};

		// Make player invincible
		player allowDamage false;
	};

	//Turn safety off
	case false;
	default {
		// Re-enable damage for vehicles if it was disabled
		if !(isNull(player getVariable ["f_var_safetyVeh",objnull])) then {
			(player getVariable "f_var_safetyVeh") allowDamage true;
			player setVariable ["f_var_safetyVeh",nil];
		};

		// Make player vulnerable
		player allowDamage true;
	};
};
