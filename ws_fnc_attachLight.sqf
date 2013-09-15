//See: http://forums.bistudio.com/showthread.php?93588-attach-flare-to-an-object&p=1541513&viewfull=1#post1541513
_obj = [_this, 0, objNull] call BIS_fnc_Param;
_brightness =  [_this, 1, 0.5,[scalar]] call BIS_fnc_Param;

_flare = "#lightpoint" createVehicle (getPos _obj);
_flare setLightBrightness _brightness;
_flare setLightAmbient[1.0, 1.0, 1.0];
_flare setLightColor[1.0, 0.2, 0.2];
_flare lightAttachObject [_obj, [-5,0,0]];