#include "\a3\editor_f\Data\Scripts\dikCodes.h"

//Keybinding Menu
["VehiclePunch","etaPU_vehicle_punch_id", "PunchKey", {_this call etaPU_VehiclePunch_fnc}, "", [DIK_T, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;

//Options Menu
[
    "etaPU_all_can_punch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "All Units can punch", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VehiclePunch", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "etaPU_punch_crew_kill", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Kill Vehicle Crew on Punch", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VehiclePunch", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "etaPU_max_punch_distance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Maximum Punch Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VehiclePunch", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 20, 8, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "etaPU_punch_uniforms", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Punch enabled Uniform (add the classname here)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VehiclePunch", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "",
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "etaPU_punch_animation", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Punch Animation", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "VehiclePunch", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "AwopPercMstpSgthWrflDnon_End1",
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
