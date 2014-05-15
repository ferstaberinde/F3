if (typeName _attachments == typeName []) then {
	removeAllPrimaryWeaponItems _unit;
	{
		// loop trough the attachments and add them to the weapon
		_unit addPrimaryWeaponItem _x;
	} foreach _attachments;
};

// Handle handgun attachments
if (typeName _hg_attachments == typeName []) then {
	removeAllHandgunItems _unit;
	{
		// loop trough the attachments and add them to the weapon
		_unit addHandgunItem _x;
	} foreach _hg_attachments;
};