// Do not execute this script anywhere but where the unit is local
if !(local _this) exitWith {};

// If the action has already been added, exit
if (!isNil "f_action_rechargeUAV") exitWith {};

_code = {
	_unit = _this select 0;

	// Remove one battery
	_unit removeMagazine 'Laserbatteries';

	// Select an appriopriate animation
	_move = switch (stance _unit) do {
		case "STAND": {"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
		case "CROUCH": {"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"};
		case "PRONE": {"AinvPpneMstpSnonWnonDnon_Putdown_AmovPpneMstpSnonWnonDnon"};
		default {"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
	};

	// Play the animation over the network
	[[[_unit,_move],{(_this select 0) playMove (_this select 1)}],
	"BIS_fnc_spawn"]spawn BIS_fnc_MP;

	// Cursortarget might have changed, so we use nearestObject instead
	(nearestObject [_unit,'UAV_01_base_F']) setFuel 1;
};

_this addMagazines ["Laserbatteries",4];
f_action_rechargeUAV = _this addAction ["Recharge UAV", _code,nil,1.5,true,true,"","cursorTarget isKindOf 'UAV_01_base_F' && {{_x == 'Laserbatteries'} count magazines _this > 0 && fuel cursorTarget  < 1 && _this distance cursorTarget < 2}"];