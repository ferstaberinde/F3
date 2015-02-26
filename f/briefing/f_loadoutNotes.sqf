// F3 - Loadout Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_text","_stuff","_weps","_items","_fnc_wepMags","_wepMags","_magArr","_s","_mags","_bp","_maxload"];

// Local function to set the proper magazine count.
_fnc_wepMags = {
		private ["_w","_magarr"];
		_w = _this select 0;

		//Get possible magazines for weapon
		_wepMags = getArray (configFile >> "CfgWeapons" >> _w >> "magazines");

  		// Compare weapon magazines with player magazines
  		_magArr = [];
  		{
  			// findInPairs returns the first index that matches the checked for magazine
  			_s = [_mags,_x] call BIS_fnc_findInPairs;

  			//If we have a match
  			if (_s != -1) then {
  				// Add the number of magazines to the list
  				_magArr set [count _magArr,([_mags,[_s, 1]] call BIS_fnc_returnNestedElement)];

  				// Remove the entry
  				_mags = [_mags, _s] call BIS_fnc_removeIndex;

  			};
  		} forEach _wepMags;

  		if (count _magArr > 0) then {
  			_text = _text + " [";

  			{
  				_text = _text + format ["%1",_x];
  				if (count _magarr > (_forEachIndex + 1)) then {_text = _text + "+";}
  			} forEach _magArr;

  			_text = _text + "]";
  		};
};


// ====================================================================================

// SET UP KEY VARIABLES

_text = "<br />NOTE: The loadout shown below is only accurate at mission start.<br />
<br />";
_stuff = [];

// All weapons minus the field glasses
_weps = weapons player - ["Rangefinder","Binocular","Laserdesignator"];

// Get a nested array containing all attached weapon items
_wepItems = weaponsItems player;

// Get a nested array containing all unique magazines and their count
_mags = (magazines player) call BIS_fnc_consolidateArray;

// Get a nested array containing all non-equipped items and their count
_items = (items player) call BIS_fnc_consolidateArray;

// ====================================================================================

// WEAPONS
// Add lines for all carried weapons and corresponding magazines

if (count _weps > 0) then {
	_text = _text + "<font size='18'>WEAPONS [#MAGAZINES]:</font>";
	{
		_text = _text + format["<br/>%1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];

		//Add magazines for weapon
  		[_x] call _fnc_wepMags;

  		// Check if weapon has an underslung grenade launcher
		if ({_x in ["GL_3GL_F","EGLM","UGL_F"]} count (getArray (configFile >> "CfgWeapons" >> _x >> "muzzles")) > 0) then {
			_text = _text + "<br/> |- UGL";
			["UGL_F"] call _fnc_wepMags;
		};

		// List weapon attachments
		// Get attached items
		_attachments = _wepItems select (([_wepItems,_x] call BIS_fnc_findNestedElement) select 0);
		_attachments = [_attachments,0] call BIS_fnc_removeIndex; // Remove the first element as it points to the weapon itself

		{
			if (typeName _x != typeName [] && {_x != ""}) then {
				_text = _text + format["<br/> |- %1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
			};
		} forEach _attachments;

	} forEach _weps;
	_text = _text + "<br/>";
};

// ====================================================================================

// OTHER MAGAZINES
// Add lines for all magazines not tied to any carried weapon (grenades etc.)

if (count _mags > 0) then {
	_text = _text + "<br/><font size='18'>OTHER [#]:</font><br/>";

	{
		_text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayname"),_x select 1];
	} forEach _mags;
};

// ====================================================================================

// BACKPACK
// Add lines for all other items

if !(backpack player == "") then {
	_text = _text + "<br/><font size='18'>BACKPACK [%FULL]:</font><br/>";

	_bp = backpack player;
	_text = _text + format["%1 [%2",getText (configFile >> "CfgVehicles" >> _bp >> "displayname"), 100*loadBackpack player]+"%]<br/>";
	//_maxload = getNumber(configFile >> "CfgVehicles" >> _bp >> "maximumload");
	//_text = _text + format["%1 [%2/%3]<br/>",getText (configFile >> "CfgVehicles" >> _bp >> "displayname"), _maxload*loadBackpack player,_maxload];
};

// ====================================================================================

// ITEMS
// Add lines for all other items

if (count _items > 0) then {
	_text = _text + "<br/><font size='18'>ITEMS [#]:</font><br/>";

	{
		_text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgWeapons" >> _x select 0 >> "displayname"),_x select 1];
	} forEach _items;

	{
		_text = _text + format["*%1<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
	} forEach assignedItems player;

	_text = _text + "<br/>*Indicates an equipped item.";
};

// ====================================================================================

// ADD DIARY SECTION
// Wait for the briefing script to finish, then add the created text

waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["Loadout", _text]];