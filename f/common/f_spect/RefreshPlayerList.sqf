private ["_debugplayer", "_idx", "_name", "_unit", "_found", "_i", "_OriginalSide","_vm_refreshNumber"];
				_debugplayer sidechat format ["Loop# %1 RefreshPlayerList spawn activated",vm_count ];
				RefreshListReady = false;
				_vm_refreshNumber = vm_count;
				// Clear and re-fill targets listbox
				lbClear KEGs_cLBTargets;
				If (KEGsAIfilter) then { 
					_debugPlayer sidechat "Filtering out the AI";
				};			
				for "_idx" from 0 to ((count deathCam)-1) do {
					_x = deathCam select _idx;
					_name = "";
					if(alive _x) then {
						// Unit is alive, use name command
						_name = name _x;					
						KEGs_nameCache set[_idx, _name];					
						_x setVariable ["KEG_NAME_CACHE", _name];					
					} else {
						if (format["%1", _unit getVariable "KEG_NAME_CACHE"] == "<null>") then {
							_name = "Unknown";
						} else {
								_name = _unit getVariable "KEG_NAME_CACHE";
						};				
					
						// Dead unit, use cached name
						// _name = "(DEAD) " + (KEGs_nameCache select _idx) ;
						_name = "(DEAD) " + _name;
						
						if ( KEGsDeadFilter ) then {
								// Remove the unit if Filter Dead
															
								// Find listbox element with matching value
								for "_idx" from 0 to (lbSize KEGs_cLBTargets) do {
									if(lbText[KEGs_cLBTargets, _idx ] == _name) then {
										// lbDelete[KEGs_cLBTargets, _idx];	
										_found = true;
									};
									//***** DEBUG CODE **** BE CAREFULE **** LOTS OF NETWORK TRAFFIC****
									if ( VM_scriptName in debugScripts ) then {
										debugX = debugX + [ _name,_idx, lbText[KEGs_cLBTargets, _idx ] ];
										publicVariable "debugX"; sleep 0.1;
									};
								};		
						};
					};
					
					addSolder = {	
						_i = lbAdd[KEGs_cLBTargets, _name];					
						lbSetValue[KEGs_cLBTargets, _i, _idx]; // Value used to id unit
						_OriginalSide = _x call VM_CheckOriginalSide; 
						if(_OriginalSide == west) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,0.8,1,1]]};
						if(_OriginalSide == east) then {lbSetColor[KEGs_cLBTargets, _i, [1,0.8,0.8,1]]};
						if(_OriginalSide == resistance) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,1,0.8,1]]};
						if(_OriginalSide == civilian) then {lbSetColor[KEGs_cLBTargets, _i, [1,1,1,1]]};
					};

					_OriginalSide = _x call VM_CheckOriginalSide; 
					if((_OriginalSide) in KEGsShownSides) then {
					
						Switch (isPlayer _x) do { 
						
							Case true: { // Players 
								if (alive _x ) then {
								
									_i = lbAdd[KEGs_cLBTargets, _name];					
									lbSetValue[KEGs_cLBTargets, _i, _idx]; // Value used to id unit
							
									if(_OriginalSide == west) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,0.8,1,1]]};
									if(_OriginalSide == east) then {lbSetColor[KEGs_cLBTargets, _i, [1,0.8,0.8,1]]};
									if(_OriginalSide == resistance) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,1,0.8,1]]};
									if(_OriginalSide == civilian) then {lbSetColor[KEGs_cLBTargets, _i, [1,1,1,1]]};
								
								
								
								};
							} ;
							Case false: { // AI 
								if (!KEGsAIfilter && alive _x) then {
								
									_i = lbAdd[KEGs_cLBTargets, _name];					
									lbSetValue[KEGs_cLBTargets, _i, _idx]; // Value used to id unit
							
									if(_OriginalSide == west) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,0.8,1,1]]};
									if(_OriginalSide == east) then {lbSetColor[KEGs_cLBTargets, _i, [1,0.8,0.8,1]]};
									if(_OriginalSide == resistance) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,1,0.8,1]]};
									if(_OriginalSide == civilian) then {lbSetColor[KEGs_cLBTargets, _i, [1,1,1,1]]};
								};
							} ;
						};
						
						if(not alive _x) then {
						
							if ( !KEGsDeadFilter) then {	
								//if Not Filtering Dead then 					
									_i = lbAdd[KEGs_cLBTargets, _name];					
									lbSetValue[KEGs_cLBTargets, _i, _idx]; // Value used to id unit
							
									if(_OriginalSide == west) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,0.8,1,1]]};
									if(_OriginalSide == east) then {lbSetColor[KEGs_cLBTargets, _i, [1,0.8,0.8,1]]};
									if(_OriginalSide == resistance) then {lbSetColor[KEGs_cLBTargets, _i, [0.8,1,0.8,1]]};
									if(_OriginalSide == civilian) then {lbSetColor[KEGs_cLBTargets, _i, [1,1,1,1]]};					
								_debugPlayer groupchat "removing the dead";
							};
							// Whoops, unit is dead, change color
							lbSetColor[KEGs_cLBTargets, _i, [0.5,0.5,0.5,1]];
							_debugPlayer groupchat "greying out the Dead";
						};
						
					};
				};			
				KEGsNeedUpdateLB = false;
				KEGs_lastAutoUpdateLB = time;
				_debugplayer sidechat format ["Loop# %1 Refeshing List Completed", _vm_refreshNumber];
				RefreshListReady = true;
	  
		