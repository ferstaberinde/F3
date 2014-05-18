// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

_unit = _this select 0;
_bool = _this select 1;

// ====================================================================================
if(_bool && alive _unit) then
{
	/// Check if they already down, don't down them again.
	if(_unit getVariable ["revive_down",false]) exitWith {};

	// The ai is a bit too triggerhappy so lets set the units as captive
	_unit setVariable ["revive_down",true,true];
	_unit setCaptive 1;


	// If the unit is local and a player, remove their magazines (otherwise they can throw grenades while down)
	if(local _unit && isPlayer _unit) then
	{
		_unit setVariable ["revive_down_mags",magazines _unit];
		{
			_unit removeMagazine _x;
		} foreach magazines _unit;
		// this disables the actionmenu for the users
		showHud false;

	};

	// Just a safety switch to ensure that the unit is wounded enough to have the firstaid option
	if(damage _unit < 0.25) then {_unit setdamage 0.26};

	// Drag Action.
	_addIndex = _unit addAction [format ["Drag %1", name _unit],{[_this, "f_fnc_OnDrag", true,false] spawn BIS_fnc_MP;}, nil, 6, false, true, "", "_var = _this getVariable ['revive_dragging',nil];_target distance _this < 2 && isNil '_var'"];
	_unit setVariable ["revive_dragIndex",_addIndex];

	// if _unit is not in a vehicle, play this animation otherwise fetch the dead animations from the vehicles.
	if(vehicle _unit == _unit) then
	{
		_unit switchmove "acts_InjuredLookingRifle02";
	}
	else
	{
		_anim = getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo");
		_unit switchmove (_anim select 0);
		_veh = vehicle _unit;
		// add pull out wounded to vehicle
		_veh addAction  ["Pull out wounded", {[_this, "f_fnc_EjectWounded", true,false] spawn BIS_fnc_MP;}, nil, 5, false, true, "", "_target distance _this < 5 && [_target] call f_fnc_HasWounded"];
	};
}
else
{
	_unit setVariable ["revive_down",false,true];

	// if the unit is not in a vehicle, play pretty animation otherwise just reset to thier default animation
	if(vehicle _unit == _unit) then
	{
		_unit switchmove "AinjPpneMstpSnonWnonDnon_rolltofront";
	}
	else
	{
		_unit switchmove "";
	};
	// clean up.
	_unit setCaptive 0;
	_dragIndex = _unit getVariable ["revive_dragIndex",-1];
	if(_dragIndex >= 0) then {_unit removeAction _dragIndex};
	_unit setVariable ["revive_dragIndex",-1];

	// give the unit back his magazines if hes local and a player.
	if(local _unit && isPlayer _unit) then
	{
		_mags = _unit getVariable ["revive_down_mags",magazines _unit];
		{
			_unit addMagazine _x;
		} foreach _mags;

		showHud true;
		// reset the PP
		F_UncToggle = true;
		[] spawn f_fnc_WoundedEffect;
		sleep 0.1;
		// force him into prone otherwise he can get stuck in the rolltofrontanimation.
		_unit playMove "amovppnemstpsraswrfldnon";
	};
};
