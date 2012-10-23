// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

private ['_lineCount', '_tmpText', '_type', '_vehicle', '_playerVehicle'];

_obj = _this select 0;
_objDist = _this select 1;
_scrPos = _this select 2;
_objDistMod = _this select 3;
_absolutePos = _this select 4;

_lineCount = 0;
_tmpText = "";
_type = vehicle _obj;
_ownGroup = group player;

if (_type isKindOf "Car" ||
		_type isKindOf "StaticWeapon" ||
		_type isKindOf "Plane" ||
		_type isKindOf "Helicopter" ||
		_type isKindOf "Tank") then {
	_vehicle = _obj;
	_objTypeStr = format["%1", (typeOf _vehicle)];
	_name = getText(configFile >> "cfgVehicles" >> _objTypeStr >> "displayName");
	_tmpText = _tmpText + format["%1:<br/>", _name];
	_lineCount = 1;
	{
		if (!(isNull _x) && alive _x) then {
			if (gunner _vehicle == _x) then {
				_tmpText = _tmpText + "G: ";
			};
			if (driver _vehicle == _x) then {
				_tmpText = _tmpText + "D: ";
			};
			if (commander _vehicle == _x) then {
				_tmpText = _tmpText + "C: ";
			};
			_nameColor = '#ffffff';
			_groupColor = '#ffffff';
			if (_x == leader group _x) then {
				_nameColor = '#ff0000'; // red
			};
			if (group _x == _ownGroup) then {
				_groupColor = '#ff0000'; // red
			};
			_tmpText = _tmpText + format["<t color='%1'>%2</t> (<t color='%3'>%4</t>)<br/>", _nameColor, name _x, _groupColor, group _x];
			_lineCount = _lineCount + 1;
		}
	} foreach (crew _vehicle);
}
else {
	_man = _obj;
	_group = group _man;
	_nameColor = '#ffffff';
	_groupColor = '#ffffff';

	if (alive _man) then
	{
		if (_man == leader _group) then {
			_nameColor = '#ff0000'; // red
		};
		if (_group == _ownGroup) then {
			_groupColor = '#ff0000'; // red
		};

		_tmpText = _tmpText + format["<t color='%1'>%2</t> (<t color='%3'>%4</t>)", _nameColor, name _man, _groupColor, _group];
		_lineCount = 1;
	};
};

foundUnitsText set [foundUnitsCount, [_tmpText, _scrPos, _lineCount, _objDistMod, _absolutePos]];

foundUnitsCount = foundUnitsCount + 1;
