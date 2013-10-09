// F3 - Nametags
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// SET GLOBAL VARIABLES

F_COLOR_NAMETAGS =  [1,1,1,0.9]; // The color for the player names in [red,blue,green,opacity]
F_FONT_NAMETAGS = "EtelkaMonospaceProBold"; // Font for the names
F_SIZE_NAMETAGS = 0.05; // The size the names are displayed in
F_KEY_NAMETAGS =  "TeamSwitch"; // The action key that will be used to toggle the name tags. See possible keys here: http://community.bistudio.com/wiki/Category:Key_Actions

F_DIST_NAMETAGS = _this select 0;
F_DRAW_NAMETAGS = false;

waitUntil {isNull (findDisplay 46)}; // some misc functions for toggleing nametags (T)
F_KEYUP_NAMETAG = {
	_key = _this select 1;
	_handeld = false;
	if(_key == (actionKeys F_KEY_NAMETAGS) select 0) then
	{
		_handeld = true;
	};
	_handeld;
};

F_KEYDOWN_NAMETAG = {
	_key = _this select 1;
	_handeld = false;
	if(_key == (actionKeys F_KEY_NAMETAGS) select 0) then
	{
		F_DRAW_NAMETAGS = !F_DRAW_NAMETAGS;

		_handeld = true;
	};
	_handeld;
};
// ====================================================================================
// We wait a few seconds into the mission
sleep 5;

(findDisplay 46) displayAddEventHandler   ["keyup", "_this call F_KEYUP_NAMETAG"];
(findDisplay 46) displayAddEventHandler   ["keydown", "_this call F_KEYDOWN_NAMETAG"];

// NOTIFY PLAYER ABOUT NAMETAGS
hintsilent format ["Press %1 to toggle name tags",actionKeysNames F_KEY_NAMETAGS];

// ====================================================================================
// the real code.

addMissionEventHandler ["Draw3D", {
if(F_DRAW_NAMETAGS) then
{
_ents = (position player) nearEntities [["CAManBase","LandVehicle","Helicopter","Plane","Ship_F"], F_DIST_NAMETAGS];
{
	if(typeof _x iskindof "Man") then
	{
		if(side _x == side player && _x != player) then
		{
			_pos = visiblePosition _x;
			drawIcon3D ["", F_COLOR_NAMETAGS, [_pos select 0,_pos select 1,(_pos select 2) + 2], 0, 0, 0,  name _x, 0,F_SIZE_NAMETAGS, F_FONT_NAMETAGS];
		};
	}
	else
	{
		_veh = _x;
		_inc = 1;
		_alternate = 0;
		{
			_prefix = "P:";
			_color = F_COLOR_NAME;
			if(driver _veh == _x) then
			{
				_prefix = "D:";
				_color = [0,0,1,0.6];
			};
			if(gunner _veh == _x) then
			{
				_prefix = "G:";
				_color = [0,0,1,0.6];
			};
			if(commander _veh == _x) then
			{
				_prefix = "C:";
				_color = [0,0,1,0.6];
			};
			if(assignedVehicleRole _x select 0 == "Turret" && commander _veh != _x && gunner _veh != _x && driver _veh != _x) then
			{
				_prefix = "G:";
				_color = [0,0,1,0.6];
			};
			_pos = visiblePosition _x;
			if(_pos distance (visiblePosition (driver _veh)) > 0.1 || driver _veh == _x) then
			{
				if(driver _veh == _x) then
				{
					_maxSlots = getNumber(configfile >> "CfgVehicles" >> typeof _veh >> "transportSoldier");
					_freeSlots = _veh emptyPositions "cargo";
				drawIcon3D ["", _color, [_pos select 0,_pos select 1,(_pos select 2) + 2], 0, 0, 0,  format["%1%2(%3/%4)",_prefix,name _x,(_maxSlots-_freeSlots),_maxSlots], 0, F_SIZE_NAMETAGS, F_FONT_NAMETAGS];
				}
				else
				{
					drawIcon3D ["", _color, [_pos select 0,_pos select 1,(_pos select 2) + 2], 0, 0, 0,  format["%1%2",_prefix,name _x], 0, F_SIZE_NAMETAGS, F_FONT_NAMETAGS];
				};
			}
			else
			{
				if(_x == gunner _veh) then
				{
					_pos = _veh modeltoworld (_veh selectionPosition "gunnerview");
					_visPos = visiblePosition _x;
					drawIcon3D ["", _color, [_pos select 0,_pos select 1,(_visPos select 2) + 2], 0, 0, 0,  format["%1%2",_prefix,name _x], 0, F_SIZE_NAMETAGS, F_FONT_NAMETAGS];
				}
				else
				{
					_pos = visiblePosition _x;
					_angle = (getdir _veh)+180;
					_pos = [((_pos select 0) + sin(_angle)*(0.6*_inc)) , (_pos select 1) + cos(_angle)*(0.6*_inc),_pos select 2];
					drawIcon3D ["", _color, [_pos select 0,_pos select 1,(_pos select 2) + 1.5], 0, 0, 0,  format["%1%2",_prefix,name _x], 0, F_SIZE_NAMETAGS, F_FONT_NAMETAGS];
					_inc = _inc + 1;
				};
			};

		} foreach crew _veh;
	};
} foreach _ents;
};
}
];

