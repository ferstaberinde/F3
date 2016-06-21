// Vehicle & Box LOADOUTS - NATO

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_riflemag, 8];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_ratmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal [_firstaid,4];
	};

// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_riflemag, 40];
		_unit addMagazineCargoGlobal [_glriflemag, 40];
		_unit addMagazineCargoGlobal [_carbinemag, 40];
		_unit addMagazineCargoGlobal [_armag, 22];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addmagazineCargoGlobal [_mgrenade,12];
		_unit addMagazineCargoGlobal [_smokegrenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 4];
		_unit addMagazineCargoGlobal [_glmag, 12];
		_unit addMagazineCargoGlobal [_glsmokewhite, 12];
		_unit addItemCargoGlobal [_firstaid,8];
	};

// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_riflemag, 20];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_armag, 8];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addmagazineCargoGlobal [_mgrenade,8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 8];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal [_firstaid,6];
	};

//CARGO: TANK
    case "v_tank":
	{
	    clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_smokegrenade,4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen,2];
		_unit addMagazineCargoGlobal [_chemgreen,4];
		_unit addItemCargoGlobal [_firstaid,2];
		_unit addItemCargoGlobal ["Toolkit",1];
	};
	
//CARGO: Rotary Transport Light
    case "v_helo_l":
    {
        clearWeaponCargoGlobal _unit;
	    clearMagazineCargoGlobal _unit;
	    clearItemCargoGlobal _unit;
	    clearBackpackCargoGlobal _unit;
	    _unit addMagazineCargoGlobal [_riflemag, 5];
	    _unit addMagazineCargoGlobal [_glriflemag, 5];
	    _unit addMagazineCargoGlobal [_armag, 2];
	    _unit addMagazineCargoGlobal [_carbinemag, 5];
	    _unit addMagazineCargoGlobal [_smokegrenade,4];
	    _unit addMagazineCargoGlobal [_smokegrenadegreen,2];
	    _unit addMagazineCargoGlobal [_chemgreen,4];
		_unit addItemCargoGlobal [_firstaid,2];
	    _unit addBackpackCargoGlobal ["B_Parachute",2];
		_unit addItemCargoGlobal ["Toolkit",1];
	};
	
//CARGO: Rotary Transport Medium
    case "v_helo_m":
	{
	    clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
	    _unit addWeaponCargoGlobal [_carbine,2];
		_unit addWeaponCargoGlobal [_rat,1];
		_unit addMagazineCargoGlobal [_riflemag,10];
		_unit addMagazineCargoGlobal [_glriflemag,10];
		_unit addMagazineCargoGlobal [_carbinemag,10];
		_unit addMagazineCargoGlobal [_armag,6];
		_unit addMagazineCargoGlobal [_ratmag,1];
		_unit addMagazineCargoGlobal [_grenade,4];
		_unit addmagazineCargoGlobal [_mgrenade,4];
		_unit addMagazineCargoGlobal [_smokegrenade,8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen,4];
		_unit addMagazineCargoGlobal [_glmag,12];
		_unit addMagazineCargoGlobal [_chemgreen,4];
		_unit addBackpackCargoGlobal [_bagmedium,2];
		_unit addItemCargoGlobal [_firstaid,4];
		_unit addBackpackCargoGlobal ["B_Parachute",2];
		_unit addItemCargoGlobal ["Toolkit",1];
	};
	
//CARGO: Rotary Transport Heavy
    case "v_helo_h":
	{
	    clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine,8];
		_unit addWeaponCargoGlobal [_rat,2];
		_unit addMagazineCargoGlobal [_riflemag,20];
		_unit addMagazineCargoGlobal [_glriflemag,20];
		_unit addMagazineCargoGlobal [_carbinemag,20];
		_unit addMagazineCargoGlobal [_armag,12];
		_unit addMagazineCargoGlobal [_ratmag,6];
		_unit addMagazineCargoGlobal [_grenade,12];
		_unit addmagazineCargoGlobal [_mgrenade,12];
		_unit addMagazineCargoGlobal [_smokegrenade,12];
		_unit addMagazineCargoGlobal [_smokegrenadegreen,4];
		_unit addMagazineCargoGlobal [_glmag,12];
		_unit addMagazineCargoGlobal [_glsmokewhite,12];
		_unit addMagazineCargoGlobal [_chemgreen,4];
		_unit addBackpackCargoGlobal [_bagmedium,4];
		_unit addItemCargoGlobal [_firstaid,6];
		_unit addBackpackCargoGlobal ["B_Parachute",4];
		_unit addItemCargoGlobal ["Toolkit",1];
	};
	
//CARGO: Rotary Attack
    case "v_helo_a":
	{
	    clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_smokegrenade,4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen,2];
		_unit addMagazineCargoGlobal [_chemgreen,4];
		_unit addItemCargoGlobal [_firstaid,2];
	};
	
//CARGO: Jet
    case "v_jet":
	{
	    clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_smokegrenade,2];
		_unit addMagazineCargoGlobal [_smokegrenadegreen,1];
		_unit addMagazineCargoGlobal [_chemgreen,2];
		_unit addItemCargoGlobal [_firstaid,1];
		_unit addBackpackCargoGlobal ["B_Parachute",1];
    };

// CRATE: Small, ammo for 1 fireteam
	case "crate_small":
    {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_riflemag, 5];
		_unit addMagazineCargoGlobal [_glriflemag, 5];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_carbinemag, 5];
		_unit addMagazineCargoGlobal [_glmag, 5];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_mgrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addItemCargoGlobal [_firstaid, 6];
    };

// CRATE: Medium, ammo for 1 squad
	case "crate_med":
    {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_riflemag, 15];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_armag, 15];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_glmag, 20];
		_unit addMagazineCargoGlobal [_glsmokewhite,16];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 25];
		_unit addMagazineCargoGlobal [_mgrenade, 25];
		_unit addMagazineCargoGlobal [_smokegrenade, 25];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 6];
		_unit addItemCargoGlobal [_firstaid, 25];
    };

// CRATE: Large, ammo for 1 platoon
	case "crate_large":
    {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_riflemag, 45];
		_unit addMagazineCargoGlobal [_glriflemag, 60];
		_unit addMagazineCargoGlobal [_armag, 45];
		_unit addMagazineCargoGlobal [_carbinemag, 60];
		_unit addMagazineCargoGlobal [_glmag, 60];
		_unit addMagazineCargoGlobal [_glsmokewhite,50];
		_unit addMagazineCargoGlobal [_ratmag, 20];
		_unit addMagazineCargoGlobal [_grenade, 75];
		_unit addMagazineCargoGlobal [_mgrenade, 75];
		_unit addMagazineCargoGlobal [_smokegrenade, 75];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 20];
		_unit addItemCargoGlobal [_firstaid, 75];
    };