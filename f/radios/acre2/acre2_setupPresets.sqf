// F3 - ACRE2 Preset Setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// include ACRE2 macros
#include "\idi\clients\acre\addons\api\script_component.hpp"

// ====================================================================================
// Setup 148 preset for all sides
{
        _modifer = 0;
        _channelNames = [];
        switch(_x) do
        {
                case blufor:
                {
                        _modifer = 0.0225;
                        _channelNames = f_radios_settings_acre2_groups_blufor;
                };
                case opfor:
                {
                        _modifer = 0.0425;
                        _channelNames = f_radios_settings_acre2_groups_opfor;
                };
                case independent:
                {
                        _modifer = 0.0825;
                        _channelNames = f_radios_settings_acre2_groups_indfor;
                };
        };
        systemChat str _modifer;
        systemChat str _channelNames;
        _usedPresetFrequencies = [];
        _presetData = HASH_CREATE;
        _channels = HASHLIST_CREATELIST(["power"]);
        for "_i" from 0 to 31 do {
                _channel = HASHLIST_CREATEHASH(_channels);
                _find = true;
                _frequency = 0;

                _frequency = (500+(_i*2))*_modifer;
                if(!(_frequency in _usedPresetFrequencies)) then {
                        _ok = true;
                        {
                                if(abs(_x-_frequency) <= 0.25) exitWith {
                                        _ok = false;
                                };
                        } forEach _usedPresetFrequencies;
                        if(_ok || (count _usedPresetFrequencies) == 0) then {
                                _find = false;
                                PUSH(_usedPresetFrequencies, _frequency);
                        };
                };
                HASH_SET(_channel,"frequencyTX",_frequency);
                HASH_SET(_channel,"frequencyRX",_frequency);
                HASH_SET(_channel,"power",5000);
                HASH_SET(_channel,"encryption",0);
                HASH_SET(_channel,"channelMode", "BASIC");
                if(_i >= (count _channelNames)) then
                {
                        HASH_SET(_channel,"label",(str _x)+ " "+ str(_i+1));
                }
                else
                {
                        HASH_SET(_channel,"label",(_channelNames select _i));
                };
                HASH_SET(_channel,"CTCSSTx", 250.3);
                HASH_SET(_channel,"CTCSSRx", 250.3);
                HASH_SET(_channel,"modulation","FM");
                HASH_SET(_channel,"trafficRate",16);
                HASH_SET(_channel,"TEK",1);
                HASH_SET(_channel,"RPTR",0.2);
                HASH_SET(_channel,"fade",2);
                HASH_SET(_channel,"phase",256);
                HASH_SET(_channel,"squelch",3);

                HASHLIST_PUSH(_channels, _channel);
        };
        HASH_SET(_presetData,"channels",_channels);
        _groups = [
                        ["G01", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]],
                        ["G02", [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]],
                        ["G03", []],
                        ["G04", []],
                        ["G05", []],
                        ["G06", []],
                        ["G07", []],
                        ["G08", []],
                        ["G09", []],
                        ["G11", []],
                        ["G12", []],
                        ["G13", []],
                        ["G14", []],
                        ["G15", []],
                        ["G16", []]
        ];
        HASH_SET(_presetData,"groups",_groups);


        ["ACRE_PRC148",str _x,_presetData] call CALLSTACK(acre_sys_data_fnc_registerRadioPreset);
} foreach [blufor,opfor,independent];

// ====================================================================================
// Setup 343 presets for all sides

{
        _modifer = 0;
        switch(_x) do
        {
                case blufor:
                {
                        _modifer = 0.01;
                };
                case opfor:
                {
                        _modifer = 0.03;
                };
                case independent:
                {
                        _modifer = 0.07;
                };
                default
                {
                        _modifer = 0.09;
                };
        };
        _presetData = HASH_CREATE;
        _channels = HASHLIST_CREATELIST(["frequencyTX"]);
        for "_i" from 0 to 15 do {
                _channel = HASHLIST_CREATEHASH(_channels);
                HASH_SET(_channel,"frequencyTX",(2401.5+(_modifer)));
                HASHLIST_PUSH(_channels, _channel);
        };
        HASH_SET(_presetData,"channels",_channels);
        ["ACRE_PRC343",str _x,_presetData] call CALLSTACK(acre_sys_data_fnc_registerRadioPreset);
        ["ItemRadio",str _x,_presetData] call CALLSTACK(acre_sys_data_fnc_registerRadioPreset);

} foreach [blufor,opfor,independent];

