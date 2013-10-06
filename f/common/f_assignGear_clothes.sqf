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
		if(!isnil "_pilotUniform" && _pilotUniform != "") then
		{
		_unit adduniform _pilotUniform;
		};
		// if there is ... etc.
		if(!isnil "_pilotHelmet" && _pilotHelmet != "") then
		{
		_unit addheadgear _pilotHelmet;
		};
		if(!isnil "_pilotRig" && _pilotRig != "") then
		{
		_unit addvest _pilotRig;
		};
	};
	case "c":
	{
		// if there is a pilotuniform defeined add it to the unit
		if(!isnil "_crewUniform" && _crewUniform != "") then
		{
		_unit adduniform _crewUniform;
		};
		// if there is ... etc.
		if(!isnil "_crewHelmet" && _crewHelmet != "") then
		{
		_unit addheadgear _crewHelmet;
		};
		if(!isnil "_crewRig" && _crewRig != "") then
		{
		_unit addvest _crewRig;
		};
	};
	case "div":
	{
		if(!isnil "_diverUniform" && _diverUniform != "") then
		{
		_unit adduniform _diverUniform;
		};
		if(!isnil "_diverHelmet" && _diverHelmet != "") then
		{
		_unit addheadgear _diverHelmet;
		};
		if(!isnil "_diverRig" && _diverRig != "") then
		{
		_unit addvest _diverRig;
		};
		if(!isnil "_diverGlasses" && _diverGlasses != "") then
		{
		_unit addGoggles _diverGlasses;
		};
	};

	default
	{
		if(!isnil "_baseUniform" && _baseUniform != "") then
		{
		_unit adduniform _baseUniform;
		};
		if(!isnil "_baseHelmet" && _baseHelmet != "") then
		{
		_unit addheadgear _baseHelmet;
		};
		if(!isnil "_mediumrig" && _mediumrig != "") then
		{
		_unit addvest _mediumrig;
		};
	};
};