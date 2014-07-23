
_curator = _this select 0;


	_center = createCenter sideLogic;
	_group = createGroup _center;
	_pos = getpos player;
	_curator = _group createUnit ["ModuleCurator_F",_pos , [], 0, ""];
	_curator setVariable ["owner","#adminLogged"]; //Find how to integrate array of units etc.