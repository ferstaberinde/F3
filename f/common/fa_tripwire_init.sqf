// F2 - Tripwire Init
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_units"];

_units = _this select 0;
_size1 = _this select 1; //Length
_size2 = _this select 2; //Width
_side = _this select 3;

if (isNil "fa_tripwire") then {fa_tripwire = []};

fa_fnc_tripwire = {
		_pos = fa_tripwire select 0;
		_size1 = fa_tripwire select 1;
		_size2 = fa_tripwire select 2;
		_side = fa_tripwire select 3;
		_dir = fa_tripwire select 4;
		_sidestr = format ["%1",_side];
		
		_trg=createTrigger["EmptyDetector",_pos];
		_trg setTriggerArea[_size2,_size1,_dir,true];
		_trg setTriggerActivation[_sidestr,"PRESENT",false];
		_trg setTriggerStatements["this","nul = [thisList,thisTrigger] execVM ""f\common\f_tripflare.sqf"";", ""];
		
		if (side player == _side) exitWith {};
		_mkr = createMarkerLocal [format["%1",_pos], _pos];
		_mkr setMarkerShapeLocal "RECTANGLE";
		_mkr setMarkerSizeLocal [_size2,_size1];
		_mkr setMarkerDirLocal _dir;
		_mkr setMarkerColorLocal "ColorRed";
		_mkr setMarkerBrushLocal "BORDER";
	};

//ADD ACTION
//All designated units have the action to place a trip wire added to their action menu	
	
{_x addAction ["<t color='#dddd00'>"+"Place tripwire"+"</t>","f\common\fa_tripwireaction.sqf",[_size1,_size2,_side],1,false,true,"","(driver _target == _this)"];} forEach _units;

//CREATE EVENTHANDLER

"fa_tripwire" addPublicVariableEventHandler {call fa_fnc_tripwire;};