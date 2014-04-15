// F3 - Folk Assign Gear Script - Crates
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE LOAD TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//
//		nato - to resupply one NATO squad
//		csat - to resupply one CSAT squad
//		aaf - to resupply one AAF squad
//		fia - to resupply one FIA squad
//
// ====================================================================================

clearWeaponCargoGlobal _unit;
clearMagazineCargoGlobal _unit;
clearItemCargoGlobal _unit;
clearBackpackCargoGlobal _unit;

switch (_typeOfUnit) do {
	case "nato":
		{

				_unit addWeaponCargoGlobal ["arifle_MXC_F", 2];
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

};