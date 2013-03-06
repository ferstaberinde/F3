for "_i" from 0 to 20 do {
	scopeName "SpectaLoop";
	if(typeof cameraOn == "SeaGull") then { [cameraOn,cameraOn,cameraOn] execVM "f\common\f_spect\gcam_start.sqf";breakOut "SpectaLoop"};
	sleep 0.5;
};