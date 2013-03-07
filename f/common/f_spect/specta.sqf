private ["_player", "_killer", "_seagull", "_debugPlayer", "_markers", "_name", "_setOriginalSide", "_OriginalSide", "_RatingDelta", "_ehVehicles", "_t", "_disp", "_cCamera", "_cTarget", "_cName", "_cCamerasBG", "_cTargetsBG", "_cMap", "_cMapFull", "_cDebug", "_pos", "_foo", "_nNoDialog", "_lastUpdateMarkers", "_lastUpdateMarkerTypes", "_lastUpdateTags", "_allUnits", "_allVehicles", "_newUnits", "_newVehicles", "_fh", "_kh", "_waitUnits", "_m", "_s", "_rate", "_doMarkerTypes", "_mapFull", "_mappos", "_markedVehicles", "_i", "_u", "_type", "_icon", "_map", "_tt", "_bpos", "_bird"];

//
// Spectating Script for Armed Assault
// by Kegetys <kegetys [ät] dnainternet.net>
//

StartLoadingScreen ["Initializing Spectator Script..."];
disableSerialization;

_player = _this select 0;
_killer = _this select 1;
_seagull = _this select 2;

// if ( isNil "_seagull" )  then  { _seagull = "noWait";};
VM_scriptName="specta";

_debugPlayer=objNull;
if ( f_var_debugMode == 1 ) then {
	_debugPlayer=player;
};

// If seagull is valid we came from the respawn scene
if(typeName _seagull == "OBJECT") then {
	_seagull setpos[-1000, -1000, 1000];
	sleep 1.5;
	titleCut["","BLACK OUT", 1.5];
};
_seagull = "noWait";

// Globals etc.
vm_count = 0; //Debug loop counter
debugX = [];
NORRN_noMarkersUpdates = true; //Added for no marker update - NORRN
spectate_events = compile preprocessFileLineNumbers ("f\common\f_spect\specta_events.sqf");
If (isNil "OldNVGMethod") then { OldNVGMethod = false };
If (isNil "VM_CommitDelay") then { VM_CommitDelay = 0 };
VM_CurrentCameraView = "";
KEG_Spect_Init = false;
KEGs_target = objNull; 
KEGsMouseButtons = [false, false];
KEGsMouseScroll = 0;
KEGsMouseCoord = [0.5, 0.5];
KEGsUseNVG = false;
KEGsMissileCamActive = false;
KEGsUseMissileCam = true;
KEGsMarkerNames = false; // True = display marker names and arrows
KEGsMarkerType = 1; // 0 = disabled, 1 = names, 2 = types
KEGsTags = false; // Particlesource tags
KEGsAIfilter = false; // Filter AI units (only players displayed)
KEGsDeadFilter = false; // Filter Unknown Dead units (only Alive players displayed)
KEGsClientAddonPresent = false; // Is client-side addon present?
KEGsMarkerSize = 1.0; // Full map marker size
KEGsMinimapZoom = 0.5; // Minimap zoom
KEGsSelect = 0; // Offset Used to change selected target
KEGsCurrentSelectIdx = 0; // Current Index of the selected target
KEGs1stGunner = false; // Gunner view on 1st person camera?
KEGsDroppedCamera = false; // Free camera dropped (non-targeted with free motion)?
KEGsCamForward = false;
KEGsCamBack = false;
KEGsCamLeft = false;
KEGsCamRight = false;
KEGsNeedUpdateLB = false;
mouseDeltaX = 0;
mouseDeltaY = 0;
sdistance = 1; // camera distance
fangle  = 0; // Free camera angle
fangleY = 15;
KEGs_flybydst = 35; // Distance of flyby camera (adjusted based on target speed)
szoom = 0.976;
_markers = []; // Map markers showing positions of all units
KEGsTagSources = []; // Particle sources for tags
KEGs_lastTgt = 0;
KEGs_nameCache = []; // Used to store valid names since name command cannot be trusted
_name = "Unknown";
CheckNewUnitsReady = true;
RefreshListReady = true;

maxDistance = 50;	// Maximum distance for camera
maxZoom = 0.05;		// Maximum zoom level
minZoom = 2;

// Unit sides shown - Show all if sides not set
if(isNil "KEGsShownSides") then {
	KEGsShownSides = [west, east, resistance, civilian];
};

// In an effort to compensate for Renegades (players with ratings of less than -2000) we will add this Renegage fix
//Renegade Fix add function _setOriginalSide - ViperMaul 
VM_CheckOriginalSide =  {

	_x = _this;

	_OriginalSide = _x getVariable "KEG_OriginalSide";
	if (isNil "_OriginalSide") then
	{
		_RatingDelta = abs(Rating _x);
		_x addRating _RatingDelta; 
		_x setVariable ["KEG_OriginalSide",(side _x)];
		_x addRating -(_RatingDelta);
	};
	_OriginalSide
};


deathCam = [];
_ehVehicles = []; // Used to keep track of added eventhandlers
KEGsAllUnits = [];

// Create trigger for retrieving all vehicles
_t = createTrigger["EmptyDetector", (player modelToWorld [0,0,0]) ];
_t setTriggerType "NONE";
_t setTriggerStatements ["this", "KEGsAllUnits = thislist", ""];
_t setTriggerArea[50000, 50000, 0, false];
_t setTriggerActivation["ANY", "PRESENT", false];

// Wait until trigger assigns the array
waitUntil{count KEGsAllUnits > 0};

if(typeName _seagull != "string") then {
	sleep 1;
	titleCut ["","BLACK IN", 8];
} else {
	titleText["","BLACK IN", 0];	
};

// Create dialog & assign keyboard handler
createDialog "rscSpectate";
_disp = (findDisplay 55001);
_disp displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call spectate_events"];
_disp displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call spectate_events"];


// hide menus by default
["ToggleCameraMenu",0] call spectate_events;
["ToggleTargetMenu",0] call spectate_events;
["ToggleHelp",0] call spectate_events;

// IDC's from rsc
_cCamera = 55002;
_cTarget = 55003;
_cName = 55004;
KEGs_cLBCameras = 55005;
KEGs_cLBTargets = 55006;
_cCamerasBG = 55007;
_cTargetsBG = 55008;
_cMap = 55013;
_cMapFull = 55014;
_cDebug = 55100;
KEGs_nearest = objNull;

// Create cameras
_pos = [(player modelToWorld [0,0,0] select 0)-1+random 2, (player modelToWorld [0,0,0] select 1)-1+random 2, 2];
KEGscam_static = "camera" camCreate _pos;
KEGscam_target = "camera" camCreate _pos; // "Dummy" target camera for smooth transitions
KEGscam_free = "camera" camCreate _pos;
KEGscam_flyby = "camera" camCreate _pos;
KEGscam_topdown = "camera" camCreate _pos;
KEGscam_1stperson = "camera" camCreate _pos; // Dummy camera
KEGscam_missile = "camera" camCreate _pos; // Missile camera
KEGscam_fullmap = "camera" camCreate _pos; // Full map view camera
KEGs_cameras = [KEGscam_free, KEGscam_static, KEGscam_flyby, KEGscam_topdown, KEGscam_1stperson];
KEGs_cameraNames = ["Free", "Chase", "Flyby", "Top-down", "1st person"];
KEGs_dummy = "HeliHEmpty" createVehicleLocal [0,0,0]; // Dummy object for distance command

// Add cameras to listbox
lbClear KEGs_cLBCameras;
{lbAdd[KEGs_cLBCameras, _x]} foreach KEGs_cameraNames;

// Add separator & toggles
KEGs_cLbSeparator = lbAdd[KEGs_cLBCameras, "---"];
lbSetColor[KEGs_cLBCameras, KEGs_cLbSeparator, [0.5, 0.5, 0.5, 0.5]];
KEGs_cLbMissileCam = lbAdd[KEGs_cLBCameras, "Missile camera"];
KEGs_cLbToggleNVG = lbAdd[KEGs_cLBCameras, "Night vision"];
KEGs_cLbToggleTags = lbAdd[KEGs_cLBCameras, "Unit tags"];
KEGs_cLbToggleAiFilter = lbAdd[KEGs_cLBCameras, "Filter AI"];
KEGs_cLbToggleDeadFilter = lbAdd[KEGs_cLBCameras, "Filter Unknown (Dead)"];

KEGs_tgtIdx = 0;
KEGs_cameraIdx = 0;
showcinemaborder false;
lbClear KEGs_cLBTargets;


["EventLogAdd",["Initialize",[1,1,1,1]]] call spectate_events;

// Check for client side addon
_foo = "KEGsAddon10" createVehicleLocal[-1000,-1000,0];
//_foo = "KEGspect_bar_yellow" createVehicleLocal[-1000,-1000,0];
if(!isNull _foo) then {
	deletevehicle _foo;
	KEGsClientAddonPresent = true;	
};

// Spawn thread to display help reminder after a few seconds
[] spawn {sleep(3);if(dialog) then {cutText["\n\n\n\n\nPress F1 for help","PLAIN DOWN", 0.75]}};

KEGs_camSelLast = 0;
KEGs_tgtSelLast = 0;
mouseLastX = 0.5;
mouseLastY = 0.5;
_nNoDialog = 0;
lastCheckNewUnits = -100;
_lastUpdateMarkers = -100;
_lastUpdateMarkerTypes = -100;
_lastUpdateTags = -100;
KEGs_lastAutoUpdateLB = time;
KEGsCamPos = [0,0,0];
KEGs_cxpos = 0;
KEGs_cypos = 0;
KEGs_czpos = 0;
KEGs_cspeedx = 0;
KEGs_cspeedy = 0;
KEGs_tbase = 0.1;
KEGs_hi = 2;



// Initialize the arrays and the listboxes.
CheckNewUnits = {
			private["_vm_CheckNewUnitsNumber"];
			_debugplayer sidechat format ["Loop# %1 CheckNewUnits spawn activated",vm_count];
			CheckNewUnitsReady = false;
			RefreshListReady = false;
			_vm_CheckNewUnitsNumber = vm_count;
			_allUnits = allUnits;
			_allVehicles = Vehicles;
			
			// Avoid game logic
	
			_newUnits = _allUnits - deathCam;	
			if (count _allVehicles > 0) then {
				// Add event handlers to new vehicles
				_ehVehicles = _allVehicles;
				{
					// Add fired eventhandler for map indication
					_nn = _x getVariable "KEGsEHfired";
					if (isNil "_nn") then {
						_fh = _x addeventhandler["fired", {["UnitFired",_this] call spectate_events}];
						_x setVariable["KEGsEHfired", _fh];
					};
				} foreach _allVehicles;
			};			
			
			if(count _newUnits > 0) then {
				_debugPlayer globalchat "*New Units";
				_waitUnits = [];
				{
					if ((format["%1", _x getVariable "KEG_SPECT"]) != "true") then
					{
						// If variable not found, set it, thus unit is tagged for next update cycle
						// This way, (re)spawned units have some time to fully initialize. Name arma.rpt Error fix.
						_x setVariable ["KEG_SPECT", true];
						waitUnits set [(count _waitUnits ),_x]; // _waitUnits = _waitUnits + [_x];
					};
					
					// In an effort to compensate for Renegades (players with ratings of less than -2000) we will add this Renegage fix
					//Renegade Fix - ViperMaul
					_x call VM_CheckOriginalSide;
					
				} forEach _newUnits;
				_newUnits = _newUnits - _waitUnits;			
				
				// Add new units to end of list
				deathCam = deathCam + _newUnits;
				
				// Request listbox update
				KEGsNeedUpdateLB = true;
				
				// Create markers
				{
					// Crete marker
					_m = createMarkerLocal[format["KEGsMarker%1", count _markers], (player modelToWorld [0,0,0]) ];
					_m setMarkerTypeLocal "mil_dot";			
					_m setMarkerSizeLocal[0.4, 0.4];
					_markers set [(count _markers),_m]; // _markers = _markers + [_m];
					
					_OriginalSide = _x call VM_CheckOriginalSide;  
					
					// Set marker color
					if(_OriginalSide == west) then {_m setMarkerColorLocal "ColorBlue";};
					if(_OriginalSide == east) then {_m setMarkerColorLocal "ColorRed";};
					if(_OriginalSide == resistance) then {_m setMarkerColorLocal "ColorGreen";};
					if(_OriginalSide == civilian) then {_m setMarkerColorLocal "ColorWhite";};			
					
					// Create particle source
					_s = "#particlesource" createvehiclelocal (_x modelToWorld [0,0,0]);
					KEGsTagSources set [(count KEGsTagSources) , [_x, _s]]; //KEGsTagSources = KEGsTagSources + [[_x, _s]];
					
					// If tags are on, turn them off and back again to include new units
					if(KEGsTags) then {
						["ToggleTags",[false, (KEGs_cameras select KEGs_cameraIdx)]] call spectate_events;
						["ToggleTags",[true, (KEGs_cameras select KEGs_cameraIdx)]] call spectate_events;
					};					
				} foreach _newUnits;						
			};			
			RefreshListReady = true;
			CheckNewUnitsReady = true;	
			lastCheckNewUnits = time;
			_debugplayer sidechat format ["Loop# %1 Completed CheckNewUnits", _vm_CheckNewUnitsNumber];
		  };  // End of Spawn CheckNewUnits
		  
	


		
RefreshPlayerList = compile preprocessFileLineNumbers "f\common\f_spect\RefreshPlayerList.sqf";
FreeLookMovementHandler = compile preprocessFileLineNumbers "f\common\f_spect\FreeLookMovementHandler.sqf";
CameraMenuHandler = compile preprocessFileLineNumbers "f\common\f_spect\CameraMenuHandler.sqf";
PlayerMenuHandler = compile preprocessFileLineNumbers "f\common\f_spect\PlayerMenuHandler.sqf";

MovementCameraLoop = {

	private ["_debugPlayer", "_bb", "_foo","_l","_w","_hstr","_hstr", "_d", "_z" ];

	vm_MovementCameraLoop_count = 0;
	While { VM_SpectatorCamerasEnabled  } do {

		// Get target properties
		_bb = boundingBox vehicle KEGs_target;
		_foo = ((_bb select 1) select 2) - ((_bb select 0) select 2); // Height
		_l = ((_bb select 1) select 1) - ((_bb select 0) select 1); // Length
		_w = ((_bb select 1) select 0) - ((_bb select 0) select 0); // Width

		_hstr = 0.15;		
		KEGs_hi = (_foo*_hstr)+(KEGs_hi*(1-_hstr));
					
		// Free camera, user rotates camera around target
		_d = (-(_l*(0.3 max sdistance)));
		_z = sin(fangleY)*(_l*(0.3 max sdistance));
		KEGscam_free camSetRelPos[(sin(fangle)*_d)*cos(fangleY), (cos(fangle)*_d)*cos(fangleY), _z];
		KEGscam_free camCommit 0;
		
		
			if(KEGsDroppedCamera) then {
					// Dropped free camera, moved with WSAD keys
					if(KEGs_cameraIdx != 0) then {
						// User changed camera
						KEGsDroppedCamera = false;
					};			
				    _debugPlayer globalchat "Active Drop Camera - Checking for WSAD controls";

					// Adjust speed from buttons held down
					KEGs_spd = (sdistance max 1)*20;
					if(KEGsCamForward) then {
						KEGs_cspeedx = KEGs_cspeedx + ((KEGs_spd*KEGs_tbase)*sin fangle);
						KEGs_cspeedy = KEGs_cspeedy + ((KEGs_spd*KEGs_tbase)*cos fangle);
					};
					if(KEGsCamBack) then {
						KEGs_cspeedx = KEGs_cspeedx + ((-KEGs_spd*KEGs_tbase)*sin fangle);
						KEGs_cspeedy = KEGs_cspeedy + ((-KEGs_spd*KEGs_tbase)*cos fangle);
					};		
					if(KEGsCamLeft) then {
						KEGs_cspeedx = KEGs_cspeedx + ((KEGs_spd*KEGs_tbase)*sin (fangle-90));
						KEGs_cspeedy = KEGs_cspeedy + ((KEGs_spd*KEGs_tbase)*cos (fangle-90));
					};
					if(KEGsCamRight) then {
						KEGs_cspeedx = KEGs_cspeedx + ((-KEGs_spd*KEGs_tbase)*sin (fangle-90));
						KEGs_cspeedy = KEGs_cspeedy + ((-KEGs_spd*KEGs_tbase)*cos (fangle-90));
					};					
					// Move camera
					KEGs_cxpos = KEGs_cxpos + (KEGs_cspeedx*KEGs_tbase);
					KEGs_cypos = KEGs_cypos + (KEGs_cspeedy*KEGs_tbase);
					KEGs_czpos = 0;
					KEGs_hi = 2; // Static camera height
					_l = 2.2;
					
					// Slow down
					_bstr = 5;
					KEGs_cspeedx = KEGs_cspeedx * ((1.0-(KEGs_tbase*_bstr)) max 0);
					KEGs_cspeedy = KEGs_cspeedy * ((1.0-(KEGs_tbase*_bstr)) max 0);
					
					// Check for nearby targets
					KEGs_dummy setpos[KEGs_cxpos, KEGs_cypos, 1.5];
					_objs = [KEGs_cxpos, KEGs_cypos, 1.5] nearObjects 5;
					KEGs_nearest = objNull;
					_dist = 10;
					{
						{
							_d = KEGs_dummy distance _x;
							if(_d < _dist and _x in deathCam and alive _x) then {KEGs_nearest = _x;_dist = _d;};					
						} foreach crew _x;
					} foreach _objs;
					if(!isNull KEGs_nearest) then {KEGs_tgtIdx = deathCam find KEGs_nearest};
		} else {		
			// Set targets for all cameras
			KEGs_cxpos = (vehicle KEGs_target modelToWorld [0,0,0]) select 0;
			KEGs_cypos = (vehicle KEGs_target modelToWorld [0,0,0]) select 1;
			KEGs_czpos = (vehicle KEGs_target modelToWorld [0,0,0]) select 2;
		};
		
	
		KEGscam_target camSetPos[KEGs_cxpos, KEGs_cypos, KEGs_czpos+(KEGs_hi*0.7)];
		KEGscam_static camSetTarget KEGscam_target;	
		KEGscam_free camSetTarget[KEGs_cxpos, KEGs_cypos, KEGs_czpos+(KEGs_hi*0.6)];	
		KEGscam_flyby camSetTarget KEGscam_target;	
		KEGscam_topdown camSetTarget[KEGs_cxpos, KEGs_cypos, KEGs_czpos+(KEGs_hi*0.6)];	
		{_x camSetFov szoom} foreach KEGs_cameras;		
	
		// Static camera, follows unit from behind
		KEGscam_static camSetRelPos[sin(KEGs_dir)*(-(_l*sdistance)), cos(KEGs_dir)*(-(_l*sdistance)), 0.6*abs sdistance];

		
		// Flyby camera, no user control except zoom
		if(KEGs_target distance KEGscam_flyby > (KEGs_flybydst*1.1)) then {
			KEGs_flybydst = 20+(speed vehicle KEGs_target);
			KEGscam_flyby camSetRelPos[sin(KEGs_dir)*KEGs_flybydst, cos(KEGs_dir)*KEGs_flybydst, 1+((random KEGs_hi)*1.5)];
			KEGscam_flyby camCommit 0;	
			KEGscam_target camCommit 0;	
		};
		
		// Top-down camera
		KEGscam_topdown camSetRelPos[0.0, -0.01, 2+((0 max sdistance)*15)];
		KEGscam_topdown camCommit 0;	
	
		// Commit static and flyby cameras
		_comSpeed = 1.0 - ((speed vehicle KEGs_target)/70);
		if(_comSpeed < 0.0) then {_comSpeed = 0.0;};
		if((vehicle KEGs_target) distance KEGscam_static > 650) then {_comSpeed = 0}; // Jump immediately to distant target
		KEGscam_static camCommit _comSpeed/2;
		KEGscam_target camCommit _comSpeed/3;
		KEGscam_flyby camCommit _comSpeed;

		// NIGHT VISION HANDLING
			If (OldNVGMethod) then {
				camUseNVG KEGsUseNVG;
				if (KEGsUseNVG) then { setAperture 4; } else { setAperture -1; }; // Green Night Vision
			} else {
				if (KEGsUseNVG) then { setAperture 0.07; } else { setAperture -1;}; // White Hot Night Vision
			};
			

		// END OF NIGHT VISION HANDLING
		

		if ( f_var_debugMode == 1 ) then {
			// vm_MovementCameraLoop_count = vm_MovementCameraLoop_count + 1;
			// _debugPlayer groupchat format ["MovementCameraLoop %1, Loop# %2", VM_SpectatorCamerasEnabled, vm_MovementCameraLoop_count];
		};
	};

};		
		
call {
		
			lastCheckNewUnits = time;
			
			player setVariable ['BIS_IS_inAgony',false];
			
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 0.0;
			"dynamicBlur" ppEffectEnable false;
			
			// Avoid game logics
			_allUnits = allUnits;
			_allVehicles = Vehicles;
			_newUnits = _allUnits - deathCam;	
			
			if (count _allVehicles > 0) then {
				// Add event handlers to new vehicles
				_ehVehicles = _allVehicles;
				{
					// Add fired eventhandler for map indication
					_nn = _x getVariable "KEGsEHfired";
					if (isNil "_nn") then {
						_fh = _x addeventhandler["fired", {["UnitFired",_this] call spectate_events}];
						_x setVariable["KEGsEHfired", _fh];
					};
				} foreach _allVehicles;
			};
			if(count _newUnits > 0) then {
				_debugPlayer globalchat "*New Units";
				_waitUnits = [];
				{
					if ((format["%1", _x getVariable "KEG_SPECT"]) != "true") then
					{
						// If variable not found, set it, thus unit is tagged for next update cycle
						// This way, (re)spawned units have some time to fully initialize. Name arma.rpt Error fix.
						_x setVariable ["KEG_SPECT", true];
						_waitUnits set [(count _waitUnits ),_x];
					};
					
					// In an effort to compensate for Renegades (players with ratings of less than -2000) we will add this Renegage fix
					//Renegade Fix - ViperMaul
					_x call VM_CheckOriginalSide;
					
				} forEach _newUnits;
				// _newUnits = _newUnits - _waitUnits;	// this line is not needed for the initialization  -ViperMaul
				
				// Add new units to end of list
				deathCam = deathCam + _newUnits;
				
				// Request listbox update
				KEGsNeedUpdateLB = true;
				
				// Create markers
				{ 
					// Crete marker
					_m = createMarkerLocal[format["KEGsMarker%1", count _markers], (player modelToWorld [0,0,0]) ];
					_m setMarkerTypeLocal "mil_dot";			
					_m setMarkerSizeLocal[0.4, 0.4];
					_markers set [(count _markers),_m];
					
					_OriginalSide = _x call VM_CheckOriginalSide;  
					
					// Set marker color
					if(_OriginalSide == west) then {_m setMarkerColorLocal "ColorBlue";};
					if(_OriginalSide == east) then {_m setMarkerColorLocal "ColorRed";};
					if(_OriginalSide == resistance) then {_m setMarkerColorLocal "ColorGreen";};
					if(_OriginalSide == civilian) then {_m setMarkerColorLocal "ColorWhite";};			
					
					// Create particle source
					_s = "#particlesource" createvehiclelocal (_x modelToWorld [0,0,0]);
					KEGsTagSources set [(count KEGsTagSources) , [_x, _s]]; //KEGsTagSources = KEGsTagSources + [[_x, _s]];
					
					
					// If tags are on, turn them off and back again to include new units
					if(KEGsTags) then {
						["ToggleTags",[false, (KEGs_cameras select KEGs_cameraIdx)]] call spectate_events;
						["ToggleTags",[true, (KEGs_cameras select KEGs_cameraIdx)]] call spectate_events;
					};					
				} foreach _newUnits;						
			};
			call RefreshPlayerList;
			["Init"] call CameraMenuHandler;
			["Init"] call PlayerMenuHandler;
			["Init"] call FreeLookMovementHandler;
	
			// KEGscam_free camSetTarget[KEGs_cxpos, KEGs_cypos, KEGs_czpos+(KEGs_hi*0.6)];	
			// KEGscam_free camSetPos [(sin(fangle)*0.3)*cos(fangleY), (cos(fangle)*0.3)*cos(fangleY), 0.7];
			// KEGscam_free camSetTarget[KEGs_cxpos, KEGs_cypos, KEGs_czpos+(KEGs_hi*0.6)];	
			// KEGscam_free camCommit 0;
			
			if(count deathCam > 0 and !KEG_Spect_Init) then { _debugPlayer groupchat "Spectator Mode Initialized."; KEG_Spect_Init = true; VM_SpectatorCamerasEnabled = true; };
			KEGs_target = deathCam select KEGs_tgtIdx;  // reset camera to the new or current player target
		   (KEGs_cameras select KEGs_cameraIdx) cameraEffect["internal", "BACK"];
		   [] spawn MovementCameraLoop; 
		
		};

EndLoadingScreen;		

		
		
while{ dialog } do {


	// If ((player getVariable "BIS_IS_inAgony") == true) then { player setVariable ['BIS_IS_inAgony',false]; };
	player setVariable ['BIS_IS_inAgony',false];
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 0.0;
	"dynamicBlur" ppEffectEnable false;
	
	_debugplayer globalchat format ["Loop# %1 Check for new units (%2)", vm_count, time - lastCheckNewUnits];
	

		// Request listbox update every 20 seconds to update dead units or jip player names (
		if(time - KEGs_lastAutoUpdateLB > 20 && (RefreshListReady) && (CheckNewUnitsReady)) then {
			KEGs_lastAutoUpdateLB = time;
			KEGsNeedUpdateLB = true;
		};	
	
	if(KEGsNeedUpdateLB && RefreshListReady && (CheckNewUnitsReady)) then {
		_debugPlayer globalchat format ["Loop# %1 Refeshing Player List ", vm_count]; //_debugplayer
		[] spawn RefreshPlayerList;
	};
	
		// Check for new units every 20 seconds
		if((time - lastCheckNewUnits > 20)  && (CheckNewUnitsReady) ) then {
			lastCheckNewUnits = time;
			RefreshListReady = false;
			_debugplayer globalchat format ["Loop# %1 Starting CheckNewUnits", vm_count];
			 [] spawn CheckNewUnits;
		}; 
		// End of If statement for Checking New Units
		
			
			//ctrlSetText[_cDebug, format["%1", count _markers]];			
			
			// Update tag particlesources
			if(time - _lastUpdateTags > (1/5)) then {
				_lastUpdateTags = time;
				if(KEGsTags) then {
					["ToggleTags", [true, (KEGs_cameras select KEGs_cameraIdx)]] call spectate_events;
				};
			};
			
			// Update markers 10fps
			_rate = 10; // modified from 15 - norrin/ViperMaul
			if(count _markers > 100) then {_rate = 5}; // Update large number of markers less often // modified from 7.5 - norrin/ViperMaul
			if(count _markers > 200) then {_rate = 0.5}; // Update large number of markers less often // added - norrin/ViperMaul
			if(time - _lastUpdateMarkers > (1/_rate)) then {
				_lastUpdateMarkers = time;
			
				if (!NORRN_noMarkersUpdates) then //added check to remove marker updates - norrin
				{
					// setMarkerTypeLocal is very slow, call it only once per second
					_doMarkerTypes = false;
					if(time - _lastUpdateMarkerTypes > 1) then {
						_lastUpdateMarkerTypes = time;
						_doMarkerTypes = true; // Allow update marker types
					};
					

					
					_markedVehicles = []; // Keep track of vehicles with markers to avoid multiple markers for one vehicle
					for "_i" from 0 to ((count _markers)-1) do {
						_m = _markers select _i;
						_u = (deathCam select _i);
						_m setMarkerPosLocal ((vehicle _u modelToWorld [0,0,0]));
						
						_OriginalSide = _u call VM_CheckOriginalSide; 
						if(!((_OriginalSide) in KEGsShownSides)) then {
							// We arent' supposed to show this side unit - hide marker
							if(_doMarkerTypes) then {_m setMarkerTypeLocal "empty"};
						} else { 				
						};
						
						if(not alive _u) then {
							if(KEGsClientAddonPresent) then {
								// Switch to darker color, cant use side since the unit is already dead
								if(getMarkerColor _m == "ColorBlue") then {_m setMarkerColorLocal "KEGsDarkBlue"};
								if(getMarkerColor _m == "ColorRed") then {_m setMarkerColorLocal "KEGsDarkRed"};
								if(getMarkerColor _m == "ColorGreen") then {_m setMarkerColorLocal "KEGsDarkGreen"};
								if(getMarkerColor _m == "ColorWhite") then {_m setMarkerColorLocal "KEGsGrey"};								
							} else {
								_m setMarkerColorLocal "ColorBlack"
							};
						};
						
						if(vehicle _u in _markedVehicles) then {
							// This vehicle was already marked, hide marker
							_m setMarkerTypeLocal "Empty";
						} else {
							_markedVehicles set [(count _markedVehicles) , vehicle _u];  // _markedVehicles = _markedVehicles + [vehicle _u];
						};
					};	
				};
			// END OF added check to remove marker updates - norrin
				
				// Follow target with small map			
			
			
			};
			
			// Check if target changed and center main map

			

			


		// KEGsKEGs_lastTgt = KEGs_tgtIdx;	 //capture the last target index for the player in focus	

		// Wait a moment. 150fps ought to be enough for everyone :-)
		_tt = time;
		sleep(1/150);
		KEGs_tbase = time-_tt;
		
		vm_count = vm_count + 1;
};
StartLoadingScreen ["EXITING SPECTATOR MODE..."];
_debugPlayer groupchat format ["EXITING SPECTATOR MODE", VM_SpectatorCamerasEnabled];
VM_SpectatorCamerasEnabled = False;
// Dialog closed with esc key
titleText["","BLACK IN", 0.5];

// Destroy cameras, markers, particlesources, etc.
_debugPlayer groupchat format ["Destroying Cameras", VM_SpectatorCamerasEnabled];
camDestroy KEGscam_target;
camDestroy KEGscam_missile;
camDestroy KEGscam_fullmap;
//deletevehicle KEGscam_target;
//deletevehicle KEGscam_missile;
//deletevehicle KEGscam_fullmap;
{camDestroy _x} foreach KEGs_cameras;
{deletemarkerlocal _x} foreach _markers;	 
_debugPlayer groupchat format ["Cleaning up", VM_SpectatorCamerasEnabled];
deletevehicle _t;
deletevehicle KEGs_dummy;
// camUseNVG false;
// KEGsTags = false;
onMapSingleClick "";
{deletevehicle (_x select 1)} foreach KEGsTagSources;
KEGsTagSources = [];

// Remove eventhandlers TODO: does this work properly?
{
	_fh = _x getVariable "KEGsEHfired";
	//_kh = _x getVariable "KEGsEHkilled";
	if(typeName _fh == "SCALAR") then {_x removeEventHandler["fired", _fh]};
	//if(typeName _kh == "SCALAR") then {_x removeEventHandler["killed", _kh]};
} foreach _ehVehicles;


_debugPlayer groupchat format ["ENTERING ButterFly Mode", VM_SpectatorCamerasEnabled];
// Create a butterfly for player to fly with
/*_bpos = [(((vehicle KEGs_target)modelToWorld [0,0,0])  select 0)-5+random 10, (((vehicle KEGs_target) modelToWorld [0,0,0])  select 1)-5+random 10, 1];
// _bird = "ButterFlySpectator"createVehicle _bpos; //custom ButterFly for improved flight.
_bird = "ButterFly"createVehicle _bpos;
_bird setvelocity[0,0,5];
_bird setpos _bpos;
_bird switchCamera "INTERNAL";

_bird cameraEffect["terminate","FRONT"];
_bird camCommand "manual on";

camUseNVG false; setAperture -1; //  Reset NVGs

KEGsBird = _bird;
onMapSingleClick "KEGsBird setpos [_pos select 0, _pos select 1, 2];KEGsBird setvelocity[0,0,5];";

cutText["\n\n\n\n\nLand on ground to return to spectating\nClick at map to jump to location","PLAIN DOWN", 0.75];
*/
EndLoadingScreen;	
_cam_script = player execVM "f\common\f_spect\camera.sqf";
// Wait until landed, delete bird & restart script
//waitUntil{(_bird modelToWorld [0,0,0]) select 2 < 0.05 and speed _bird < 1};
waituntil {
	if (!isnull BIS_DEBUG_CAM) then {_lastpos = position BIS_DEBUG_CAM};
	isNull BIS_DEBUG_CAM
};
onMapSingleClick "";

sleep(0.5);
if !( f_var_debugMode == 1 ) then {
	titleText["","BLACK OUT", 0.5];
	sleep(1);
};


_player switchCamera "INTERNAL";
_player cameraEffect["terminate","FRONT"];
deletevehicle _bird;
if !( f_var_debugMode == 1 ) then {
	[_player, _killer, "noWait"] execVM ("f\common\f_spect\specta.sqf");
};