// F3 - Casualties Cap (Advanced)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if (isServer) then {

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grps","_pc","_end","_started","_remaining","_counter","_grpsno","_grpsel","_grpstemp","_alive","_faction","_temp_grp","_temp_grp2","_type","_onlyPlayers"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables.
// Up to 5 variables are passed to the script:
// 0: = Side (e.g. BLUFOR), or group name(s) as string array (e.g. ["mrGroup1","myGroup2"])
// 1: = What % of units must be dead before the ending is triggered
// 2: = If only groups with a playable leader slot will be included (uses 1 for 'true', 0 for 'false'; default is 1)
// 3: = What faction(s) to filter for if the first variable is a Side  (e.g. ["blu_f"])
// Note: the last two variables are optional, and may not be passed to the script.

_grpstemp = _this select 0; // either SIDE or array with group strings
_pc = _this select 1;

if(count _this >= 3) then
{
	_onlyPlayers = _this select 2; // should be true or false if not defined true is assumed
};

if(count _this >= 4) then
{
	_faction = _this select 3; // should be a array
};

_started = 0;

if(isnil "_onlyPlayers") then
{
	_onlyPlayers = 1;
};

// ====================================================================================

// Check if _grpstemp is a variable of type SIDE otherwise continue.
_type = typeName _grpstemp; // Grab the type name

if(_type == "SIDE") then // if the variable is any of the side variables use it to consturct a list of groups in that faction.
{
	_temp_grp = []; 
	{
		if(_onlyPlayers == 1) then
		{
			if((side _x == _grpstemp) && (leader _x in playableUnits)) then 
			{
				_temp_grp = _temp_grp + [_x]; // Add group to array

			};
		}
		else
		{
			if((side _x == _grpstemp)) then 
			{
				_temp_grp = _temp_grp + [_x]; // Add group to array
			}
		}
	
	} forEach allGroups;
	if(!isnil "_faction") then
	{
		_temp_grp2 = []; 
		{
			if(faction (leader _x) in _faction) then
			{
				_temp_grp2 = _temp_grp2 + [_x]; 
			};
		} forEach _temp_grp;
		_temp_grp = _temp_grp2;
	};
	_grpstemp = _temp_grp; // set it.
}
else
{
	sleep 1;
	_temp_grp = [];
	{
		_Tgrp = call compile format ["
			%1
		",_x];
		if(!isnil "_Tgrp") then
		{
			_temp_grp = _temp_grp + [_Tgrp];
		};
	} foreach _grpstemp;
	_grpstemp = _temp_grp;
	
};

// ====================================================================================
// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\server\f_casualtiesCapAdv.sqf): _grpstemp = %1",_grpstemp];
};

// ====================================================================================

// CLEAN OUT EMPTY GROUPS
// 10 seconds into the mission, we cycle through _grpstemp and only add valid groups 
// to _grps:

sleep 10;

_counter = 0;
_grpsno = count _grpstemp;
_grps = [];

while {_counter < _grpsno} do 
{
	_grpsel = _grpstemp select _counter;
	_alive = {alive _x} count (units _grpsel);
	if (_alive >= 1) then
		{
		_grps = (_grps + [_grpsel]);
		};
	_counter = (_counter + 1);
};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\server\f_casualtiesCapAdv.sqf): _grps = %1",_grps];
};

// ====================================================================================

// CREATE STARTING VALUES
// A count is made of units in the groups listed in _grps.

{_started = _started + (count (units _x))} forEach _grps;

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\server\f_casualtiesCapAdv.sqf): _started = %1",_started];
};

// ====================================================================================

// CHECK IF CASUALTIES CAP HAS BEEN REACHED OR EXCEEDED
// Every 6 seconds the server will check to see if the number of casualties sustained
// within the group(s) has reached the percentage specificed in the variable _pc. If
// the cap has been reached, your custom code (further down in this script) will be
// executed.

for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
{
	_remaining = 0;	
	_counter = 0;
	_grpsno = count _grps;
	while {_counter < _grpsno} do 
	{
		_grpsel = _grps select _counter;
		_alive = {alive _x} count (units _grpsel);
		_remaining = (_remaining  + _alive);
		_counter = (_counter + 1);
	};
	
// DEBUG
	if (f_var_debugMode == 1) then
	{
		player sideChat format ["DEBUG (f\server\f_casualtiesCapAdv.sqf): _remaining = %1",_remaining];
	};
	
	if (_remaining == 0) then 
	{
		_i=10001;
	};
	if (((_started - _remaining) / _started) >= (_pc / 100)) then 
	{	
		_i=10001;
	};
	sleep 6;	
};

// ====================================================================================

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat "DEBUG (f\server\f_casualtiesCapAdv.sqf): Custom commands activated.";
};

// ====================================================================================

// CUSTOM CODE
// Once the designated percentage of casualties has been reached, your custom code, 
// which is placed below, will be executed:


// Replace me with your custom code (remember to delete the "//" characters).
 

// ====================================================================================

// nothing happens if the script is executed on a client.
};
