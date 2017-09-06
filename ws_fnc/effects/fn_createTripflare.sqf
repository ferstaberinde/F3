/* ws_fnc_createTripflare

FEATURE
Creates illuminated smoke at position

USAGE
[position,color] spawn ws_fnc_createTripflare

PARAMETERS
1. position  at which to spawn the flare | MANDATORY - object, array [x,y,z] or marker
2. color of the smoke			 | MANDATORY - "red", "green","yellow" or "white"

NOTE
Function does not check for locality. Wrap your call in an isServer etc. clause if necessary.

EXAMPLE
if (isServer) then {[thisTrigger,"red"] spawn ws_fnc_createTripflare}; - in a trigger's on activation field will create a tripflare at the trigger's center when the trigger's conditions have been met
*/

private ["_color","_flare","_smk","_duration"];

_pos = (_this select 0) call ws_fnc_getEpos;
_color = toLower(_this select 1);
_duration = if (count _this > 2) then {_this select 2} else {0};

if !(_color in ["green","red","yellow","white"]) exitWith {["ws_fnc_tripFlare DBG: ",[_color]," is not one of: [""green"",red","yellow","white""]"] call ws_fnc_debugtext};

_flare = (format ["F_40mm%1","_"+_color]) createVehicle _pos;
uisleep 0.5;
if (_color == "white") then {_color =""};
_smk = (format ["Smokeshell%1",_color]) createVehicle _pos;
_smk setVectorUp [1,0,0];

while {!isNull _smk} do {
	uisleep 21.5; // A flare takes roughly 25seconds to die off. As there's a delay between creating and illumination, the sleep is slightly shorter
	if (!isNull _smk) then {
		_flare = (format ["F_40mm%1","_"+_color]) createVehicle _pos;
	};
	uisleep 0.01;
};
