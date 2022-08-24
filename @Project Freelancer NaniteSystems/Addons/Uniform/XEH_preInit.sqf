
//Nanite Hotkeys
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

//Keybinding Menu

//Armor
["NaniteKeys","eta_nanite_armor_id", "Armor Key", {_this call fnc_MaximumArmorKey}, "", [DIK_Q, [false, true, false]],false,0,false] call CBA_fnc_addKeybind;
//Cloak
["NaniteKeys","eta_nanite_cloak_id", "Cloak Key", {_this call fnc_CloakKey}, "", [DIK_E, [false, true, false]],false,0,false] call CBA_fnc_addKeybind;
//MaxSpeed
["NaniteKeys","eta_nanite_speed_id", "MaxSpeed Key", {_this call fnc_MaximumSpeedKey}, "", [DIK_W, [true, false, true]],false,0,false] call CBA_fnc_addKeybind;
//Jump
["NaniteKeys","eta_nanite_jump_id", "Jump Key", {_this call fnc_JumpKey}, "", [DIK_SPACE, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;
//Disengage
["NaniteKeys","eta_nanite_disengage_id", "Disengage Key", {_this call fnc_Disengage_Key}, "", [DIK_SPACE, [false, true, false]],false,0,false] call CBA_fnc_addKeybind;
//WeaponsCore
["NaniteKeys","eta_nanite_weapon_core_id", "WeaponCore Key", {_this call fnc_WeaponKey}, "", [DIK_1, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;
//SpartanShieldCharge
["NaniteKeys","eta_nanite_shield_core_id", "ShieldOveride Key", {_this call fnc_ShieldKey}, "", [DIK_2, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;

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
    "shield_switch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Energy Shield for Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "ShieldChargeSwitch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Recharge Spartan Shields Function", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_energy_shield_recharge_cost_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Spartan Shield Charge Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_energy_shield_recharge_amount_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Spartan Shield Charge Amount", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "shield_size_switch_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Multiple Shield Sizes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_small_shield_power_drain_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Single Shield Power/Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 50, 1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_big_shield_power_drain_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Group Shield Power/Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 50, 5, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_small_shield_size_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Single Shield Size", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 0.3, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_big_shield_size_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Group Shield Size", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 1.5, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

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
    "eta_vehicle_shield_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow Vehicle Shield?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_vehicle_shield_power_drain_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Energy Cost for Vehicle Shield / Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 15, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
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
    "eta_nanite_cloak_particles_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ParticleEffects for cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "eta_cloak_vehicles_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow Vehicle Cloak?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_vehicle_stealth_energy_cost_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Extra Energy Cost for Vehicle Cloak / Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_sneak_chargeup_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Stealth Activation Delay", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 60, 3, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_cloak_cooldown_timer_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Stealth Cooldown", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 60, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
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

[
   "nanite_new_UI_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "CHECKBOX", // setting type
   "Use new UI", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   true, // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "nanite_GUI_HidePercentage_ONI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "CHECKBOX", // setting type
   "Show Energy Percentage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "ONI NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   true, // data for this setting: [min, max, default, number of shown trailing decimals]
   0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

//SPARTAN NanoSuit
[
    "shield_switch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Energy Shield for Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "ShieldChargeSwitch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Recharge Spartan Shields Function", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_energy_shield_recharge_cost_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Spartan Shield Charge Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_energy_shield_recharge_amount_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Spartan Shield Charge Amount", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "shield_size_switch_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Multiple Shield Sizes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_small_shield_power_drain_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Single Shield Power/Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 50, 1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_big_shield_power_drain_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Group Shield Power/Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 50, 5, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_small_shield_size_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Single Shield Size", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 0.3, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_big_shield_size_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Group Shield Size", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 1.5, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

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
    "eta_vehicle_shield_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow Vehicle Shield?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_vehicle_shield_power_drain_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Energy Cost for Vehicle Shield / Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 15, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
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
    "eta_nanite_cloak_particles_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ParticleEffects for cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "eta_cloak_vehicles_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow Vehicle Cloak?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_vehicle_stealth_energy_cost_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Extra Energy Cost for Vehicle Cloak / Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_sneak_chargeup_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Stealth Activation Delay", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 60, 3, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_cloak_cooldown_timer_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Stealth Cooldown", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 60, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
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

[
   "nanite_new_UI_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "CHECKBOX", // setting type
   "Use new UI", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   true, // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "nanite_GUI_HidePercentage_SPARTAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "CHECKBOX", // setting type
   "Show Energy Percentage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   true, // data for this setting: [min, max, default, number of shown trailing decimals]
   0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

//SPARTAN_V2
[
    "shield_switch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Energy Shield for Armor", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "ShieldChargeSwitch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Recharge Spartan Shields Function", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_energy_shield_recharge_cost_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Spartan Shield Charge Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_energy_shield_recharge_amount_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Spartan Shield Charge Amount", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "shield_size_switch_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Multiple Shield Sizes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_small_shield_power_drain_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Single Shield Power/Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 50, 1, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_big_shield_power_drain_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Group Shield Power/Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 50, 5, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_small_shield_size_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Single Shield Size", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 0.3, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_big_shield_size_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Group Shield Size", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 1.5, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

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
    "eta_vehicle_shield_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow Vehicle Shield?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_vehicle_shield_power_drain_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Energy Cost for Vehicle Shield / Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 100, 15, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
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
    "eta_nanite_cloak_particles_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ParticleEffects for cloak", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "eta_cloak_vehicles_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow Vehicle Cloak?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_vehicle_stealth_energy_cost_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Extra Energy Cost for Vehicle Cloak / Tick", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_sneak_chargeup_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Stealth Activation Delay", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 60, 3, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "eta_cloak_cooldown_timer_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "SLIDER", // setting type
   "Stealth Cooldown", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   [0, 60, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
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
    "AdvancedInvisibility", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
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

[
   "nanite_new_UI_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "CHECKBOX", // setting type
   "Use new UI", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   true, // data for this setting: [min, max, default, number of shown trailing decimals]
   nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
   "nanite_GUI_HidePercentage_SPARTAN_V2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
   "CHECKBOX", // setting type
   "Show Energy Percentage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
   "SPARTAN_V2 NanoSuit", // Pretty name of the category where the setting can be found. Can be stringtable entry.
   true, // data for this setting: [min, max, default, number of shown trailing decimals]
   0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
   {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

////////////////////////////////
//MEDICAL SUIT SECTION//////////
////////////////////////////////


[   "nanite_energy_default_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Starting Energy", "The amount of Energy your suit will have on initial activation"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "1. Energy Generation"], // Category name
    [0, 100, 100, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_energy_gain_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Energy Gain", "How much energy is added per tick, defined by the next setting"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "1. Energy Generation"], // Category name
    [0, 10, 1, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_energy_tick_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Energy Tick", "How long in between updates of the suit energy"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "1. Energy Generation"], // Category name
    [0, 120, 1, 1, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_selfheal_cost_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Energy Cost", "How much energy is needed to activate this feature"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "2. Self Healing"], // Category name
    [0, 100, 50, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_selfheal_cooldown_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Cooldown time", "How long until another feature is usable in seconds"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "2. Self Healing"], // Category name
    [0, 120, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_targetheal_cost_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Energy Cost", "How much energy is needed to activate this feature"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "3. Target Healing"], // Category name
    [0, 100, 25, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_targetheal_area_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Area of Effect", "How far away from the initial target does the effect reach in meters"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "3. Target Healing"], // Category name
    [0, 50, 1, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_targetheal_cooldown_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Cooldown time", "How long until another feature is usable in seconds"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "3. Target Healing"], // Category name
    [0, 120, 10, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_groupheal_cost_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Energy Cost", "How much energy is needed to activate this feature"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "4. Group Healing"], // Category name
    [0, 100, 100, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_groupheal_area_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Area of Effect", "How far away from the activating unit does the effect reach in meters"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "4. Group Healing"], // Category name
    [0, 50, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_groupheal_cooldown_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Cooldown time", "How long until another feature is usable in seconds"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "4. Group Healing"], // Category name
    [0, 120, 10, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_shieldrecharge_cost_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Energy Cost", "How much energy is needed to activate this feature"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "5. Shield Booster"], // Category name
    [0, 100, 20, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_shieldrecharge_area_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Area of Effect", "How far away from the activator does the effect reach in meters"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "5. Shield Booster"], // Category name
    [0, 50, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_shieldrecharge_amount_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Recharge Amount", "How many Spartan shield points does the ability grant per activation (100% is maximum)"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "5. Shield Booster"], // Category name
    [0, 100, 20, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_shieldrecharge_cooldown_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Cooldown time", "How long until another feature is usable in seconds"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "5. Shield Booster"], // Category name
    [0, 120, 60, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_shieldrecharge_duration_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Effect Duration", "How long will the effect be active !!NOTE THAT THE AMOUNT OF ACTIVATION IS A SEPERATE SETTING!!)"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "5. Shield Booster"], // Category name
    [0, 120, 10, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_shieldrecharge_frequency_MEDICAL", // Variable tag
    "SLIDER", // setting type
    ["Effect Frequency", "How often will the effect activates !!!THIS IS A DIVISOR, IT IS CALCULATED BY DURATION / FREQUENCY!!!"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "5. Shield Booster"], // Category name
    [0, 20, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_GUI_HidePercentage_MEDICAL", // Variable tag
    "CHECKBOX", // setting type
    ["Hide energy percentage", "Show a numeric representation of the remaining energy above the energy bar"], // [Name, Tooltip]
    ["MEDICAL NANITE SUIT", "6. GUI"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;


////////////////////////SPEED SUIT///////////////////////


[   "nanite_energy_default_speed", // Variable tag
    "SLIDER", // setting type
    ["Default Energy", "How much power does the suit start with"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "1. Power Management"], // Category name
    [0, 100, 100, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_energy_gain_speed", // Variable tag
    "SLIDER", // setting type
    ["Energy Gain", "How much Power is restored per tick"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "1. Power Management"], // Category name
    [0, 20, 1, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_energy_tick_speed", // Variable tag
    "SLIDER", // setting type
    ["Energy Tick", "How often does the power circle update (this affects energy drain) RECOMMEND TO STAY BELOW 5"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "1. Power Management"], // Category name
    [0, 20, 1, 1, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_energy_activation_energy", // Variable tag
    "SLIDER", // setting type
    ["Minimum Power Activation", "How much power is required to activate speed mode"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "1. Power Management"], // Category name
    [0, 100, 20, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_speed_default_mult", // Variable tag
    "SLIDER", // setting type
    ["Default Speed Multiplier", "What speed does the suit start out with"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    [0, 100, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_speed_redline", // Variable tag
    "SLIDER", // setting type
    ["Redline Speed Multiplier", "What speed is considered the *Redline* Speed, this also acts as the maximum speed"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    [0, 100, 20, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_speed_half_redline", // Variable tag
    "CHECKBOX", // setting type
    ["Normal Speed Limiter", "Should the normaly achievable speed be 1/2 of redline speed?"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_redline_pain", // Variable tag
    "SLIDER", // setting type
    ["ACE Redline Pain / Damage", "How much pain / damage gets caused per tick by using redline"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    [0, 1, 0.5, 1, false], // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_redline_player_none_ace_damage", // Variable tag
    "SLIDER", // setting type
    ["NONE ACE Redline Damage", "How much damage does the player receive per tick *(1 damage  = dead)*"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    [0, 1, 0.01, 2, false], // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_redline_knockout", // Variable tag
    "SLIDER", // setting type
    ["Redline Knockout Timer", "How long until redline knocks the user out *REQUIRES ACE*"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    [0, 120, 10, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_speed_redline_no_power", // Variable tag
    "CHECKBOX", // setting type
    ["Redline Power Override", "If ticked Redline speed requires no energy"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_speed_tick", // Variable tag
    "SLIDER", // setting type
    ["Speed Change Tick", "How long until speed change registers"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "2. Speed Mode"], // Category name
    [0, 120, 1, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_maximum_energy_drain_speed", // Variable tag
    "SLIDER", // setting type
    ["Maximum Speed Power Drain", "How much Power Redline Draws *(LOGISTICAL EXPONENT, so not fully accurate)*"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "3. Speed Power Management"], // Category name
    [0, 100, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_minimum_energy_drain_speed", // Variable tag
    "SLIDER", // setting type
    ["Minimim Speed Power Drain", "How much Power 0x Speed Draws *(LOGISTICAL EXPONENT, so not fully accurate)*"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "3. Speed Power Management"], // Category name
    [0, 100, 1, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_speed_lamda", // Variable tag
    "SLIDER", // setting type
    ["Exponent Lamda", "How quickly the function exponites, the lower this number the slower it does *DEFAULT 0.18*"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "3. Speed Power Management"], // Category name
    [0, 1, 0.18, 2, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_GUI_HidePercentage_speed", // Variable tag
    "CHECKBOX", // setting type
    ["Hide Energy Percentage", "Should the Energy Percentage be shown on the energy bar"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "4. Misc"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "nanite_spartan_compat_speed", // Variable tag
    "CHECKBOX", // setting type
    ["Spartan Speed COMPAT", "Uses an overwrite of a function necessery for speed to work for spartans *TAKES A LOT OF PROCESSING POWER*"], // [Name, Tooltip]
    ["SPEED NANITE SUIT", "4. Misc"], // Category name
    false, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
