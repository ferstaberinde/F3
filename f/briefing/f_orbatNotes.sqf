// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface || (side player == sideLogic)) exitWith {}; //Exit if not a player.

// Group IDs need to be set before the ORBAT listing can be created
waitUntil {scriptDone f_script_setGroupIDs};

// Define needed variables
private _orbatText = "NOTE: The ORBAT below is only accurate at mission start.<br />
<br />
<font size='18'>GROUP LEADERS + NOTABLE</font><br /><br />";

private _hiddenGroups = [];

private _icon_arrow = "<img image='\A3\ui_f\data\gui\rscCommon\rscTree\hiddenTexture_ca.paa' height='16'/>";

// Add groups to ORBAT if side matches, group isn't already listed, and group has players
private _groups = allGroups select {(side _x == side group player) && ({_x in playableUnits} count units _x) > 0};
//Only allow unique groups:
_groups = _groups arrayIntersect _groups;
// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Use the groupData,
// change the variable name (the first field) to the variable itself,
// then filter out any non-groups, and groups we don't want to show.
private _groupData = f_var_groupData_all apply {
	[
		missionNamespace getVariable [_x select 0,grpNull], 
		_x select 1, 
		_x select 3
	]
} select { ! isNull (_x select 0) && {(_x select 0) in _groups}};

// Loop through the group, print out group ID, leader name and medics if present
{
	// Highlight the player's group with a different color (based on the player's side)
	private _color = "#FFFFFF";
	if (_x == group player) then {
		_color = switch (side player) do {
			 case west: {"#0080FF"};
			 case east: {"#B40404"};
			 case independent: {"#298A08"};
			 default {"#8904B1"};
 		};
	};

	//group marker icon:
	private _thisGroup = _x;
	private _dataForThisGroup = _groupData select {_x select 0 == _thisGroup};
	if (count _dataForThisGroup > 0) then {
		_dataForThisGroup select 0 params ["", "_mIcon", "_mColor"];
		_mIcon = getText (configfile >> "CfgMarkers" >> _mIcon >> "icon");
		_mColor = getArray (configfile >> "CfgMarkerColors" >> _mColor >> "color") call BIS_fnc_colorRGBAtoHTML;
		_orbatText = _orbatText + format ["<img color='%1' image='%2' height='20'/> ", _mColor, _mIcon];
	};

	_orbatText = _orbatText + format ["<font color='%3'>%1 %2</font>", _x, name leader _x,_color] + "<br />";

	{
		//Note: FAC is a specialised JTAC. so additional differentiation is needed
		_orbatText = _orbatText + (switch [_x getVariable ["f_var_assignGear",""], (roleDescription _x) find "FAC" != -1] do {
			case ["m",    false]: { format["%1 %2 [M]<br />",    _icon_arrow, name _x] };
			case ["jtac", false]: { format["%1 %2 [JTAC]<br />", _icon_arrow, name _x] };
			case ["jtac", true ]: { format["%1 %2 [FAC]<br />",  _icon_arrow, name _x] };
			default { "" };
		});
	} forEach (units _x - [leader _x]);
} forEach _groups;

// Get all player vehicles
private _veharray = [];
{
	{
		_veharray pushBackUnique (vehicle _x);
	} forEach (units _x select {vehicle _x != _x});
} forEach _groups;

if (count _veharray > 0) then {

	_orbatText = _orbatText + "<br />VEHICLE CREWS + PASSENGERS<br />";

	{
		 // Filter all characters which might break the diary entry (such as the & in Orca Black & White)
		private _vehName = [getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname"),"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_- "] call BIS_fnc_filterString;

		_orbatText = _orbatText + "<br />" + _vehName;

		// Workaround for http://feedback.arma3.com/view.php?id=21602
		private _maxSlots = getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") + (count allTurrets [_x, true] - count allTurrets _x);
		private _freeSlots = _x emptyPositions "cargo";

		if (_maxSlots > 0) then {
			_orbatText = _orbatText + format [" [%1/%2]",(_maxSlots-_freeSlots),_maxSlots];
		};

		_orbatText = _orbatText  + "<br />";

		{
			if ((assignedVehicleRole _x select 0) != "CARGO") then {

				private _veh = vehicle _x;
				private _crewrole = switch (true) do {
					case (driver _veh == _x && !((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" [D]"};
					case (driver _veh == _x && ((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" [P]"};
					case (commander _veh == _x):{" [CO]"};
					case (gunner _veh == _x):{" [G]"};
					case (assignedVehicleRole _x select 0 == "Turret" && commander _veh != _x && gunner _veh != _x && driver _veh != _x):{" [C]"};
					default {" [C]"};
				};

				_orbatText = _orbatText + format["%1 %2", _icon_arrow, name _x] + _crewrole + "<br/>";
			};
		} forEach crew _x;

		private _groupList = [];
		{
			if (!(group _x in _groupList) && {(assignedVehicleRole _x select 0) == "CARGO"} count (units group _x) > 0) then {
				_groupList pushBack (group _x);
			};
		} forEach crew _x;

		if (count _groupList > 0) then {
			{
				_orbatText =_orbatText + format["%1 %2", _icon_arrow, _x] + " [CARGO] <br />";
			} forEach _groupList;
		};

	} forEach _veharray;

};

// Insert final result into subsection ORBAT of section Notes
waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];
