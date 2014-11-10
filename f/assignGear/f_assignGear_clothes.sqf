// F3 - F3 Folk ARPS Assign Gear
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Prevent BIS Randomisation System
// BIS created a system for randomisation unit loadouts, that may overwrite the changes made by this script, this will fix such system.

_unit setVariable ["BIS_enableRandomization", false];

// ====================================================================================

// lets strip him down to the basic
removeUniform _unit;
removeHeadgear _unit;
removeVest _unit;

// Assign default clothes
_uniform = _baseUniform;
_helmet = _baseHelmet;
_rig = _mediumRig;
_glasses = _baseGlasses;

// Flip through unit to assign specialized uniforms

// Light
if (_typeOfUnit in _light) then {
	_rig = _lightRig;
};

// Heavy
if (_typeOfUnit in _heavy) then {
	_rig = _heavyRig;
};

// Pilot
if (_typeOfUnit in _pilot) then {
	_helmet = _pilotHelmet;
	_uniform = _pilotUniform;
	_rig = _pilotRig;
	_glasses = _pilotGlasses
};

// Crew
if (_typeOfUnit in _crew) then {
	_helmet = _crewHelmet;
	_uniform = _crewUniform;
	_rig = _crewRig;
	_glasses = _crewGlasses;
};

// Diver
if (_typeOfUnit in _diver) then {
	_helmet = _diverHelmet;
	_uniform = _diverUniform;
	_rig = _diverRig;
	_glasses = _diverGlasses;
};

// Ghillie
if (_typeOfUnit in _ghillie) then {
	_helmet = _ghillieHelmet;
	_uniform = _ghillieUniform;
	_rig = _ghillieRig;
	_glasses = _ghillieGlasses;
};

// Spec Op
if (_typeOfUnit in _specOp) then {
	_helmet = _sfHelmet;
	_uniform = _sfUniform;
	_rig = _sfRig;
	_glasses = _sfGlasses;
};

// Add clothing items to unit
if(count _uniform > 0) then
{
	_unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
};

if(count _helmet > 0) then
{
	_unit addHeadgear (_helmet call BIS_fnc_selectRandom);
};

if(count _rig > 0) then
{
	_unit addVest (_rig call BIS_fnc_selectRandom);
};

if(count _glasses > 0) then
{
	_unit addGoggles (_glasses call BIS_fnc_selectRandom);
};
