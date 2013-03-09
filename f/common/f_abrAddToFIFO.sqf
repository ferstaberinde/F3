// F3 - Automatic Body Removal (FIFO)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SET KEY VARIABLES
// The body to remove is passed to this script by the event handler itself.

_body = _this select 0;

// ====================================================================================

while {!isNull _body} do
{
	waitUntil{isNull f_abrAddToFIFO};
	sleep random .1;
	if (isNull f_abrAddToFIFO) then
	{
		f_abrAddToFIFO = _body;
		publicVariable "f_abrAddToFIFO";
		_body = objNull;
	};
};
