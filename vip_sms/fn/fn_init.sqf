if (isServer) then {

	vip_sms_var_gl_jipMines = [];
	vip_sms_var_gl_3DWires = [];
	publicVariable "vip_sms_var_gl_jipMines";
	publicVariable "vip_sms_var_gl_3DWires";
};

if (isDedicated) exitWith {};

waitUntil {!isNil "vip_sms_var_gl_jipMines"};
waitUntil {!isNil "vip_sms_var_gl_3DWires"};

if (count vip_sms_var_gl_jipMines > 0) then { //sync JIP players to currently placed mines

	{[_x] call vip_sms_fnc_cl_vector} forEach vip_sms_var_gl_jipMines;
};

vip_sms_var_cl_3DIcon = [];
vip_sms_var_cl_minePlacing = false;
vip_sms_var_cl_remoteMines = [];
vip_sms_var_cl_iconOK = "\A3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_sidebar_show_down.paa";
vip_sms_var_cl_iconNo = "\A3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";

addMissionEventHandler ["Draw3D", {

	if (count vip_sms_var_gl_3DWires > 0) then {
		{
			drawLine3D [(_x select 0), (_x select 1), [0,0,0,0.75]]
		} forEach vip_sms_var_gl_3DWires;
	};
	
	if (count vip_sms_var_cl_3DIcon > 0) then {
		drawIcon3D vip_sms_var_cl_3DIcon
	};
}];

waitUntil {!isNull player};

player addEventHandler ["Fired", {
	
	_b = _this select 5;
	if (_b in [
		"APERSMine_Range_Mag",
		"APERSBoundingMine_Range_Mag",
		"APERSTripMine_Wire_Mag",
		"ClaymoreDirectionalMine_Remote_Mag",
		"DemoCharge_Remote_Mag",
		"SatchelCharge_Remote_Mag",
		"ATMine_Range_Mag",
		"SLAMDirectionalMine_Wire_Mag"
	]) then {
	
		_type = typeOf (_this select 6);
		deleteVehicle (_this select 6);
		if !(vip_sms_var_cl_minePlacing) then {
			vip_sms_var_cl_minePlacing = true;
			[_type] spawn vip_sms_fnc_cl_place;
		} else {player addMagazine _b};
	};
}];

player addEventHandler ["Killed", {

	if (!isNull (findDisplay 12100)) then {closeDialog 0};
}];

if (isClass (configFile >> "CfgPatches" >> ("cse_sys_advanced_interaction"))) then {

	waitUntil {count (["ActionMenu", "equipment"] call cse_fnc_getAllCategoryEntriesRadialMenu_f) > 0};

	_entries = [
		["Explosives",
		{
			!vip_sms_var_cl_minePlacing && 
			!(surfaceIsWater (getPos player)) && 
			((getPosASL player select 2) > 0) && 
			!((animationState player) in ["AinvPknlMstpSlayWrflDnon_medic", "AinvPknlMstpSlayWpstDnon_medicOut", "AinvPknlMstpSlayWnonDnon_medic"])
		},
		"a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa",

		{closeDialog 0; ['CSE_RADIAL_MENU', false] call cse_fnc_gui_blurScreen; createDialog "vip_sms_dlg_mineMenu"},
		"Explosives menu"]
	];

	["ActionMenu", "equipment", _entries] call cse_fnc_addMultipleEntriesToRadialCategory_F;

} else {

	vip_sms_var_cl_menuAction = player addAction ["<t color='#FF0000'>Explosives Interface</t>", 
	{vip_sms_var_cl_minePlacing = false; createDialog "vip_sms_dlg_mineMenu"},
	[], 
	-98, 
	false, 
	true, 
	"", 
	"!vip_sms_var_cl_minePlacing && !(surfaceIsWater (getPos player)) && ((getPosASL player select 2) > 0) && !((animationState player) in ['AinvPknlMstpSlayWrflDnon_medic', 'AinvPknlMstpSlayWpstDnon_medicOut', 'AinvPknlMstpSlayWnonDnon_medic'])"
	];
	
	player addEventHandler ["Respawn", {

		vip_sms_var_cl_menuAction = player addAction ["<t color='#FF0000'>Explosives Interface</t>", 
		{vip_sms_var_cl_minePlacing = false; createDialog "vip_sms_dlg_mineMenu"},
		[], 
		-98, 
		false, 
		true, 
		"", 
		"!vip_sms_var_cl_minePlacing && !(surfaceIsWater (getPos player)) && ((getPosASL player select 2) > 0) && !((animationState player) in ['AinvPknlMstpSlayWrflDnon_medic', 'AinvPknlMstpSlayWpstDnon_medicOut', 'AinvPknlMstpSlayWnonDnon_medic'])"
		];
	}];
	
	player addEventHandler ["Killed", {

		player removeAction vip_sms_var_cl_menuAction;
	}];
};