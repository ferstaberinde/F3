// DEFINE BACKPACK CONTENTS
// The following blocks of code define different backpack loadouts. These are then
// called from the role loadouts.

// BACKPACK: MEDIC
case "m":
{
	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 4];
		(unitBackpack _unit) addItemCargoGlobal [_firstaid, 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 6];
		(unitBackpack _unit) addItemCargoGlobal [_firstaid, 12];
	};
};

// BACKPACK: GRENADIER (CO/DC/SL/FTL/G)
case "g":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_glriflemag,2];
		_unit addmagazines [_glmag,1];
		_unit addmagazines [_glsmokewhite,1];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 6];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 4];
	};
};

// BACKPACK: AR
case "ar":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_ARmag_Tr,2];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
};

// BACKPACK: AAR
case "aar":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_riflemag,2];
		_unit addmagazines [_ARmag,2];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_tr, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 3];(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 4];
	};
};

// BACKPACK: RIFLEMAN AT (RAT)
case "rat":
{
	// NO BACKPACK (STILL ADD SMALL FOR ROCKETS)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];

	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_RATmag, 1];
	};
};

// BACKPACK: RIFLEMAN (R)
case "r":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_riflemag,2];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 8];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 4];
	};
};

// BACKPACK: CARABINEER (CAR)
case "car":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_carbinemag,2];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 8];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 4];
	};
};

// BACKPACK: MMG GUNNER (MMG)
case "mmg":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_MMGmag,1];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
};

// BACKPACK: MMG ASSISTANT GUNNER (MMGAG)
case "mmgag":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_MMGmag,1];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
};

// BACKPACK: MAT GUNNER (MATG)
case "matg":
{
	// NO BACKPACK (STILL ADD SMALL FOR ROCKETS)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
};

// BACKPACK: MAT ASSISTANT (MATAG)
case "matag":
{
	// NO BACKPACK (STILL ADD SMALL FOR ROCKETS)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
	_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
};

// BACKPACK: ENGINEER (DEMO)
case "eng":
{
	// NO BACKPACK (STILL ADD SMALL FOR TOOLKIT)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_satchel,2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_satchel,4];
	};
};

// BACKPACK: ENGINEER (MINES)
case "engm":
{
	// NO BACKPACK (STILL ADD SMALL FOR TOOLKIT)
	if (f_param_backpacks == 0) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addMagazineCargoGlobal [_ATmine,1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addMagazineCargoGlobal [_ATmine,2];
	};
};

// BACKPACK: SUBMACHINEGUNNER (SMG)
case "smg":
{
	// NO BACKPACK
	if (f_param_backpacks == 0) then {
		_unit addmagazines [_smgmag,2];
		_unit addmagazines [_grenade,1];_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
	};
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagsmall;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 8];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 4];
	};
};

// BACKPACK: DIVER (DIV)
case "div":
{
	// BACKPACK: LIGHT
	if (f_param_backpacks == 1) then {
		_unit addBackpack _bagmediumdiver;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_diverMag1, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_diverMag2, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		_unit addBackpack _bagmediumdiver;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_diverMag1, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_diverMag2, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	};
};

// BACKPACK: UAV
case "uav":
{
	_unit addBackpack _baguav;
};

// BACKPACK: CREW CHIEFS & VEHICLE DRIVERS
case "cc":
{
	_unit addBackpack _bagsmall;
	clearMagazineCargoGlobal (unitBackpack _unit);
	(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
};