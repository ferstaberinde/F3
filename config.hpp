class WS
	{

		class debug
		{
			file = "ws_fnc\dbg";
			class debugText {};
			class typeCheck {};
			class clipboardCode {};
			class copyPos {};
			class countUnits {};
			class debugTriggers {postInit = 1;};
		};
		class tools
		{
			file = "ws_fnc\tools";
			class selectRandom {};
			class gameCheck {preInit=1;};
			class collectMarkers {};
			class collectObjects {};
			class collectObjectsNum {};
			class collectBuildings {};
			class loadVehicle {};
			class checkHC {};
			class showFPS {};
			class nearPlayer {};
			class listPlayers {};
			class setGVar {};
			class isWallInDir {};
		};
		class effects
		{
			file = "ws_fnc\effects";
			class createTripflare {};
			class createLightning {};
			class createCAS {};
			class createOrdnance {};
		};
		class misc
		{
			file = "ws_fnc\misc";
			class switchLights {};
			class attachLight {};
			class attachChem {};
			class attachIR {};
			class broadcast {};
			class showIntro {};
		};
		class getPos
		{
			file = "ws_fnc\getPos";
			class getPos {};
			class getBPos {};
			class getEPos {};
			class nearestRoadPos {};
			class nearestLandPos {};
			class getPosInArea {};
		};
		class AI
		{
			file = "ws_fnc\AI";
			class createGroup {};
			class createVehicle {};
			class createGarrison {};
			class betterVehicle {};
			class enterBuilding {};
			class taskDefend {};
			class taskCrew {};
			class taskAmbush {};
			class taskArtilleryFire {};
			class taskLand {};
			class taskConvoy {};
			class addWaypoint {};
			class setAIMode {};
			class setInsidePos {};
		};
		class cache
		{
			file = "ws_fnc\cache";
			class cInit {};
			class gCache {};
			class gUncache {};
			class cTracker {};
		};

		class init {
			class init {file = "ws_fnc\ws_fnc_init.sqf";preInit = 1;};
		};

	};