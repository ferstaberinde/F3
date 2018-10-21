// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

//add aparachute as backpack and restore the old backpack on landing

private ["_bp","_bpi"];
params [
	["_unit", objNull, [objNull]]
];
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
