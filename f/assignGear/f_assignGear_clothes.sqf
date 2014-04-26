// F3 - F3 Folk ARPS Assign Gear
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// lets strip him down to the basic
removeUniform _unit;
removeheadgear _unit;
removevest _unit;

// First check if the unit type is in any of the arrays for specific uniforms
if (_typeOfUnit in (_light+_heavy+_pilots+_divers+_crews+_ghillie)) then {

	if (_typeOfUnit in _light) then {
		if(!isnil "_baseUniform" && {count _baseUniform > 0}) then
		{
		_unit adduniform (_baseUniform call BIS_fnc_selectRandom);
		};
		if(!isnil "_baseHelmet" && {count _baseHelmet > 0}) then
		{
		_unit addheadgear (_baseHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_lightrig" && {count _lightrig > 0}) then
		{
		_unit addvest (_lightrigrig call BIS_fnc_selectRandom);
		};
	};

	if (_typeOfUnit in _heavy) then {
		if(!isnil "_baseUniform" && {count _baseUniform > 0}) then
		{
		_unit adduniform (_baseUniform call BIS_fnc_selectRandom);
		};
		if(!isnil "_baseHelmet" && {count _baseHelmet > 0}) then
		{
		_unit addheadgear (_baseHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_heavyrig" && {count _heavyrig > 0}) then
		{
		_unit addvest (_heavyrig call BIS_fnc_selectRandom);
		};
	};



	if (_typeOfUnit in _pilots) then {
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


	// Then check each to see if it contains the unit
	if (_typeOfUnit in _divers) then {
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

	if (_typeOfUnit in _crews) then {
		if(!isnil "_crewUniform" && {count _crewUniform > 0}) then
		{
		_unit adduniform (_crewUniform call BIS_fnc_selectRandom);
		};
		if(!isnil "_crewHelmet" && {count _crewHelmet > 0}) then
		{
		_unit addheadgear (_crewHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_crewRig" && {count _crewRig > 0}) then
		{
		_unit addvest (_crewRig call BIS_fnc_selectRandom);
		};
	};

	if (_typeOfUnit in _ghillie) then {
		player globalchat "ghillie";
		if(!isnil "_ghillieUniform" && {count _crewUniform > 0}) then
		{
		_unit adduniform (_ghillieUniform call BIS_fnc_selectRandom);
		};
		if(!isnil "_ghillieHelmet" && {count _crewHelmet > 0}) then
		{
		_unit addheadgear (_ghillieHelmet call BIS_fnc_selectRandom);
		};
		if(!isnil "_ghillieRig" && {count _crewRig > 0}) then
		{
		_unit addvest (_ghillieRig call BIS_fnc_selectRandom);
		};
	};

// Else, equip the unit with the basic uniform and a medium vest
} else {
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
