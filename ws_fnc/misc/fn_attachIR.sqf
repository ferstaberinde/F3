/*ws_fnc_attachIR
By Wolfenswan [FA]: wolfenswanarps@gmail.com

FEATURE
Attach IR strobe to object.

RETURNS
true

USAGE
Minimal:
[object] spawn ws_fnc_attachIR
Full:
[object, attachPoint, memoryPoint] spawn ws_fnc_attachIR

PARAMETERS
1. Object to attach chem to (object)				| MANDATORY
2. Offset for attach from center (array in [x,y,z])	| OPTIONAL - default is [0,0,0]
3. MemoryPoint to attach to (string					| OPTIONAL - see http://resources.bisimulations.com/wiki/Named_Selection and https://community.bistudio.com/wiki/ArmA:_Selection_Translations for memory points. Not all work.

EXAMPLES
[UnitNATO_CO,[-0.05,0.05,0.1],"Spine3"] spawn ws_fnc_attachIR - attaches an IR to the left shoulder of UnitNATO_CO
*/

private ["_obj","_duration","_offset","_mpoint","_class","_ir"];

_obj = _this select 0;
_offset = if (count _this > 1) then {_this select 1} else {[0,0,0]};
_mpoint = if (count _this > 2) then {_this select 2} else {""};

_class = "I_IR_Grenade";
switch (side _obj) do {
	case west: 	{_class = "B_IRStrobe"};
	case east: 	{_class = "O_IRStrobe"};
	default {_class = "I_IRStrobe";};
};

_ir = _class createVehicle [0,0,0];
_ir attachTo [_obj, _offset, _mpoint];
_ir setDir (getDir _obj);
_ir setVectorDir (vectorDir _obj);
_ir setVectorUp (vectorUp _obj);

true;