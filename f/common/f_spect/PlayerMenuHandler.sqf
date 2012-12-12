private ["_Source", "_debugPlayer", "_cName", "_cCamera", "_idx", "_found", "_role", "_name", "_ccName", "_disp"];
_Source = _this select 0;
_debugPlayer=objNull;
if ( f_var_debugMode == 1 ) then {
	_debugPlayer=player;
};
_debugPlayer groupchat format ["PlayerMenuHandler Source: %1", _Source];


_cName = 55004;
_cCamera = 55002;

/****************************************   PLAYER MENU HANDLING ***************************************************/

		if(lbCurSel KEGs_cLBTargets > lbSize KEGs_cLBTargets) then {
			lbSetCurSel[KEGs_cLBTargets, lbSize KEGs_cLBTargets];	// Selection outside listbox size
			_debugPlayer globalchat "Selection outside listbox size - reset select";
		};
		
	//	_debugPlayer globalchat Format["KEGsSelect %3 lbCurSel KEGs_cLBTargets %1 == KEGs_tgtSelLast %2",lbCurSel KEGs_cLBTargets,KEGs_tgtSelLast, KEGsSelect];
		
	/*	Commented out since Spectating.hpp handles this now. -ViperMaul 13-FEB-2010
		// Update selected target from listbox
		if(KEGsSelect != 0) then {	// If problems try (Less than 1)		
			lbSetCurSel[KEGs_cLBTargets, ((lbCurSel KEGs_cLBTargets)+KEGsSelect)];
			KEGsSelect = 0;
			_debugPlayer vehiclechat "Update selected target from listbox";
		};	
*/
		// CHECK FOR NEW PLAYER TARGET 
		if(KEGs_tgtSelLast != lbCurSel KEGs_cLBTargets ) then {
			KEGsDroppedCamera = false;
			KEGs_tgtIdx = lbValue[KEGs_cLBTargets, (lbCurSel KEGs_cLBTargets)]; // Get the new player target
			KEGs_lastTgt = KEGs_tgtIdx;	//immediately capture the last target index
			KEGs_tgtSelLast = lbCurSel KEGs_cLBTargets; //immediately capture the last selected target index - ArmaII MODIFICATION: moved from code "Commit static and flyby cameras" near line 970 -ViperMaul (6/28/09)
			_debugPlayer globalchat "Get the new player target (updated KEGs_tgtIdx)";
		};			
		
	// lbSort menuTargets;	
		// Check limits
		if(KEGs_tgtIdx >= count deathCam) then {KEGs_tgtIdx = (count deathCam)-1;};
		if(KEGs_tgtIdx < 0) then {KEGs_tgtIdx = 0};

	// Select camera, get target
		if(!KEGsMissileCamActive) then {
		
			_debugPlayer globalchat format ["Handler: Loop# %3 KEGs_cameraIdx = %1 KEGs_tgtIdx = %4 CameraView = %2 ", KEGs_cameraIdx, VM_CurrentCameraView, vm_count, KEGs_tgtIdx];
			
			(KEGs_cameras select KEGs_cameraIdx) cameraEffect["internal", "BACK"];_debugplayer globalchat format ["*Changing Camera to %1", (KEGs_cameras select KEGs_cameraIdx) ];
			KEGs_target = deathCam select KEGs_tgtIdx;  // reset camera to the new or current player target
			(vehicle KEGs_target) camcommit 0.5;
			KEGscam_target camCommit 0;	
				 // If not in First Person mode rest camera
				 If (!(KEGs_cameraIdx == 4) && !(VM_CurrentCameraView in ["INTERNAL","GUNNER"]) ) then { 
					(KEGs_cameras select KEGs_cameraIdx) cameraEffect["internal", "BACK"];
					 _debugplayer globalchat format ["Resetting Camera on to %1", KEGs_target];
				 };
		};
		
		if(lbValue[KEGs_cLBTargets, (lbCurSel KEGs_cLBTargets)] != KEGs_tgtIdx) then { //possible bug in A2 somewhere in this code - ViperMaul
			// Find listbox element with matching value
			for "_idx" from 0 to (lbSize KEGs_cLBTargets) do {
				if(lbValue[KEGs_cLBTargets, (lbCurSel KEGs_cLBTargets)] == KEGs_tgtIdx) then {
					lbSetCurSel[KEGs_cLBTargets, _idx];
					_found = true;
				};
			};
		};
		
		
		
		// Set UI texts
		_role = "";
		if(vehicle KEGs_target != KEGs_target) then {
			if(KEGs_target == driver vehicle KEGs_target) then {_role = "(Driver)"};
			if(KEGs_target == gunner vehicle KEGs_target) then {_role = "(Gunner)"};
			if(KEGs_target == commander vehicle KEGs_target) then {_role = "(Commander)"};
		};		
		
		// _name = "Unknown";
		if(alive KEGs_target) then {
			_name = name KEGs_target;
			if(_name == "Error: no unit") then {_name = "Unknown"};
		}else{
			_Idx_KEGS_Target = deathCam find KEGs_target;
			if(lbValue[KEGs_cLBTargets, (lbCurSel KEGs_cLBTargets)] != KEGs_tgtIdx) then {
				// Find listbox element with matching value
				for "_idx" from 0 to (lbSize KEGs_cLBTargets) do {
					if(lbValue[KEGs_cLBTargets, (lbCurSel KEGs_cLBTargets)] == KEGs_tgtIdx) then {
						_name = KEGs_nameCache select _idx;
						_found = true;
					};
				};
			};
		};
		
		if(KEGsDroppedCamera and isNull KEGs_nearest) then {
			// Dropped camera mode - no target
			_name = "";
			_role = "";
		};
		
		ctrlSetText[_cName, format["%1 %2", _name, _role]];	

		// Set name color to gray if dropped cam
		_ccName = _disp displayctrl _cName;
		if(KEGsDroppedCamera) then {
			_ccName ctrlSetTextColor[0.6, 0.6, 0.6, 1];
		} else {
			_ccName ctrlSetTextColor[1, 1, 1, 1];
		};

KEGsKEGs_lastTgt = KEGs_tgtIdx;		//capture the last target index for the player in focus