// F2 - Construction Interface (COIN) Presets
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_coin","_coinOp","_coinType","_coinFunds","_str_coin","_str_coinOp","_barriers","_sandbags","_hesco","_bunkers","_weaponsUSMC","_weaponsCDF","_weaponsRU","_weaponsINS","_weaponsGUE","_items"];

// ====================================================================================

// SET KEY VARIABLES
// The Construct Module Name, Construct Operator, Type of Funds and Funds amount are passed from the script call

if ( isnil "f_COINpresetsINIT" ) then {f_COINpresetsINIT = []};
_coin = _this select 0;
_coinOp = _this select 1;
_coinType = _this select 2;
_coinFunds = _this select 3;
_str_coin = str _coin;
_str_coinOp = str _coinOp;
	
if (isNull (call compile format ["%1", _coinOP]))exitWith{}; 
_coinOP = call compile format ["%1",  _coinOP]; 
if (player != _coinOp) exitWith {};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_COINpresets.sqf): COIN Name: %1 | Operator: %2 | Type: %3 | Funds: %4",_str_coin,_str_coinOp,_coinType,_coinFunds];
};

f_COINpresetsINIT = f_COINpresetsINIT + [f_COINstopped];

// ====================================================================================

// BASIC COIN CONFIGURATION
// The following lines set the coin's name, level of funds etc.

call compile format ["_coin setvariable [""BIS_COIN_funds"",[""%1Var""]];",_str_coin];
call compile format ["%1Var = _coinFunds",_str_coin];
_coin setvariable ["BIS_COIN_fundsDescription",[""]];
_coin setvariable ["BIS_COIN_areasize",[30,30]];
_coin setvariable ["BIS_COIN_actionCondition","!(f_COINstopped)"];

// ====================================================================================

// NIGHT VISION GOGGLE TOGGLE

player setVariable ["F_COINname", _coin];
F_keyPressed = compile preprocessfile "f\common\F_keyPressed.sqf";
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call F_keyPressed"];

// ====================================================================================

// BUILD CATEGORIES
// The following blocks of code populate each possible category

// CATEGORY: BARRIERS

_barriers = [];
_barriers = _barriers + [["Fort_RazorWire","Barriers",300]];
_barriers = _barriers + [["Hedgehog","Barriers",100]];
_barriers = _barriers + [["Hhedgehog_concrete","Barriers",300]];
_barriers = _barriers + [["Hhedgehog_concreteBig","Barriers",300]];
_barriers = _barriers + [["Fort_Barricade","Barriers",500]];

// CATEGORY: SANDBAGS

_sandbags = [];
_sandbags = _sandbags + [["Land_BagFenceCorner","Sandbags",100]];
_sandbags = _sandbags + [["Land_BagFenceEnd","Sandbags",100]];
_sandbags = _sandbags + [["Land_BagFenceShort","Sandbags",100]];
_sandbags = _sandbags + [["Land_BagFenceLong","Sandbags",300]];
_sandbags = _sandbags + [["Land_BagFenceRound","Sandbags",300]];
_sandbags = _sandbags + [["Land_fort_bagfence_long","Sandbags",300]];
_sandbags = _sandbags + [["Land_fort_bagfence_corner","Sandbags",300]];
_sandbags = _sandbags + [["Land_fort_bagfence_round","Sandbags",500]];

// CATEGORY: HESCO

_hesco = [];
_hesco = _hesco + [["Land_HBarrier1","HESCO",100]];
_hesco = _hesco + [["Land_HBarrier3","HESCO",300]];
_hesco = _hesco + [["Land_HBarrier5","HESCO",500]];
_hesco = _hesco + [["Land_HBarrier_large","HESCO",1000]];

// CATEGORY: BUNKERS

_bunkers = [];
_bunkers = _bunkers + [["Land_fortified_nest_small","Bunkers",500]];
_bunkers = _bunkers + [["Land_fortified_nest_big","Bunkers",1000]];
_bunkers = _bunkers + [["Land_Fort_Watchtower","Bunkers",1000]];

// CATEGORY: RAMPARTS

_ramparts = [];
_ramparts = _ramparts + [["Fort_EnvelopeSmall","Ramparts",100]];
_ramparts = _ramparts + [["Fort_EnvelopeBig","Ramparts",300]];
_ramparts = _ramparts + [["Land_fort_rampart","Ramparts",1000]];
_ramparts = _ramparts + [["Land_fort_artillery_nest","Ramparts",1000]];

// CATEGORY: STATIC WEAPONS (USMC)

_weaponsUSMC = [];
_weaponsUSMC = _weaponsUSMC + [["SearchLight","Weapons",1000]];
_weaponsUSMC = _weaponsUSMC + [["M119","Weapons",1000]];
_weaponsUSMC = _weaponsUSMC + [["M2HD_mini_TriPod","Weapons",1000]];
_weaponsUSMC = _weaponsUSMC + [["M2StaticMG","Weapons",1000]];
_weaponsUSMC = _weaponsUSMC + [["MK19_TriPod","Weapons",1000]];
_weaponsUSMC = _weaponsUSMC + [["Stinger_Pod","Weapons",1000]];
_weaponsUSMC = _weaponsUSMC + [["TOW_TriPod","Weapons",1000]];

// CATEGORY: STATIC WEAPONS (CDF)

_weaponsCDF = [];
_weaponsCDF = _weaponsCDF + [["AGS_CDF","Weapons",1000]];
_weaponsCDF = _weaponsCDF + [["D30_CDF","Weapons",1000]];
_weaponsCDF = _weaponsCDF + [["DSHKM_CDF","Weapons",1000]];
_weaponsCDF = _weaponsCDF + [["DSHkM_Mini_TriPod_CDF","Weapons",1000]];
_weaponsCDF = _weaponsCDF + [["SPG9_CDF","Weapons",1000]];
_weaponsCDF = _weaponsCDF + [["SearchLight_CDF","Weapons",1000]];
_weaponsCDF = _weaponsCDF + [["ZU23_CDF","Weapons",1000]];

// CATEGORY: STATIC WEAPONS (RUSSIAN)

_weaponsRU = [];
_weaponsRU = _weaponsRU + [["AGS_RU","Weapons",1000]];
_weaponsRU = _weaponsRU + [["D30_RU","Weapons",1000]];
_weaponsRU = _weaponsRU + [["Igla_AA_pod_East","Weapons",1000]];
_weaponsRU = _weaponsRU + [["KORD","Weapons",1000]];
_weaponsRU = _weaponsRU + [["Metis","Weapons",1000]];
_weaponsRU = _weaponsRU + [["SearchLight_RUS","Weapons",1000]];

// CATEGORY: STATIC WEAPONS (CHDKZ)

_weaponsINS = [];
// _weaponsINS = _weaponsINS + [["AGS_Ins","Weapons",1000]];
// _weaponsINS = _weaponsINS + [["D30_Ins","Weapons",1000]];
_weaponsINS = _weaponsINS + [["DSHKM_Ins","Weapons",1000]];
// _weaponsINS = _weaponsINS + [["DSHkM_Mini_TriPod","Weapons",1000]];
// _weaponsINS = _weaponsINS + [["SPG9_Ins","Weapons",1000]];
_weaponsINS = _weaponsINS + [["SearchLight_INS","Weapons",500]];
// _weaponsINS = _weaponsINS + [["ZU23_Ins","Weapons",1000]];

// CATEGORY: STATIC WEAPONS (NAPA)

_weaponsGUE = [];
_weaponsGUE = _weaponsGUE + [["DSHKM_Gue","Weapons",1000]];
// _weaponsGUE = _weaponsGUE + [["SPG9_Gue","Weapons",1000]];
_weaponsGUE = _weaponsGUE + [["SearchLight_Gue","Weapons",500]];
// _weaponsGUE = _weaponsGUE + [["ZU23_Gue","Weapons",1000]];

// ====================================================================================

// SELECT COIN AVAILABLE ITEMS
// Using the value of the variable _coinType we determine the items available in this COIN instance.

switch (_coinType) do
{
// Barriers, Sandbags, HESCO, Bunkers and Ramparts
	case 0:
	{
		_coin setvariable ["BIS_COIN_categories",["Barriers","Sandbags","HESCO","Bunkers","Ramparts"]];
		_items = [];
		_items = _items + _barriers;
		_items = _items + _sandbags;
		_items = _items + _hesco;
		_items = _items + _bunkers;
		_items = _items + _ramparts;
		_coin setvariable ["BIS_COIN_items",_items];
	};
// USMC Weapons + Barriers, Sandbags, HESCO, Bunkers and Ramparts 
	case 1:
	{
		_coin setvariable ["BIS_COIN_categories",["Barriers","Sandbags","HESCO","Bunkers","Ramparts","Weapons"]];
		_items = [];
		_items = _items + _barriers;
		_items = _items + _sandbags;
		_items = _items + _hesco;
		_items = _items + _bunkers;
		_items = _items + _ramparts;
		_items = _items + _weaponsUSMC;
		_coin setvariable ["BIS_COIN_items",_items];
	};
// CDF Weapons + Barriers, Sandbags, HESCO, Bunkers and Ramparts 
	case 2:
	{
		_coin setvariable ["BIS_COIN_categories",["Barriers","Sandbags","HESCO","Bunkers","Ramparts","Weapons"]];
		_items = [];
		_items = _items + _barriers;
		_items = _items + _sandbags;
		_items = _items + _hesco;
		_items = _items + _bunkers;
		_items = _items + _ramparts;
		_items = _items + _weaponsCDF;
		_coin setvariable ["BIS_COIN_items",_items];
	};
// Russian Weapons + Barriers, Sandbags, HESCO, Bunkers and Ramparts 
	case 3:
	{
		_coin setvariable ["BIS_COIN_categories",["Barriers","Sandbags","HESCO","Bunkers","Ramparts","Weapons"]];
		_items = [];
		_items = _items + _barriers;
		_items = _items + _sandbags;
		_items = _items + _hesco;
		_items = _items + _bunkers;
		_items = _items + _ramparts;
		_items = _items + _weaponsRU;
		_coin setvariable ["BIS_COIN_items",_items];
	};
// ChDKZ Weapons + Barriers, Sandbags, HESCO, Bunkers and Ramparts 
	case 4:
	{
		_coin setvariable ["BIS_COIN_categories",["Barriers","Sandbags","HESCO","Bunkers","Ramparts","Weapons"]];
		_items = [];
		_items = _items + _barriers;
		_items = _items + _sandbags;
		_items = _items + _hesco;
		_items = _items + _bunkers;
		_items = _items + _ramparts;
		_items = _items + _weaponsINS;
		_coin setvariable ["BIS_COIN_items",_items];
	};
// NAPA Weapons + Barriers, Sandbags, HESCO, Bunkers and Ramparts 
	case 5:
	{
		_coin setvariable ["BIS_COIN_categories",["Barriers","Sandbags","HESCO","Bunkers","Ramparts","Weapons"]];
		_items = [];
		_items = _items + _barriers;
		_items = _items + _sandbags;
		_items = _items + _hesco;
		_items = _items + _bunkers;
		_items = _items + _ramparts;
		_items = _items + _weaponsGUE;
		_coin setvariable ["BIS_COIN_items",_items];
	};
};

// ====================================================================================

// KEEP COIN NEAR OPERATOR
// We keep the COIN instance near to its operator (so the menu is always available).

while {!(f_COINstopped)} do 
{
	if (format ["%1", _coinOp] == "any") exitWith {}; //added 90909
	_coin setPos [(getPos _coinOp select 0),(getPos _coinOp select 1)]; 
	sleep 6;
};

// ====================================================================================

// REMOVE COIN FUNCTIONALITY
// f_COINstopped has been set to true. The construction module will now be deleted 
// which will result in the removal of the construction interface attached to this 
// instance of the module.

BIS_COIN_QUIT = true;
_preview = _coin getvariable "BIS_COIN_preview";
if !(isnil "_preview") then {deletevehicle _preview};
_coin setvariable ["BIS_COIN_preview",nil];
_coin setvariable ["BIS_COIN_params",[]];

BIS_CONTROL_CAM cameraeffect ["terminate","back"];
camdestroy BIS_CONTROL_CAM;
BIS_CONTROL_CAM = nil;
deletevehicle _coin;

// ====================================================================================

