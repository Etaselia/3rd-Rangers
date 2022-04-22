#include "\a3\ui_f\hpp\defineDIKCodes.inc"

//CBA Keybinds
//UP
["Smart Jet", "Up", ["Go Up", "Hold this button to go up"], {
    ["Up", true] call fnc_SLE_JET_on_key_item_check;
}, {
    ["Up", false] call fnc_SLE_JET_on_key_item_check;
}, [DIK_SPACE, [false, false, false]]] call CBA_fnc_addKeybind;

//Forward
["Smart Jet", "Forw", ["Forward", "Hold this button to accelerate forward"], {
    ["Forw", true] call fnc_SLE_JET_on_key_item_check;
}, {
    ["Forw", false] call fnc_SLE_JET_on_key_item_check;
}, [DIK_W, [false, false, false]]] call CBA_fnc_addKeybind;

//Backward
["Smart Jet", "Backw", ["Reverse", "Hold this button to accelerate backwards"], {
    ["Backw", true] call fnc_SLE_JET_on_key_item_check;
}, {
    ["Backw", false] call fnc_SLE_JET_on_key_item_check;
}, [DIK_S, [false, false, false]]] call CBA_fnc_addKeybind;

//Left
["Smart Jet", "Left", ["Left", "Hold this button to accelerate left"], {
    ["Left", true] call fnc_SLE_JET_on_key_item_check;
}, {
    ["Left", false] call fnc_SLE_JET_on_key_item_check;
}, [DIK_A, [false, false, false]]] call CBA_fnc_addKeybind;

//You got a hole in your right wing
["Smart Jet", "Right", ["Right", "Hold this button to accelerate right"], {
    ["Right", true] call fnc_SLE_JET_on_key_item_check;
}, {
    ["Right", false] call fnc_SLE_JET_on_key_item_check;
}, [DIK_D, [false, false, false]]] call CBA_fnc_addKeybind;

//Break
["Smart Jet", "Brake", ["Brake / Hower", "Hold this button to brake. After stopping in air keep holding brake button for some time (can be adjusted in addon settings) to enter autohover. After entering it you can release button. Press brake button again to exit this mode."], {
    ["Brake", true] call fnc_SLE_JET_on_key_item_check;
}, {
    ["Brake", false] call fnc_SLE_JET_on_key_item_check;
}, [DIK_TAB, [false, false, false]]] call CBA_fnc_addKeybind;


//CBA Settings
// 1. Features
[   "SLE_JET_CCIP_mode_CBAS", // Variable tag
    "LIST", // setting type
    ["CCIP mode", "When Continuously Calculated Impact Point will be shown. WARNING! Current version of CCIP does not account for gravity and air friction. Also it's widely inaccurate for AT rockets. I recommend to use MAAWS instead."], // [Name, Tooltip]
    ["Smart Jet", "1. Features"], // Category name
    [["Const", "InAir", "Off"], ["Always ON", "Only in air", "OFF"], 1], // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_autobrake_mode_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Autobrake / Autolanding", "If set to on jetpack will automatically brake when danger of collision occurs. Autobrake provides smooth landing even when you under pressure or ran out of fuel. Also lets unconscious (both vanilla and ACE) player to land safely. "], // [Name, Tooltip]
    ["Smart Jet", "1. Features"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_height_limiter_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Height limter", "If set to on jetpack will automatically accelerate down when you approaching 100m over ground. This does not consumes fuel and will stop you from going into paradrop mode. Jumps from above 100m are not affected even if this setting is on."], // [Name, Tooltip]
    ["Smart Jet", "1. Features"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_water_hover_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Hover over water", "If set to on jetpack will hover about 5m over water without consuming fuel. This will significantly decrease overall fuel consumption while crossing large bodies of water. Also jetpack can't work in water so if already in water you'll have to swim to the closest shore."], // [Name, Tooltip]
    ["Smart Jet", "1. Features"], // Category name
    false, // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_base_acceleration_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Base acceleration", "Number in meters per second. Directly changes jetpack agility and maximum speed."], // [Name, Tooltip]
    ["Smart Jet", "1. Features"], // Category name
    [0, 100, 30, 1, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;



// 2. Fuel
[   "SLE_JET_fuel_consumption_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Base fuel consumption", "Number in percent per second. Nuff said really. If you wish your jetpack to be more like jump pack set both consumption and recharge higher. If you on a large map or just want infinite flight set it lower of to 0. Note that this is consumption for one action. For example if you flying forward and left at the same time it will double the fuel cost."], // [Name, Tooltip]
    ["Smart Jet", "2. Fuel"], // Category name
    [0, 20, 1, 2, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_hover_fuel_consumption_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Hover fuel consumption", "Amount of fuel jetpack uses in hover (brake key is held on near zero speed or autohover is on). Number is relative to base fuel consumption. For example by default it's 1(base fuel consumption) * 0.5 = 0.5 percent per second."], // [Name, Tooltip]
    ["Smart Jet", "2. Fuel"], // Category name
    [0, 1, 0.5, 2, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_fuel_recharge_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Recharge over time", "Will jetpack generate fuel/charge over time at all?"], // [Name, Tooltip]
    ["Smart Jet", "2. Fuel"], // Category name
    true, // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {[] call fnc_SLE_JET_setting_change_reboot;}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_fuel_air_recharge_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Recharge in air", "Will jetpack generate fuel/charge in flight? Will not work if Recharge over time setting is off. Note that this is not second recharge setting and it will not give you twice the fuel if both are on."], // [Name, Tooltip]
    ["Smart Jet", "2. Fuel"], // Category name
    true, // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {[] call fnc_SLE_JET_setting_change_reboot;}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_fuel_recharge_rate_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Recharge rate", "Number is percent of fuel/charge regenerated per second."], // [Name, Tooltip]
    ["Smart Jet", "2. Fuel"], // Category name
    [0, 20, 0.1, 2, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;



// 3. Hover fix
[   "SLE_JET_hover_aim_fix_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Flight / hover aim fix", "It will allow you to aim in flight. However it stops/slows down your fall animation. Also allows to adjust weapon sway in air."], // [Name, Tooltip]
    ["Smart Jet", "3. Aim fix"], // Category name
    true, // ValueInfo
    0, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {[] call fnc_SLE_JET_setting_change_reboot;}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_hover_sway_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Hover weapon sway", "Default game value is 1. Game still considers flying on jet as movement and will increase sway even if it's not affecting stamina.  Also due to lack of bipod in air I'd recommend adjusting it to lower value. Values from 0 to 0.99 will decrease weapon sway in air. Values above 1 will increase. Values lower than 0 is a compatibility option and will disable adjustment altogether allowing other mods (mainly ACE) to dictate sway in air."], // [Name, Tooltip]
    ["Smart Jet", "3. Aim fix"], // Category name
    [-1, 3, 0.4, 2, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_hover_anim_speed_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Hover animation speed", "Default game value is 1. Mainly it stops falling animation which would make aimed shots almost impossible. On other hand it can make some actions (going prone in air for example) feel sluggish. Only affects falling animations. You can't decrease sway from falling animation by holding breath like with normal sway."], // [Name, Tooltip]
    ["Smart Jet", "3. Aim fix"], // Category name
    [0, 3, 0, 2, false], // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;



// 4. UI and controls
[   "SLE_JET_autohover_delay_CBAS", // Variable tag
    "SLIDER", // setting type
    ["Autohover delay", "How long you actually need to hold brake to enter autohover mode. After stopping in air keep holding brake button for some time to enter autohover. After entering it you can release button. Press brake button again to exit this mode."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [0, 10, 1, 1, false], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_fuel_bar_mode_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Dynamic fuel bar color", "Will color of fuel bar change from green to red depending on remaining fuel?"], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    false, // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_fuel_bar_color_CBAS", // Variable tag
    "COLOR", // setting type
    ["Fuel bar color", "If dynamic color is disabled this color will be used instead. Note that last 10% will always be red."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [1, 0.58, 0, 1], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_FPV_color_normal_CBAS", // Variable tag
    "COLOR", // setting type
    ["FPV normal color", "Flight path vector in normal condition."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [0,1,1,1], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_FPV_color_warning_CBAS", // Variable tag
    "COLOR", // setting type
    ["FPV warning color", "Flight path vector color. Warning edition."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [1,1,0,1], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_FPV_color_danger_CBAS", // Variable tag
    "COLOR", // setting type
    ["FPV danger color", "Flight path vector color. You're about to collide into something edition. It's recommended to release controls and let auto brake stop you."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [1,0,0,1], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_CCIP_color_normal_CBAS", // Variable tag
    "COLOR", // setting type
    ["CCIP normal color", "Continuously Calculated Impact Point color in normal flight."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [0,0.8,0,1], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_CCIP_color_autohover_CBAS", // Variable tag
    "COLOR", // setting type
    ["CCIP autohover color", "Continuously Calculated Impact Point color in autohover mode."], // [Name, Tooltip]
    ["Smart Jet", "4. UI and controls"], // Category name
    [0,1,0,1], // ValueInfo
    2, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;



// 5. Advanced
[   "SLE_JET_jetpack_capable_items_CBAS", // Variable tag
    "EDITBOX", // setting type
    ["Jetpack compatable backpacks", "Classes of jetpack compatable backpacks. Format: class1,class2,class3"], // [Name, Tooltip]
    ["Smart Jet", "5. Advanced"], // Category name
    "B_CombinationUnitRespirator_01_F,B_Parachute,B_JETPACK_01_SLE,B_JETPACK_02_SLE", // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {[] call fnc_SLE_JET_setting_change_reboot;}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_facewear_check_CBAS", // Variable tag
    "CHECKBOX", // setting type
    ["Facewear check", "If set to on jetpack UI will only appear if player have compatible facewear."], // [Name, Tooltip]
    ["Smart Jet", "5. Advanced"], // Category name
    true, // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {[] call fnc_SLE_JET_setting_change_reboot;}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

[   "SLE_JET_jetpack_HUD_capable_items_CBAS", // Variable tag
    "EDITBOX", // setting type
    ["Jetpack UI compatable facewear", "Classes of jetpack UI compatable facewear. Format: class1,class2,class3"], // [Name, Tooltip]
    ["Smart Jet", "5. Advanced"], // Category name
    "G_Tactical_Clear,G_Tactical_Black,G_Goggles_VR,G_Jet_UI_Clear,G_Jet_UI_Shade,G_Jet_UI_VR", // ValueInfo
    1, // Globality 0-default 1-Owerwrite/sychroized 2--Non overridable
    {[] call fnc_SLE_JET_setting_change_reboot;}, // OnChage code
    false // Show mission restart nedded warning
] call CBA_fnc_addSetting;

/*
ValueInfo types:
CHECKBOX:
    Default value <BOOLEAN>

EDITBOX:
    Default value <STRING>

SLIDER:
    0: Minimum (lowest possible value) <NUMBER>
    1: Maximum (highest possible value) <NUMBER>
    2: Default value <NUMBER>
    3: Number of displayed trailing decimals (should be 0, 1 or 2) <NUMBER>
    4: Percentage display <BOOL>
    Example: [1, 25, 5, 2] (value), [0, 1, 0.5, 2, true] (percentage)

LIST:
    0: Values this setting can take. <ARRAY>
    1: Corresponding pretty names for the ingame settings menu. Can be stringtable entries. <ARRAY>
    2: Index of the default value. Not the default value itself. <NUMBER>
    Example: [[false, true], ["STR_A3_OPTIONS_DISABLED", "STR_A3_OPTIONS_ENABLED"], 0]

COLOR:
    Default color. Array size can be 3 or 4, depending on whether the setting uses the alpha value. <ARRAY>
    Example: [1,0,0] (red), [1,1,0,0.5] (semi transparent yellow)
*/
