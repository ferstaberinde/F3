// F3 - Remove TFR Radios Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit", "_vanillaRadio"];

_unit = player;
_vanillaRadio = "itemRadio";

// ====================================================================================

// REMOVE ALL RADIOS
// Check all items, removing any TFR radios, using the TFR API call to distinguish 
// between radios and normal items.

{ _isRadio = _x call TFAR_fnc_isRadio; if(_isRadio) then {_unit unlinkItem _x}; } foreach items _unit;
{ _isRadio = _x call TFAR_fnc_isRadio; if(_isRadio) then {_unit unlinkItem _x}; } foreach assignedItems _unit;

// ====================================================================================
