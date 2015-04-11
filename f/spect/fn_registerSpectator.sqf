// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Registers
if(isnil "f_spect_spectators") then
{
	f_spect_spectators = [[_this select 0,_this select 1]];
}
else
{
	f_spect_spectators pushBack [_this select 0,_this select 1];
};


