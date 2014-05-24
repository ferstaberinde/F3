
// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (isDedicated) ExitWith {};
_unit = _this select 0;

/// lets wait a bit.
sleep 0.1;

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

