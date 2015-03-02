_obj = _this select 0;
_bb = boundingBoxReal _obj;
_min = _bb select 0;
_max = _bb select 1;

_x1y1z1 = _obj modeltoworldVisual [_min select 0, _min select 1, _min select 2];
_x1y2z1 = _obj modeltoworldVisual [_min select 0, _max select 1, _min select 2];

_x2y1z1 = _obj modeltoworldVisual [_max select 0, _min select 1, _min select 2];
_x2y2z1 = _obj modeltoworldVisual [_max select 0, _max select 1, _min select 2];

_x1y1z2 = _obj modeltoworldVisual [_min select 0, _min select 1, _max select 2];
_x1y2z2 = _obj modeltoworldVisual [_min select 0, _max select 1, _max select 2];

_x2y1z2 = _obj modeltoworldVisual [_max select 0, _min select 1, _max select 2];
_x2y2z2 = _obj modeltoworldVisual [_max select 0, _max select 1, _max select 2];

[_x1y1z1, _x1y2z1, _x2y1z1, _x2y2z1, _x1y1z2, _x1y2z2, _x2y1z2, _x2y2z2]