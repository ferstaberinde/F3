
// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (isDedicated) ExitWith {};
_unit = _this select 0;


// add breifing
if(isNil "f_wound_briefing") then
{
	f_wound_briefing = true;
};
if(f_wound_briefing) then
{
	[] spawn
	{
		waitUntil {scriptDone f_script_briefing};
		_bstr = format ["OVERVIEW<br/>
When a player is wounded to the point of being 'incapacitated' they become a casualty. Casualties are prone and unable to move.
<br/><br/>
TREATING CASUALTIES<br/>
Players equipped with at least 1 x FAK can treat a casualty by moving next to them and selecting the relevant action menu option. Treatment uses up 1 x FAK.
<br/><br/>
DRAGGING CASUALTIES<br/>
Players can drag a casualty by moving next to them and selecting the relevant action menu option. Whilst dragging, the player has an action menu option for releasing the casualty.
<br/><br/>
BLEEDING OUT<br/>
An incapacitated player only has a few minutes before her/his wounds become fatal and they die."];
		player createDiaryRecord ["Diary", ["Simple Wounding System",_bstr]];
	};
};





/// lets wait a bit.
sleep 5;

// default variables.
_unit setVariable ["revive_down",false,true];
_unit setVariable ["revive_bleeding",false,true];
_unit setVariable ["revive_blood",100]; // other player dont need know this
_unit setVariable ["revive_dragging",nil];


/// Lifeticker, manages bleeding and blood values.
_unit spawn f_fnc_LifeTick;


// Handleheal needs to be one the player you heal.
{
	_x addEventHandler ["HandleHeal",{_this call f_fnc_OnHeal}];
} foreach playableUnits;

// defines the PP effects for the downed effect.
F_UncCC = ppEffectCreate ["ColorCorrections", 1603];
F_UncRadialBlur = ppEffectCreate ["RadialBlur", 280];
F_UncBlur = ppEffectCreate ["DynamicBlur", 180];
F_UncToggle = false;
F_damageValue = 1.1;

// Eventhandlers for the player.
_unit addEventHandler ["killed", {_this call f_fnc_OnDeath}];
_unit addEventHandler ["HandleDamage",{_this call f_fnc_OnDamage}];

