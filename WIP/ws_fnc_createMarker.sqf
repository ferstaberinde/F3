//WIP
//Do I want rectangles etc.?

_type = _this select 0;
_pos = _this select 1;
_color = _this select 2;
_text = _this select 3;
_size = _this select 4;

_mkr = createMarker

switch (_type) do {
	case "RECTANGLE": {};
	case "ELLIPSE": {};
	default {debug};
};

_mkr