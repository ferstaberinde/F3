_dummy = _this select 0;
_ret = false;

if (((getPosASL player) select 2) > -2.5) then {

	_mine = _dummy getVariable "vip_mineObj";
	_pos = getPosASL _mine;
	_posMine = [_pos select 0, _pos select 1, (_pos select 2) + 0.3];
	_posASLPlayer = getPosASL player;

	if ((_posASLPlayer distance _posMine) <= 200) then {

		if ((_posASLPlayer distance _posMine) <= 100) then {

			_ret = true;
		} else {

			_modelPos = player selectionPosition "neck";
			_worldPos = player modelToWorld _modelPos;
			_posUnit = ATLtoASL _worldPos;
			_intersectsObjs = lineIntersects [_posMine, _posUnit, _mine, player];
			if !(_intersectsObjs) then {

				_intersectsTerrain = terrainIntersectASL [_posMine, _posUnit];
				if !(_intersectsTerrain) then {_ret = true};
			};
		};
	};

	if (_ret) then {_dummy setVariable ["vip_mineDet", true, true]};
};

_ret