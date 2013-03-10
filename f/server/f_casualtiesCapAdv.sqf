// F3 - Casualties Cap (Advanced)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if (isServer) then {

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grps","_pc","_end","_started","_remaining","_counter","_grpsno","_grpsel","_grpstemp","_alive"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_grpstemp = _this select 0;
_pc = _this select 1;
_started = 0;

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
// the cap has been reached, the ending specified in _end will be triggered, using the
// Multiplayer Ending Controller component.

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
