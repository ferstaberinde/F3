// F3 - Remove TFR Radios Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit", "_vanillaRadio"];

_unit = player;
_vanillaRadio = "itemRadio";

// ====================================================================================

// REMOVE ALL RADIOS
// Check for all items if they are a TFR radio. They shouldn't have a longrange
// backpack: it's disabled by the init.sqf if the radio param is set to TFR.

{ _isRadio = _x call TFAR_fnc_isRadio; if(_isRadio) then {_unit unlinkItem _x}; } foreach items _unit;
{ _isRadio = _x call TFAR_fnc_isRadio; if(_isRadio) then {_unit unlinkItem _x}; } foreach assignedItems _unit;

// ====================================================================================