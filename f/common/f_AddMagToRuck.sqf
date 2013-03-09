// F2A2 - f_AddMagToRuck
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// arguments: [_unit, _mag, _count] (_count is optional )
// example usage: [player, "SmokeShell", 6] spawn f_AddMagToRuck;

// requires the following two lines in the INIT.SQF or some other appropriate location
// cfgACE_IsEnabled = isClass (configFile >> "CfgPatches" >> "ace_version");
// f_AddMagToRuck = compile preprocessFileLineNumbers "f\common\f_AddMagToRuck.sqf";

private ["_unit", "_mag", "_count", "_magazine", "_success", "_ErrorReport", "_confSize"];

#define __CONF_MAGAZINES configFile >> "CfgMagazines"
#define __CONF_WEAPONS configFile >> "CfgWeapons"

If (!cfgACE_IsEnabled) ExitWith {diag_log "F2 WARNING: RuckFunctions Disabled. ACE Mod does not appear to be activated."}; 

_unit = _this select 0;
_magazine = _this select 1;
_count = 1; // Default Count
_success = false; // Initialize with false

If (count _this > 2)  then {
_count = _this select 2;
};

	// Do we have a ruck.
	if ( _unit call ace_sys_ruck_fnc_HasRuck ) then {
	
			//if yes we have a ruck then use the ACE API to add the item and return and result if it fits or not. 
			_success = [_unit, _magazine, _count] call ACE_fnc_PackMagazine;
			
			// DEBUG
			if (f_var_debugMode == 1) then
			{
				_ErrorReport = Format ["F2 Debug - unit: %1 Count: %2 Magazine: %3 CanFit: %4", _unit, _count,_magazine, _success];
				diag_log _ErrorReport;
				player sideChat _ErrorReport;
			};

			// If No Success
			If (!_success) then {
				_confSize = __CONF_MAGAZINES >> _magazine >> "ACE_Size";
				_ErrorReport = format ["F2 Config Error: Attempt to overfill %1's rucksack with %2 of type %3, size %4. CONTACT Mission Maker.", _unit, _count, _magazine, (getNumber(_confSize) * _count)];
				diag_log _ErrorReport;
				Hint _ErrorReport;
			};
		 
   } else {
   		_ErrorReport = format ["F2 Config Error: No rusksack available for %1 at this time. Attempted to add %2 of type %3. CONTACT Mission Maker.",_unit,  _count, _magazine];
		diag_log _ErrorReport;
		Hint _ErrorReport;
   };
 _success
	
	
