// F3 - Process ParamsArray
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

//Testing has shown that paramArrays only exists on the server during preInit
//In SP it is best to load the defaults (they can't be changed anyway)
//The publicVariable will synchronize the value to the clients.

//PreInit
if (isMultiplayer) then {
	if (isServer) then {
		{
			_paramName =(configName ((missionConfigFile >> "Params") select _forEachIndex));
			_paramValue = (paramsArray select _forEachIndex);
			missionNamespace setVariable[_paramName,_paramValue];
			publicVariable _paramName;
		} forEach paramsArray;
	};
} else {
	//Values must be default in SP anyway and paramsArray doesn't exist in SP till postInit.
	{
		_paramName = (configName _x);
		_paramValue = (getNumber (missionConfigFile >> "Params" >> _paramName >> "default"));
		missionNamespace setVariable[_paramName,_paramValue];
	} forEach ((missionConfigFile >> "Params") call bis_fnc_returnChildren);
};