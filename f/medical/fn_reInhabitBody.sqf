_camera = player;
F_UncCC ppEffectEnable false;
_unit = _this select 0;
selectPlayer _unit;

(_unit) setPosATL ([(getposATL (_unit)), 1.2, direction (_unit)] call BIS_fnc_relPos);
deleteVehicle _camera;