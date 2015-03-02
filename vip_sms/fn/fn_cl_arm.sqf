_dummy = _this select 0;
_trig = _this select 1;

switch (_trig) do {

	case 0: { //step
	
		_dummy setVariable ["vip_mineArm", 2, true];
	};

	case 1: { //trip

		private ["_pos"];
		
		_dummy setVariable ["vip_mineArm", 1, true];
		
		_mine = _dummy getVariable "vip_mineObj";
		_startPos = [(getPosATL _mine) select 0, (getPosATL _mine) select 1, ((getPosATL _mine) select 2) + 0.1];
		vip_sms_var_cl_minePlacing = true;
		vip_sms_var_cl_mineReady = false;
		vip_sms_var_cl_minePlaced = false;
		vip_sms_var_cl_mineCancel = false;

		_act1 = player addAction ["<t color='#00FF00'>Confirm Tripwire</t>", {if (vip_sms_var_cl_mineReady) then {vip_sms_var_cl_minePlaced = true}}, [], 25, false, false, "", ""];
		_act2 = player addAction ["<t color='#FF0000'>Cancel Tripwire</t>", {vip_sms_var_cl_mineCancel = true}, [], 25, false, true, "", ""];

		_tempTrip = "Land_CanOpener_F" createVehicleLocal getpos player;

		waitUntil {

			_headPos = ASLToATL (eyePos player);
			_viewPos = positionCameraToWorld [0,0,3];
			_viewVector = _headPos vectorFromTo _viewPos;
			_pos = [(_headPos select 0) + 1 * (_viewVector select 0), (_headPos select 1) + 1 * (_viewVector select 1), (_headPos select 2) + 1 * (_viewVector select 2)];
			if ((_pos select 2) < 0.05) then {
				_pos = [_pos select 0, _pos select 1, 0.02];
			};
			_dnTest = [_pos select 0, _pos select 1, (_pos select 2) - 0.03];
			_upTest = [_pos select 0, _pos select 1, (_pos select 2) + 0.08];
			_goodTouch = false;
			
			_tempTrip setPosATL _pos;
			_tempTrip setDir 0;
			_tempTrip setVectorUp [1, -1, 0];
			
			if (terrainIntersect [_pos, _dnTest]) then {_goodTouch = true} else {
				_t = (lineintersectsWith [ATLToASL _pos, ATLToASL _dnTest, _tempTrip, objNull, true]);
				if (count _t > 0) then {if !((_t select 0) isKindOf "Car") then {_goodTouch = true}};
			};
			_badTouch = (
				(lineintersects [ATLToASL _pos, ATLToASL _upTest, _tempTrip]) ||
				(lineintersects [ATLToASL _startPos, ATLToASL _upTest, _tempTrip, _mine]) ||
				(lineintersects [ATLToASL _pos, ATLToASL _headPos, _tempTrip, objNull]) ||
				(terrainIntersectASL [ATLToASL _pos, ATLToASL _headPos]) ||
				(terrainIntersect [_upTest, _startPos]) ||
				(_upTest distance _startPos > 15)
			);
			
			//drawline3D [_dnTest, _pos, [0,1,0,1]]; drawline3D [_upTest, _pos, [1,1,0,1]];
				
			if (_goodTouch && !_badTouch) then {
					
				drawLine3D [_startPos, _upTest, [0,1,0,1]];
				vip_sms_var_cl_3DIcon = [vip_sms_var_cl_iconOK, [0,1,0,0.75], [_pos select 0, _pos select 1, (_pos select 2) + 0.1], 2, 2, 0];
				vip_sms_var_cl_mineReady = true;
			} else {
				drawLine3D [_startPos, _upTest, [1,0,0,1]];
				vip_sms_var_cl_3DIcon = [vip_sms_var_cl_iconNo, [1,0,0,0.75], [_pos select 0, _pos select 1, (_pos select 2) + 0.1], 2, 2, 0];
				vip_sms_var_cl_mineReady = false;
			};
			if ((surfaceisWater getPos player) || (surfaceisWater _pos)) then {vip_sms_var_cl_mineCancel = true; hintSilent "Tripwires cannot be placed in water."};
			if ((vehicle player != player) || !(alive player) || (player distance _mine > 30) || ((_dummy getVariable "vip_mineArm") != 1)) then {vip_sms_var_cl_mineCancel = true};
			
			vip_sms_var_cl_minePlaced || vip_sms_var_cl_mineCancel
		};

		deleteVehicle _tempTrip;
		player removeAction _act1;
		player removeAction _act2;
		vip_sms_var_cl_minePlacing = false;
		vip_sms_var_cl_3DIcon = [];

		if !(vip_sms_var_cl_mineCancel) then {;
			
			[[_pos, _dummy], "vip_sms_fnc_sv_createTripwire", false] call BIS_fnc_MP;
		} else {_dummy setVariable ["vip_mineArm", 0, true]};
	};
	
	case 2: { //remote connect
	
		_dummy setVariable ["vip_mineArm", 4, true];
		vip_sms_var_cl_remoteMines pushBack [_dummy, _dummy getVariable "vip_mineType"];
	};
	
	case 3: { //timer
	
		_dummy setVariable ["vip_mineArm", 5, true];
	};
};