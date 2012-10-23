private ["_Source", "_debugPlayer", "_cName", "_cCamera"];
_Source = _this select 0;
_debugPlayer=objNull;
if ( f_var_debugMode == 1 ) then {
	_debugPlayer=player;
};
_debugPlayer groupchat format ["CameraMenuHandler Source: %1", _Source]; 
_msg = format["CameraMenuHandler Source: %1", _Source];
if ( f_var_debugMode == 1 ) then { diag_log  _msg; };


_cName = 55004;
_cCamera = 55002;

// ----------------------------------------------------------------------------------------------------------------------------------------------------
		// Check for listbox selections
		if(KEGs_camSelLast != lbCurSel KEGs_cLBCameras) then {
			KEGs_cs = lbCurSel KEGs_cLBCameras;
			if(KEGs_cs == KEGs_cLbSeparator) then {
				KEGs_cs = KEGs_camSelLast;
				_debugPlayer globalchat "KEGs_cLbSeparator";
			};
			
			// Special for toggling missile camera 
			if(KEGs_cs == KEGs_cLbMissileCam) then {
				KEGsUseMissileCam = !KEGsUseMissileCam;
				KEGs_cs = KEGs_camSelLast;
				_debugPlayer globalchat "toggle KEGsUseMissileCam";
			};
			// Special for toggling NVG
			if(KEGs_cs == KEGs_cLbToggleNVG) then {
				KEGsUseNVG = !KEGsUseNVG;
				KEGs_cs = KEGs_camSelLast;
				_debugPlayer globalchat "toggle NVG";
			};			
			// Special for toggling tags
			if(KEGs_cs == KEGs_cLbToggleTags) then {
				KEGsTags = !KEGsTags;
				["ToggleTags", [KEGsTags, (KEGs_cameras select KEGs_cameraIdx)]] call spectate_events;
				KEGs_cs = KEGs_camSelLast;
				_debugPlayer globalchat "toggle tags";
			};			
			// Special for toggling AI filter
			if(KEGs_cs == KEGs_cLbToggleAiFilter) then {
				KEGsAIfilter = !KEGsAIfilter;
				KEGs_cs = KEGs_camSelLast;				
				KEGsNeedUpdateLB = true; // Request listbox update
				_debugPlayer globalchat "toggle AI filter";
			};
			// Special for toggling Unknown (Dead) Players
			if(KEGs_cs == KEGs_cLbToggleDeadFilter) then {
				KEGsDeadFilter = !KEGsDeadFilter;
				KEGs_cs = KEGs_camSelLast;				
				KEGsNeedUpdateLB = true; // Request listbox update
				_debugPlayer globalchat "toggle Unknown (Dead) filter";
			};	
			if(KEGs_cs != KEGs_camSelLast) then {
				// Selected another camera - disable dropped cam
				KEGsDroppedCamera = false;
				_debugPlayer globalchat "Selected another camera - disable dropped cam";
			};
			KEGs_cameraIdx = KEGs_cs;
			KEGs_camSelLast = lbCurSel KEGs_cLBCameras; //immediately capture the last selected camera index - ArmaII MODIFICATION: moved from code "Commit static and flyby cameras" near line 970 -ViperMaul (6/28/09)
			_debugPlayer globalchat "Reset KEGs_cameraIdx to the New or Current Mode";			
		};
			
	_debugPlayer globalchat Format["KEGs_cLBCameras %1 <==> KEGs_cameraIdx %2 (KEGs_camSelLast %3)",KEGs_cLBCameras, KEGs_cameraIdx,KEGs_camSelLast];
	_msg = Format["KEGs_cLBCameras %1 <==> KEGs_cameraIdx %2 (KEGs_camSelLast %3)",KEGs_cLBCameras, KEGs_cameraIdx,KEGs_camSelLast];
	if ( f_var_debugMode == 1 ) then { diag_log  _msg; };
	
	lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx];	// reset camera mode selection in the listbox to the new or current camera mode
	
		// Check limits
		if(KEGs_cameraIdx < 0) then {KEGs_cameraIdx = 0};
		if(KEGs_cameraIdx >= count KEGs_cameras) then {KEGs_cameraIdx = (count KEGs_cameras)-1;};
		
		
		// Select camera, get target
		if(!KEGsMissileCamActive) then {
		
			_debugPlayer globalchat format ["Handler: Loop# %3 KEGs_cameraIdx = %1 KEGs_tgtIdx = %4 CameraView = %2 ", KEGs_cameraIdx, VM_CurrentCameraView, vm_count, KEGs_tgtIdx];
			
		   (KEGs_cameras select KEGs_cameraIdx) cameraEffect["internal", "BACK"];
			KEGs_target = deathCam select KEGs_tgtIdx;  // reset camera to the new or current player target
			
				 // If not in First Person mode rest camera
				 If (!(KEGs_cameraIdx == 4) && !(VM_CurrentCameraView in ["INTERNAL","GUNNER"]) ) then { 
					(KEGs_cameras select KEGs_cameraIdx) cameraEffect["internal", "BACK"];
					 _debugplayer globalchat format ["Resetting Camera on to %1", KEGs_target];
				 };
		};	
		
// ----------------------------------------------------------------------------------------------------------------------------------------------------

		// Set toggle text color for camera menu		
		if(KEGsUseMissileCam) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbMissileCam, [1, 0.5, 0, 1]]}
		else {lbSetColor[KEGs_cLBCameras, KEGs_cLbMissileCam, [1,1,1,0.33]]};
		
		if(KEGsUseNVG) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleNVG, [1, 0.5, 0, 1]]}
		else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleNVG, [1,1,1,0.33]]};		
		
		if(KEGsTags) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTags, [1, 0.5, 0, 1]]} 
		else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTags, [1,1,1,0.33]]};			

		if(KEGsAIfilter) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleAiFilter, [1, 0.5, 0, 1]]} 
		else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleAiFilter, [1,1,1,0.33]]};			

		if(KEGsDeadFilter) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleDeadFilter, [1, 0.5, 0, 1]]} 
		else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleDeadFilter, [1,1,1,0.33]]};	

// ----------------------------------------------------------------------------------------------------------------------------------------------------
		if((KEGs_cameras select KEGs_cameraIdx) == KEGscam_1stperson) then {
			// 1st person view
			VM_CurrentCameraView = cameraView; // Save the current CameraView
			if(KEGs1stGunner) then {
			
				if !(VM_CurrentCameraView == "GUNNER") then {
					(vehicle KEGs_target) switchCamera "GUNNER";
					_debugPlayer globalchat "switchCamera 'GUNNER'";
				} else {
					(vehicle KEGs_target) switchCamera "INTERNAL";
				};
				
				
			} else {
				(vehicle KEGs_target) switchCamera "INTERNAL";
				_debugPlayer globalchat "switchCamera 'INTERNAL'";
			};
			_debugPlayer globalchat Format ["**Handler CameraView is currently %1",cameraView];	// 	_debugPlayer
			 (vehicle KEGs_target) cameraEffect ["terminate","BACK"]; _debugPlayer globalchat "cameraEffect ['terminate','BACK']";
			 (vehicle KEGs_target) camcommit 0.5;
		};

ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	
KEGs_camSelLast = lbCurSel KEGs_cLBCameras; 