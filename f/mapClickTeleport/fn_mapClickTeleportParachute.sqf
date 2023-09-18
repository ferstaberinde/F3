// F3 - Mission Maker Teleport
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// If a vehicle is teleported, a parachute is attached at a given height.
// If it's a player, a parachute is added as a backacpk.
// After landing, the old backpack is restored.

params [["_obj", objNull, [objNull]]];

private _heightOpenParachute = 200;

if ( ! (_obj isKindOf "CAManBase") ) then {

	// Set the vehicle up-right to make sure it doesn't drift away too much
	_obj setVectorUp [0, 0, 1];

	waitUntil { sleep 0.1; getPos _obj select 2 < _heightOpenParachute };
	_obj engineOn false;

	//Set the vehicle captive to prevent AT units from shooting it down immediately
	_obj setCaptive true;

	// Create the parachute, and attach the vehicle.
	private _chute = createVehicle ["B_Parachute_02_F", getPos _obj, [], 0, "NONE"];
	_chute setDir getDir _obj;
	_obj attachTo [_chute, [0, 0, 0.2]];

	// Once near the ground, detach the parachute  and gently place the vehicle on the ground
	waitUntil { sleep 0.1; getPos _obj select 2 < 1.5 || {isNull _chute || {! alive _chute}} };
	_obj allowDamage false;
	detach _obj;
	_obj setVectorUp [0, 0, 1];
	_obj setVelocity [0, 0, -1];
	_obj setPos [getPos _obj select 0, getPos _obj select 1, 0.5];
	_obj allowDamage true;

	// Disable captivity to make the vehicles a viable target again
	_obj setCaptive false;

	// Let the parachute fall down
	_chute setVelocity [0 - sin windDir * 5, 0 - cos windDir * 5, 0];
	_chute disableCollisionWith _obj;

	// Wait before removing the parachute, to allow it to die naturally
	sleep 10;
	if (!isNull _chute) then {
		deleteVehicle _chute;
	};

} else {

	// Save the backpack and its items
	private _backpack = backpack _obj;
	private _backpackItems = backPackItems _obj;

	// Replace the backpack with a parachute
	removeBackpack _obj;
	_obj addBackpack "B_parachute";

	// Once on the ground, remove the parachute
	// and re-add the backpack with all its content
	waitUntil {sleep 0.1; isTouchingGround _obj};
	if (alive _obj) then {
		removeBackpack _obj;
		_obj addBackPack _backpack;
		{
			(unitbackpack _obj) addItemCargoGlobal [_x,1];
		} forEach _backpackItems;
	};

};
