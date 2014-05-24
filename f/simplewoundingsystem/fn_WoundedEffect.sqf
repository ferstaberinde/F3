// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// I don't know how this works but it does ;)
_damage=F_damageValue;
if(!F_UncToggle) then
{
	F_UncCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0.001 max (1 min ((0.05/(_damage-0.8))-0.25))],[0.17, 0.0008, 0.0008, 1],[1, 1, 1, 0]];
	F_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[0.17, 0.0008, 0.0008, 0.218 max (1 min ((0.03/(_damage-0.819))+0.05))],[1, 1, 1, 0]];
	F_UncCC ppEffectEnable TRUE;
	F_UncCC ppEffectForceInNVG TRUE;
	F_UncCC ppEffectCommit 2.5;
	F_UncBlur ppEffectAdjust [0.5];
	F_UncBlur ppEffectEnable TRUE;
	F_UncBlur ppEffectCommit 0;


	F_UncCC ppEffectAdjust [1,1,0,[0.15, 0.0, 0.0, (3.33*_damage)-2.83], [1.0, 0.5, 0.5, 1-((3.33*_damage)-2.83)], [0.587, 0.199, 0.114, 0.0]];
	F_UncCC ppEffectEnable TRUE;
	F_UncCC ppEffectForceInNVG TRUE;
	F_UncCC ppEffectCommit 2.5;

	F_UncBlur ppEffectAdjust [0.8];
	F_UncBlur ppEffectEnable TRUE;
	F_UncBlur ppEffectCommit 0;
	F_UncToggle = true;
}
else
{
	F_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0]];
	F_UncCC ppEffectCommit 3.5; //2.5

	F_UncRadialBlur ppEffectAdjust [0.0, 0.0, 0.5, 0.5];
	F_UncRadialBlur ppEffectCommit 2.5;  //2.5

	F_UncBlur ppEffectAdjust [0];
	F_UncBlur ppEffectCommit 2.5;  //2.5
	//sleep 3.5;
	F_UncBlur ppEffectEnable FALSE;
	F_UncToggle = false;
};




