// F3 - GEAR Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// TODO:
// Count for > 1 items (medpaks)
// Add button to re-calculate equipment?
// TODO: Weapon items
// TODO: Backpack

// DECLARE VARIABLES

private ["_text","_stuff","_weps","_mags","_items","_wepMags"];

// ====================================================================================

// SET UP KEY VARIABLES

_text = "<br />NOTE: The GEAR shown below is only accurate at mission start.<br />
<br />";
_stuff = [];

// All weapons minus the ooglers
_weps = weapons player - ["Rangefinder","Binocular","Laserdesignator"];

// As there's no command to create an array of all magazines without duplicates we need to do this manually
_mags = [];
{if !(_x in _mags) then {_mags set [count _mags,_x]}} forEach magazines player;

_items = (items player + assignedItems player);

// ====================================================================================

// WEAPONS
// Add lines for all carried weapons and corresponding magazines

if (count _weps > 0) then {
	_text = _text + "WEAPONS:<br/>";
	{
		_text = _text + format["%1 <br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];

		/*
		// Get attached items
		{
			// Ignore magazines (stored as array)
			if (typeName _x != typeName []) then {
				_text = _text + format["- %1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
			};
			_text = _text + "<br/>";
		} forEach weaponsItems player;
		*/

		// Get possible magazines
		_wepMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");

		// Check if it has an underslung grenade launcher, if yes add the grenade-classes to the magazine array
		if ("EGLM" in getArray (configFile >> "CfgWeapons" >> _x >> "muzzles")) then {
			_wepMags = _wepMags + getArray (configFile >> "CfgWeapons" >> "UGL_F" >> "magazines");
		};

		// Loop through all magazines. Those added remove from the full magazine list
		{
			if (_x in _mags) then {
				_m = _x;
				_text = _text + format["|- %1 (%2)<br/>",getText (configFile >> "CfgMagazines" >> _m >> "displayname"),{_m == _x} count magazines player];
				_mags = _mags - [_m];
			};
		} forEach _wepMags;

	} forEach _weps;
	_text = _text + "<br/>";
};

// ====================================================================================

// OTHER MAGAZINES
// Add lines for all magazines not tied to any carried weapon (grenades etc.)

if (count _mags > 0) then {
	_text = _text + "OTHER:<br/>";

	{
		_m = _x;
		_text = _text + format["%1 (%2)<br/>",getText (configFile >> "CfgMagazines" >> _m >> "displayname"), {_m == _x} count magazines player];
	} forEach _mags;
	_text = _text + "<br/>";
};

// ====================================================================================

// ITEMS
// Add lines for all other items

if (count _items > 0) then {
	_text = _text + "ITEMS:<br/>";

	{
		_text = _text + format["%1*<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
	} forEach assignedItems player;

	{
		_text = _text + format["%1<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
	} forEach items player;

	_text = _text + "<br/>";
};

// ====================================================================================

// BACKPACK
// If unit is carrying a backpack add it and list it's contains
// TODO: COUNT
// TODO: differentiate between mag and weapon
/*
if !(backpack player == "") then {
	_text = _text + "BACKPACK:<br/>";

	// TODO FIX
	_text = _text + format["%1<br/>",getText (configFile >> "CfgWeapons" >> (backpack player) >> "displayname")];

	{
		_text = _text + format["%1*<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
	} forEach backpackItems player;

	_text = _text + "<br/>";
};
*/

// ====================================================================================

// ADD DIARY SECTION
// Wait for the briefing script to finish, then add the created text

waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["GEAR", _text]];