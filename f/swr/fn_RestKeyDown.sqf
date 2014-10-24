// F3 - Simple Weapon Resting
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Handles the on key, current bound to TAB

_dik = _this select 1;
if(_dik == 15 && !f_rest_deployed) then
{
	if([] call F_fnc_RestCanDeploy) then
	{
		[] spawn F_fnc_RestDeployed;
	};
};
false