// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// "I don't know how this works but it does ;)" -somebody at some point in the framework's history wrote that here. ppEffectAdjust info can be found here: https://community.bistudio.com/wiki/Post_process_effects
_damage=f_damage_effect + damage player;
_blood = player getVariable "f_wound_blood";
if(!F_UncToggle) then
{
	F_UncCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0.001 max (1 min ((0.05/(_damage-0.8))-0.25))],[0.17, 0.0008, 0.0008, 1],[1, 1, 1, 0]];
	F_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[0.17, 0.0008, 0.0008, 0.218 max (1 min ((0.03/(_damage-0.819))+0.05))],[1, 1, 1, 0]]; //seems to cause the screen to turn red. sleep after this block gives it more time to fade to red
	F_UncCC ppEffectEnable TRUE;
	F_UncCC ppEffectForceInNVG TRUE;
	F_UncCC ppEffectCommit 2.5;
	F_UncBlur ppEffectAdjust [0.5];
	F_UncBlur ppEffectEnable TRUE;
	F_UncBlur ppEffectCommit 0;

	sleep 2.5-(_blood/50); //if more blood left then screen will have less time to fade red, as bleed decreases screen will go more red + for longer
	F_UncCC ppEffectAdjust [(_blood/120),0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]]; //screen gets darker as blood decreases.
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
