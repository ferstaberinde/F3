// F3 - Nametags
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// SET GLOBAL VARIABLES

// MODIFYABLE
f_size_Nametags = 0.04; // The size the names are displayed in
f_height_standing_Nametags = 2;
f_height_crouch_Nametags = 1.5;
f_height_prone_Nametags = 0.9;
f_vheight_Nametags = 0; // The height of the name tags for units in vehicles (0 = hovering over vehicle)
F_SHADOW_NAMETAGS = 2; // The shadow for the name tags (0 - 2)

f_color_Nametags =  [1,1,1,0.9]; // The color for infantry and units in vehicle cargo (in [red,green, blue, opacity])
f_color2_Nametags = [0.5,0.1,0.2,0.9]; // The color for units in driver, gunner and other vehicle positions positions
f_groupColor_Nametags = [0,1,0.7,0.9]; // The color for units of the same group

F_FONT_NAMETAGS = "EtelkaMonospaceProBold"; // Font for the names
F_KEY_NAMETAGS =  "TeamSwitch"; // The action key that will be used to toggle the name tags. See possible keys here: http://community.bistudio.com/wiki/Category:Key_Actions

// SCRIPTSIDE
F_DIST_NAMETAGS = _this select 0;

if (isNil "f_showGroup_Nametags") then {f_showGroup_Nametags = false};
if (isNil "f_showDistance_Nametags") then {f_showDistance_Nametags = false};
if (isNil "f_showVehicle_Nametags") then {f_showVehicle_Nametags = false};

F_DRAW_NAMETAGS = false;
F_ACTIONKEY_NAMETAGS = (actionKeys F_KEY_NAMETAGS) select 0;
F_KEYNAME_NAMETAGS = actionKeysNames F_KEY_NAMETAGS;
if (isNil "F_ACTIONKEY_NAMETAGS") then {F_ACTIONKEY_NAMETAGS = 20; F_KEYNAME_NAMETAGS = 'T';}; // If the user has not bound 'TeamSwitch' to a key we default to 'T' to toggle the tags

F_KEYUP_NAMETAG = {
	_key = _this select 1;
	_handeld = false;
	if(_key == F_ACTIONKEY_NAMETAGS) then
	{
		_handeld = true;
	};
	_handeld;
};

F_KEYDOWN_NAMETAG = {
	_key = _this select 1;
	_handeld = false;
	if(_key == F_ACTIONKEY_NAMETAGS) then
	{
		F_DRAW_NAMETAGS = !F_DRAW_NAMETAGS;
		_handeld = true;
	};
	_handeld;
};

// ====================================================================================

// ADD BRIEFING SECTION
// A section is added to the player's briefing to inform them about name tags being available.

[] spawn {
waitUntil {scriptDone f_script_briefing};

_bstr = format ["<br/>Toggle nametags for friendly units by pressing %1. This displays nametags for units within %3 m.<br/><br/>

If you do not have an key bound for %2 this will be 'T' by default. To bind the toggle to a different key bind your %2 key and click
<execute expression=""
F_ACTIONKEY_NAMETAGS = (actionKeys F_KEY_NAMETAGS) select 0;
F_KEYNAME_NAMETAGS = actionKeysNames F_KEY_NAMETAGS;
if (isNil 'F_ACTIONKEY_NAMETAGS') then {F_ACTIONKEY_NAMETAGS = 20; F_KEYNAME_NAMETAGS = 'T';};
hintsilent 'Team switch key rebound!';
"">here</execute>.
",F_KEYNAME_NAMETAGS, F_KEY_NAMETAGS,F_DIST_NAMETAGS];

if (F_SHOWGROUP_NAMETAGS) then {
_bstr = _bstr + "<br/><br/>GROUP NAMES<br/>Nametags display the unit's group name. To toggle this feature click <execute expression=""
if (F_SHOWGROUP_NAMETAGS) then {hintsilent 'Group display deactivated!';F_SHOWGROUP_NAMETAGS= false} else {F_SHOWGROUP_NAMETAGS = true;hintsilent 'Group display activated!'};""
>here</execute>."
};

if (F_SHOWDISTANCE_NAMETAGS) then {
_bstr = _bstr + "<br/><br/>DISTANCE<br/>Nametags display the unit's relative distance to you. To toggle this feature click <execute expression=""
if (F_SHOWDISTANCE_NAMETAGS) then {hintsilent 'Distance display deactivated!';F_SHOWDISTANCE_NAMETAGS= false} else {F_SHOWDISTANCE_NAMETAGS = true;hintsilent 'Distance display activated!'};""
>here</execute>."
};

if (F_SHOWVEHICLE_NAMETAGS) then {
_bstr = _bstr + "<br/><br/>VEHICLE TYPES<br/>Nametags display the vehicle type of any mounted units. To toggle this feature click <execute expression=""
if (F_SHOWVEHICLE_NAMETAGS) then {hintsilent 'Vehicle type display deactivated!';F_SHOWVEHICLE_NAMETAGS= false} else {F_SHOWVEHICLE_NAMETAGS = true;hintsilent 'Vehicle type display activated!'};""
>here</execute>."
};

player createDiaryRecord ["Diary", ["NameTags",_bstr]];

// NOTIFY PLAYER ABOUT NAMETAGS VIA HINT
sleep 5;
hintsilent format ["Press %1 to toggle name tags", F_KEYNAME_NAMETAGS ];
};

// ====================================================================================

// ADD EVENTHANDLERS
// After the mission has initialized eventhandlers are added to the register keypresses.

sleep 0.1;

waitUntil {!isNull (findDisplay 46)}; // Make sure the display we need is initialized

(findDisplay 46) displayAddEventHandler   ["keyup", "_this call F_KEYUP_NAMETAG"];
(findDisplay 46) displayAddEventHandler   ["keydown", "_this call F_KEYDOWN_NAMETAG"];

// ====================================================================================
// the real code.

addMissionEventHandler ["Draw3D", {

	if(F_DRAW_NAMETAGS) then
	{

	private ["_ents","_veh","_color","_inc","_suffix","_pos","_angle"];

	// Collect all entities in the relevant distance
	_ents = (position player) nearEntities [["CAManBase","LandVehicle","Helicopter","Plane","Ship_F"], F_DIST_NAMETAGS];

		// Start looping through all entities
		{
			// Only display units of players side
			if(side _x == side player && _x != player && !(player iskindof "VirtualMan_F")) then
			{

				// If the entity is Infantry
				if(typeof _x iskindof "Man") then
				{
						_pos = visiblePosition _x;
						[_x,_pos] call f_fnc_drawNameTag;
				}

				// Else (if it's a vehicle)
				else
				{

					_veh = _x;
					_inc = 1;
					_alternate = 0;

					{

						_suffix = "";

						// Get the various crew slots
						if(driver _veh == _x) then
						{
							_suffix = " - D";
						};
						if(gunner _veh == _x) then
						{
							_suffix = " - G";
						};
						if(commander _veh == _x) then
						{
							_suffix = " - C";
						};
						if(assignedVehicleRole _x select 0 == "Turret" && commander _veh != _x && gunner _veh != _x && driver _veh != _x) then
						{
							_suffix = " - G";
						};

						_pos = visiblePosition _x;

						// If the unit is a passenger or the driver
						if (_pos distance (getPosVisual (driver _veh)) > 0.1 || driver _veh == _x) then
						{

							// If it's the driver calculate the cargo slots
							if(driver _veh == _x) then
							{
								// Workaround for http://feedback.arma3.com/view.php?id=21602
								_maxSlots = getNumber(configfile >> "CfgVehicles" >> typeof _veh >> "transportSoldier") + (count allTurrets [_veh, true] - count allTurrets _veh);
								_freeSlots = _veh emptyPositions "cargo";

								if (_maxSlots > 0) then {

								_suffix = _suffix + format [" (%1/%2)",(_maxSlots-_freeSlots),_maxSlots];

								[_x,_pos,_suffix] call f_fnc_drawNameTag;

								} else {
									[_x,_pos,_suffix] call f_fnc_drawNameTag;
								};
							}
							else
							{
								[_x,_pos,_suffix] call f_fnc_drawNameTag;
							};
						}
						else
						{
							if(_x == gunner _veh) then
							{
								_pos = [_veh modeltoworld (_veh selectionPosition "gunnerview") select 0,_veh modeltoworld (_veh selectionPosition "gunnerview") select 1,(visiblePosition _x) select 2];

								[_x,_pos,_suffix] call f_fnc_drawNameTag;
							}
							else
							{
								_angle = (getdir _veh)+180;
								_pos = [((_pos select 0) + sin(_angle)*(0.6*_inc)) , (_pos select 1) + cos(_angle)*(0.6*_inc),_pos select 2 + F_VHEIGHT_NAMETAGS];

								[_x,_pos,_suffix] call f_fnc_drawNameTag;
								_inc = _inc + 1;
							};
						};

					} foreach crew _veh;
				};
			};
		} foreach _ents;

	}; // Outmost if scope

}]; // End of the Eventhandler Scope

