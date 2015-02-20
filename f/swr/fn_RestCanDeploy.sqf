// F3 - Simple Weapon Resting
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Return true if you can deploy here


// You can always deploy if you are prone.
if(stance player == "PRONE") exitWith {true};
// ====================================================================================

// Repos the fake items and check the intersects.
_rightHandPos = (player modelToWorld (player selectionPosition "righthand")) ;
_weaponDir = player weaponDirection currentWeapon player;
_weaponDir = (_weaponDir select 0) atan2 (_weaponDir select 1);

_x = (_rightHandPos select 0) + sin(_weaponDir) * 0.5;
_y = (_rightHandPos select 1) + cos(_weaponDir) * 0.5;

_x2 = (_rightHandPos select 0) + sin(_weaponDir) * 0.3;
_y2 = (_rightHandPos select 1) + cos(_weaponDir) * 0.3;

_x3 = (_rightHandPos select 0) + sin(_weaponDir) * 0.4;
_y3 = (_rightHandPos select 1) + cos(_weaponDir) * 0.4;

_weaponPos = [_x,_y,(_rightHandPos select 2)+0.1];
_weaponPosClose = [_x2,_y2,(_rightHandPos select 2)+0.1];
_weaponPosThird = [_x3,_y3,(_rightHandPos select 2)+0.1];

// ====================================================================================
// abuse objects because they are nice
f_rest_ballstart setPosATL _weaponPos;
f_rest_ballend setPosATL [_weaponPos select 0,_weaponPos select 1,(_weaponPos select 2) - 0.5 ];
f_rest_ballstart_alt setPosATL _weaponPosClose;
f_rest_ballend_alt setPosATL [_weaponPosClose select 0,_weaponPosClose select 1,(_weaponPosClose select 2) - 0.5 ];
f_rest_ballstart_third setPosATL _weaponPosThird;
f_rest_ballend_third setPosATL [_weaponPosThird select 0,_weaponPosThird select 1,(_weaponPosThird select 2) - 0.5 ];
_out = lineIntersects [getposASL f_rest_ballstart ,getposASL f_rest_ballend ] || lineIntersects [getPosASL f_rest_ballstart_alt,getPosASL f_rest_ballend_alt] || lineIntersects [getPosASL f_rest_ballstart_third,getPosASL f_rest_ballend_third];
_out