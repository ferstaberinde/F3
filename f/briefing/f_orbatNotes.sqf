// F3 - ORBAT Notes
// Credits and documentation: https://github.com/folkarps/F3/wiki
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
private _playableUnits = if (isMultiplayer) then {playableUnits} else {switchableUnits};
private _groups = allGroups select {(side _x == side group player) && ({_x in _playableUnits} count units _x) > 0};
//Only allow unique groups:
_groups = _groups arrayIntersect _groups;
// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

//Get all units from these groups, so that we can take their specialist marker from _groupData
private _units = []; {_units append units _x} forEach _groups;

// Use the groupData,
// change the variable name (the first field) to the variable itself,
// then filter out any non-groups, and groups we don't want to show.
private _groupData = f_var_groupData_all apply {
	[
		missionNamespace getVariable [_x select 0,grpNull], 
		getText (configfile >> "CfgMarkers" >> (_x select 1) >> "icon"),
		((configfile >> "CfgMarkerColors" >> (_x select 3) >> "color") call BIS_fnc_colorConfigToRGBA) call BIS_fnc_colorRGBAtoHTML
	]
} select { ! isNull (_x select 0) && {(_x select 0) in (_groups + _units)}};

//Helper function to get marker from _groupData
private _fnc_getMarker = {
	params [
		["_unitOrGroup", objNull, [grpNull, objNull]],
		["_groupFallback", false, [false]] //fall back to group if the unit doesn't have a marker
	];
	private _unitData = _groupData select {_x select 0 isEqualTo _unitOrGroup};
	private _icon = if (count _unitData > 0) then {
		_unitData select 0 params ["", "_mIcon", "_mColor"];
		format [" <img color='%1' image='%2' height='20'/> ", _mColor, _mIcon]
	} else {
		if (_groupFallback && _unitOrGroup isEqualType objNull) then {
			[group _unitOrGroup] call _fnc_getMarker
		} else {
			""
		}
	};
	_icon
};

// Loop through the group, print out group ID, leader name and special units if present
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

	private _icon = [_x] call _fnc_getMarker;
	_orbatText = _orbatText + format ["%1<font color='%4'>%2 %3</font>", _icon, groupId _x, name leader _x,_color] + "<br />";

	{
		private _unit = _x;
		private _icon = [_unit] call _fnc_getMarker;
		//Note: FAC is a specialised JTAC. so additional differentiation is needed
		private _type = switch [_unit getVariable ["f_var_assignGear",""], (roleDescription _unit) find "FAC" != -1] do {
			case ["m",    false]: { "[M]"    };
			case ["jtac", false]: { "[JTAC]" };
			case ["jtac", true ]: { "[FAC]"  };
			default { "" };
		};
		if (count _type > 0 || {count _icon > 0}) then {
			_orbatText = _orbatText + format["%1%2 %3 %4<br />", _icon_arrow, _icon, name _unit, _type];
		};
	} forEach (units _x - [leader _x]);
} forEach _groups;

// Get all player vehicles
private _veharray = [];
{
	_veharray pushBackUnique (vehicle _x);
} forEach (_units select {vehicle _x != _x});

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

				private _icon = [_x, true] call _fnc_getMarker;
				_orbatText = _orbatText + format["%1%2 %3", _icon_arrow, _icon, name _x] + _crewrole + "<br/>";
			};
		} forEach crew _x;

		// Print groups in cargo
		private _groupList = [];
		{
			if ({(assignedVehicleRole _x select 0) == "CARGO"} count (units group _x) > 0) then {
				_groupList pushBackUnique (group _x);
			};
		} forEach crew _x;
		{
			private _icon = [_x] call _fnc_getMarker;
			_orbatText =_orbatText + format["%1%2 %3", _icon_arrow, _icon, groupId _x] + " [CARGO] <br />";
		} forEach _groupList;

	} forEach _veharray;

};

// Insert final result into subsection ORBAT of section Notes
waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];
