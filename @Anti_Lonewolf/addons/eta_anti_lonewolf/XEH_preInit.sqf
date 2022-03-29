[
    "eta_activate_lonewolf", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Activate Script", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Anti Lonewolf Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;

 [
    "eta_distance_to_leader", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Allowed Leader Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Anti Lonewolf Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [10, 200, 50, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
