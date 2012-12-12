FreeLookMovementHandler = {

	_debugPlayer=objNull;
	if ( f_var_debugMode == 1 ) then {
		_debugPlayer=player;
	};
	// _debugplayer sidechat "Classic FreeLookMovementHandler spawn activated";		
	

// ----------------------------------------------------------------------------------------------------------------------------------------------------
		// Update the position of the current player in focus (KEGs_Target) 
				KEGs_cxpos = (vehicle KEGs_target modelToWorld [0,0,0]) select 0;
				KEGs_cypos = (vehicle KEGs_target modelToWorld [0,0,0]) select 1;
				KEGs_czpos = (vehicle KEGs_target modelToWorld [0,0,0]) select 2;
				KEGscam_free camSetTarget[KEGs_cxpos, KEGs_cypos, KEGs_czpos+(KEGs_hi*0.6)];	
// ----------------------------------------------------------------------------------------------------------------------------------------------------
			// Process mouse movement
			mouseDeltaX = mouseLastX - (KEGsMouseCoord select 0);
			mouseDeltaY = mouseLastY - (KEGsMouseCoord select 1);	
			
			if(!(KEGsMouseButtons select 0) and (KEGsMouseButtons select 1)) then {
				// Right mouse button - Adjust position
				fangle = fangle - (mouseDeltaX*360);
				fangleY=fangleY + (mouseDeltaY*180);
				if(fangleY > 89) then {fangleY = 89};
				if(fangleY < -89) then {fangleY = -89};		
			};
			if((KEGsMouseButtons select 0) and !(KEGsMouseButtons select 1)) then {
				// Left mouse button - Adjust distance
				sdistance = sdistance - (mouseDeltaY*10);
				if(sdistance > maxDistance) then {sdistance = maxDistance};
				if(sdistance < -maxDistance) then {sdistance = -maxDistance};		
			};	
			if(KEGsMouseScroll != 0) then {
				// Mouse scroll wheel - Adjust distance
				sdistance = sdistance - (KEGsMouseScroll*0.11);		
				KEGsMouseScroll = KEGsMouseScroll * 0.75;
				if(sdistance > maxDistance) then {sdistance = maxDistance};
				if(sdistance < -maxDistance) then {sdistance = -maxDistance};						
			};
			if((KEGsMouseButtons select 0) and (KEGsMouseButtons select 1)) then {
				// Both mousebuttons - Adjust zoom
				szoom = szoom - (mouseDeltaY*3);		
				if(szoom > minZoom) then {szoom = minZoom};
				if(szoom < maxZoom) then {szoom = maxZoom};

			};
		
// ----------------------------------------------------------------------------------------------------------------------------------------------------			
			// Get target properties
			KEGs_dir = getdir vehicle KEGs_target;
			_bb = boundingBox vehicle KEGs_target;
			//KEGs_hi = ((_bb select 1) select 2) - ((_bb select 0) select 2); // Height
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
			//VM_CommitDelay;
			mouseLastX = KEGsMouseCoord select 0;
			mouseLastY = KEGsMouseCoord select 1;
};


