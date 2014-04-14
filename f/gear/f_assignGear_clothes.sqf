// F3 - F3 Folk ARPS Assign Gear
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// lets strip him down to the basic
removeUniform _unit;
removeheadgear _unit;
removevest _unit;

// use the type of the unit to figure out who gear they need
switch (_typeofUnit) do
{
	case "p":
	{
		// if there is a pilotuniform defeined add it to the unit
		if(!isnil "_pilotUniform" && {count _pilotUniform > 0}) then
		{
		_unit adduniform (_pilotUniform call BIS_fnc_selectRandom);
		};
		// if there is ... etc.
		if(!isnil "_pilotHelmet" && {count _pilotHelmet > 0}) then
		{
		_unit addheadgear (_pilotHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_pilotRig" && {count _pilotRig > 0}) then
		{
		_unit addvest (_pilotRig call BIS_fnc_selectRandom);
		};
	};
	case "c":
	{
		// if there is a pilotuniform defeined add it to the unit
		if(!isnil "_crewUniform" && {count _crewUniform > 0}) then
		{
		_unit adduniform (_crewUniform call BIS_fnc_selectRandom);
		};
		// if there is ... etc.
		if(!isnil "_crewHelmet" && {count _crewHelmet > 0}) then
		{
		_unit addheadgear (_crewHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_crewRig" && {count _crewRig > 0}) then
		{
		_unit addvest (_crewRig call BIS_fnc_selectRandom);
		};
	};
	case "div":
	{
		if(!isnil "_diverUniform" && {count _diverUniform > 0}) then
		{
		_unit adduniform (_diverUniform call BIS_fnc_selectRandom);
		};
		if(!isnil "_diverHelmet" && {count _diverHelmet > 0}) then
		{
		_unit addheadgear (_diverHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_diverRig" && {count _diverRig > 0}) then
		{
		_unit addvest (_diverRig call BIS_fnc_selectRandom);
		};
		if(!isnil "_diverGlasses" && {count _diverGlasses > 0}) then
		{
		_unit addGoggles (_diverGlasses call BIS_fnc_selectRandom);
		};
	};

	default
	{
		if(!isnil "_baseUniform" && {count _baseUniform > 0}) then
		{
		_unit adduniform (_baseUniform call BIS_fnc_selectRandom);
		};
		if(!isnil "_baseHelmet" && {count _baseHelmet > 0}) then
		{
		_unit addheadgear (_baseHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_mediumrig" && {count _mediumrig > 0}) then
		{
		_unit addvest (_mediumrig call BIS_fnc_selectRandom);
		};
	};
};