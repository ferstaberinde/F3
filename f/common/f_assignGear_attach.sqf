// F3 - Folk ARPS Attachment Gear Script
// Credits: Head
_wepClass = primaryweapon _unit;
switch(_wepClass) do
{
	case _rifle: 
	{
		if(!isnil "_rifle_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _rifle_attach;
		};
	};
	case _carbine: 
	{
		if(!isnil "_carbine_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _carbine_attach;
		};
	};
	case _glrifle: 
	{
		if(!isnil "_glrifle_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _glrifle_attach;
		};
	};
	case _smg: 
	{
		if(!isnil "_smg_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _smg_attach;
		};
	};
	case _AR: 
	{
		if(!isnil "_AR_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _AR_attach;
		};
	};
	case _MMG: 
	{
		if(!isnil "_MMG_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _MMG_attach;
		};
	};
	case _SNrifle: 
	{
		if(!isnil "_SNrifle_attach") then
		{
			_wepItems = primaryWeaponItems _unit;
			{
				_unit removeItemFromPrimaryWeapon _x;
				_unit removeItem _x;
			} foreach _wepItems;
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _SNrifle_attach;
		};
	};
	case _diverWep:
		{
			if(!isnil "_diverWep_attach") then
			{
				_wepItems = primaryWeaponItems _unit;
				{
					_unit removeItemFromPrimaryWeapon _x;
					_unit removeItem _x;
				} foreach _wepItems;
				{
					_unit addPrimaryWeaponItem _x;
				} foreach _diverWep_attach;
			};
	};
};