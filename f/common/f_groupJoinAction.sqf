// F3 - Group join action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

private ["_targetGroup"];
_targetGroup = _this select 3;

// Join player to the target group
[player] joinSilent _targetGroup;