// 	F3 - Convert teamcolors to markercolor.
// 	Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//  Description: Converts group team colors to Marker colors
//  Parameters
//		0: String (MAIN,RED,GREEN,BLUE,YELLOW)
//	Returns:
//		0: String (ColorWhite,ColorRed,ColorGreen,ColorBlue,ColorYellow)
// 	Example:
// 		["MAIN"] call f_fnc_GetMarkerColor;
//
// ====================================================================================
_color = "ColorWhite";
switch ((_this select 0)) do
{
  case "MAIN": {_color = "ColorWhite"};
  case "RED": {_color = "ColorRed"};
  case "GREEN": {_color = "ColorGreen"};
  case "BLUE": {_color = "ColorBlue"};
  case "YELLOW": {_color = "ColorYellow"};
};
_color
