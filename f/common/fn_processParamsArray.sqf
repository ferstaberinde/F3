// F3 - Process ParamsArray
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

_paramArray = paramsArray;
{
	_paramName =(configName ((missionConfigFile >> "Params") select _forEachIndex));
	_paramValue = (_paramArray select _forEachIndex);
	_paramCode = ( getText (missionConfigFile >> "Params" >> _paramName >> "code"));
	_code = format[_paramCode, _paramValue];
	call compile _code;
	if (isServer) then {
		publicVariable _paramName;
	};
} foreach _paramArray;
