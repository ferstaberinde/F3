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

params [
	["_obj", objNull, [objNull]],
	["_color", "red", [""]],
	["_duration", 0, [0]],
	["_offset", [0,0,0], [[]], 3],
	["_mpoint", "", [""]]
];

private _chm = (format ["Chemlight_%1",toLower _color]) createVehicle [0,0,0];
_chm attachTo [_obj, _offset, _mpoint];
_chm setDir (getDir _obj);
_chm setVectorDir (vectorDir _obj);
_chm setVectorUp (vectorUp _obj);

if (_duration > 0) then {
	sleep _duration;
	deleteVehicle _chm;
};

true
