// F3 - Medical Systems ACE3 Advanced Medical System Converter
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_unit","_itemCargoList","_cntFAK","_cntMediKit"];

// ====================================================================================

// DETECT CRATE TYPE

_unit = _this select 0;

// ====================================================================================

// COUNT AMOUNT OF FAKS AND MEDIKITS

_itemCargoList = itemCargo _unit;
_cntFAK = {_x == "FirstAidKit"} count _itemCargoList;
_cntMediKit = {_x == "MediKit"} count _itemCargoList;

// ====================================================================================

// REMOVE ALL VANILLA ITEMS

{
	if (_x == "FirstAidKit" || {_x == "Medikit"}) then {
		_itemCargoList = _itemCargoList - [_x];
		};
} forEach _itemCargoList;

clearItemCargoGlobal _unit;

{
	_unit addItemCargoGlobal [_x,1];
} forEach _itemCargoList;

// ====================================================================================

// ADD BACK ACE ITEMS FOR REMOVED VANILLA ITEMS

_unit addItemCargoGlobal ["ACE_fieldDressing", (_cntFAK * 5)];

if (_cntFAK <= 25 && _cntMediKit == 0 ) then // Fireteam sized cargo
	{
		_unit addItemCargoGlobal ["ACE_fieldDressing", 16];
		_unit addItemCargoGlobal ["ACE_morphine", 4];
		_unit addItemCargoGlobal ["ACE_tourniquet", 4];
		_unit addItemCargoGlobal ["ACE_elasticBandage", 12];
		_unit addItemCargoGlobal ["ACE_packingBandage", 12];
		_unit addItemCargoGlobal ["ACE_quikclot", 12];
		
	};

if (_cntFAK <= 25 && {_cntMediKit == 1}) then // Squad sized cargo
	{
		// Add items for 1 medic
		_unit addItemCargoGlobal ["ACE_fieldDressing", 15];
		_unit addItemCargoGlobal ["ACE_elasticBandage", 12];
		_unit addItemCargoGlobal ["ACE_packingBandage", 12];
		_unit addItemCargoGlobal ["ACE_quikclot", 15];
		_unit addItemCargoGlobal ["ACE_tourniquet", 3];		
		_unit addItemCargoGlobal ["ACE_salineIV_500", 4];
		_unit addItemCargoGlobal ["ACE_morphine", 5];
		_unit addItemCargoGlobal ["ACE_epinephrine", 5];
		_unit addItemCargoGlobal ["ACE_atropine",   8];
	};

if (_cntFAK > 50 || {_cntMediKit > 1}) then // Platoon sized Cargo
	{
		// Add items for 4 medics
		_unit addItemCargoGlobal ["ACE_fieldDressing", 60];
		_unit addItemCargoGlobal ["ACE_elasticBandage", 48];
		_unit addItemCargoGlobal ["ACE_packingBandage", 48];
		_unit addItemCargoGlobal ["ACE_quikclot", 60];
		_unit addItemCargoGlobal ["ACE_tourniquet", 40];		
		_unit addItemCargoGlobal ["ACE_salineIV_500", 16];
		_unit addItemCargoGlobal ["ACE_morphine", 20];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_atropine",   32];
		_unit addItemCargoGlobal ["ACE_surgicalKit", 12];
		_unit addItemCargoGlobal ["ACE_personalAidKit", 12];
		_unit addItemCargoGlobal ["ACE_plasmaIV", 3];
		_unit addItemCargoGlobal ["ACE_BloodIV", 3];
	};
