#include "\a3\editor_f\Data\Scripts\dikCodes.h"

//Keybinding Menu
["RifleBash","eta_bash_vehicle_punch_id", "BashKey", {_this call eta_bash_fnc}, "", [DIK_T, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;

//Options Menu
[
    "eta_bash_SOG_animation", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Use SOG animation", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "RifleBash", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "eta_melee_ace_compat", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "ACE compat", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "RifleBash", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

[
    "eta_bash_max_distance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Maximum Melee Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "RifleBash", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
