// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function updates radio event handlers to take care of JIP players.
=========================== */

params ["_splitMode"];

// Find which playable units don't have their radio handlers yet
_unitsWithoutHandlers = (playableUnits select {(_x getVariable ["f_var_radioHandlersAdded",false]) == false});

// Tell their client to add their handlers
{
	[_splitMode] remoteExec ["f_fnc_radioAddHandlers",_x];
} forEach _unitsWithoutHandlers;