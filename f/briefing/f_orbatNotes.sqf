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
GROUPS<br />";
_groups = [];
_hiddenGroups = [];

{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == side group player) && !(_x in _groups) && ({isPlayer _x} count units _x) > 0) then {
	//if ((side _x == side group player) && !(_x in _groups)) then {
		_groups = _groups + [_x];
	};
} forEach allGroups;

// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Loop through the group, print out group ID, leader name and medics if present
{
	_orbatText = _orbatText + format["%1 %2", _x, name leader _x] + "<br />";
	{
		if (_x getVariable ["f_var_assignGear",""] == "m" && {_x != leader group _x}) then {
			_orbatText = _orbatText + format["|- %1 [M]",name _x] + "<br />";
		};
	} forEach units _x;
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

_orbatText = _orbatText + "<br />VEHICLES<br />";

	{
		_orbatText = _orbatText + "<br />" + format["%1 ",getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname")];

		if (getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") > 0) then {
			_orbatText = _orbatText + format ["[%1/%2]",getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") - (_x emptyPositions "CARGO"),getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier")];
		};

		_orbatText =_orbatText + "<br />";
		{
			if ((assignedVehicleRole _x select 0) != "CARGO") then {
				_orbatText = _orbatText + format["|- %1",name _x];
				if (driver vehicle _x == _x) exitWith {_orbatText =_orbatText +" [D] <br />"};
				if (gunner vehicle _x == _x) exitWith {_orbatText =_orbatText +" [G] <br />"};
				if (commander vehicle _x == _x) exitWith {_orbatText =_orbatText +" [C] <br />"};
				_orbatText =_orbatText +" [G] <br />"
			};
		} forEach crew _x;

		_groupList = [];

		{
			if (!(group _x in _groupList) && {(assignedVehicleRole _x select 0) == "CARGO"} count (units group _x) > 0) then {
				_groupList set [count _groupList,group _x];
			};
		} forEach crew _x;

		if (count _groupList > 0) then {
			{
				_orbatText =_orbatText + format["|- %1", _x] + " Passengers <br />";
			} forEach _groupList;
		};

	} forEach _veharray;

};

// Insert final result into subsection ORBAT of section Notes
waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];