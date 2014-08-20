// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
_unit = _this;

// handles the woundeffect
[_unit] spawn
{
	_unit = _this select 0;

	while{alive _unit} do
	{
		_downed = _unit getVariable ["revive_down",false];
		_bleeding = _unit getVariable ["revive_bleeding",false];
		if(_downed || _bleeding) then
		{
			[] call f_fnc_WoundedEffect;
		};
		sleep 2.5;
	};
};

// ticker for life, calculates death and blood.
while {alive _unit} do
{
	_downed = _unit getVariable ["revive_down",false];
	_bleeding = _unit getVariable ["revive_bleeding",false];
	_blood = _unit getVariable ["revive_blood",100];
	if(_bleeding && damage _unit < 0.26) then
	{
		// stops units from not being able to first aid.
		_unit setdamage 0.26;
	};
    if(_downed || _bleeding) then
    {
    	// blood loss
    	_unit setVariable ["revive_blood",_blood - 0.6 max 0];
    	if(getBleedingRemaining _unit <= 0) then {    	_unit setBleedingRemaining 10;};
    }
	else
	{
		// blood regens.
		_unit setVariable ["revive_blood",_blood + 0.6 min 100];
	};
	// value of blood where you will be downed
	if(_blood < 45 && !_downed) then
	{
		[[_unit,true], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
	};
	if(_blood <= 0) then
	{
		_unit setdamage 1;
	};
	sleep 1;
};
