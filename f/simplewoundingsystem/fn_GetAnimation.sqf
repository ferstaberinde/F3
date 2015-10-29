params ["_unit"];
_anim = "";
if(vehicle _unit == _unit) then
{
	_anim = "acts_InjuredLookingRifle02";
}
else
{
	_anim = (getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo")) select 0;
};
_anim