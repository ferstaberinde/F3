[] spawn {

waitUntil {!isNull player};
_colourText = str (["IGUI_WARNING"] call vip_cmn_fnc_cl_profileColoursHTML);

call vip_cmn_fnc_cl_authorDiaryTopic;

_interaction = if (isClass (configFile >> "CfgPatches" >> ("cse_sys_advanced_interaction"))) then {"CSE menu"} else {"scroll menu"};
	
player createDiaryRecord ["vip_modules_var_cl_diary", ["SMS", format ["
<font color=%1 size='18'>Simple Mine System</font>
<br /><br />
This mission uses voiper's Simple Mine System (SMS) module. This is a lightweight module that makes the default Arma 3 mines more robust, immersive, easier to manage, and slightly more realistic.
<br /><br />
<font color=%1 size='18'>Instructions:</font>
<br /><br />
Start by placing a mine as usual. A preview of the mine's position and orientation in 3D space will appear in front of you, along with a red icon. Adjust your view and position as needed. Mines can only be placed on solid surfaces. When a position is correct, the icon will turn green. Once you find a suitable position, place the mine through the scroll menu. Initially, the mine won't be armed.
<br /><br />
Mines can be armed, triggered, and disarmed via the <font color=%1>Explosives Interface</font>, opened from the %2. To manipulate one or more mines through the interface, the mine(s) must be close by and in front of you before opening the interface. When a mine is selected, a red icon will hover over it. The interface will provide arming/disarming options based on the type of mine and its current state.
<br /><br />
The mines have built in safety features to prevent accidental detonation.
<br /><br />
Note: Mines cannot be placed on or over water.
<br /><br />
<font color=%1 size='18'>Mines:</font>
<br /><br />
<font color=%1>Bounding Mine</font><br />
Item: APERS Bounding Mine<br />
Placeable on: ground<br />
Triggered via: human and vehicle pressure<br />
Safety: 10s delay before arming<br />
<br />
<font color=%1>Claymore Mine</font><br />
Item: Claymore Charge<br />
Placeable on: ground, non-vehicle surfaces<br />
Triggered via: tripwire or remote detonation<br />
Tripwire: 15m (max)<br />
Remote: 100m (non-LOS max), 100-200m (LOS max), 2.5m water depth<br />
Timer: 10-600s<br />
Other: can be rotated<br />
Safety: 10s delay before arming<br />
<br />
<font color=%1>SLAM Mine</font><br />
Item: M6 SLAM Mine<br />
Placeable on: ground, non-vehicle surfaces<br />
Triggered via: optical vehicle sensor or timer<br />
Optical: 10m (max)<br />
Other: can be rotated<br />
Safety: 10s delay before arming<br />
<br />
<font color=%1>Tripflare</font><br />
Item: APERS Tripwire Mine<br />
Placeable on: ground, non-vehicle surfaces<br />
Triggered via: tripwire<br />
Tripwire: 15m (max)<br />
Safety: 10s delay before arming<br />
<br />
<font color=%1>Proximity Sound Alarm</font><br />
Item: APERS Mine<br />
Placeable on: ground, non-vehicle surfaces<br />
Triggered via: human proximity<br />
Safety: 10s delay before arming<br />
<br />
<font color=%1>Explosive Charge</font><br />
Item: Explosive Charge<br />
Placeable on: ground, vehicle and non-vehicle surfaces<br />
Triggered via: remote, timer<br />
Remote: 100m (non-LOS max), 100-200m (LOS max), 2.5m water depth<br />
Timer: 10-600s<br />
<br />
<font color=%1>Satchel Charge</font><br />
Item: Satchel Charge<br />
Placeable on: ground, vehicle and non-vehicle surfaces<br />
Triggered via: remote, timer<br />
Remote: 100m (non-LOS max), 100-200m (LOS max), 2.5m water depth<br />
Timer: 10-600s<br />
<br />
<font color=%1>AT Mine</font><br />
Item: At Mine<br />
Placeable on: ground<br />
Triggered via: vehicle pressure<br />
Safety: 10s delay before arming<br />
", _colourText, _interaction]]];
};