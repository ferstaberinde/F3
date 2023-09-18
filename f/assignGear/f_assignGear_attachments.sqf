if (_attachments isEqualType []) then {
	removeAllPrimaryWeaponItems _unit;
	{
		// loop through the attachments and add them to the weapon
		_unit addPrimaryWeaponItem _x;
	} foreach _attachments;
};

// Handle handgun attachments
if (_hg_attachments isEqualType []) then {
	removeAllHandgunItems _unit;
	{
		// loop through the attachments and add them to the weapon
		_unit addHandgunItem _x;
	} foreach _hg_attachments;
};

// Handle launcher attachments
if (_lau_attachments isEqualType []) then {
	removeAllSecondaryWeaponItems _unit;
	{
		// loop through the attachments and add them to the weapon
		_unit addSecondaryWeaponItem _x;
	} foreach _lau_attachments;
};
