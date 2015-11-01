// F3 - AGM Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
// and parameter to initialize
waitUntil{(player getVariable ["f_var_assignGear_done", false])};
waitUntil{!isNil "f_var_ace3"};

// Exit if not enabled
if (f_var_ace3 == 0) exitWith {};

private "_typeOfUnit";
_typeOfUnit = player getVariable "f_var_assignGear";

// ACE Hearing
if (ace_hearing_EnableCombatDeafness) then
{
	// Deprecated method, uncomment and remove the second line if you want players to manually insert earplugs
	//player addItem "ACE_EarPlugs";
    player setVariable ["ACE_hasEarPlugsIn", true, true];
};

// ACE Maptools
if (_typeOfUnit in [
	"co", "dc", "m", "mmgag", "hmgag", "matag", "hatag", "mtrag", "mtrg", "msamag","sp", "vc", "pp", "uav"
	]) then {
        player addItem "ACE_Maptools";
};

// ACE Kestrel
if (_typeOfUnit in ["sn","sp"]) then {
    player addItem "ACE_Kestrel";
};

// ACE MicroDagr
if (_typeOfUnit in ["co","dc","sp"]) then {
    player addItem "ACE_microDAGR";
};

// ACE Explosives
if (_typeOfUnit in ["eng","engm"]) then {
    player addItem "ACE_M26_Clacker";
    player addItem "ACE_DefusalKit";
};

// ACE Logistics Wirecutter
if (_typeOfUnit in ["eng","engm"]) then {
    player addItem "ACE_wirecutter";
};
