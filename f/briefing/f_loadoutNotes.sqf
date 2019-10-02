// F3 - Loadout Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface || (side player == sideLogic)) exitWith {}; //Exit if not a player.

// Local function to set the proper magazine count.
private _fnc_wepMags = {
	params [
		["_weapon", "", [""]],
		["_mags", [], [[]]]
	];

	//Get possible magazines for weapon
	private _wepMags = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

	// Compare weapon magazines with player magazines
	private _magArr = [];
	{
		// findInPairs returns the first index that matches the checked for magazine
		private _index = [_mags,_x] call BIS_fnc_findInPairs;

		//If we have a match
		if (_index != -1) then {
			// Add the number of magazines to the list
			_magArr pushBack ([_mags,[_index, 1]] call BIS_fnc_returnNestedElement);

			// Remove the entry
			_mags deleteAt _index;

		};
	} forEach _wepMags;

	_magArr
};

// Local function to get the name and picture of a weapon/item
private _fnc_name = {
	params [
		["_name", "", [""]], 
		["_type", "CfgWeapons", [""]],
		["_prefix", "", [""]],
		["_short", false, [false]]
	];

	private _picture = getText (configFile >> _type >> _name >> "picture");
	if ! (_picture isEqualTo "") then {
		if (_picture find ".paa" == -1) then {
			_picture = _picture + ".paa"
		};
		_picture = format ["<img image='%1' height='24'/>", _picture];
	};

	format[
		["%1%2%3 ", "%1%2 "] select _short,
		_prefix,
		_picture,
		getText (configFile >> _type >> _name >> "displayname")
	]
};
private _fnc_nameShort = {
	params [
		["_name", "", [""]], 
		["_type", "CfgWeapons", [""]],
		["_prefix", "", [""]]
	];
	[_name, _type, _prefix, true] call _fnc_name
};

// Local function to format the text for magazine counts
private _fnc_magArrText = {
	params [["_magArr", [], [[]]]];
	if (count _magArr > 0) exitWith {
		format ["[%1]", _magArr joinString "+"]
	};
	""
};

private _fnc_loadoutDataToText = {
	params [
		["_full", true, [true]],
		["_wepItems", [], [[]]],
		["_mags", [], [[]]],
		["_items", [], [[]]],
		["_items_assigned", [], [[]]],
		["_bp", "", [""]],
		["_bpLoad", 0, [0]],
		["_weps", [], [[]]]
	];

	private _arrow = "<img image='\A3\ui_f\data\gui\rscCommon\rscTree\hiddenTexture_ca.paa' height='24'/>";
	private _classesBlacklist = ["HandGrenade", "1Rnd_HE_Grenade_shell", "FirstAidKit"];

	//Generate the loadout text from the previously defined variables.
	private _textLong = "";
	private _textShrt = "";

	// WEAPONS
	if (count _weps > 0) then {
		_textLong = _textLong + "<font size='18'>WEAPONS [#MAGAZINES]:</font>";
		{
			_x params [
				["_weapon", "", [""]],
				["_magArr", [], [[]]],
				["_ugls", [], [[]]],
				["_attachments", [], [[]]]
			];

			// Weapon name and picture
			_textLong = _textLong + "<br/>" + ([_weapon] call _fnc_name);
			_textShrt = _textShrt + ([_weapon] call _fnc_name);

			// Weapon magazines
			_textLong = _textLong + ([_magArr] call _fnc_magArrText);
			_textShrt = _textShrt + ([_magArr] call _fnc_magArrText);

			// Underslung grenade launcher
			{
				//private _picture = "<img image='\A3\ui_f\data\igui\cfg\weaponicons\GL_ca.paa' height='20'/>";
				private _picture = "<img image='\A3\Weapons_f\Data\ui\gear_UGL_slug_CA.paa' height='24'/>";
				_textLong = _textLong + "<br/>" + _arrow + _picture + "UGL" + ([_x] call _fnc_magArrText);
				_textShrt = _textShrt + " + " +  _picture + ([_x] call _fnc_magArrText);
			} forEach _ugls;

			// Weapon attachments
			{
				_textLong = _textLong + "<br/>" + ([_x, "CfgWeapons", _arrow] call _fnc_name);
				_textShrt = _textShrt + ([_x, "CfgWeapons", " + "] call _fnc_nameShort);
			} forEach _attachments;

			_textLong = _textLong + "<br/>";
			_textShrt = _textShrt + "<br/>";
		} forEach _weps;
	};

	// BACKPACK
	// Add lines for all other items
	if (_bp != "") then {
		_textLong = _textLong + "<br/><font size='18'>BACKPACK [%FULL]:</font><br/>";
		private _bpText = ([_bp, "CfgVehicles"] call _fnc_name);
		if (getContainerMaxLoad _bp > 0) then {
			_bpText = _bpText + format["[%1%2]",round _bpLoad,"%"];
		} else {
			//For the short version: only show special non-cargo backpacks
			_textShrt = _textShrt + _bpText + "<br/>";
		};
		_textLong = _textLong + _bpText + "<br/>";
	};

	// OTHER 
	if (! _full) then {
		_mags  = _mags  select {private _class = _x select 0; {_class isKindOf [_x, configfile >> "CfgMagazines"]} count _classesBlacklist == 0 };
		_items = _items select {private _class = _x select 0; {_class isKindOf [_x, configfile >> "CfgWeapons"  ]} count _classesBlacklist == 0 };
	};
	if (count _mags > 0 || count _items > 0 || count _items_assigned > 0) then {
		_textLong = _textLong + "<br/><font size='18'>OTHER [#]:</font>";

		{
			_x params [
				["_className", "", [""]],
				["_num", 0, [0]]
			];
			_textLong = _textLong + "<br/>" + ([_className, "CfgMagazines"] call _fnc_name) + format[" [%1]", _num];
			_textShrt = _textShrt + ([_className, "CfgMagazines"] call _fnc_nameShort) + format[" [%1]", _num];
		} forEach _mags;

		{
			_x params [
				["_className", "", [""]],
				["_num", 0, [0]]
			];
			_textLong = _textLong + "<br/>" + ([_className, "CfgWeapons"] call _fnc_name) + format[" [%1]",_num];
			_textShrt = _textShrt + ([_className, "CfgWeapons"] call _fnc_nameShort) + format[" [%1]", _num];
		} forEach _items;

		if (count _mags > 0 || count _items > 0) then {
			_textLong = _textLong + "<br/>";
			_textShrt = _textShrt + "<br/>";
		};

		{
			_textLong = _textLong + "<br/>" + ([_x, "CfgWeapons"] call _fnc_name);
		} forEach _items_assigned;
		
	};


	//return value
	if (_full) exitWith {_textLong};

	_textShrt
};

private _fnc_getLoadout = {
	params [
		["_unit", player, [objNull]],
		["_full", true, [true]]
	];

	// Get a nested array containing all attached weapon items
	private _wepItems = weaponsItems _unit;

	// Get a nested array containing all unique magazines and their count
	private _mags = (magazines _unit) call BIS_fnc_consolidateArray;

	// Get a nested array containing all non-equipped items and their count
	private _items = (items _unit) call BIS_fnc_consolidateArray;
	private _items_assigned = assignedItems _unit;
	
	// Backpack and backpack-load in percent
	private _bp = backpack _unit;
	private _bpLoad = 100 * loadBackpack _unit;

	// All weapons minus the field glasses
	private _weps = (weapons _unit);
	_weps = _weps select {(toLower (getText(configFile >> "CfgWeapons" >> _x >> "simulation"))) != "binocular"};
	_weps = _weps apply {
		// Magazines
		private _magArr = [_x, _mags] call _fnc_wepMags;

		// Check if weapon has an underslung grenade launcher
		private _muzzles = getArray(configFile >> "CfgWeapons" >> _x >> "muzzles") apply {toLower _x};
		private _ugls = [configFile >> "CfgWeapons" >> _x,0,true] call BIS_fnc_returnChildren;
		_ugls = _ugls select {"GrenadeLauncher" in ([_x,true] call BIS_fnc_returnParents)};
		_ugls = _ugls apply {configName _x};
		_ugls = _ugls select {(toLower _x) in _muzzles};
		_ugls = _ugls apply {["UGL_F", _mags] call _fnc_wepMags};

		// List weapon attachments
		// Get attached items
		private _attachments = _wepItems select (([_wepItems,_x] call BIS_fnc_findNestedElement) select 0);
		_attachments deleteAt 0; // Remove the first element as it points to the weapon itself
		_attachments = _attachments select { !(_x isEqualType []) && {_x != ""} };

		//return value:
		[_x, _magArr, _ugls, _attachments]
	};

	//Note: At this point "_mags" only consists of magazine types that are
	// not compatible with the unit's weapons.

	[_full, _wepItems, _mags, _items, _items_assigned, _bp, _bpLoad, _weps] call _fnc_loadoutDataToText
};

private _text_notice = "NOTE: The loadout shown below is only accurate at mission start.<br /><br />";

// ====================================================================================
// Wait for the briefing script to finish, so that the loadout appears at the top.
waitUntil {scriptDone f_script_briefing};

// ====================================================================================
// Normal loadout for the player:
private _text = _text_notice + ([player] call _fnc_getLoadout);
// ====================================================================================
// Loadout page for group members
private _units = (units (group player));
private _text_group = "" + _text_notice;
{
	private _text_loadout = [_x, false] call _fnc_getLoadout;
	private _unit_name = format ["<font face='PuristaBold'>%1</font><font face='PuristaLight'> (%2):</font><br/>", name _x, roleDescription _x];
	_text_group = _text_group + format ["%1", _unit_name] + _text_loadout + "<br/><br/>";
} forEach _units;
// ====================================================================================
// Create Loadout pages
player createDiaryRecord ["diary", ["Loadout Team", _text_group]];
player createDiaryRecord ["diary", ["Loadout", _text]];
// ====================================================================================
