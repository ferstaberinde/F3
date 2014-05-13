// F3 - SetAISkill
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_unit","_skill","_skillarray","_random"];

// ====================================================================================

// SET KEY VARIABLES

_unit = _this select 0;
_skillarray = _this select 1;

// ====================================================================================

// If a specific skill level was passed we update _skillArray using the new value.
if (typename _skillarray == 'SCALAR') then {
	_skill = _this select 1;
	_skillArray = [];
	for '_x' from 0 to 9 do {
		_skilllevel = (f_skillSet select _x) * _skill;
		_random =  random f_randomUp - random f_randomDown;
		_skillArray set [_x, (_skilllevel + _random)];
	};
};

// ====================================================================================

// We loop through all skilltypes and set them for the individual unit
{
_unit setSkill [_x,_skillarray select _forEachIndex];
} forEach ['aimingAccuracy','aimingShake','aimingSpeed','endurance','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];

_unit setVariable ["f_setAISkill",true];

// Returns true
true