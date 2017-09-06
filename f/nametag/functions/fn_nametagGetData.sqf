//====================================================================================
//
//	fn_nametagUpdate.sqf - Updates values for F3 nametags
//							Intended to be run each frame.
//
//	> 	_data = [_player,_playerGroup,_cameraPositionAGL,_cameraPositionASL,_entities,
//		false] call f_fnc_nametagGetData;	<
//
//		Returns [_names,_data].
//		Names is an array of references to units (CAManBase).
//		Data is nametag data, for each.
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initializing variables.
//------------------------------------------------------------------------------------

params ["_player","_playerGroup","_cameraPositionAGL","_cameraPositionASL",
		"_entities","_isCursor"];

// _player (object CAManBase): Current player that will be rendering tags.
// _playerGroup: Group of said player.
// _cameraPositionAGL (positionAGL array [[],[],[]]): Current position of player camera.
// _cameraPositionASL (positionASL array [[],[],[]]): Current position of player camera.
// _entities (array of objects CAManBase or vehicle): Entities tags will be processed for.
// _isCursor (boolean): Flag signaling that said entities are under cursor.


//------------------------------------------------------------------------------------
//	Establishing arrays to be filled with unit names and unit data, respectively.
//------------------------------------------------------------------------------------

// TODO: Do these need to be private?
private _names= [];
private _data = [];

//	Temporary fix for zoom not being in here.
private _zoom = 1;


//------------------------------------------------------------------------------------
//	Main loop. Fills above arrays with data for each entity in _entities.
//------------------------------------------------------------------------------------

//	For every entity in _entities...
{
	//	Store said entity. It may be a vehicle (with multiple people inside), and it
	//	may just be a single unit. We do not know, so we will just process data for
	//	each of the "vehicles" (or units) "crew" (or self).
	_entity = _x;
	
	if !(_entity in allUnitsUAV) then // TODO: Find a better solution for this.
	{
		{
			//	Reset variables used for each unit.
			_locationData = {};
			_role = "";
			_show = false;
			_drawRoleAndGroup = false;
			_isCommander = false;
			_isPassenger = false; // TODO : Find a smoother solution for this.
			
			if !(_x isEqualTo _player) then
			{
				//	If the unit is NOT in a vehicle...
				if (isNull objectParent _x) then
				{
					//	Get the data that will be processed (later) to determine where
					//	to draw the nametag. Either their chest, or above their head.
					_locationData = 
					if !F_NT_FONT_HEIGHT_ONHEAD
					then { {_x modelToWorldVisual (_x selectionPosition "spine3")} }
					else { {_x modelToWorldVisual (_x selectionPosition "pilot")
							vectorAdd [0,0,((0.2 + (((_cameraPositionAGL distance _x) * 1.5 * 
							F_NT_FONT_SPREAD_BOTTOM_MULTI)/_zoom)))]} };
					
					_isCommander = true;
					
					//	If the unit is NOT in a vehicle and NOT under the cursor...
					if !_isCursor then
					{
						//	Get the location of that unit...
						_targetPositionAGL = call _locationData;
						_targetPositionASL = AGLtoASL _targetPositionAGL;
						
						//	...and check...
						if
						(
							// ( If the man is within the boundaries of the screen )
							!(worldToScreen _targetPositionAGL isEqualTo []) &&
							// AND ( If the game can draw a line from the player to the man without hitting anything )
							{ lineIntersectsSurfaces [_cameraPositionASL, _targetPositionASL, _player, _x] isEqualTo [] }
						)
						//	If those criteria are met, let the system know that the tag will be shown.
						then { _show = true };
					}
					else
					{
						//	If the unit is NOT in a vehicle but IS under the cursor,
						//	show it, and let the system know that the role and group
						//	should be rendered.
						_show = true;
						_drawRoleAndGroup = true;
					};
				}
				
				//	Otherwise (if the unit IS in a vehicle)...
				else
				{
					//	The vehicle is the thing we're processing the crew for.
					_vehicle = vehicle _x; //objectParent _x
					
					//	Depending on where the unit is in a vehicle, store it's 'role.'
					_role = call
					{
						if ( commander	_vehicle isEqualTo _x ) exitWith {"Commander"};
						if ( gunner		_vehicle isEqualTo _x ) exitWith {"Gunner"};
						if ( !(driver	_vehicle isEqualTo _x)) exitWith {""};
						if ( driver		_vehicle isEqualTo _x && {!(_vehicle isKindOf "helicopter") && {!(_vehicle isKindOf "plane")}} ) exitWith {"Driver"};
						if ( driver		_vehicle isEqualTo _x && { (_vehicle isKindOf "helicopter") || { (_vehicle isKindOf "plane")}} ) exitWith {"Pilot"};
						""
					};
					
					//	The location data is different for vehicles, since many vehicle
					//	positions do not work properly with modelToWorldVisual.
					_locationData =
					{ ASLtoAGL (getPosASLVisual _x) vectorAdd [0,0,(0.4)] };
					
					//	Use the above location data to get the unit's location.
					_targetPositionAGL = call _locationData;
					_targetPositionASL = AGLtoASL _targetPositionAGL;
					
					//	If the unit has a role (isn't a passenger) then...
					if !(_role isEqualTo "") then
					{
						//	...if it's effectively the commander of the vehicle...
						if ( effectiveCommander _vehicle isEqualTo _x ) then
						{
							//	...set a flag that lets the system know if a player has this
							//	vehicle under his cursor from far away, only this guy should
							//	be rendered.
							_isCommander = true;
							
							//	Also, if the missionmaker has configured vehicle information
							//	to be shown, store that for later.
							if F_NT_SHOW_VEHICLEINFO then
							{
								//	Get the vehicle's friendly name from configs.
								_vehicleName = format ["%1",getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayname")];
								
								//	Get the maximum number of (passenger) seats from configs.
								_maxSlots = getNumber(configfile >> "CfgVehicles" >> typeof _vehicle >> "transportSoldier") + (count allTurrets [_vehicle, true] - count allTurrets _vehicle);
								
								//	Get the number of empty seats.
								_freeSlots = _vehicle emptyPositions "cargo";

								//	If meaningful, append vehicle name.
								if !(_vehicleName isEqualTo "") then
								{ _role = format ["%1 %2",_vehicleName,_role]};
								
								//	If meaningful, append some info on seats onto the vehicle info.
								if (_maxSlots > 0) then 
								{ _role = format["%1 [%2/%3]",_role,(_maxSlots-_freeSlots),_maxSlots]; };
							};
							
							
						};
						
						//	If the unit is the gunner and is uncomfortably close to the driver (many Arma APCs
						//	without interiors do this), then render the nametag where the turret is.
						if ( _role isEqualTo "Gunner" && {_targetPositionASL distance (getPosASLVisual(driver _vehicle)) < 0.5} ) then
						{
							_locationData =
							{ _vehicle modelToWorldVisual (_vehicle selectionPosition "gunnerview") };
						};
						
						//	If the unit's location is on-screen...
						if !(worldToScreen _targetPositionAGL isEqualTo []) then 
						{
							//	Then show it.
							_show = true; 
							
							//	If it's player's vehicle, or if it's under the cursor,
							//	then draw the role and group, too.
							if ( _vehicle isEqualTo vehicle _player || {_isCursor} ) then
							{ _drawRoleAndGroup = true };
						};
					}
					
					//	Otherwise (if it IS a passenger)...
					else
					{
						if
						(
							// ( If the man is within the boundaries of the screen )
							!(worldToScreen _targetPositionAGL isEqualTo []) &&
							// AND ( If the game can draw a line from the player to the man without hitting anything )
							{ lineIntersectsSurfaces [_cameraPositionASL, _targetPositionASL, _player, _x] isEqualTo [] } &&
							{_targetPositionAGL distance (ASLToAGL getPosASLVisual(driver _vehicle)) > 0.5}
						)
						then 
						{
							//	Don't draw the role and group no matter what.
							_isPassenger = true;
							_show = true;
						};
					}
				};
				
				//----------------------------------------------------------------------------
				//	If the tag's going to be shown, get and add the data.
				//----------------------------------------------------------------------------
				
				//	If it's shown...
				if _show then
				{
					//	Get the unit's name.
					_name = name _x;
					
					//	Default the unit's nametag color to the mission default.
					_nameColor =+ F_NT_FONT_COLOR_DEFAULT;
					
					//	Get the unit's group.
					_unitGroup = group _x;
					
					//	If the unit is in the same group as the player,
					//	then erase the group tag. It does not need to be shown.
					_sameGroup = (_unitGroup isEqualTo _playerGroup);
					_groupName = if !_sameGroup then { groupID _unitGroup } else { "" };

					//	...For normal people...
					if (_role isEqualTo "") then 							
					{
						//	Grab the variable set in F3 AssignGear, if present.
						//	If it's not there, grab the possibly-ugly name from configs.
						_role = (_x getVariable ["f_var_assignGear_friendly",
								getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayname")]);
					}
					//	...and for vehicle crew, where a role is already present.
					else { _nameColor =+ F_NT_FONT_COLOR_CREW };

					//	For units in the same group as the player, set their color according to color team.
					if _sameGroup then 
					{
						_team = assignedTeam _x;
						_nameColor = switch _team do 
						{
							case "RED": 	{	+F_NT_FONT_COLOR_GROUPR	};
							case "GREEN": 	{	+F_NT_FONT_COLOR_GROUPG	};
							case "BLUE": 	{	+F_NT_FONT_COLOR_GROUPB	};
							case "YELLOW": 	{	+F_NT_FONT_COLOR_GROUPY	};
							default			{	+F_NT_FONT_COLOR_GROUP		};
						};
					};
						
					//	Huck all this data into an array...
					_unitData = [];
					_unitData pushBack _x;
					_unitData pushBack _entity;				// Index 0
					_unitData pushBack _name;				// Index 1			
					_unitData pushBack _nameColor;			// Index 2
					_unitData pushBack _locationData;		// Index 3
					_unitData pushBack _role;				// Index 4
					_unitData pushBack _groupName;			// Index 5
					_unitData pushBack _drawRoleAndGroup;	// Index 6
					_unitData pushBack _isPassenger;
					_unitData pushBack _isCommander;
					
					//	...Then add the unit's name to the name array...
					_names pushBack _x;
					
					// ...and the unit's data to the data array.
					_data append [_unitData];
				};
			};
		} forEach (crew _entity);
	};
} count _entities;


//------------------------------------------------------------------------------------
//	Returns arrays of names and data for all valid entities.
//------------------------------------------------------------------------------------

[_names,_data]