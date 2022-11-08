// F3 - Cold Breath
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

if !(hasInterface) exitWith {};

{
   _x spawn {
     while {alive _this} do {
        sleep (4*(1 - getFatigue _this) + random 1);
        drop [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8,1], "", "Billboard", 1,
           (1-((vectorMagnitude velocity _this) / 35)) *.75 max .05,
           _this selectionPosition "Head" vectorAdd [0,.02,0],
           velocityModelSpace _this vectorAdd [0, .1, 0], 1, 1.3, 1, .01, [.1,.25,.33,.4], [[1, 1, 1, 0.25],[1, 1, 1, 0]], [1], 1, 0, "", "", _this];
        drop [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8,1], "", "Billboard", 1,
          (1-((vectorMagnitude velocity _this) / 35)) *.75 max .05,
          _this selectionPosition "Head" vectorAdd [0,.02,0],
          velocityModelSpace _this vectorAdd [0, .15, 0], 1, 1.3, 1, .01, [.1,.22,.3,.35], [[1, 1, 1, 0.25],[1, 1, 1, 0]], [1], 1, 0, "", "", _this];
    };
  };
} forEach allUnits;
