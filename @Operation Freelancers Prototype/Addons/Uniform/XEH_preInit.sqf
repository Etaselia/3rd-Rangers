
//Nanite Hotkeys



//CATS
[
    "distance_fail", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Rangefinder Distance Deviation %", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "C.A.T.S", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "trace_dist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "BCU Start Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "C.A.T.S", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1000, 500, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "prox_distance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Shot Detector Maximum Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "C.A.T.S", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1000, 200, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

//ONI NanoSuit
[
    "MaximumArmorSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "CloakSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "MaximumSpeedSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "TwoSpeedModeSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Two Speed Modes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "JumpSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Jump", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "WeaponHandlingSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Weapon Handling", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;


 [
    "ConstantRangefinder_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Rangefinder", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ProximitySensor_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ProximitySensor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoHeal_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoHeal", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoRebreather_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoRebreather", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoAirburst_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoAirburst", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoGuidance_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoGuidance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SuitPower_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SuitPower", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 90, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ActiveRecharge_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ActiveRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "StaticRecharge_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "StaticRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "RechargeTick_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RechargeTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ArmorTick_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "ArmorTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SneakTick_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SneakTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "FastAsFuckTickEff_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedEffecientTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "GottaGoFastMultiplierEff_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "FastAsFuckTickMAX_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "GottaGoFastMultiplierMAX_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AdvancedInvisibility_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AdvancedInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ShotBreakInvis_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ShotBreakInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AndZeroPower_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DrainEnergyOnBrokenInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ExcludeSuppressed_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ExcludeSuppressed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilConmpensationEnergyPerShot_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "EnergyPerShot", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilModificator_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RecoilModificator", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoSway_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoSway", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "WeaponCoreSwayMultiplier_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "WeaponCoreSwayMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoRecharge_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "TraceBullets_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "TraceBullets", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "TraceNumber_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "TraceNumber", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "JumpEnergyCost_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "JumpEnergyCost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 20, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NoFallDamageACEmedicalCompat_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NoFallDamageACEmedicalCompat", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "HotkeysEnabeled_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "HotkeysEnabeled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "DisableScrollMenu_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DisableScrollMenu", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "NanoHealRate_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "NanoHealRate", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.01, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

//SPARTAN NanoSuit
[
    "MaximumArmorSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "CloakSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "MaximumSpeedSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "TwoSpeedModeSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Two Speed Modes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "JumpSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Jump", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "WeaponHandlingSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Weapon Handling", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;


 [
    "ConstantRangefinder_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Rangefinder", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ProximitySensor_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ProximitySensor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoHeal_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoHeal", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoRebreather_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoRebreather", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoAirburst_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoAirburst", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoGuidance_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoGuidance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SuitPower_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SuitPower", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 90, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ActiveRecharge_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ActiveRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "StaticRecharge_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "StaticRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "RechargeTick_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RechargeTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ArmorTick_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "ArmorTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SneakTick_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SneakTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "FastAsFuckTickEff_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedEffecientTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "GottaGoFastMultiplierEff_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "FastAsFuckTickMAX_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "GottaGoFastMultiplierMAX_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AdvancedInvisibility_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AdvancedInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ShotBreakInvis_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ShotBreakInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AndZeroPower_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DrainEnergyOnBrokenInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ExcludeSuppressed_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ExcludeSuppressed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilConmpensationEnergyPerShot_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "EnergyPerShot", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilModificator_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RecoilModificator", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoSway_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoSway", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "WeaponCoreSwayMultiplier_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "WeaponCoreSwayMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoRecharge_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "TraceBullets_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "TraceBullets", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "TraceNumber_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "TraceNumber", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "JumpEnergyCost_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "JumpEnergyCost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 20, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NoFallDamageACEmedicalCompat_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NoFallDamageACEmedicalCompat", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "HotkeysEnabeled_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "HotkeysEnabeled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "DisableScrollMenu_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DisableScrollMenu", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "NanoHealRate_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "NanoHealRate", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.01, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

//SPARTAN_V2 NanoSuit
[
    "MaximumArmorSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "CloakSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "MaximumSpeedSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "TwoSpeedModeSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Two Speed Modes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "JumpSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Jump", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "WeaponHandlingSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Weapon Handling", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;


 [
    "ConstantRangefinder_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Rangefinder", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ProximitySensor_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ProximitySensor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoHeal_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoHeal", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoRebreather_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoRebreather", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoAirburst_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoAirburst", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoGuidance_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoGuidance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SuitPower_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SuitPower", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 90, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ActiveRecharge_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ActiveRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "StaticRecharge_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "StaticRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "RechargeTick_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RechargeTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ArmorTick_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "ArmorTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SneakTick_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SneakTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "FastAsFuckTickEff_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedEffecientTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "GottaGoFastMultiplierEff_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "FastAsFuckTickMAX_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "GottaGoFastMultiplierMAX_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AdvancedInvisibility_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Velocity based Invisibility Power Drain", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
  "SimpleSneakDrain_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "SLIDER", // setting type
  "Simple Stealth Energy Drain per Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
  "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [0, 10, 1, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
  nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ShotBreakInvis_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ShotBreakInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AndZeroPower_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DrainEnergyOnBrokenInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ExcludeSuppressed_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ExcludeSuppressed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilConmpensationEnergyPerShot_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "EnergyPerShot", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilModificator_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RecoilModificator", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoSway_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoSway", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "WeaponCoreSwayMultiplier_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "WeaponCoreSwayMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoRecharge_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "TraceBullets_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "TraceBullets", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "TraceNumber_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "TraceNumber", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "JumpEnergyCost_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "JumpEnergyCost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 20, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NoFallDamageACEmedicalCompat_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NoFallDamageACEmedicalCompat", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "HotkeysEnabeled_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "HotkeysEnabeled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "DisableScrollMenu_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DisableScrollMenu", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "NanoHealRate_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "NanoHealRate", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.01, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
