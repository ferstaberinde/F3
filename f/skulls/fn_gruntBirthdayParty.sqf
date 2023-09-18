// FA3 - Skulls module (Grunt Birthday Party)
// Credits and documentation: https://github.com/folkarps/F3/wiki
// This component creates a colourful celebration of a late unit's life. And death.
// ====================================================================================

params ["_unit"];

// basic setup
private _pos = getPosATL _unit;
private _soundSource = "#particlesource" createVehicleLocal _pos;

// create a particle source
private _particleSource1 = "#particlesource" createVehicleLocal _pos;
// attach it to the head of the victim
_particleSource1 attachTo [_unit,[0,0,0],"Head",true];
// fancy particles! I don't remember how this works
_particleSource1 setParticleClass "TestEmitterEffect";
_particleSource1 setParticleParams [["\A3\Data_f\cl_basic.p3d",16,7,48,1],"","Billboard",1,5,[0,0,0],[0,0,0.5],0,0.5,0.01,0.1,[0.1],[[1,0,0,1]],[1],0.01,1,"","","",0,false,0,[[0,0,0,0]]];
_particlesource1 setParticleRandom [0,[0,0,0],[0.1,0.1,0.1],0,0,[0,0,0,1],0,0.1,1,0];
_particleSource1 setDropInterval 0.01;

private _particleSource2 = "#particlesource" createVehicleLocal _pos;
_particleSource2 attachTo [_unit,[0,0,0],"Head",true];
_particleSource2 setParticleClass "TestEmitterEffect";
_particleSource2 setParticleParams [["\A3\Data_f\cl_basic.p3d",16,7,48,1],"","Billboard",1,5,[0,0,0],[0,0,0.5],0,0.5,0.01,0.1,[0.1],[[0,1,0,1]],[1],0.01,1,"","","",0,false,0,[[0,0,0,0]]];
_particlesource2 setParticleRandom [0,[0,0,0],[0,0,0],0,0,[1,0.954608,0,0],0,0,1,0];
_particleSource2 setDropInterval 0.01;

private _particleSource3 = "#particlesource" createVehicleLocal _pos;
_particleSource3 attachTo [_unit,[0,0,0],"Head",true];
_particleSource3 setParticleClass "TestEmitterEffect";
_particleSource3 setParticleParams [["\A3\Data_f\cl_basic.p3d",16,7,48,1],"","Billboard",1,5,[0,0,0],[0,0,0.5],0,0.5,0.01,0.1,[0.1],[[1,0.716538,0,1]],[1],0.01,1,"","","",0,false,0,[[0,0,0,0]]];
_particlesource3 setParticleRandom [0,[0,0,0],[0,0,0],0,0,[1,0.954608,0,0],0,0,1,0];
_particleSource3 setDropInterval 0.01;

// yaaay!
_soundSource say3D "f_gruntBirthdayParty";

sleep 0.75;
deleteVehicle _particleSource1;
deleteVehicle _particleSource2;
deleteVehicle _particleSource3;

sleep 2;
deleteVehicle _soundSource;
