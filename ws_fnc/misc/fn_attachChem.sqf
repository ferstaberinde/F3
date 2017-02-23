/*ws_fnc_attachChem
By Wolfenswan [FA]: wolfenswanarps@gmail.com

FEATURE
Attach chemlight to object.

RETURNS
true

USAGE
Minimal:
[object,color] spawn ws_fnc_attachChem
Full:
[object, color, duration, attachPoint, memoryPoint] spawn ws_fnc_attachChem

PARAMETERS
1. Object to attach chem to (object)				| MANDATORY
2. Color of chemlight (string)						| MANDATORY	- can be "red","green","blue" or "yellow"
3. Duration of light (number)						| OPTIONAL - default is 0 (infinite)
4. Offset for attach from center (array in [x,y,z])	| OPTIONAL - default is [0,0,0]
5. MemoryPoint to attach to (string					| OPTIONAL - see http://resources.bisimulations.com/wiki/Named_Selection and https://community.bistudio.com/wiki/ArmA:_Selection_Translations for memory points. Not all work.

EXAMPLES
[UnitNATO_CO,"red",5,[-0.15,0.05,0.1],"Spine3"] spawn ws_fnc_attachChem; - attaches a chemlight to the left shoulder of UnitNATO_CO

*/

private ["_obj","_color","_duration","_offset","_mpoint","_chm"];

_obj = _this select 0;
_color = toLower(_this select 1);
_duration = if (count _this > 2) then {_this select 2} else {0};
_offset = if (count _this > 3) then {_this select 3} else {[0,0,0]};
_mpoint = if (count _this > 4) then {_this select 4} else {""};

_chm = (format ["Chemlight_%1",_color]) createVehicle [0,0,0];
_chm attachTo [_obj, _offset, _mpoint];
_chm setDir (getDir _obj);
_chm setVectorDir (vectorDir _obj);
_chm setVectorUp (vectorUp _obj);

if (_duration > 0) then {
	sleep _duration;
	deleteVehicle _chm;
};

true