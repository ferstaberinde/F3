// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

_keys = keysToHandle;

private['_handled'];
_handled = false;
_key = _this select 1;

if ((_keys find _key) > -1) then {
	_handled = true;
};
_handled;
