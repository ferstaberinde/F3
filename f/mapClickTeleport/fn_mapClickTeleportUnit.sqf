// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textSelect","_textDone"];

// ====================================================================================

// SET KEY VARIABLES

f_telePositionSelected = false;
if (isNil "f_var_mapClickTeleport_Used") then {f_var_mapClickTeleport_Used = 0};

// ====================================================================================

// TELEPORT FUNCTIONALITY
// Open the map for the player and display a notification, then set either the player's vehicle
// or the unit to the new position. If the group needs to be teleported too, set the group's position
// as well.

["MapClickTeleport",[f_var_mapClickTeleport_textSelect]] call BIS_fnc_showNotification;
openMap [true, false];
onMapSingleClick "f_var_mapClickTeleport_telePos = _pos; f_telePositionSelected = true";
waitUntil {f_telePositionSelected};

// HALO - set height
// If a HALO height is set, modify the clicked position accordingly

if (f_var_mapClickTeleport_Height != 0) then {
	f_var_mapClickTeleport_telePos = [f_var_mapClickTeleport_telePos select 0,f_var_mapClickTeleport_telePos select 1,f_var_mapClickTeleport_Height];
};

// Move player
// If the player is in a vehicle and not HALO-ing, the complete vehicle is moved. Otherwise the player is teleported.

if (vehicle player != player && f_var_mapClickTeleport_Height == 0) then {
	(vehicle player) setPos (f_var_mapClickTeleport_telePos findEmptyPosition [0,150,typeOf (vehicle player)]);
} else {
	player setPos f_var_mapClickTeleport_telePos;
};

// Move group
// If enabled, the player's group is moved next to him

if (f_var_mapClickTeleport_GroupTeleport) then {
	sleep 0.1;
	{
		[[_x,f_var_mapClickTeleport_telePos],"f_fnc_mapClickTeleportGroup",_x] spawn BIS_fnc_MP;
	} forEach ((units group player) - [player]);
};

openMap false;

["MapClickTeleport",[f_var_mapClickTeleport_textDone]] call BIS_fnc_showNotification;

// ====================================================================================

// HALO functionality
// If the players are parajumping spawn the following code to add a backpack and restore the old backpack on landing

if (f_var_mapClickTeleport_Height > 0) then {
	[player] spawn {
		private ["_unit","_bp","_bpi"];
		_unit = _this select 0;
		_bp = backpack _unit;
		_bpi = backPackItems _unit;

		removeBackpack _unit;
		_unit addBackpack "B_parachute";
		waitUntil {sleep 0.1;isTouchingGround _unit;};
		removeBackpack _unit;
		_unit addBackPack _bp;
		{
			(unitbackpack _unit) addItemCargoGlobal [_x,1];
		} forEach _bpi;
	};
};

// ====================================================================================

// REMOVE AND READ ACTION
// Remove the action and re-add if we have uses left (or if they are infinite)

player removeAction f_mapClickTeleportAction;
f_var_mapClickTeleport_Used = f_var_mapClickTeleport_Used + 1;

if (f_var_mapClickTeleport_Uses == 0 || f_var_mapClickTeleport_Used < f_var_mapClickTeleport_Uses) then {
	f_mapClickTeleportAction = player addaction [f_var_mapClickTeleport_textAction,{[] spawn f_fnc_mapClickTeleportUnit},"", 0, false,true,"","_this == player"];
};
