// F3 - Tripwire Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_pos","_dir","_id","_size1","_size2","_side","_sidestr","_mkr"];

_unit = _this select 1;
_pos = getPos _unit;
_dir = getDir _unit;
_id = _this select 2;
_size1 = (_this select 3) select 0;
_size2 = (_this select 3) select 1;
_side = (_this select 3) select 2;

_unit removeAction _id;

fa_tripwire = [_pos,_size1,_size2,_side,_dir];
publicvariable "fa_tripwire";
	
call fa_fnc_tripwire;