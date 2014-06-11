// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Group IDs need to be set before the ORBAT listing can be created
waitUntil {scriptDone f_script_setGroupIDs};

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups"];
_orbatText = "<br />NOTE<br />
The ORBAT below is only accurate at mission start.<br />
<br />
ORBAT<br />";
_groups = [];
_hiddenGroups = [];

{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == side group player) && !(_x in _groups) && ({isPlayer _x} count units _x) > 0) then {
		_groups = _groups + [_x];
	};
} forEach allGroups;

// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Loop through the group, print out group ID and leader name
{
	_orbatText = _orbatText + format["%1 %2", _x, name leader _x] + "<br />";
} forEach _groups;

_veharray = [];
{

	if ({vehicle _x != _x} count units _x > 0 ) then {
		{
			if (vehicle _x != _x && {!(vehicle _x in _veharray)}) then {
			_veharray set [count _veharray,vehicle _x];
			};
		} forEach units _x;
	};

} forEach _groups;

if (count _veharray > 0) then {

	_orbatText = _orbatText + "<br />VEHICLES";

	{
		_orbatText = _orbatText + "<br />" + format["%1 ",getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname")];

		if (getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") > 0) then {
			_orbatText = _orbatText + format ["(%1/%2)",getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") - (_x emptyPositions "CARGO"),getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier")];
		};

		_orbatText =_orbatText + "<br />";
		{
			_orbatText = _orbatText + format["|- %1",name _x];
			if (driver vehicle _x == _x) then {_orbatText =_orbatText +" (D)"};
			if (gunner vehicle _x == _x) then {_orbatText =_orbatText +" (G)"};
			if (commander vehicle _x == _x) then {_orbatText =_orbatText +" (C)"};
			_orbatText =_orbatText + "<br />";
		} forEach crew _x;
	} forEach _veharray;

};


// Insert final result into subsection ORBAT of section Notes
waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];