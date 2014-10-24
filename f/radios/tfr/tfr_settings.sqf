// F3 - TFR Settings
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RADIO STRUCTURE

// Whether long range radios are automatically added
tf_no_auto_long_range_radio = true;

// Should a side use the same short-wave frequencies
tf_same_sw_frequencies_for_side = true;

// Should a side use the same long-wave frequencies
tf_same_lr_frequencies_for_side = true;

// Whether any radios should be assigned at all, to any units
// TRUE = Disable radios for all units
f_radios_settings_tfr_disableRadios = FALSE;

// Which units should be given LR backpacks
// TRUE = all group leaders get backpacks
// FALSE = only units defined in next variable will get LR backpacks
f_radios_settings_tfr_defaultLRBackpacks = TRUE;

// Unit types you want to give long-range radios if previous is
// E.G: ["co", "m"] would give the CO and all medics 2 long-range radios
f_radios_settings_tfr_backpackRadios = ["co","dc"];

// Independent radio encryption code: Independent faction use radio code of side 
// they are friendly to if they are only friendly to one side.
f_radios_settings_tfr_indepUseRadioCode = FALSE;
