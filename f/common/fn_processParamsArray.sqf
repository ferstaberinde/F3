// F3 - Process ParamsArray
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

//Testing has shown that paramArrays only exists on the server during preInit
//The publicVariable will synchronize the value to the clients.

//PreInit
if (isServer) then {
    if (isNil "f_paramsArray_complete") then {
        if (isNil "paramsArray") then {
            {
                _paramName = (configName _x);
                _paramValue = (getNumber (missionConfigFile >> "Params" >> _paramName >> "default"));
                missionNamespace setVariable [_paramName,_paramValue];
                publicVariable _paramName;
            } forEach ("true" configClasses (missionConfigFile >> "Params"));
        } else {
            {
                _paramName =(configName ((missionConfigFile >> "Params") select _forEachIndex));
                missionNamespace setVariable [_paramName,_x];
                publicVariable _paramName;
            } forEach paramsArray;
            f_ParamsArray_complete = true;
        };
    };
};
