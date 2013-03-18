// F3 - Folk ARPS Clothes Gear Script
// Credits: Head


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
	};
	case "eng":
	{
		if(!isnil "_baseUniform" && _baseUniform != "") then
		{
		_unit adduniform _baseUniform;
		};
		if(!isnil "_baseHelmet" && _baseHelmet != "") then
		{
		_unit addheadgear _baseHelmet;
		};
		if(!isnil "_heavyRig" && _heavyRig != "") then
		{
		_unit addvest _heavyRig;
		};
	};
	case "ar":
	{
		if(!isnil "_baseUniform" && _baseUniform != "") then
		{
		_unit adduniform _baseUniform;
		};
		if(!isnil "_baseHelmet" && _baseHelmet != "") then
		{
		_unit addheadgear _baseHelmet;
		};
		if(!isnil "_heavyRig" && _heavyRig != "") then
		{
		_unit addvest _heavyRig;
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
		if(!isnil "_lightRig" && _lightRig != "") then
		{
		_unit addvest _lightRig;
		};
	};
};