// ====================================================================================

// RESTRICT VIEWABLE UNITS
// We use the array KEGsShownSides to restrict which sides will be visible to 
// spectating players:
	
// KEGsShownSides = [west, east, resistance, civilian];

// if (side player == west) then {KEGsShownSides = [west];};
// if (side player == east) then {KEGsShownSides = [east];};
// if (side player == resistance) then {KEGsShownSides = [resistance];};
// if (side player == civilian) then {KEGsShownSides = [civilian];};

// ====================================================================================

// Connect handler for spectating script, check if camera on seagull for first 10 seconds and launch spectating script
for "_i" from 0 to 20 do {
	scopeName "SpectaLoop";
	if(typeof cameraOn == "SeaGull") then {[cameraOn,cameraOn,cameraOn] execVM "f\common\f_spect\specta.sqf";breakOut "SpectaLoop"};
	sleep 0.5;
};
