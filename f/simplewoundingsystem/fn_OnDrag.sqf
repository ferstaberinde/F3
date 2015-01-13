// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
_unit = _this select 0;
_dragger = _this select 1;
_dragger setVariable ["f_wound_dragging",_unit,true];

// the dragger gets a release option.
if(local _dragger) then
{
	_dragger addAction [format["Release %1",name _unit],{(_this select 1) setVariable ["f_wound_dragging",nil];(_this select 1) removeAction (_this select 2);}, nil, 6, false, true, "", "true"];


	switch (currentWeapon _dragger) do {
	    case (primaryWeapon _dragger): {
	    	_dragger switchMove "acinpknlmstpsraswrfldnon";
	    };
	   case (secondaryWeapon _dragger): {
	    	_dragger switchMove "AcinPknlMstpSnonWnonDnon";
	   };
	};
};
_unit switchMove "AinjPpneMrunSnonWnonDb";

if(local _unit) then
{
	// setup the unit and all that fun stuff.
	_unit attachTo [_dragger, [0, 1.1, 0.092]];
	_unit SetDir 180;
	_unit SetPos (getpos _unit);
	};

// lets wait a while.
waitUntil {
	sleep 0.1;
	_dude =  _dragger getVariable ["f_wound_dragging",nil];
	( isNil "_dude" || !alive _dragger || (_dragger	getVariable ["f_wound_down",false]))
};


_dragger setVariable ["f_wound_dragging",nil,true];
// release unit.
detach _unit;
_unit setPosATL getposATL _dragger;

if(!(_dragger getVariable ["f_wound_down",false])) then
{
	_unit switchMove "AinjPpneMstpSnonWrflDb_release";
};

sleep 0.1;
if(_unit getVariable ["f_wound_down",false]) then
{
	_unit switchMove "acts_InjuredLookingRifle02";
}
else
{
	_unit switchMove "amovppnemstpsraswrfldnon";
};

if(_dragger getVariable ["f_wound_down",false]) then
{
	_dragger switchMove "acts_InjuredLookingRifle02";
}
else
{
	_dragger switchMove "";
};