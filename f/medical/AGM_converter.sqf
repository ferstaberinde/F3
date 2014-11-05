// F3 - Medical Systems AGM Converter
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_unit","_itemCargoList","_cntFAK","_cntMediKit","_cntBandages"];

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

// ADD BACK AGM ITEMS FOR REMOVED VANILLA ITEMS

_cntBandages = _cntFAK * 5;
_unit addItemCargoGlobal ["AGM_Bandage", _cntBandages];

if (_cntFAK <= 10 && _cntMediKit == 0 ) then // Fireteam sized cargo
	{
		// Do nothing
	};

if (_cntFAK <= 50 || _cntMediKit == 1) then // Squad sized cargo
	{
		// Add items for 1 medic
		_unit addItemCargoGlobal ["AGM_Bandage", 15];
		_unit addItemCargoGlobal ["AGM_Morphine", 15];
		_unit addItemCargoGlobal ["AGM_Epipen", 15];
		_unit addItemCargoGlobal ["AGM_Bloodbag", 5];
	};

if (_cntFAK > 50 || _cntMediKit > 1) then // Platoon sized Cargo
	{
		// Add items for 4 medics
		_unit addItemCargoGlobal ["AGM_Bandage", 45];
		_unit addItemCargoGlobal ["AGM_Morphine", 45];
		_unit addItemCargoGlobal ["AGM_Epipen", 45];
		_unit addItemCargoGlobal ["AGM_Bloodbag", 15];
	};
