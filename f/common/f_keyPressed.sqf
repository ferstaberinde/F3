// F3 - Construction Interface (COIN) Presets
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!(f_COINstopped)) then
{	
	_coin = player getVariable "F_COINname";
	switch ((_this select 1)) do
	{
		//N key
		case 49:
		{	
			if (_coin getvariable "BIS_COIN_nvg") then
			{
				camUseNVG false;
				_coin setvariable ["BIS_COIN_nvg", false];
			}else {
				camUseNVG true;
				_coin setvariable ["BIS_COIN_nvg", true];
			};
		};
	};
}; 

