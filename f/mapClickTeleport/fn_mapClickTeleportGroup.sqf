// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_pos","_units","_textDone","_height"];

// ====================================================================================

// SET KEY VARIABLES

_unit = _this select 0;
_pos = _this select 1;
_textDone = localize "STR_f_mapClickTeleportDone";
_height = if (f_var_mapClickTeleport_Height == 0) then {(_pos select 2)} else {f_var_mapClickTeleport_Height};

// ====================================================================================

// LOCALITY CHECK
// The component should not run anywhere else but where the unit is local by default
// This check is a redundancy to ensure this

if !(local _unit) exitWith {};

// ====================================================================================

// TELEPORT UNITS
// Loop through the group's units (excluding the leader) and check if they are local, if true teleport
// them next to the leader and display a notification for players

_unit setPos [((_pos select 0) + 3 + random 3),((_pos select 1) + 3 + random 3),_height];

// Display a notification for players
if (_unit == vehicle player) then {["MapClickTeleport",[_textDone]] call BIS_fnc_showNotification};

// HALO - BACKPACK
// If unit is parajumping, spawn the following code to add a parachute and restore the old backpack after landing

if (f_var_mapClickTeleport_Height > 0) then {
	[_unit] spawn {
		private ["_unit","_bp","_bpi"];
		_unit = _this select 0;
		_bp = backpack _unit;
		_bpi = backPackItems _unit;

		removeBackpack _unit;
		_unit addBackpack "B_parachute";
		waitUntil {sleep 0.1;isTouchingGround _unit;};
		if (alive _unit) then {
			removeBackpack _unit;
			_unit addBackPack _bp;
			{
			   (unitbackpack _unit) addItemCargoGlobal [_x,1];
			} forEach _bpi;
		};
	};
};
