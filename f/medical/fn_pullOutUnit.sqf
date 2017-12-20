params ["_unit"];

// Hack: Despite the wiki claiming 'moveOut' works on unconscious players, it doesn't
// So make them conscious again until they are out
_unit setUnconscious false;

// Eject the downed player from the vehicle
moveOut _unit;

// Hack
_unit setUnconscious true;

// Move them away from the vehicle slightly once they are out
[_unit] spawn {
	params ["_unit"];
	sleep 0.2;
	(_unit) setPosATL (_unit getPos [0.6, direction _unit]);
};

// Make them draggable
[_unit] spawn {
	params ["_unit"];
	waitUntil{ sleep 0.1; animationState _unit ==  "unconsciousrevivedefault"};
	_unit setVariable ["f_wound_draggable", true, true];
	waitUntil{ sleep 0.1; animationState _unit !=  "unconsciousrevivedefault"};
	_unit setVariable ["f_wound_draggable", false, true];
};