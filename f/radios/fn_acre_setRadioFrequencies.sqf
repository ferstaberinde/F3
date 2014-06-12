// F3 - Set ACRE Frequencies Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit", "_westOffset", "_eastOffset", "_resistanceOffset", "_selectedOffset", "_lrFrequencies", "_lrFreq", "_srFrequencies", "_srFreq"];

_unit = player;

// ====================================================================================

// CONSTRUCT FREQUENCY LIST
// Depending on the player's side, and mission-maker set settings, create a list of
// frequencies for long-range and short-range radios.

// If frequency splitting is not disabled in the settings
if(!f_radios_settings_acre_disableFrequencySplit) then {
  
  // Set offsets for each side
  _westOffset = 0.2;
  _eastOffset = 0.4;
  _resistanceOffset = 0.6;

  // Choose offset depending on unit's side
  switch (side _unit) do {

    case west: {
      _selectedOffset = _westOffset;
    };

    case east: {
      _selectedOffset = _eastOffset;
    };

    case resistance: {
      _selectedOffset = _resistanceOffset;
    };

  };

  // Construct frequencies for long-range radios
  _lrFrequencies = [];
  _lrFreq = 0;
  for "_x" from 1 to 100 do {
    // Starting from 30MHz, add frequency with offset to list
    _lrFreq = ((36) + _x) + _selectedOffset;
    _lrFrequencies set [_x - 1, _lrFreq];
  };

  // Construct frequencies for short-range radios
  _srFrequencies = [];
  _srFreq = 0;
  for "_x" from 1 to 16 do {
    // Starting from 30MHz, add frequency with offset to list
    _srFreq = ((2400) + _x) + _selectedOffset;
    _srFrequencies set [_x - 1, _srFreq];
  };

} else {

    // Construct frequencies for long-range radios
    _lrFrequencies = [];
    _lrFreq = 0;
    for "_x" from 1 to 100 do {
      // Starting from 30MHz, add frequency with offset to list
      _lrFreq = ((30) + _x);
      _lrFrequencies set [_x - 1, _lrFreq];
    };

    // Construct frequencies for short-range radios
    _srFrequencies = [];
    _srFreq = 0;
    for "_x" from 1 to 16 do {
      // Starting from 30MHz, add frequency with offset to list
      _srFreq = ((2400) + _x);
      _srFrequencies set [_x - 1, _srFreq];
    };
  
};

// ====================================================================================

// ASSIGN FREQUENCIES
// Configure the user's radios to use the correct list of frequencies.

// Long-range frequencies
_ret = ["ACRE_PRC117F", _lrFrequencies] call acre_api_fnc_setDefaultChannels;
_ret = ["ACRE_PRC119", _lrFrequencies] call acre_api_fnc_setDefaultChannels;
_ret = ["ACRE_PRC148", _lrFrequencies] call acre_api_fnc_setDefaultChannels;
_ret = ["ACRE_PRC152", _lrFrequencies] call acre_api_fnc_setDefaultChannels;

// Short-range frequencies
_ret = ["ACRE_PRC343", _srFrequencies] call acre_api_fnc_setDefaultChannels;   

// ====================================================================================
