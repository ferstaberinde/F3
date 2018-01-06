/*ws_fnc_attachLight
// By Wolfenswan: wolfenswanarps@gmail.com
// See: http://forums.bistudio.com/showthread.php?93588-attach-flare-to-an-object&p=1541513&viewfull=1#post1541513

FEATURE
Attach light source to object.

RETURNS
true

USAGE
Minimal:
[object] call ws_fnc_attachLight
Full:
[object, brightness, color, haze, attachpoint] call ws_fnc_attachLight

PARAMETERS
1. Object to attach light to 									| MANDATORY
2. Brightness of light source (0-1)								| OPTIONAL - default is 0.6
3. Color of light (array with [0-1,0-1,0-1] for [r,g,b])					| OPTIONAL - default is [1.0,1.0,1.0]
4. Haze of the light (array with [0-1,0-1,0-1] for [r,g,b])					| OPTIONAL - default is [1.0, 0.2, 0.2]
5. Attachpoint of the light (offset to the object it is attached to as array [x,y,z]) 	| OPTIONAL - default is [0,0,0]
*/

params [
	["_obj", objNull, [objNull]],
	["_brightness", 0.6, [0]],
	["_color", [1.0, 1.0, 1.0], [[]], 3],
	["_haze", [1.0, 0.2, 0.2], [[]], 3],
	["_offset", [0,0,0], [[]], 3]
];

private _flare = "#lightpoint" createVehicle (getPos _obj);
_flare setLightBrightness _brightness;
_flare setLightAmbient _color;
_flare setLightColor _haze;
_flare lightAttachObject [_obj,_offset];

true
