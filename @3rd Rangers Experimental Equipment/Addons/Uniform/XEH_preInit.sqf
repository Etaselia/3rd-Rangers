[
    "MaximumArmorSwitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "CloakSwitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "MaximumSpeedSwitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Maximum Speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "TwoSpeedModeSwitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Two Speed Modes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "JumpSwitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Jump", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "WeaponHandlingSwitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Weapon Handling", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  
 [
    "ConstantRangefinder", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Rangefinder", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
  
 [
    "ProximitySensor", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ProximitySensor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NanoHeal", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoHeal", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
 
 [
    "NanoRebreather", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoRebreather", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
 
 [
    "NanoAirburst", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoAirburst", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
   
 [
    "NanoGuidance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NanoGuidance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
   
 [
    "SuitPower", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SuitPower", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 90, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ActiveRecharge", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ActiveRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "StaticRecharge", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "StaticRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "RechargeTick", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RechargeTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ArmorTick", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "ArmorTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "SneakTick", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "SneakTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "FastAsFuckTickEff", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedEffecientTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.4, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "GottaGoFastMultiplierEff", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "FastAsFuckTickMAX", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXTick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "GottaGoFastMultiplierMAX", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MaximumSpeedMAXMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AdvancedInvisibility", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AdvancedInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ShotBreakInvis", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ShotBreakInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "AndZeroPower", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DrainEnergyOnBrokenInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "ExcludeSuppressed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ExcludeSuppressed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilConmpensationEnergyPerShot", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "EnergyPerShot", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 6, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "RecoilModificator", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "RecoilModificator", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 0.1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
 
 [
    "WeaponCoreNoSway", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoSway", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
    
  [
    "WeaponCoreSwayMultiplier", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "WeaponCoreSwayMultiplier", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "WeaponCoreNoRecharge", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "WeaponCoreNoRecharge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "TraceBullets", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "TraceBullets", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "TraceNumber", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "TraceNumber", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

  [
    "JumpEnergyCost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "JumpEnergyCost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 100, 20, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "NoFallDamageACEmedicalCompat", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "NoFallDamageACEmedicalCompat", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "HotkeysEnabeled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "HotkeysEnabeled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "DisableScrollMenu", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "DisableScrollMenu", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
    
  [
    "NanoHealRate", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "NanoHealRate", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "NanoSuit Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.01, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

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