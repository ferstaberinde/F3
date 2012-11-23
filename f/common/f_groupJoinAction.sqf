// F2 - Group join action
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

private ["_targetGroup"];
_targetGroup = _this select 3;

// Join player to the target group
[player] joinSilent _targetGroup;