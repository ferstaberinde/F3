// F3 - F3 Folk ARPS Assign Gear
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// lets strip him down to the basic
removeUniform _unit;
removeheadgear _unit;
removevest _unit;

// Assign default clothes
_uniform = _baseUniform;
_helmet = _baseHelmet;
_rig = _mediumRig;
_glasses = _baseGlasses;

// Flip through unit to assign specialized uniforms
if (_typeOfUnit in _light) then {
	_rig = _lightRig;
};

if (_typeOfUnit in _heavy) then {
	_rig = _heavyRig;
};

if (_typeOfUnit in _pilots) then {
	_helmet = _pilotHelmet;
	_uniform = _pilotUniform;
	_rig = _pilotRig;
	_glasses = _pilotGlasses
};

if (_typeOfUnit in _crews) then {
	_helmet = _crewHelmet;
	_uniform = _crewUniform;
	_rig = _crewRig;
	_glasses = _crewGlasses;
};

if (_typeOfUnit in _divers) then {
	_helmet = _diverHelmet;
	_uniform = _diverUniform;
	_rig = _diverRig;
	_glasses = _diverGlasses;
};

if (_typeOfUnit in _ghillie) then {
	_helmet = _ghillieHelmet;
	_uniform = _ghillieUniform;
	_rig = _ghillieRig;
	_glasses = _ghillieGlasses;
};

// Add uniforms to unit
if(count _uniform > 0) then
{
	_unit adduniform (_uniform call BIS_fnc_selectRandom);
};
if(count _Helmet > 0) then
{
	_unit addheadgear (_helmet call BIS_fnc_selectRandom);
};
if(count _rig > 0) then
{
	_unit addvest (_rig call BIS_fnc_selectRandom);
};
if(count _glasses > 0) then
{
	_unit addGoggles (_glasses call BIS_fnc_selectRandom);
};
