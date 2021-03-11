// FA3 - Combat Life Saver Event Handler
// This component adds an event handler for use with the Combat Life Saver assignGear class. Units with the f3_cls trait can provide full heals using FAKs.
// Enable this component in init.sqf
// For credits and more information see https://github.com/folkarps/F3/wiki

// Make sure the player is initialised
if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

// Make sure the player can be broadcast properly
_unit = player;

// Add the EH
[_unit, ["HandleHeal", {
	_this spawn {
		params ["_injured", "_healer","_isMedic"];
			

		
			// Check whether the person healing the player is a CLS
			if (_healer getUnitTrait "f3_cls") then {
			
				// DEBUG
				if (f_param_debugMode == 1) then
					{
						player sideChat format ["DEBUG (f_clsEH.sqf): %1 is CLS healing %2",(name _healer),(name _injured)];
					};
					
				// Wait until the standard heal has been applied, or a timeout happens
				_timeout = (time + 20);
				waitUntil {(damage _injured <= 0.2501) or (time > _timeout)};

				// If it timed out, exit with nothing but a debug message
				if (time > _timeout) exitWith {
					if (f_param_debugMode == 1) then
						{
							player sideChat format ["DEBUG (f_clsEH.sqf): Heal on %1 timed out without completing",(name _injured)];
						};
				};
				
				// If the heal was successful, make it a full heal
				_injured setDamage 0;
				
				// DEBUG
				if (f_param_debugMode == 1) then
					{
						player sideChat format ["DEBUG (f_clsEH.sqf): %1 healed to %2 damage",(name _injured),(damage _injured)];
					};
			};
	};
// Upon initialising, the player broadcasts an instruction to all connected clients, including themselves, to add the EH on the broadcasting player.
// This instruction is added to the JIP queue, so any player joining in progress automatically receives the instructions from all existing players - and then broadcasts their own instruction.
}]] remoteExec ["addEventHandler",0,_unit];
