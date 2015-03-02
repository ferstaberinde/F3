_type = _this select 0;

private ["_pos", "_dir", "_vector", "_attachTo"];

if (_type in ["DemoCharge_Remote_Ammo", "SatchelCharge_Remote_Ammo", "ClaymoreDirectionalMine_Remote_Ammo"]) then {_type = _type + "_Scripted"};
if (_type == "APERSTripMine_Wire_Ammo") then {_type = "Land_GasCanister_F"};

vip_sms_var_cl_mineReady = false;
vip_sms_var_cl_minePlaced = false;
vip_sms_var_cl_mineCancel = false;

_act1 = player addAction ["<t color='#00FF00'>Confirm Mine</t>", {if (vip_sms_var_cl_mineReady) then {vip_sms_var_cl_minePlaced = true}}, [], 25, false, false, "", ""];
_act2 = player addAction ["<t color='#FF0000'>Cancel Mine</t>", {vip_sms_var_cl_mineCancel = true}, [], 25, false, true, "", ""];

_ehInventory = player addEventHandler ["InventoryOpened", {if (vip_sms_var_cl_minePlacing) then {vip_sms_var_cl_mineCancel = true}}];

_ehKeys = (finddisplay 46) displayAddEventHandler ["KeyDown", {

	if (vip_sms_var_cl_minePlacing) then {
	
		if (((_this select 1) in (actionKeys "Fire")) || ((_this select 1) in (actionKeys "Optics")) || ((_this select 1) in (actionkeys "ReloadMagazine")) || visibleMap) then {

			vip_sms_var_cl_mineCancel = true;
		};
	};
}];

_ehMouse = (finddisplay 46) displayAddEventHandler ["MouseButtonDown", {

	if (vip_sms_var_cl_minePlacing) then {

		if ((_this select 1) == 0) then {
		
			vip_sms_var_cl_mineCancel = true;
		};
		
		true
	};
}];

_tempMine = _type createVehicleLocal getPos player;
_tempMine enableSimulation false;

waitUntil {

	_headPos = ASLToATL (eyePos player);
	_viewPos = positionCameraToWorld [0,0,3];
	_viewVector = _headPos vectorFromTo _viewPos;
	_vector = [0,0,0];
	_pos = [(_headPos select 0) + 1 * (_viewVector select 0), (_headPos select 1) + 1 * (_viewVector select 1), (_headPos select 2) + 1 * (_viewVector select 2)];
	_heightPlayer = (getPosATL player) select 2;
	
	if ((_pos select 2) < 0.05) then { //if at ground level
		_pos = [_pos select 0, _pos select 1, 0.02];
		_vector = surfaceNormal _pos;
	} else {
	
		if ((_pos select 2) < (_heightPlayer + 0.05)) then { //if on a building's floor
			_pos = [_pos select 0, _pos select 1, _heightPlayer + 0.02];
		};
	};
	
	_dnTest = [_pos select 0, _pos select 1, (_pos select 2) - 0.03];
	_dir = getDir player;
	_goodTouch = false;
	_badTouch = false;
	_attachTo = objNull;
	
	_tempMine setPosATL _pos;
	_tempMine setDir _dir;
	_tempMine setVectorUp _vector;
	
	if (terrainIntersect [_pos, _dnTest]) then { //if bottom touches terrain
	
		_goodTouch = true;
	
	} else {
	
		_t = (lineintersectsWith [ATLToASL _pos, ATLToASL _dnTest, _tempMine, objNull, true]); //if bottom touches an object
		
		if (count _t > 0) then {
			
			_nearestObj = _t select 0;
			if ((_nearestObj isKindOf "LandVehicle") || (_nearestObj isKindOf "Air")) then { //if touching object is a vehicle
				if (_type in ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted"]) then { //if the mine is a charge of some kind
					_goodTouch = true;
					_attachTo = (_t select 0);
				};
			} else { //if touching object isn't a vehicle (i.e. it's immobile; players are never counted in lineintersects)
			
				if !((typeOf _nearestObj) in ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted", "ClaymoreDirectionalMine_Remote_Ammo_scripted", "Land_GasCanister_F", "APERSMine_Range_Ammo", "ATMine_Range_Ammo", "SLAMDirectionalMine_Wire_Ammo"]) then { //if touching object isn't a mine
					_goodTouch = true;
				};
			};
		};
	};
	
	if (lineintersects [ATLToASL _pos, ATLtoASL _headPos, _tempMine, objNull]) then {_badTouch = true}; //if there is an object between the player and the mine
	if (terrainIntersectASL [ATLToASL _pos, ATLtoASL _headPos]) then {_badTouch = true}; //if there is terrain (unlikely) between the player and the mine
	
	_corners = [_tempMine] call vip_cmn_fnc_cl_3DModelEdges;
	_x1y1z1 = _corners select 0;
	_x1y2z1 = _corners select 1; 
	_x2y1z1 = _corners select 2; 
	_x2y2z1 = _corners select 3; 
	_x1y1z2 = _corners select 4; 
	_x1y2z2 = _corners select 5; 
	_x2y1z2 = _corners select 6; 
	_x2y2z2 = _corners select 7;
	
	{ //if any of the edges of the bounding box, or the middle of the bounding box, touch anything
		if ((lineintersects [ATLtoASL (_x select 0), ATLtoASL (_x select 1), _tempMine]) || (terrainIntersect [_x select 0, _x select 1])) exitWith {_badTouch = true};
	} foreach [
		[_x1y1z1, _x2y2z2],
		[_x1y1z1, _x2y1z1], [_x1y1z1, _x1y2z1], [_x1y1z1, _x1y1z2],
		[_x2y1z2, _x1y1z2],	[_x2y1z2, _x2y1z1], [_x2y1z2, _x2y2z2], 
		[_x1y2z2, _x1y2z1], [_x1y2z2, _x1y1z2], [_x1y2z2, _x2y2z2],
		[_x2y2z1, _x1y2z1], [_x2y2z1, _x2y1z1], [_x2y2z1, _x2y2z2]
	];

	//draw edges of bounding box
	/*{drawLine3D [_x select 0, _x select 1, _x select 2]} foreach [
	[_x1y1z1, _x2y1z1, [1,0,0,1]], [_x1y1z1, _x1y2z1, [1,0,0,1]], [_x1y1z1, _x1y1z2, [1,0,0,1]],
	[_x2y1z2, _x1y1z2, [0,1,0,1]], [_x2y1z2, _x2y1z1, [0,1,0,1]], [_x2y1z2, _x2y2z2, [0,1,0,1]],
	[_x1y2z2, _x1y2z1, [0,0,1,1]], [_x1y2z2, _x1y1z2, [0,0,1,1]], [_x1y2z2, _x2y2z2, [0,0,1,1]],
	[_x2y2z1, _x1y2z1, [0,1,1,1]], [_x2y2z1, _x2y1z1, [0,1,1,1]], [_x2y2z1, _x2y2z2, [0,1,1,1]],
	[_pos, _dnTest, [0,1,0,1]]
	]*/
		
	if (_goodTouch && !_badTouch) then {

		_surfaceOK = if (_type in ["APERSBoundingMine_Range_Ammo"]) then { //buried-only mine
		
			if (( _pos select 2) < 0.05) then { //if mine is on ground
			
				if ((((surfaceType _pos) find "Concrete") < 0) && !(isOnRoad _pos)) then {true} else {false}; //pos is ok if not in concrete or on road
				
			} else {false}; //not on ground
		} else {true}; //any other kind of mine
		
		if (_surfaceOK) then {
			vip_sms_var_cl_3DIcon = [vip_sms_var_cl_iconOK, [0,1,0,0.75], [_pos select 0, _pos select 1, (_pos select 2) + 0.1], 2, 2, 0];
			vip_sms_var_cl_mineReady = true;
		} else {
			vip_sms_var_cl_3DIcon = [vip_sms_var_cl_iconNo, [1,0,0,0.75], [_pos select 0, _pos select 1, (_pos select 2) + 0.1], 2, 2, 0];
		};
	} else {
	
		vip_sms_var_cl_3DIcon = [vip_sms_var_cl_iconNo, [1,0,0,0.75], [_pos select 0, _pos select 1, (_pos select 2) + 0.1], 2, 2, 0];
		vip_sms_var_cl_mineReady = false;
	};
	if ((surfaceisWater getPos player) || (surfaceisWater _pos)) then {vip_sms_var_cl_mineCancel = true; hintSilent "Mines cannot be placed in water."};
	if ((vehicle player != player) || !(alive player)) then {vip_sms_var_cl_mineCancel = true};
	
	vip_sms_var_cl_minePlaced || vip_sms_var_cl_mineCancel
};

deleteVehicle _tempMine;
player removeAction _act1;
player removeAction _act2;
vip_sms_var_cl_3DIcon = [];

vip_sms_var_cl_minePlacing = false;

player removeEventHandler ["InventoryOpened", _ehInventory];
player removeEventHandler ["KeyDown", _ehKeys];
player removeEventHandler ["MouseButtonDown", _ehMouse];

if !(vip_sms_var_cl_mineCancel) then { //create the mine

	[[_type, _pos, _dir, _vector, _attachTo], "vip_sms_fnc_sv_createMine", false] call BIS_fnc_MP;

} else { //give the player back the magazine

	_numTrim = -4;
	if (["_Ammo_Scripted", _type] call BIS_fnc_inString) then {_numTrim = -13};
	_mag = [_type, 0, _numTrim] call BIS_fnc_trimString;
	_mag = _mag + "Mag";
	if (_type == "Land_GasCanister_F") then {_mag = "APERSTripMine_Wire_Mag"};
	
	if (player canAdd _mag) then {player addMagazine _mag} else {
		
		private ["_ground"];
		_posPlayer = getPos player;
		_nearHolders = nearestObjects [_posPlayer, ["GroundWeaponHolder", "WeaponHolderSimulated"], 0.5];
			
		if (count _nearHolders > 0) then {
			
			_ground = _nearHolders select 0;
				
		} else {
			
			_holderType = "GroundWeaponHolder";
			_ground = "GroundWeaponHolder" createVehicle _posPlayer;
			_ground setPos _posPlayer;
		};
			
		_ground addMagazineCargoGlobal [_mag, 1];
	};
};