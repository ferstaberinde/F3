// ws_fnc_showIntro
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
/*
FEATURE
Show an intro text using BIS_fnc_typeText.
It displays two paragraphs of text and the current date & time in the third.

USAGE
["string1","string2"] call ws_fnc_showIntro

PARAMETERS
1. The string in the first paragraph  | MANDATORY
1. The string in the second paragraph | MANDATORY

RETURNS
true

NOTE
ARMA 3 only
*/

if !(ws_game_a3) exitWith {["ws_fnc_showIntro DBG: Game version: ",[_game]," Must be ARMA 3!"] call ws_fnc_debugtext};

[
	[
		[_this select 0, "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
		[_this select 1,"<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
		 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
	] , 0, 0.7
] spawn BIS_fnc_typeText;

true
