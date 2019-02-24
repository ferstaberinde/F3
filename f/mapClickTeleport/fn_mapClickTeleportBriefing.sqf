// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {};

if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

player createDiaryRecord ["diary", ["HALO Jumping 101",
format ["<font size='16'>TL/DR - OPEN YOUR PARACHUTE AT 200 METERS</font>
<br/><br/>
A HALO jump consists of three stages: the jump, the decent, and the landing.
<br/><br/>
You will jump from a height of %1 meters.
<br/><br/>
While descending, steer yourself towards the drop zone - 
orient yourself in the direction you want to go, then go forward.
<br/><br/>
The recommended open height for a HALO jump is 200 meters. 
100 meters is the absolute minimum. 
Anything less than 100 meters and you will not survive.
<br/><br/>
When you are getting close to the ground, try to move backwards.
This will slow you down and prevent injuries.
<br/><br/>
If you are being paradropped in a vehicle, 
you do not need to do anything. Just sit tight and enjoy the descent.
The vehicle will automatically deploy a parachute at an appropriate time. 
If you get out of the vehicle while it is descending, you will not survive. 
<br/>
If a group leader initiates the jump while you are not in the same vehicle,
you will jump alongside the vehicle, 
but you have your own parachute which must be opened manually.
", f_var_mapClickTeleport_Height]
]];
