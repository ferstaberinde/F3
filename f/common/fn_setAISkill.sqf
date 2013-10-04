// DECLARE VARIABLES

private ["_unit","_skill","_skillarray","_random"];

// SET KEY VARIABLES

_unit = _this select 0;
_skill = _this select 1;

_skillArray = [];
for "_x" from 0 to 9 do {
	_skilllevel = (f_skillSet select _x) * _skill;
	_random =  random f_randomUp - random f_randomDown;
	_skillArray set [_x, (_skilllevel + _random)];
};


// We loop through all skilltypes and set them for the individual unit
{
_unit setSkill [_x,_skillarray select _forEachIndex];
} forEach ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];

// We set a Variable on the processed unit to indicate it's changed skill and differentiate it from "untouched" units
_unit setVariable ["f_skillarray",_skillarray];

// Returns true
true