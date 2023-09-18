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

private ["_smk"];

params [
	["_pos", objNull, ["", objNull, grpNull, locationNull, []]],
	["_color", "", [""]]
];

_pos = _pos call ws_fnc_getEpos;
_color = toLower _color;

if !(_color in ["green","red","yellow","white"]) exitWith {["ws_fnc_tripFlare DBG: ",[_color]," is not one of: [""green"",red","yellow","white""]"] call ws_fnc_debugtext};

(format ["F_40mm%1","_"+_color]) createVehicle _pos;
uisleep 0.5;
if (_color == "white") then {_color =""};
_smk = (format ["Smokeshell%1",_color]) createVehicle _pos;
_smk setVectorUp [1,0,0];

while {!isNull _smk} do {
	uisleep 21.5; // A flare takes roughly 25seconds to die off. As there's a delay between creating and illumination, the sleep is slightly shorter
	if (!isNull _smk) then {
		(format ["F_40mm%1","_"+_color]) createVehicle _pos;
	};
	uisleep 0.01;
};
