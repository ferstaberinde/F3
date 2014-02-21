/*ws_fnc_attachIR
By Wolfenswan [FA]: wolfenswanarps@gmail.com

FEATURE
Attach IR strobe to object.

RETURNS
true

USAGE
Minimal:
[object] spawn ws_fnc_attachChem
Full:
[object, duration, attachPoint, memoryPoint] spawn ws_fnc_attachChem

PARAMETERS
1. Object to attach chem to (object)				| MANDATORY
2. Duration of light (integer)						| OPTIONAL - default is 0 (infinite)
3. Offset for attach from center (array in [x,y,z])	| OPTIONAL - default is [0,0,0]
4. MemoryPoint to attach to (string					| OPTIONAL - see http://resources.bisimulations.com/wiki/Named_Selection and https://community.bistudio.com/wiki/ArmA:_Selection_Translations for memory points. Not all work.

EXAMPLES
[UnitNATO_CO,5,[-0.15,0.05,0.1],"Spine3"] spawn ws_fnc_attachChem; - attaches an IR to the left shoulder of UnitNATO_CO
*/

private ["_obj","_duration","_offset","_mpoint","_class","_ir"];

_obj = _this select 0;
_duration = if (count _this > 1) then {_this select 1} else {0};
_offset = if (count _this > 2) then {_this select 3} else {[0,0,0]};
_mpoint = if (count _this > 3) then {_this select 4} else {""};

_class = "I_IR_Grenade";
switch (side _obj) do {
	case west: 	{_class = "B_IR_Grenade"};
	case east: 	{_class = "O_IR_Grenade"};
	default {_class = "I_IR_Grenade";};
};

_ir = _class createVehicle [0,0,0];
_ir attachTo [_obj, _offset, _mpoint];
_ir setDir (getDir _obj);
_ir setVectorDir (vectorDir _obj);
_ir setVectorUp (vectorUp _obj);

if (_duration > 0) then {
	sleep _duration;
	deleteVehicle _ir;
};

true;