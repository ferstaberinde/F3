/* ws_fnc_taskConvoy
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Norrin's convoy script for inspiration and guidance: http://forums.bistudio.com/showthread.php?152279-norrin-s-ArmA2-scripts-ported-to-ArmA3
You can find a video tutorial here: http://youtu.be/_aELNA7j__c

FEATURE
The passed vehicles will follow the given route to it's destination, where they will disembark and take sentry waypoints.
The convoy will follow any given path and dismount on enemy contact.

RETURNS
true once convoy has reached the destination or made contact

USAGE
Place an ungrouped selection of vehicles. All trailing vehicles should share the name of the leading vehicle followed by _n, where n is an incrementing number (e.g.: veh, veh_1, veh_2).
Place markers indicating the convoy route, ideally on roads. All markers should share the name of the first marker followed by _n, where n is an incrementing number (e.g.: mkr, mkr_1, mkr_2).
You can change which waypoint type the units will be assigned on dismounting below as _finalWP

Minimal:
[leadingVehicle,"firstMarker"] spawn ws_fnc_taskConvoy

Full:
[leadingVehicle,"firstMarker",speedLimit] spawn ws_fnc_taskConvoy

PARAMETERS
1. The leading vehicle (all other vehicles should share the same naming template) 					 	| MANDATORY - object
2. The first marker indicating the convoy route (all other markers should share the naming template) 	| MANDATORY - can be marker, object or positional array
3. Speed limit in km/h (the slower the more reliably the convoy will move) 								| OPTIONAL - any number (default: 14)

EXAMPLE
[cv,"cvwp"] spawn ws_fnc_taskConvoy - All vehicles sharing the cv-name (cv,cv_1,cv_2...) would follow the route indicated by the markers sharing the "cvwp"-name ("cvwp","cvwp_1","cvwp_2"...)

*/

_leadv = [_this,0,objNull] call BIS_fnc_param;
_marker = [_this,1,""] call BIS_fnc_param;
_speedLimit = [_this,2,15] call BIS_fnc_param;

// What waypoint-type the final/combat waypoint will be. Sentry or Hold work best
_finalwp = "SENTRY";

// Exit the script if any of the required variables is invalid
if (isNull _leadv || _marker == "" || !local _leadV) exitWith {};

_convoy = _leadv call ws_fnc_collectObjectsNum;
_waypoints = _marker call ws_fnc_collectMarkers;
_run = true;

// Check if the convoy is in a condition to move at all
if (({!canMove _x || !alive _x || (!isNull (_x findNearestEnemy (getPosATL _x)))} count _convoy) > 0) then {_run = false;};

// Setup convoy mode
{
	[(group (driver _x)),"SAFE","LIMITED"] call ws_fnc_setAIMode;
} forEach _convoy;

// As long as the convoy isn't threatened, keep it moving
while {_run} do {

	{
		_wp =  (_waypoints select 0);
		_veh = _x;

		// Set the destination for the leading vehicle
		if (_veh == _leadv) then {

			// If there's sufficient distance from the next waypoint
			if ((_leadv distance (getMarkerPos _wp)) > 25 || _leadv getVariable ["ws_destination",""] == "") then {

				// And the next waypoint isn't already set as destination
				if (_leadv getVariable ["ws_destination",""] != _wp) then {
					// Then give the order to move to the next waypoint and set it as destination on the leading vehicle
					{_x doMove (getMarkerPos _wp)} forEach _convoy;
					_leadv setVariable ["ws_destination",_wp];
				};

			// If we are within distance of the next waypoint, remove the current waypoint and recount the waypoint array to exit if it is depleted
			} else {
				_waypoints deleteAt 0;
				if (count _waypoints == 0) exitWith {_run = false; _leadV setVariable ["ws_destination",""];};
			};
		};


		// Control the speed of all vehicles in the convoy (thanks to Norrin for dealing with the math)
		_vfront = objNull;
		_vback = objNull;

		if (_forEachIndex-1 >= 0) then {
			_vfront = _convoy select (_forEachIndex-1);
		};

		if (_forEachIndex+1 < count _convoy) then {
			_vback = _convoy select (_forEachIndex+1);
		};

		_dir = getDir _veh;
		_veh limitSpeed _speedLimit;

		// If the vehicle in front is going under the speed limit and it's a bit too close, limit the vehicle's speed as well
		if (!isNull _vfront && {_veh distance _vfront < 15}) then {
				if (speed _vfront < _speedLimit) then {
					_veh limitSpeed (speed _vfront);
				};

				if (((sin _dir) * (velocity _veh select 0)) > 1) then {_veh setVelocity [(velocity _veh select 0) - (2 * (sin _dir)), (velocity _veh select 1), velocity _veh select 2]};
				if (((cos _dir) * (velocity _veh select 1)) > 1) then {_veh setVelocity [(velocity _veh select 0), (velocity _veh select 1) - (2 * (cos _dir)), velocity _veh select 2]};
		};

		if (!isNull _vback && {_veh distance _vback > 50}) then {
				if (_veh distance _vback <= 150) then {
					if (((sin _dir) * (velocity _veh select 0)) > 3) then {_veh setVelocity [(velocity _veh select 0) - (1 * (sin _dir)), (velocity _veh select 1), velocity _veh select 2]};
					if (((cos _dir) * (velocity _veh select 1)) > 3) then {_veh setVelocity [(velocity _veh select 0), (velocity _veh select 1) - (1 * (cos _dir)), velocity _veh select 2]};
				} else {
					if (((sin _dir) * (velocity _veh select 0)) > 1) then {_veh setVelocity [(velocity _veh select 0) - (2 * (sin _dir)), (velocity _veh select 1), velocity _veh select 2]};
					if (((cos _dir) * (velocity _veh select 1)) > 1) then {_veh setVelocity [(velocity _veh select 0), (velocity _veh select 1) - (2 * (cos _dir)), velocity _veh select 2]};
				};
		};

		// If the vehicle is way over limit, reset velocity
		/*if (speed _veh > _speedLimit *1.5) then {
			_veh setVelocity [(11 * (sin _dir)), (11 * (cos _dir)), velocity _veh select 2];
		};*/

		// If for some reason the vehicle is halted, reset speed limit to the original value
		if (speed _veh < 0.1) then {
			_veh limitSpeed _speedLimit;
			_veh doMove (getMarkerPos _wp);
		};

	} forEach _convoy;

	// If convoy was engaged exit the loop and set the convoy to combat mode
	if (({!canMove _x || !alive _x || (!isNull (_x findNearestEnemy (getPosATL _x)))} count _convoy) > 0) then {
		_run = false;
		{[(group (driver _x)),"COMBAT","NORMAL"] call ws_fnc_setAIMode;} forEach _convoy;
	};

	uisleep 0.5;
};

// Once the convoy has reached the destination or is being engaged have all groups which aren't crew disembark
{
_veh = _x;
_veh doMove (getPosATL _veh);

	{
		// If the unit is the vehicle driver, check if it's a combat vehicle
		if (_x == driver _veh) then {

			// If yes, only give it a sentry WP
			if (canFire _veh) then {
				[(group _x),_veh,[_finalwp,5]] call ws_fnc_addWaypoint;
			} else {
				// If the vehicle can't shoot, let the crew dismount too
				(group driver _veh) leaveVehicle _veh;
				[(group _x),_veh,[_finalwp,15]] call ws_fnc_addWaypoint;
			};
		};

		// If the unit's in a cargo index and a group leader, order the whole group out
		if (_veh getCargoIndex _x != -1 && _x == leader group _x) then {
			(group _x) leaveVehicle _veh;
			[group _x,_veh,[_finalwp,50]] call ws_fnc_addWaypoint;
			[(group _x),"AWARE","DIAMOND","YELLOW"] call ws_fnc_setAIMode;
		};

	} forEach crew _veh;

} forEach _convoy;

true