// F3 - Medical Systems ACE3 Converter
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
_cntFAK = {_x == "FirstAidKit"} count _itemCargoList; _itemCargoList = _itemCargoList - ["FirstAidKit"];
_cntMediKit = {_x == "MediKit"} count _itemCargoList; _itemCargoList = _itemCargoList - ["Medikit"];

// ====================================================================================

// REMOVE ALL AND RE-ADD ALL VANILLA ITEMS

clearItemCargoGlobal _unit;
{
    _unit addItemCargoGlobal [_x,1];
} forEach _itemCargoList;

// ====================================================================================

// ADD ACE MEDICAL SUPPLIES

// Vanilla: MRAP 4 FAK, Truck 8 FAK, Crate 20 FAK

if (_cntFAK > 14 || {_cntMediKit > 1}) exitWith // Platoon sized Cargo
{
    _cntFAK = _cntFAK min 25; _cntFAK = _cntFAK max 8;
    _unit addItemCargoGlobal ["ACE_fieldDressing", (_cntFAK * 2)];
    _unit addItemCargoGlobal ["ACE_packingBandage", (_cntFAK * 2)]
    _unit addItemCargoGlobal ["ACE_tourniquet", _cntFAK];
    _unit addItemCargoGlobal ["ACE_morphine", _cntFAK];
    _unit addItemCargoGlobal ["ACE_epinephrine", _cntFAK];
    _unit addItemCargoGlobal ["ACE_salineIV_250", ceil (_cntFAK / 4)];
    _unit addItemCargoGlobal ["ACE_bodyBag", ceil (_cntFAK / 3)];
};
if (_cntFak > 7 || {_cntMediKit > 0}) exitWith // Squad sized Cargo
{
     _cntFAK = _cntFAK min 14; _cntFAK = _cntFAK max 4;
    _unit addItemCargoGlobal ["ACE_fieldDressing", (_cntFAK * 2)];
    _unit addItemCargoGlobal ["ACE_packingBandage", (_cntFAK * 2)]
    _unit addItemCargoGlobal ["ACE_tourniquet", _cntFAK];
    _unit addItemCargoGlobal ["ACE_morphine", _cntFAK];
    _unit addItemCargoGlobal ["ACE_epinephrine", _cntFAK];
    _unit addItemCargoGlobal ["ACE_bloodIV", ceil (_cntFAK /3)];
    _unit addItemCargoGlobal ["ACE_bodyBag", ceil (_cntFAK /3)];
};
if (_cntFAK > 0) exitWith // Fireteam sized Cargo
{
    _unit addItemCargoGlobal ["ACE_fieldDressing", (_cntFAK * 2)];
    _unit addItemCargoGlobal ["ACE_packingBandage", (_cntFAK * 2)]
    _unit addItemCargoGlobal ["ACE_tourniquet", _cntFAK];
    _unit addItemCargoGlobal ["ACE_morphine", _cntFAK];
    _unit addItemCargoGlobal ["ACE_bodyBag", 1];
};
