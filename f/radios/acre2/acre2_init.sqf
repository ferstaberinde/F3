// F3 - ACRE2 Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

private ["_presetSetup"];

// precompile functions
f_acre2_presetSetup = compile preprocessFileLineNumbers "f\radios\acre2\acre2_setupPresets.sqf";
f_acre2_clientInit = compile preprocessFileLineNumbers "f\radios\acre2\acre2_clientInit.sqf";
f_fnc_GiveSideRadio = compile preprocessFileLineNumbers "f\radios\acre2\fn_giveSideRadio.sqf";

f_radios_acre2_giveRadioAction = {
	private["_x"];
	_x = _this;
	_unit = player;
		//Give the player a message so it isn't forgotten about during the briefing.
	[_x] spawn {
		waitUntil{time>3};
		systemChat format["[F3 ACRE2] Warning: No room to add radio '%1', report this to the mission maker. You now have a scroll-wheel action to get this radio.",_this select 0];
	};

	//Create addAction to give radio.
	_radioName = getText (configfile >> "CfgWeapons" >> _x >> "displayName");
	_actionID = _unit addAction [format ["<t color='#3375D6'>[Radios] Give myself a %1 radio</t>",_radioName],
		 {
			 _radioToGive = (_this select 3) select 0;
			 _unit = (_this select 0),
			 if (_unit canAdd _radioToGive) then {
				_unit addItem _radioToGive;
				_unit removeAction (_this select 2);
			 } else {
				 systemChat format["[F3 ACRE2] Warning: No room to add radio '%1', remove more stuff and try again",_radioToGive];
			 };
		 }
		 ,[_x],0,false,false,"","(_target == _this)"];
	[_actionID,_unit] spawn {
		sleep 300;
		if (!isNull (_this select 1)) then {
			(_this select 1) removeAction (_this select 0);
		};
	};
};


// jip check
if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

// include the smaller acre2 settings file.
#include "acre2_settings.sqf"


// setup presets
_presetSetup = [] call f_acre2_presetSetup;


// run client stuff.
if (hasInterface) then
{
	// define our languages (need to be the same order for everyone)
	{
		_x call acre_api_fnc_babelAddLanguageType;
	} foreach f_radios_settings_acre2_languages;
	[] call f_acre2_clientInit;
};