
//Nanite Hotkeys
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

//Keybinding Menu

//ShieldWall Hotkeys
["NaniteKeys","eta_ShieldWall_activate_id", "Activate HandShield", {_this call fncInitiateShield}, "", [DIK_UP, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;
["NaniteKeys","eta_ShieldWall_deactivate_id", "Deactivate HandShield", {_this call fncInitiateShieldDespawn}, "", [DIK_DOWN, [false, false, false]],false,0,false] call CBA_fnc_addKeybind;

//Settings
[   "defaultHandShieldHP", // Variable tag
    "SLIDER", // setting type
    ["Default HandShield HP", "How much health the HandShield spawns with"], // [Name, Tooltip]
    ["ShieldWall", "1. HP"], // Category name
    [0, 1000, 100, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
[   "maxHandShieldHP", // Variable tag
    "SLIDER", // setting type
    ["Maximum HandShield HP", "How much health the HandShield can maximally charge to"], // [Name, Tooltip]
    ["ShieldWall", "1. HP"], // Category name
    [0, 1000, 100, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
[   "handShieldColorBlue", // Variable tag
    "SLIDER", // setting type
    ["Color change threshold Blue - Yellow", "Under how much health should the color change to yellow"], // [Name, Tooltip]
    ["ShieldWall", "2. Color"], // Category name
    [0, 1000, 50, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
[   "handShieldColorYellow", // Variable tag
    "SLIDER", // setting type
    ["Color change threshold Yellow - Red", "Under how much health should the color change to red"], // [Name, Tooltip]
    ["ShieldWall", "2. Color"], // Category name
    [0, 1000, 30, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
[   "handShieldChargeTick", // Variable tag
    "SLIDER", // setting type
    ["RechargeTick", "How often should the shield update its charge in seconds (default 5)"], // [Name, Tooltip]
    ["ShieldWall", "3. Recharge"], // Category name
    [1, 120, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
[   "handShieldChargePercentage", // Variable tag
    "SLIDER", // setting type
    ["Recharge percentage per tick", "How much the shield recharges each tick, while not in use, set to 0 to disable recharge"], // [Name, Tooltip]
    ["ShieldWall", "3. Recharge"], // Category name
    [0, 100, 5, 0, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;
[
    "handShieldAlwaysRecharge", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Active Recharge", "Shield recharges while in use"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["ShieldWall", "3. Recharge"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call cba_settings_fnc_init;
