// F3 Zeus Support - Add Addons
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

params [
	["_curator", objNull]
];

//if (! local _curator) exitWith {};

private _curatorEH = _curator getVariable ["f_curator_EH", -1];
if (_curatorEH != -1) exitWith {};

// Add event-handler:
_curatorEH = _curator addEventHandler ['CuratorObjectPlaced',{

	params[
		["_curator", objNull, [objNull]],
		["_entity", objNull, [objNull]]
	];
	{
		[_x] call f_fnc_setAISkill;
	} forEach crew _entity;
	if(!isNil "f_var_disableThermals_enabled" && {f_var_disableThermals_enabled}) then {
		_entity disableTIEquipment true;
	};
}];
_curator setVariable ["f_curator_EH", _curatorEH];
