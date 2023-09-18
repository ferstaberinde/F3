// F3 - F3 Folk ARPS Assign Gear
// Credits and documentation: https://github.com/folkarps/F3/wiki
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
_helmet  = _baseHelmet;
_glasses = _baseGlasses;

_rig = _standardRig;

// Uncomment this block if you are adding an alternate loadout. See relevant block in description.ext for more info.
// Select the default rig
// _rig = switch (f_param_loadouts) do {
//		case 0:{_lightRig};
//		case 1:{_standardRig};
//		default{_standardRig};
// };

// Flip through unit to assign specialized uniforms

// Pilot
if (_typeOfUnit in _pilot) then {
	_helmet  = _pilotHelmet;
	_uniform = _pilotUniform;
	_rig     = _pilotRig;
	_glasses = _pilotGlasses;
	_nvg     = _nvgPilot;
};

// Jet Pilot
if (_typeOfUnit in _jet) then {
	_helmet  = _jetHelmet;
	_uniform = _jetUniform;
	_rig     = _jetRig;
	_glasses = _jetGlasses;
	_nvg     = ""; //Do not assign NVG, otherwise the jet helmet gets removed.
};

// Crew
if (_typeOfUnit in _crew) then {
	_helmet  = _crewHelmet;
	_uniform = _crewUniform;
	_rig     = _crewRig;
	_glasses = _crewGlasses;
};

// Diver
if (_typeOfUnit in _diver) then {
	_helmet  = _diverHelmet;
	_uniform = _diverUniform;
	_rig     = _diverRig;
	_glasses = _diverGlasses;
};

// Ghillie
if (_typeOfUnit in _ghillie) then {
	_helmet  = _ghillieHelmet;
	_uniform = _ghillieUniform;
	_rig     = _ghillieRig;
	_glasses = _ghillieGlasses;
};

// Spec Op
if (_typeOfUnit in _specOp) then {
	_helmet  = _sfHelmet;
	_uniform = _sfUniform;
	_rig     = _sfRig;
	_glasses = _sfGlasses;
};

// VIP/Officer
if (_typeOfUnit in _vip) then {
	_helmet  = _vipHelmet;
	_uniform = _vipUniform;
	_rig     = _vipRig;
	_glasses = _vipGlasses;
};

// Add clothing items to unit
if(count _uniform > 0) then
{
	_unit forceAddUniform (selectRandom _uniform);
};

if(count _helmet > 0) then
{
	_unit addHeadgear (selectRandom _helmet);
};

if(count _rig > 0) then
{
	_unit addVest (selectRandom _rig);
};

if(count _glasses > 0 && {!(goggles _unit in _glasses)}) then 
{
	removeGoggles _unit;
	_unit addGoggles (selectRandom _glasses);
};
