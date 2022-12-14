// FA3 - Skulls module
// Credits and documentation: https://github.com/folkarps/F3/wiki
// This component initialises various special effects if they're turned on by a mission parameter.
// ====================================================================================

// Grunt Birthday Party - yaaaayyyy!
if (f_param_gruntBirthdayParty > 0) then {
	f_var_gruntBirthdayPartyEH = addMissionEventHandler ["EntityKilled",{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (_unit isKindOf "CAManBase") then {
			// If running in Players Only mode and this isn't a player, do nothing.
			if (!(isPlayer [_unit]) && (f_param_gruntBirthdayParty == 1)) exitWith {};
			[_unit] spawn f_fnc_gruntBirthdayParty;
		};
	}];
};
