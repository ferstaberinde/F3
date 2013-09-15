/*
	Author: Karel Moricky

	Description:
	Define script parameter

	Parameter(s):
	_this select 0: ARRAY			- list of params
	_this select 1: NUMBER			- selected index
	_this select 2 (Optional): ANY		- default param (used when param is missing or of wrong type)
						- you can overload default value by setting 'BIS_fnc_<functionName>_<index>'
	_this select 3 (Optional): ARRAY	- list of allowed type examples (e.g. ["",[],0,objnull])
	_this select 4 (Optional): NUMBER	- If value is ARRAY, checks if it has required number of elements

	Returns:
	ANY - either value from list of params, or default value
*/

///////////////////////////////////////////////////////////////////////////////////////////////////////////

#define FNC_DISABLEERRORS \
	private ["_disableErrors"]; \
	_disableErrors = false;

//	_disableErrors = if (count _this > 5) then {_this select 4} else {false};

#define FNC_TEXTTYPES \
	private ["_textTypes"];\
	_textTypes = "";\
	{\
		_textTypes = _textTypes + typename _x;\
		if (_forEachIndex < count _types - 1) then {_textTypes = _textTypes + ", "};\
	} foreach _types;

///////////////////////////////////////////////////////////////////////////////////////////////////////////

private ["_params","_id","_value","_thisCount"];
//disableserialization; //--- Do not put this here or none of the scripts where BIS_fnc_param is used will be serialized!

_thisCount = count _this;
//if (typename _this != typename [])	then {_this = [_this]};
_params = if (_thisCount > 0)		then {_this select 0}		else {[]};
_id = if (_thisCount > 1)		then {_this select 1}		else {0};
if (typename _params != typename [])	then {_params = [_params]};
//if (typename _id != typename 00)	then {_id = 0};
_value = if (count _params > _id)	then {_params select _id}	else {nil};

//--- Assign default value
if (_thisCount > 2) then {
	private ["_default","_defaultOverload","_types","_typeDefault","_type"];
	_default = _this select 2;

	//--- Overload default value
	#ifndef DISABLE_REWRITE
	if !(isnil "_fnc_scriptName") then {
		_defaultOverload = missionnamespace getvariable (_fnc_scriptName + "_" + str _id);
		if !(isnil "_defaultOverload") then {
			_default = _defaultOverload;
		};
	};
	#endif

	//--- Default set
	if (isnil "_value") then {
		_value = _default;
	};

	//--- Check type
	if (_thisCount > 3) then {
		_types = _this select 3;
		//if (typename _types != typename []) then {_types = [_types]};
		_type = typename _value;
		_typeDefault = typename _default;

		if !({_type == typename _x} count _types > 0) then {

			if ({_typeDefault == typename _x} count _types > 0) then {
				FNC_DISABLEERRORS
				if (!_disableErrors) then {
					FNC_TEXTTYPES
					["#%1: %2 is type %3, must be %4. %5 used instead.",_id,str _value, _type, _textTypes, str _default] call bis_fnc_error;
				};
				_value = _default;
			} else {
				FNC_DISABLEERRORS
				if (!_disableErrors) then {
					FNC_TEXTTYPES
					["#%1: Default %2 is type %3, must be %4",_id, str _default, _typeDefault, _textTypes] call bis_fnc_error;
				};
			};
		};
	};

	//--- Check number of elements (ARRAY type only)
	if (_thisCount > 4) then {
		if (typename _value == typename []) then {
			private ["_valueCountRequired","_valueCount"];
			_valueCountRequired = [_this,4,0,[0,[]]] call bis_fnc_param;
			if (typename _valueCountRequired != typename []) then {_valueCountRequired = [_valueCountRequired]};
			_valueCount = count _value;
			if !(_valueCount in _valueCountRequired) then {
				_value = _default;
				["#%1: %2 elements provided, %3 expected: %4",_id,_valueCount,_valueCountRequired,_value] call bis_fnc_error;
			};
		};
	};
};

_value