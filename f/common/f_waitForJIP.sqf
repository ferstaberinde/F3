// F3 - Wait for JIP
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!isDedicated && (player != player)) then
{
    waitUntil {player == player};
    waitUntil {time > 10};
    // dedicated protection
	waitUntil {!isnil "f_var_debugMode"};
};
