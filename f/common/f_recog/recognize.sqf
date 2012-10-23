// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

if (!recogIsDisplayed) exitWith { foundUnitsCount = 0; };


// player globalChat format["Recognize"];

_gen = player;
_tolerance = recognizeTolerance;
_maxDistance = recognizeDistance;
/*
   _bbMan = boundingBox _gen;
   _sizeMan = (_bbMan select 0) distance (_bbMan select 1);
 */
_ownSide = side _gen;

_possibleVehicles = ["Man", "Car", "Tank", "StaticWeapon", "Helicopter", "Plane"];

// update the overlays until key is pressed again
_playerVehicle = vehicle _gen;
_genPos = getPos _gen;

_objects = [];
_i = 0;
{
	if (side _x == _ownSide && _x != _gen) then {
		_objects set [_i, _x];
		_i = _i + 1;
	};
} foreach nearestObjects [_genPos, _possibleVehicles, _maxDistance];
_objCount = count _objects;

foundUnitsText = [];
foundUnitsCount = 0;
_i = 0;
_shownObjects = 0;

// for every friendly object in _distanceMax distance, check how
// much the player is looking at it
while { (_shownObjects < 10) && (_i < _objCount) } do {
	_obj = _objects select _i;
	if (_obj != _playerVehicle) then {
		_objPos = getPos _obj;
		_bb = boundingBox _obj;

		// move the z ordinate to the middle of the BB
		// but 1m at most, so the position of tags is in
		// the object's center or lower
		_bbZMin = (_bb select 0) select 2;
		_bbZMax = (_bb select 1) select 2;
		_bbZDiff = (_bbZMax - _bbZMin) / 2.0;
		if (_bbZDiff > 1) then { _bbZDiff = 1; };
		_objPos set [2, (_objPos select 2) + _bbZDiff];
		_scrPos = worldToScreen _objPos;

		//player globalChat format["scr: %1", _scrPos];
		if (count _scrPos == 2) then {
			_scrX = _scrPos select 0;
			_scrY = _scrPos select 1;
			if (_scrX < 1.5 && _scrX > -1.5 && _scrY < 1.5 && _scrY > -1.5) then {
				_distToCenter = sqrt ((_scrX - 0.5) * (_scrX - 0.5) + (_scrY - 0.5) * (_scrY - 0.5));

				// extend the tolerance for objects based on their size relative
				// to the size of a human (diagonal through the BB)
				/*
				   _bb = boundingBox _obj;
				   _objSize = (_bb select 0) distance (_bb select 1);
				   _objSizeMod = _objSize / _sizeMan;
				 */
				_objSizeMod = 1.0;

				// modifier based on the distance, between 2
				// (close) and 1 (at _maxDistance)
				_objDist = _gen distance _obj;
				_objDistMod = 2 - (_objDist / _maxDistance);

				if (_distToCenter <= _tolerance * _objSizeMod * _objDistMod) then {
					_shownObjects = _shownObjects + 1;
					[_obj, _objDist, _scrPos, _objDistMod, false] call generateLabelText;
				};
			};
		};
	};
	_i = _i + 1;
};

// if the player is in a vehicle, show the crew list
// independantly from the look direction
if (_playerVehicle != _gen) then {
	if (foundUnitsCount > 9) then {
		foundUnitsCount = 9;
	};
	[_playerVehicle, 0, [0.0, 0.05], 2, true] call generateLabelText;
};

