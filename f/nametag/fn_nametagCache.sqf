//====================================================================================
//
//	fn_nametagCache.sqf - Updates global cache of near entities and their data.
//						  Updates some other stuff, too.
//
//	> call f_fnc_nametagCache; <
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	If the nametag system is on, check all the stuff we need to check!
//------------------------------------------------------------------------------------
	
if F_NT_NAMETAGS_ON then
{
	//	Collect the current player.
	_player = player;
		
	//	Check the day night cycle...
	F_NT_VAR_NIGHT = if F_NT_NIGHT then
	{ linearConversion [0, 1, sunOrMoon, 0.25+0.5*(currentVisionMode _player),1,true]; } 
	else { 1 };
	
	//	Check the day night cycle...
	F_NT_VAR_NIGHT = if F_NT_NIGHT then
	{ linearConversion [0, 1, sunOrMoon, 0.25+0.5*(currentVisionMode _player),1,true]; } 
	else { 1 };

	//--------------------------------------------------------------------------------
	//	If not set to only draw the cursor, collect nearEntities.
	//--------------------------------------------------------------------------------

	if !F_NT_DRAWCURSORONLY then
	{
		//	Reset the data variable.
		_data = [];

		//	Collect the player's group.
		_playerGroup = group _player;

		//	Get the position of the player's camera.
		_cameraPositionAGL = positionCameraToWorld[0,0,0];
		_cameraPositionASL = AGLtoASL _cameraPositionAGL;
		
		//	Collect all nearEntities of the types we want.
		_entities = 
		_player nearEntities [["CAManBase","LandVehicle","Helicopter","Plane","Ship_F"], 
		((F_NT_DRAWDISTANCE_NEAR+(F_NT_DRAWDISTANCE_NEAR*0.25)+1)*F_NT_VAR_NIGHT)]	
		select 	
		{
			!(_x isEqualTo _player) &&
			{(
				(side group _x isEqualTo side group _player) 	// 0.0018ms
				//((side _x getFriend side player) > 0.6) 		// 0.0024ms
				//|| {(group _x isEqualTo group player)}
			)} 
		};

		//	Collect each filter entities' data.
		_data = [_player,_playerGroup,_cameraPositionAGL,_cameraPositionASL,_entities,false]
		call f_fnc_nametagGetData;
		
		//	Push all those names and their data to the global cache.
		F_NT_CACHE =+ _data;
	}
	else
	{ F_NT_CACHE = [[],[]] };
};