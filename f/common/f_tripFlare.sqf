// F3 - Trip Flare
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_pos","_light","_pos","_ranNum","_cnt","_flare", "_smokeFX","_trg0","_trg0_units","_str_trg0_units","_trg1","_trg1_units","_str_trg1_units"];

// ====================================================================================

// SET KEY VARIABLES

_units = _this select 0;
_pos = [(getPos (_units select 0) select 0), (getPos (_units select 0) select 1), 0];
_cnt = 35;

// ====================================================================================

// CREATE TRIGGER TO COLLECT LOCAL AI
// This dynamically created trigger allows us to build arrays containing all men and 
// vehicles etc. which are nearby. We then exclude non-local units and units from the
// same side as the triggering unit.

_trg0 = createTrigger ["EmptyDetector", _pos];
_trg0 setTriggerActivation ["ANY", "PRESENT", true];
_trg0 setTriggerArea [300, 300, 0, false];
_trg0 setTriggerStatements ["this", "", ""];
sleep 1;
_trg0_units = [];
{if (_x isKindOf "CAManBase" || _x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Ship") then {_trg0_units = _trg0_units + [_x]}} forEach list _trg0;
{if ((!local _x) || (player == _x)) then {_trg0_units = _trg0_units - [_x]}} forEach _trg0_units;
{if ((side _x) == (side (_units select 0))) then {_trg0_units = _trg0_units - [_x]}} forEach _trg0_units;

// DEBUG
if (f_var_debugMode == 1) then
{
	_str_trg0_units = str _trg0_units;
	player sideChat format ["DEBUG (f\common\f_tripFlare.sqf): _trg0_units = %1",_str_trg0_units];
};

// ====================================================================================

// CREATE TRIGGER TO COLLECT UNITS IN FLARE LIGHT
// This dynamically created trigger allows us to build arrays containing all men and 
// vehicles etc. which are very close to the flare:

_trg1 = createTrigger ["EmptyDetector", _pos];
_trg1 setTriggerActivation ["ANY", "PRESENT", true];
_trg1 setTriggerArea [25, 25, 0, false];
_trg1 setTriggerStatements ["this", "", ""];
sleep 1;
_trg1_units = [];
{if (_x isKindOf "CAManBase" || _x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Ship") then {_trg1_units = _trg1_units + [_x]}} forEach list _trg1;

// DEBUG
if (f_var_debugMode == 1) then
{
	_str_trg1_units = str _trg1_units;
	player sideChat format ["DEBUG (f\common\f_tripFlare.sqf): _trg1_units = %1",_str_trg1_units];
};

// ====================================================================================

// REVEAL UNITS IN FLARE LIGHT
// The units in the flare light are revealed to nearby AI units that are local to the
// client and not on the same side as the triggering unit.

{
	private["_seer","_str_seer","_str_x","_knowledge","_str_knowledge"];
	_seer = _x;
	{
		_knowledge = (_seer knowsAbout _x);
		if (_knowledge < 1) then {
			_seer reveal _x;
		};
		
		// DEBUG
		if (f_var_debugMode == 1) then
		{
			_knowledge = (_seer knowsAbout _x);
			_str_seer = str _seer;
			_str_x = str _x;
			_str_knowledge = str _knowledge;
			player sideChat format ["DEBUG (f\common\f_tripFlare.sqf): %1 knowsAbout %2 = %3",_str_seer,_str_x,_str_knowledge];
		};
		
	} forEach _trg1_units;
	
} forEach _trg0_units;

// ====================================================================================

// CREATE FLARE
// The flare is composed of a new light source attached to a small can, to which smoke
// effects are also added.

_flare = "Can_small" createVehicleLocal _pos;
_light = "#lightpoint" createVehicleLocal _pos;
_light setLightBrightness 0.4;
_light setLightAmbient[0.25, 0.05, 0.0];
_light setLightColor[0.5, 0.1, 0.0];

_light lightAttachObject [_flare, [0,0,0]];
BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf"; 
_smokeFX = [_flare, 0.8, time, false, false] spawn BIS_Effects_Burn;

sleep 0.5;

// ====================================================================================

// SUSTAIN AND FLICKER FLARE
// We cause the light of the flare to flicker randomly during the burn time.

while {_cnt > 0} do
{
	_ranNum = (10 + (random (20))) / 100;
	_light setLightBrightness _ranNum;
	_cnt = _cnt - 0.1;
	
	sleep 0.1;
};

for [{_i=_ranNum}, {_i > 0}, {_i=_i-0.01}] do
{
	_light setLightBrightness _i;
	sleep 0.1;
};

// ====================================================================================

// DELETE FLARE
// Finally we delete the flare by deleting its components: the light and the can.

deleteVehicle _light;
deletevehicle _flare;

// ====================================================================================
