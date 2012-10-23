// F2 - Automatic Body Removal (FIFO)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if (isServer) then {

// ====================================================================================

// DECLARE VARIABLES

f_abrFIFO = [];
f_abrAddToFIFO = objNull;
f_removeBodyDelay = 0;
_FIFO = f_abrFIFO;
_time = time;
_more = f_abrFIFOmaxLength - f_abrFIFOlength;

// ====================================================================================

// WAIT FOR COMMON LOCAL VARIABLES TO BE SET
// Before executing this script, we wait for the script 'f_setLocalVars.sqf' to run:

waitUntil {scriptDone f_script_setLocalVars};

// ====================================================================================

while {true} do
{
	waitUntil{
        sleep 5; // Reduce A2's script overhead.
        !(isNull f_abrAddToFIFO)
    };
    
	if !(isNull f_abrAddToFIFO) then 
	{
		f_abrFIFO = f_abrFIFO + [f_abrAddToFIFO];
		f_abrAddToFIFO = objNull;
		publicVariable "f_abrAddToFIFO"
	} else
	{
		if (count f_abrFIFO > f_abrFIFOlength) then
		{
			_tooClose = [];
			_FIFO = [];
			_delete = [];
			{
				_body = _x;
				if ({_body distance _x < f_abrDistance} count f_var_men_players > 0) then
				{
					_tooClose = _tooClose + [_body];
				} else
				{
					_FIFO = _FIFO + [_body];
				};
			} forEach f_abrFIFO;
		
			_count = count _FIFO - f_abrFIFOlength;
			if (_count > 0) then
			{
				for "_i" from 0 to _count do
				{
					_body = _FIFO select _i;
					_delete = _delete + [_body];
				};
				_FIFO = _FIFO - _delete
			};

			_count = count _tooClose - _more;
			if (_count > 0) then
			{
				for "_i" from 0 to _count do
				{
					_body = _tooClose select _i;
					_delete = _delete + [_body];
				};
				_tooClose = _tooClose - _delete;
			};
			{
				[_x] execVM "f\common\f_removeBody.sqf";
			} forEach _delete;
			f_abrFIFO = f_abrFIFO - _delete;
		};
	};
};

// ====================================================================================

// nothing happens if the script is executed on a client.
};