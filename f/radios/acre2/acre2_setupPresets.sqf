// F3 - ACRE2 Preset Setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// include ACRE2 macros
#include "\idi\clients\acre\addons\api\script_component.hpp"

// ====================================================================================
// Setup 148 preset for all sides
{
        _offset = 0;
        _channelNames = [];
        _override = [];
        switch(_x) do
        {
                case blufor:
                {
                        _offset = f_radios_settings_acre2_offset_blufor;
                        _channelNames = f_radios_settings_acre2_groups_blufor;
                };
                case opfor:
                {
                        _offset = f_radios_settings_acre2_offset_opfor;
                        _channelNames = f_radios_settings_acre2_groups_opfor;
                };
                case independent:
                {
                        _offset = f_radios_settings_acre2_offset_indfor;
                        _channelNames = f_radios_settings_acre2_groups_indfor;
                };
        };

        _presetData = HASH_CREATE;
        _channels = HASHLIST_CREATELIST(["power"]);

        for "_i" from 0 to 31 do {
                // create a hashlist
                _channel = HASHLIST_CREATEHASH(_channels);

                // append the offset to the frequency
                _frequency = (500+(_i))*_offset;

                // Set the frequency
                HASH_SET(_channel,"frequencyTX",_frequency);
                HASH_SET(_channel,"frequencyRX",_frequency);

                // set the basic settings power settings and encryption
                HASH_SET(_channel,"power",5000);
                HASH_SET(_channel,"encryption",0);
                HASH_SET(_channel,"channelMode", "BASIC");


                // If there's not a set name to use, just use the name of the side + the channel number
                if(_i >= (count _channelNames)) then
                {
                        HASH_SET(_channel,"label",(str _x)+ " "+ str(_i+1));
                }
                else
                {
                        HASH_SET(_channel,"label",(_channelNames select _i));
                };
                // CTCSS
                // http://en.wikipedia.org/wiki/Continuous_Tone-Coded_Squelch_System
                HASH_SET(_channel,"CTCSSTx", 250.3);
                HASH_SET(_channel,"CTCSSRx", 250.3);

                // Settings, default don't change.
                HASH_SET(_channel,"modulation","FM");
                HASH_SET(_channel,"trafficRate",16);
                HASH_SET(_channel,"TEK",1);
                HASH_SET(_channel,"RPTR",0.2);
                HASH_SET(_channel,"fade",2);
                HASH_SET(_channel,"phase",256);
                HASH_SET(_channel,"squelch",3);

                // Push the channels to the hashlist
                HASHLIST_PUSH(_channels, _channel);
        };

        // Assign the channels to the proper groups.
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

        // save the preset as "WEST"
        ["ACRE_PRC148",str _x,_presetData] call CALLSTACK(acre_sys_data_fnc_registerRadioPreset);

} foreach [blufor,opfor,independent];

// ====================================================================================
// Setup 343 presets for all sides

{
        _offset = 0;

        switch(_x) do
        {
                case blufor:
                {
                        _offset = f_radios_settings_acre2_offset_blufor;
                };
                case opfor:
                {
                        _offset = f_radios_settings_acre2_offset_opfor;
                };
                case independent:
                {
                        _offset = f_radios_settings_acre2_offset_indfor;
                };
                default
                {
                        _offset = f_radios_settings_acre2_offset_indfor;
                };
        };

        _presetData = HASH_CREATE;
        _channels = HASHLIST_CREATELIST(["frequencyTX"]);


        for "_i" from 0 to 15 do {
                _channel = HASHLIST_CREATEHASH(_channels);
                HASH_SET(_channel,"frequencyTX",(2401+(_i))+(_offset));
                HASHLIST_PUSH(_channels, _channel);
        };
        HASH_SET(_presetData,"channels",_channels);



        ["ACRE_PRC343",str _x,_presetData] call CALLSTACK(acre_sys_data_fnc_registerRadioPreset);
        ["ItemRadio",str _x,_presetData] call CALLSTACK(acre_sys_data_fnc_registerRadioPreset);

} foreach [blufor,opfor,independent];

