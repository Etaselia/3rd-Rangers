/*
Non-local stuff used:

  Playerbound variables.
SLE_JET_Fuel_counter (also propogated throught network)
SLE_JET_Jetpak_activation_state
SLE_JET_Jetpak_ui_activation_state
SLE_JET_Semi_auto_hover_counter
SLE_JET_Sway_fix_on
SLE_JET_LiInSu
SLE_JET_FPV_distance
SLE_JET_Brake_time
SLE_JET_backpack_mags
SLE_JET_backpack_guns
SLE_JET_backpack_items

  functions
fnc_SLE_JET_item_check
fnc_SLE_JET_setting_change_reboot
fnc_SLE_JET_Jetpack_activation
fnc_SLE_JET_Brake_calculator_iteration
fnc_SLE_JET_Jetpack_ui_activation
fnc_SLE_JET_on_key_item_check
fnc_SLE_JET_fuel_core
fnc_SLE_JET_up
fnc_SLE_JET_forw
fnc_SLE_JET_backw
fnc_SLE_JET_left
fnc_SLE_JET_right
fnc_SLE_JET_brake
fnc_SLE_JET_autobrake
fnc_SLE_JET_engine_sound_core
fnc_SLE_JET_event_sound_core
fnc_SLE_JET_backpack_swapper
fnc_SLE_JET_backpack_inventory_saver
fnc_SLE_JET_Disable_Jetpack
fnc_SLE_JET_Disable_Jetpack_ui

  Spawn handles
SLE_JET_auto_brake_spawn_handle
SLE_JET_up_spawn_handle
SLE_JET_forw_spawn_handle
SLE_JET_backw_spawn_handle
SLE_JET_left_spawn_handle
SLE_JET_right_spawn_handle
SLE_JET_brake_spawn_handle
SLE_JET_autobrake_spawn_handle
SLE_JET_sound_repeater_spawn_handle
SLE_JET_stop_sound_repeater_spawn_handle
SLE_JET_autobrake_physic_calculator_spawn_handle
SLE_JET_fuel_generation_spawn_handle
SLE_JET_height_limiter_spawn_handle
SLE_JET_autohover_over_water_spawn_handle
SLE_JET_unconscious_detector_spawn_handle

  Eventhandler handles
PEH_SLE_JET_In_air_no_sway
MEH_SLE_JET_In_air_no_sway_repeater
MEH_JET_FPV
MEH_JET_CCIP
*/

/*
CBA Settings:
Setting | Global variable name | data type | default value
  1. Features
CCIP mode constant, only in air, off | SLE_JET_CCIP_mode_CBAS | str | "Const", "InAir", "Off"
CCIP ballistic calculations complexity for guns | SLE_JET_CCIP_ballistic_guns_CBAS | str | "Simp", "Adv", "Advg"
CCIP ballistic calculations complexity for launchers | SLE_JET_CCIP_ballistic_launchers_CBAS | str | "Simp", "Adv", "Advg"
Autobrake mode | SLE_JET_autobrake_mode_CBAS | bool | true
Height limiter | SLE_JET_height_limiter_CBAS | bool | true
Over water hover | SLE_JET_water_hover_CBAS | bool | false
Typical Acceleration | SLE_JET_base_acceleration_CBAS | val | 30 (m/s)
  2. Fuel
Typical fuel consumption | SLE_JET_fuel_consumption_CBAS | val | 1
Hover fuel consumption | SLE_JET_hover_fuel_consumption_CBAS | val | 0.5
Fuel regen | SLE_JET_fuel_recharge_CBAS | bool | true
Fuel regen in air/in use | SLE_JET_fuel_air_recharge_CBAS | bool | true
Fuel regen rate | SLE_JET_fuel_recharge_rate_CBAS | val | 0.1
  3. Hover fix
Hover aim fix | SLE_JET_hover_aim_fix_CBAS | bool | true
Hover Sway | SLE_JET_hover_sway_CBAS | val | 0.4
Hover anim speed | SLE_JET_hover_anim_speed_CBAS | val | 0
  4. UI and controls
Autohover mode delay | SLE_JET_autohover_delay_CBAS | val | 1
Fuel bar dynamic of fixed color | SLE_JET_fuel_bar_mode_CBAS | bool | false
color of fixed fuel bar | SLE_JET_fuel_bar_color_CBAS | color array
colors FPV | SLE_JET_FPV_color_normal_CBAS, SLE_JET_FPV_color_warning_CBAS, SLE_JET_FPV_color_danger_CBAS | color array
colors CCIP | SLE_JET_CCIP_color_normal_CBAS, SLE_JET_CCIP_color_autohover_CBAS | color array
  5. Advanced
Jetpack compatable backpacks | SLE_JET_jetpack_capable_items_CBAS  | str
UI facewear check | SLE_JET_facewear_check_CBAS | bool | true
Jetpack UI compatable facewear | SLE_JET_jetpack_HUD_capable_items_CBAS | str
*/

//TODO
//CCIP ballistic formula for AT rockets.
//Conditional sounds like alarms and maybe voicelines.
//Add better 3D model?


//Var
player setVariable ["SLE_JET_Fuel_counter", 100, true];  //Jetpack fuel/charge. Obviously.
player setVariable ["SLE_JET_Jetpak_activation_state", false, false]; //Is jetpack core systems active. Mainly used in engaging/disengaging jetpack.
player setVariable ["SLE_JET_Jetpak_ui_activation_state", false, false]; //Same as previous but for UI elements. (FPV, CCIP, Fuel bar). Player still can use jetpack without UI. UI googles without jetpack will provide CCIP if it's set to always visible in CBA settings.
player setVariable ["SLE_JET_Semi_auto_hover_counter", 0, false]; //Used for autohover feature.
player setVariable ["SLE_JET_Sway_fix_on", false, false]; //Used for sway fix.
player setVariable ["SLE_JET_backpack_mags", [], false];//These three used to store backpack inventory on takeoff/land backpack swap.
player setVariable ["SLE_JET_backpack_guns", [], false];//These three used to store backpack inventory on takeoff/land backpack swap.
player setVariable ["SLE_JET_backpack_items", [], false];//These three used to store backpack inventory on takeoff/land backpack swap.

//Initializng spawn handles because it's far easier than accounting for isNil with each check later or setting spawn handles to nil after each terminate.
SLE_JET_up_spawn_handle = [] spawn {};
SLE_JET_forw_spawn_handle = [] spawn {};
SLE_JET_backw_spawn_handle = [] spawn {};
SLE_JET_left_spawn_handle = [] spawn {};
SLE_JET_right_spawn_handle = [] spawn {};
SLE_JET_brake_spawn_handle = [] spawn {};
SLE_JET_autobrake_spawn_handle = [] spawn {};
SLE_JET_sound_repeater_spawn_handle = [] spawn {};
SLE_JET_stop_sound_repeater_spawn_handle = [] spawn {};
//Oh and variables that end with _CBAS dictated by CBA settings.

//Item check on exiting vanilla arsenal. Either activates or deactivates jetpack systems. Also resets fuel level to 100.
[missionNamespace, "arsenalClosed", {
    [true] call fnc_SLE_JET_item_check;
}] call BIS_fnc_addScriptedEventHandler;
//Item check on exiting inventory. Either activates or deactivates jetpack systems.
player addEventHandler ["InventoryClosed", {
    [false] call fnc_SLE_JET_item_check;
}];

//Item check function. Called by inventory check, arsenal check and hotkey input. Either activates or deactivates jetpack systems.
fnc_SLE_JET_item_check = {
  private _with_refuel = param [0, false, [true]];
    private _return_val = true;
    //Core systems
    if (player getVariable "SLE_JET_Jetpak_activation_state") then {
        //jetpack was active
        if (backpack player in (SLE_JET_jetpack_capable_items_CBAS splitString ",")) then {
            if (_with_refuel) then {["", false, 0, true, false] call fnc_SLE_JET_fuel_core;}; //Refuel backpack if fucntion called from arsenal (or just with parameter true)
            _return_val = true; //Return value of this function is essentially used by fnc_SLE_JET_on_key_item_check to choose between proceeding or not doing anything with key input.
        } else {
            [] call fnc_SLE_JET_Disable_Jetpack;
            if (_with_refuel) then {["", false, 0, true, false] call fnc_SLE_JET_fuel_core;};
            _return_val = false;
        };
    } else {
        //jetpack was inactive
        if (backpack player in (SLE_JET_jetpack_capable_items_CBAS splitString ",")) then {
            [] call fnc_SLE_JET_Jetpack_activation;
            if (_with_refuel) then {["", false, 0, true, false] call fnc_SLE_JET_fuel_core;};
            _return_val = true;
        } else {
            _return_val = false;
        };
    };
    //UI elements
    if (SLE_JET_facewear_check_CBAS) then { //Depending on "Facewear check" setting we'll use one out of two algorythms.
        if (player getVariable "SLE_JET_Jetpak_ui_activation_state") then {
            //UI was active
            if (goggles player in (SLE_JET_jetpack_HUD_capable_items_CBAS splitString ",")) then {
            } else {
                [] call fnc_SLE_JET_Disable_Jetpack_ui;
            };
        } else {
            //UI was inactive
            if (goggles player in (SLE_JET_jetpack_HUD_capable_items_CBAS splitString ",")) then {
                [] call fnc_SLE_JET_Jetpack_ui_activation;
            } else {
            };
        };
    } else {
        if (player getVariable "SLE_JET_Jetpak_ui_activation_state") then {
            //UI was active
            if (backpack player in (SLE_JET_jetpack_capable_items_CBAS splitString ",")) then {
            } else {
                [] call fnc_SLE_JET_Disable_Jetpack_ui;
            };
        } else {
            //UI was inactive
            if (backpack player in (SLE_JET_jetpack_capable_items_CBAS splitString ",")) then {
                [] call fnc_SLE_JET_Jetpack_ui_activation;
            } else {
            };
        };
    };
    _return_val; //And here we actually return value.
};
//Reboot jetpack. Called in on CBA setting changes. "Have you tried to turn it off and on?"
fnc_SLE_JET_setting_change_reboot = {
    if (player getVariable "SLE_JET_Jetpak_activation_state") then {
        [] call fnc_SLE_JET_Disable_Jetpack;
        [false] call fnc_SLE_JET_autobrake;
        [] call fnc_SLE_JET_Jetpack_activation;
    };
    if (player getVariable "SLE_JET_Jetpak_ui_activation_state") then {
        [] call fnc_SLE_JET_Disable_Jetpack_ui;
        [] call fnc_SLE_JET_Jetpack_ui_activation;
    };
};
//Disable jetpack systems on respawn.
player addEventHandler ["Respawn", {
    if (player getVariable "SLE_JET_Jetpak_activation_state") then {
        [] call fnc_SLE_JET_Disable_Jetpack;
    };
    if (player getVariable "SLE_JET_Jetpak_ui_activation_state") then {
        [] call fnc_SLE_JET_Disable_Jetpack_ui;
    };
}];

//Jetpack activation function. Contains all things that can't run in background unnoticed by player. Called in by item check function.
fnc_SLE_JET_Jetpack_activation = {
    //Autobrake calculator system repeater.
    SLE_JET_autobrake_physic_calculator_spawn_handle = [] spawn {
        while {true} do {
            [] call fnc_SLE_JET_Brake_calculator_iteration;
            sleep 0.05;
        };
    };
    //Autobrake system physical calculator.
    fnc_SLE_JET_Brake_calculator_iteration = {
        if ((isTouchingGround player) or ((vectorMagnitude velocity player) == 0)) exitWith {}; //That whole thing really only useful when player actually flying. Also player can and will have zero speed sometimes. And computers can't handle division by zero. Only we humans can.
        if (((animationState player) find "aswm" != -1) or //Same goes for swimming. I am well aware how this looks but it's not really worth doing forEach just for 5 fixed instances.
            ((animationState player) find "absw" != -1) or
            ((animationState player) find "adve" != -1) or
            ((animationState player) find "asdv" != -1) or
            ((animationState player) find "assw" != -1)
            ) exitWith {};
        //Magic, math and middle school physics happening here.
        private _long_legs_pos = [getPosASL player select 0, getPosASL player select 1, (getPosASL player select 2) - 1]; //Gives player one meter of space for errors.
        private _LiInSu = lineIntersectsSurfaces [_long_legs_pos, AGLtoASL (player modelToWorld (velocityModelSpace player vectorMultiply 100)), vehicle player, objNull, true, 1, "FIRE", "NONE"];
        player setVariable ["SLE_JET_LiInSu", _LiInSu, false]; //Sending some data to UI eventhandler.
        private _FPV_distance = 5000;

        //Get distance to impact point.
        if (count _LiInSu > 0) then {
            if (surfaceIsWater (_LiInSu select 0 select 0)) then { //Check if impact point is over water.
              private _velocity_to_gravity_angle = acos ((vectorNormalized (velocity player)) vectorDotProduct [0, 0, -1]); //If impact point is over water it's a bit complicated. First we get angle between two vectors. If you not sure how it works consult nearest geometry teacher.
              if (_velocity_to_gravity_angle < 90) then { //And if it's less that 90 proceed to caluculations since we kinda falling. Otherwise just set it to 5000.
                  _FPV_distance = ((getPosASL player select 2) / (cos _velocity_to_gravity_angle) min ((_LiInSu select 0 select 0) vectorDistance _long_legs_pos)); //Select minimal result between geometric approximation and lineIntersectsSurfaces (Needed for landing on structures over water like piers and so on).
              } else {
                  _FPV_distance = 5000;
              };
            } else {
                _FPV_distance = (_LiInSu select 0 select 0) vectorDistance _long_legs_pos; //And if impact point is not over water it's far more straightforward.
            };
        } else {
            _FPV_distance = 5000; //Fix for potential bugs.
        };

        player setVariable ["SLE_JET_FPV_distance", _FPV_distance, false]; //Sending some data to UI eventhandler.

        private _velocity = vectorMagnitude (velocityModelSpace player);

        private _velocity_norm = vectorNormalized (velocityModelSpace player);
        private _one_tick_acceleraton = (vectorMagnitude [
            -((_velocity_norm select 0) * (2.3 max (SLE_JET_base_acceleration_CBAS / 13.3))),
            -((_velocity_norm select 1) * (2.3 max (SLE_JET_base_acceleration_CBAS / 13.3))),
            -((_velocity_norm select 2) * (2.3 max (SLE_JET_base_acceleration_CBAS / 13.3))) + 0.6
        ]); //It's technically backwards acceleration aka deceleration but anyway.
        private _brake_time = _velocity / (_one_tick_acceleraton * 40);
        player setVariable ["SLE_JET_Brake_time", _brake_time, false];
        //If autobrake disabled in settings we are stoping right here. Calculations above will go to FPV in UI section.
        if (!SLE_JET_autobrake_mode_CBAS) exitWith {};
        private _estimated_time_to_splat = _FPV_distance / _velocity;
        //So anyway do we need to panic? Also breaking on low speed isn't necessary and can leave player bouncing over the ground so we'll fix that with extra check.
        if (((_estimated_time_to_splat - _brake_time) < 0.1) and (vectorMagnitude velocity player > 5)) then {
            [true] call fnc_SLE_JET_autobrake; //Yes but actually no
        } else {
            [false] call fnc_SLE_JET_autobrake; //No
        };
    };


    //Makes aimed shots possible. Stops huge sway from falling animation. Even if you fly a kilometer game stil thinks that you moved a kilometer and increases sway without decreasing stamina. So it needs to be ajusted. Also you don't get to use bipod in air.
    if (SLE_JET_hover_aim_fix_CBAS) then {
        PEH_SLE_JET_In_air_no_sway = player addEventHandler ["AnimChanged", {
          params ["_unit", "_anim"];
          private _anim = _this select 1;
          private _sway_fix_on = false;
            private _Fall_animations = ["afalpercmstpsnonwnondnon", "afalpercmstpsraswlnrdnon", "afalpercmstpsraswpstdnon", "afalpercmstpsraswrfldnon", "afalpknlmstpsnonwnondnon", "afalpknlmstpsraswlnrdnon", "afalpknlmstpsraswpstdnon", "afalpknlmstpsraswrfldnon", "afalppnemstpsnonwnondnon", "afalppnemstpsraswpstdnon", "afalppnemstpsraswrfldnon"];
            //Check if player entered fall animation. Also cycles override commands to prevent override by ACE.
            if (_anim in _Fall_animations) then {
                if (!(player getVariable "SLE_JET_Sway_fix_on")) then {
                    MEH_SLE_JET_In_air_no_sway_repeater = addMissionEventHandler ["EachFrame", {
                        player setanimspeedcoef SLE_JET_hover_anim_speed_CBAS;
                        //Negative values allowed in this setting will make script to not override sway at all.
                        if (SLE_JET_hover_sway_CBAS >= 0) then {
                            player setCustomAimCoef SLE_JET_hover_sway_CBAS;
                        };
                    }];
                    player setVariable ["SLE_JET_Sway_fix_on", true, false];
                };
            } else {
                if (player getVariable "SLE_JET_Sway_fix_on") then {
                    player setanimspeedcoef 1;
                    player setCustomAimCoef 1;
                    removeMissionEventHandler ["EachFrame", MEH_SLE_JET_In_air_no_sway_repeater];
                    player setVariable ["SLE_JET_Sway_fix_on", false, false];
                };
            };
        }];
    };

    //Fuel (re)generation.
    if (SLE_JET_fuel_recharge_CBAS) then {
        SLE_JET_fuel_generation_spawn_handle = [] spawn {
            while {true} do {
                if ((player getVariable "SLE_JET_Fuel_counter" < 100) and ((SLE_JET_fuel_air_recharge_CBAS) or (isTouchingGround player))) then {
                    ["", false, SLE_JET_fuel_recharge_rate_CBAS / 10, false, false] call fnc_SLE_JET_fuel_core;
                };
                sleep 0.1;
            }
        };
    };
    //Height limiter. Jetpack will automatically accelerate player towards ground to avoid 100m ceiling that triggers annoying halojump mode.
    if (SLE_JET_height_limiter_CBAS) then {
        SLE_JET_height_limiter_spawn_handle = [] spawn {
            while {true} do {
                if (((animationState player) find "halofreefall" == -1) and ((ASLToAGL getPosASL player) select 2 > 80)) then {
                    private _velocity = velocity player;
                    private _concrete_shoes = (1 max (((_velocity select 2) / 3) min (SLE_JET_base_acceleration_CBAS / 3)) + (0 max (((ASLToAGL getPosASL player) select 2) - 90)));
                    player setVelocity [(_velocity select 0),(_velocity select 1), (_velocity select 2) - _concrete_shoes];
                };
                sleep 0.05;
            };
        };
    };
    //Hover over water. Jetpack does not work in water. like at all. Game engine says flyswim is a no no. And it would be unfortunate to get stuck in the lake.
    //Autobrake wasn't working over water at first so it was used to stop player from checking water/concrete hardness ratio with face on 80 meter drop. Now it's fine. I mean brake, not testing water hardnes.
    //By default it's turned off in CBA settings but can be activated anytime.
    //This is legacy function and it will not be updated.
    if (SLE_JET_water_hover_CBAS) then {
        SLE_JET_autohover_over_water_spawn_handle = [] spawn {
            while {true} do {
                if ((surfaceIsWater position player) and ((getPosASL player select 2) < 5)) then {
                    private _velocity = velocity player;
                    private _hover_propulsion = 0.8 max (((-(_velocity select 2)) / 1.5) min 5);
                    player setVelocity [(_velocity select 0),(_velocity select 1), (_velocity select 2) + _hover_propulsion];
                    [true] call fnc_SLE_JET_engine_sound_core;
                    [true] call fnc_SLE_JET_backpack_swapper;
                };
                sleep 0.05;
            };
        };
    };
    //Automatically stops propulsion when player decides to take a nap. Autobrake will handle the rest. And if autobrake is off in CBA settings... well... F. ACE compatible.
    SLE_JET_unconscious_detector_spawn_handle = [] spawn {
        while {true} do {
            if ((incapacitatedState player == "UNCONSCIOUS") or (player getVariable ["ACE_isUnconscious", false])) then {
                [false] call fnc_SLE_JET_up;
                [false] call fnc_SLE_JET_forw;
                [false] call fnc_SLE_JET_backw;
                [false] call fnc_SLE_JET_left;
                [false] call fnc_SLE_JET_right;
                [false, true] call fnc_SLE_JET_brake;
                [false] call fnc_SLE_JET_engine_sound_core;
            };
            sleep 0.5;
        };
    };
    //Deletes jet sound emmiter on death.
    PEH_SLE_JET_Sound_KILLswitch = player addEventHandler ["Killed", {
            if (!isNull SLE_JET_sound_repeater_spawn_handle) then {
                terminate SLE_JET_sound_repeater_spawn_handle;
            };
            if (!isNull SLE_JET_stop_sound_repeater_spawn_handle) then {
                terminate SLE_JET_stop_sound_repeater_spawn_handle;
            };

            {
                    if (typeOf _x == "SLE_JET_Sound_emitter") then {
                        deleteVehicle _x;
                    };
            } forEach nearestObjects [player, ["all"], 2] - allUnits;

            player removeEventHandler ["Killed", PEH_SLE_JET_Sound_KILLswitch];
            PEH_SLE_JET_Sound_KILLswitch = nil;
    }];

    //Variable tied to jetpack state.
    player setVariable ["SLE_JET_Jetpak_activation_state", true, false];
};

//Jetpack UI activation. Capitan obvious. Called in by item check function.
fnc_SLE_JET_Jetpack_ui_activation = {
    //Flight path vector.
    MEH_JET_FPV = addMissionEventHandler ["Draw3D", {
        //That whole thing really only useful when player actually flying with jetpack.
        if ((isTouchingGround player) or (abs (vectorMagnitude velocity player) < 1)) exitWith {};
        //Same goes for swimming.
        if (((animationState player) find "aswm" != -1) or
            ((animationState player) find "absw" != -1) or
            ((animationState player) find "adve" != -1) or
            ((animationState player) find "asdv" != -1) or
            ((animationState player) find "assw" != -1)
            ) exitWith {};
        //This UI eventhandler gets most values from autobrake calculator.
        private _LiInSuUI = player getVariable "SLE_JET_LiInSu";
        private _estimated_time_to_splat = 0;
        private _brake_time = player getVariable "SLE_JET_Brake_time";
        private _FPV_color = [];
        if (count _LiInSuUI > 0) then {
            _estimated_time_to_splat = (player getVariable "SLE_JET_FPV_distance") / (vectorMagnitude velocity player);
            //Select FPV colo(u)r based on player's time until guaranteed splat point.
            if ((_estimated_time_to_splat - _brake_time) > 0.3) then {
                if ((_estimated_time_to_splat - _brake_time) > 1) then {
                    _FPV_color = SLE_JET_FPV_color_normal_CBAS;
                } else {
                    _FPV_color = SLE_JET_FPV_color_warning_CBAS;
                };
            } else {
                _FPV_color = SLE_JET_FPV_color_danger_CBAS;
            };
            //This actually draws FPV. Duh.
            drawIcon3D [
                "sle_jetpack_core\UI\sle_jet_fpv.paa", //icon
                _FPV_color, //color
                ASLToAGL (_LiInSuUI select 0 select 0), //draw position
                1, //icon width
                1, //icon height
                0, //icon angle
                (_estimated_time_to_splat toFixed 1) + " / " + (_brake_time toFixed 1), //text
                2, //text shadow
                0.05, //text size
                'PuristaMedium', //font
                'center', //text allignment
                true //off-screen arrows
            ];
        };
    }];
    //Continiously(Constantly) calculated(computed) impact point. Damn definition ambiguity.
    //CCIP only initialized if it's actually not off in settings.
    if (SLE_JET_CCIP_mode_CBAS != "OFF") then {

        MEH_JET_CCIP = addMissionEventHandler ["Draw3D", {
            //Stops drawing if player on the ground and CBA setting set to only in air.
            if ((isTouchingGround player) and (SLE_JET_CCIP_mode_CBAS == "InAir")) exitWith {};
            //Exclusion for swimming.
            if (((animationState player) find "aswm" != -1) or
                ((animationState player) find "absw" != -1) or
                ((animationState player) find "adve" != -1) or
                ((animationState player) find "asdv" != -1) or
                ((animationState player) find "assw" != -1)
                ) exitWith {};
            //Choose method of calculations for guns depending on complexity setting.
            if ((currentWeapon player == primaryWeapon player) or (currentWeapon player == handgunWeapon player)) then {
                if (SLE_JET_CCIP_ballistic_guns_CBAS == "Simp") then {
                    [] call fnc_SLE_JET_simple_ballistic_calculator;
                };
                if (SLE_JET_CCIP_ballistic_guns_CBAS == "Adv") then {
                    [] call fnc_SLE_JET_simple_ballistic_calculator;  //stub
                };
                if (SLE_JET_CCIP_ballistic_guns_CBAS == "Advg") then {
                    [] call fnc_SLE_JET_simple_ballistic_calculator;  //stub
                };
            };
            if (currentWeapon player == secondaryWeapon player) then {
                if (SLE_JET_CCIP_ballistic_guns_CBAS == "Adv") then {
                    [] call fnc_SLE_JET_simple_ballistic_calculator;  //stub
                };
                if (SLE_JET_CCIP_ballistic_guns_CBAS == "Advg") then {
                    [] call fnc_SLE_JET_simple_ballistic_calculator;  //stub
                };
            };
        }];

        fnc_SLE_JET_simple_ballistic_calculator = {
            private _ammo_speed = 0;
            //Player have primary weapon or pistol in hands.
            if ((currentWeapon player == primaryWeapon player) or (currentWeapon player == handgunWeapon player)) then {
                //Pull ammo initial ammo speed. Arma doing it a bit convoluted way for some weapons so...
                _ammo_speed = getNumber (configfile >> "CfgWeapons" >> (currentWeapon player) >> "initSpeed");
                if (_ammo_speed < 0) then {
                    //... if weapon have bullet speed of -1.x you need to search for ammo speed and use weapon speed (absolute) value as multiplier.
                    _ammo_speed = (abs (getNumber (configfile >> "CfgWeapons" >> (currentWeapon player) >> "initSpeed"))) *
                    (getNumber (configFile >> "CfgMagazines" >> currentMagazine player >> "initSpeed"));
                };
                //Exception for GL weapons like M32 and M320 sidearm from RHS. And you know... Steam workshop is BIG.
                if (_ammo_speed == 0) then {
                    _ammo_speed = getNumber (configfile >> "CfgMagazines" >> currentMagazine player >> "initSpeed");
                };
            };
            //Player have launcher in hands. Simple inplementation is pretty much useless for launchers so that's a skip.
            if (currentWeapon player == secondaryWeapon player) exitWith {};

            //When it comes to math it's pretty straightforward when you realize that vectors and coordinates are not so different in their nature. MATH, BITCH. IT JUST WORKS.
            private _weapon_dir = ((player weaponDirection currentWeapon player) vectorMultiply _ammo_speed);
            private _CCIP_pos = (((eyePos player) vectorAdd  _weapon_dir) vectorAdd (velocity player));
            [_CCIP_pos] call fnc_SLE_JET_CCIP_visualizer;
        };

        fnc_SLE_JET_advanced_ballistic_calculator = {
            //under construction.
        };

        fnc_JET_CCIP_Build_rangetable = {
            //under construction.
            private _ammo_init_speed = 0;
                _ammo_init_speed = getNumber (configfile >> "CfgWeapons" >> (currentWeapon player) >> "initSpeed");
                if (_ammo_init_speed < 0) then {
                    _ammo_init_speed = (abs (getNumber (configfile >> "CfgWeapons" >> (currentWeapon player) >> "initSpeed"))) *
                    (getNumber (configFile >> "CfgMagazines" >> currentMagazine player >> "initSpeed"));
                };
                if (_ammo_init_speed == 0) then {
                    _ammo_init_speed = getNumber (configfile >> "CfgMagazines" >> currentMagazine player >> "initSpeed");
                };
            private _ammo_airFriction = getNumber (configfile >> "CfgAmmo" >> (getText (configfile >> "CfgMagazines" >> currentMagazine player >> "ammo")) >> "airFriction");
            private _ammo_maxSpeed = getNumber (configfile >> "CfgAmmo" >> (getText (configfile >> "CfgMagazines" >> currentMagazine player >> "ammo")) >> "maxSpeed");
            private _ammo_timeToLive = getNumber (configfile >> "CfgAmmo" >> (getText (configfile >> "CfgMagazines" >> currentMagazine player >> "ammo")) >> "timeToLive");
            private _ammo_thrust = getNumber (configfile >> "CfgAmmo" >> (getText (configfile >> "CfgMagazines" >> currentMagazine player >> "ammo")) >> "thrust");
            private _ammo_thrustTime = getNumber (configfile >> "CfgAmmo" >> (getText (configfile >> "CfgMagazines" >> currentMagazine player >> "ammo")) >> "thrustTime");
        };

        fnc_SLE_JET_CCIP_visualizer = {
          private _CCIP_pos = param [0, [0,0,0], [[]]];
            //Changes CCIP colo(u)r based on hover state.
            private _CCIP_color = [];
            if ((player getVariable "SLE_JET_Semi_auto_hover_counter") <= (SLE_JET_autohover_delay_CBAS * 20)) then {
                _CCIP_color = SLE_JET_CCIP_color_normal_CBAS;
            } else {
                _CCIP_color = SLE_JET_CCIP_color_autohover_CBAS;
            };

            drawIcon3D [
                "sle_jetpack_core\UI\sle_jet_ccip.paa", //icon
                _CCIP_color, //color
                ASLToAGL (_CCIP_pos), //draw position
                1, //icon width
                1, //icon height
                0, //icon angle
                "", //text
                2, //text shadow
                0.05, //text size
                'PuristaMedium', //font
                'center', //text allignment
                true //off-screen arrows
            ];
        };

    };

    //Variable tied to jetpack UI state.
    player setVariable ["SLE_JET_Jetpak_ui_activation_state", true, false];
    //Enable fuel bar.
    disableSerialization;
    ("layer_sle_jet_fuel_bar" call BIS_fnc_rscLayer) cutRsc ["SLE_JET_Fuel_Bar", "plain", -1, false];
};

//Keypress jetpack item validation. Called in by CBA keybinds. Checks player inventory and if all clear pases keypress to fuel system.
fnc_SLE_JET_on_key_item_check = {
  params["_key_type", "_key_state"];
  private _key_type = _this select 0;
  private _key_state = _this select 1;
    //Check that player isn't swimming. Jetpack won't work in the water so no point in running code and waste fuel.
    if (((animationState player) find "aswm" != -1) or
        ((animationState player) find "absw" != -1) or
        ((animationState player) find "adve" != -1) or
        ((animationState player) find "asdv" != -1) or
        ((animationState player) find "assw" != -1)
        ) exitWith {
        [false] call fnc_SLE_JET_up;
        [false] call fnc_SLE_JET_forw;
        [false] call fnc_SLE_JET_backw;
        [false] call fnc_SLE_JET_left;
        [false] call fnc_SLE_JET_right;
        [false, true] call fnc_SLE_JET_brake;
    };
        //Inventory item check. Returns true if jetpack is on and false if not.
    if ([false] call fnc_SLE_JET_item_check) then {
        [_key_type, _key_state, 0, false, false] call fnc_SLE_JET_fuel_core;
    };
};

/*Fuel system core. Handles fuel duh. Can be called in manually for refuel or manual fuel adjustment. Intended call to refuel: ["", false, 0, true, false] call fnc_SLE_JET_fuel_core;
Called in by item check with respective key and key state and if player have fuel it sends signal to respective jetpack physic function.
Called in by physic function with empty key identifier string to change fuel level and immediately checks fuel level.
If or when player runs out of fuel it sends KeyUp signal to all keybound physic functions effectively shutting down all player controlled propulsion.*/
fnc_SLE_JET_fuel_core = {
  private _key_type = param [0, "", [""]];
  private _key_state = param [1, false, [true]];
  private _fuel_change = param [2, 0, [0.1]];
  private _refuel = param [3, false, [true]];
  private _autobrake = param [4, false, [true]];
    //Full jetpack refuel
    if (_refuel) then {player setVariable ["SLE_JET_Fuel_counter", 100, true];};
    //Fuel change
    if (_fuel_change != 0) then{
        player setVariable ["SLE_JET_Fuel_counter", (player getVariable "SLE_JET_Fuel_counter") + _fuel_change, true];
    };
    //Update fuel bar
    private _display = uiNamespace getVariable "SLE_JET_Fuel_bar";
    private _set_bar = _display displayCtrl 629211;
    _set_bar progressSetPosition (player getVariable "SLE_JET_Fuel_counter") / 100;
    if  (SLE_JET_fuel_bar_mode_CBAS) then {
        _set_bar ctrlSetTextColor [(1-(player getVariable "SLE_JET_Fuel_counter") / 100), (player getVariable "SLE_JET_Fuel_counter") / 100, 0, 1];
    } else {
        _set_bar ctrlSetTextColor SLE_JET_fuel_bar_color_CBAS;
    };


    //Even though autobrake consumes fuel it will not trigger engine shutdown.
    if (_autobrake) exitWith {};
    //Shut player propulsion when out of fuel
    if ((player getVariable "SLE_JET_Fuel_counter") <= 0) exitWith {
            [false] call fnc_SLE_JET_up;
            [false] call fnc_SLE_JET_forw;
            [false] call fnc_SLE_JET_backw;
            [false] call fnc_SLE_JET_left;
            [false] call fnc_SLE_JET_right;
            [false, true] call fnc_SLE_JET_brake;
            if (_fuel_change < 0) then {
                [false] call fnc_SLE_JET_engine_sound_core;
            };
    };
    //Proceed with keypress normaly
    switch (_key_type) do {
        case "": {};
        case "Up": {[_key_state] call fnc_SLE_JET_up;};
        case "Forw": {[_key_state] call fnc_SLE_JET_forw;};
        case "Backw": {[_key_state] call fnc_SLE_JET_backw;};
        case "Left": {[_key_state] call fnc_SLE_JET_left;};
        case "Right": {[_key_state] call fnc_SLE_JET_right;};
        case "Brake": {[_key_state] call fnc_SLE_JET_brake;};
        default {};
    };
};

//Jetpack control fucntions. Called by fuel system core.
//I'll explain how these functions work in detail with brake function so proceed there by searching: "fnc_SLE_JET_brake" if you not sure what all of this means.
fnc_SLE_JET_up = {
  params["_UP_key_state"];
  private _UP_key_state = _this select 0;
    if (_UP_key_state) then {
        if (isNull SLE_JET_up_spawn_handle) then {
            SLE_JET_up_spawn_handle = [] spawn {
                while {true} do {
                    //Acceleration will work only below 80 meters. From 80 to 100 meters player will be accelerated downwards. However if player breaks 100m ceeling and enter halojump animation this barrier is lifted. That way actuall jumps from aircraft will be seamless.
                    if (((animationState player) find "halofreefall" != -1) or ((ASLToAGL getPosASL player) select 2 < 80)) then {
                        private _velocity = velocity player;
                        player setVelocity [(_velocity select 0),(_velocity select 1), (_velocity select 2) + ((SLE_JET_base_acceleration_CBAS / 20) + 1)];
                        ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, false] call fnc_SLE_JET_fuel_core;
                    };
                    sleep 0.05;
                };
            };
            [] spawn {
                sleep 0.05;
                [true] call fnc_SLE_JET_engine_sound_core;
                [true] call fnc_SLE_JET_backpack_swapper;
            };
        };
    } else {

        if (!isNull SLE_JET_up_spawn_handle) then {
            terminate SLE_JET_up_spawn_handle;
        };
    };
};

fnc_SLE_JET_forw = {
  params["_forw_key_state"];
  private _forw_key_state = _this select 0;
    if (!isTouchingGround player) then {
        if (_forw_key_state) then {
            if (isNull SLE_JET_forw_spawn_handle) then {
                SLE_JET_forw_spawn_handle = [] spawn {
                    while {!isTouchingGround player} do {
                        private _velocity = velocityModelSpace player;
                        player setVelocityModelSpace [(_velocity select 0), (_velocity select 1) + (SLE_JET_base_acceleration_CBAS / 20), (_velocity select 2)];
                        ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, false] call fnc_SLE_JET_fuel_core;
                        sleep 0.05;
                    };
                };
            };
        } else {
            if (!isNull SLE_JET_forw_spawn_handle) then {
                terminate SLE_JET_forw_spawn_handle;
            };
        };
    };
};

fnc_SLE_JET_backw = {
  params["_backw_key_state"];
  private _backw_key_state = _this select 0;
    if (!isTouchingGround player) then {
        if (_backw_key_state) then {
            if (isNull SLE_JET_backw_spawn_handle) then {
                SLE_JET_backw_spawn_handle = [] spawn {
                    while {!isTouchingGround player} do {
                        private _velocity = velocityModelSpace player;
                        player setVelocityModelSpace [(_velocity select 0), (_velocity select 1) - (SLE_JET_base_acceleration_CBAS / 20), (_velocity select 2)];
                        ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, false] call fnc_SLE_JET_fuel_core;
                        sleep 0.05;
                    };
                };
            };
        } else {
            if (!isNull SLE_JET_backw_spawn_handle) then {
                terminate SLE_JET_backw_spawn_handle;
            };
        };
    };
};

fnc_SLE_JET_left = {
  params["_left_key_state"];
  private _left_key_state = _this select 0;
    if (!isTouchingGround player) then {
        if (_left_key_state) then {
            if (isNull SLE_JET_left_spawn_handle) then {
                SLE_JET_left_spawn_handle = [] spawn {
                    while {!isTouchingGround player} do {
                        private _velocity = velocityModelSpace player;
                        player setVelocityModelSpace [(_velocity select 0) - (SLE_JET_base_acceleration_CBAS / 20), (_velocity select 1), (_velocity select 2)];
                        ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, false] call fnc_SLE_JET_fuel_core;
                        sleep 0.05;
                    };
                };
            };
        } else {
            if (!isNull SLE_JET_left_spawn_handle) then {
                terminate SLE_JET_left_spawn_handle;
            };
        };
    };
};

fnc_SLE_JET_right = {
  params["_right_key_state"];
  private _right_key_state = _this select 0;
    if (!isTouchingGround player) then {
        if (_right_key_state) then {
            if (isNull SLE_JET_right_spawn_handle) then {
                SLE_JET_right_spawn_handle = [] spawn {
                    while {!isTouchingGround player} do {
                        private _velocity = velocityModelSpace player;
                        player setVelocityModelSpace [(_velocity select 0) + (SLE_JET_base_acceleration_CBAS / 20), (_velocity select 1), (_velocity select 2)];
                        ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, false] call fnc_SLE_JET_fuel_core;
                        sleep 0.05;
                    };
                };
            };
        } else {
            if (!isNull SLE_JET_right_spawn_handle) then {
                terminate SLE_JET_right_spawn_handle;
            };
        };
    };
};
//This one is a bit... overwhelming at first but i can explain.
fnc_SLE_JET_brake = {
  private _brake_key_state = param [0, false, [true]];  //First we get variables. This is key state. It indicates if function was called by keyDown or keyUp event.
  private _brake_key_override = param [1, false, [true]]; //This is override. It overrides semi auto hover and used when we need to forcefuly end propulsion. Like when player is out of fuel or unconscious.
    if (!isTouchingGround player) then { //All physics functions check if player is in air. Only exception is go up function. This way player can use walking keybinds without conflicts.
        if (_brake_key_state) then { //Basically we spawning code on keyDown and... (1)
            if ((player getVariable "SLE_JET_Semi_auto_hover_counter") <= (SLE_JET_autohover_delay_CBAS * 20)) then { //This counter used to check if player hovering for certain time and hover will turn on autohover. With autohover player can release key and still hover without pressing or holding keys. Pressing brake/hover key again will disable autohover. (2)
                if (isNull SLE_JET_brake_spawn_handle) then { //This check won't allow to spawn this code twice. Which would be bad for obvious reasons.
                    SLE_JET_brake_spawn_handle = [] spawn { //Spawns code. Basically think of it as starting new independant task.
                        while {!isTouchingGround player} do { //This loop repeats code while player is in the air.
                        private _velocity = velocityModelSpace player; //Get player velocity
                            private _velocity_norm = vectorNormalized _velocity; //Normalize it (Basically vector with same direction but length of one.)
                            if (vectorMagnitude velocity player > 2) then { //Dependant on player speed we slow him down... (3)
                                player setVelocityModelSpace [ //Slowing player by changing his speed.
                                    (_velocity select 0) - ((_velocity_norm select 0) * (SLE_JET_base_acceleration_CBAS / 13.3)),
                                    (_velocity select 1) - ((_velocity_norm select 1) * (SLE_JET_base_acceleration_CBAS / 13.3)),
                                    (_velocity select 2) - ((_velocity_norm select 2) * (SLE_JET_base_acceleration_CBAS / 13.3)) + 0.6
                                  ];
                                ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, false] call fnc_SLE_JET_fuel_core; //And deducting fuel.
                                player setVariable ["SLE_JET_Semi_auto_hover_counter", 0, false]; //reset autohover counter.
                            } else { //(3) ... or just stopping him alltogether.
                                player setVelocityModelSpace [0, 0, 0.2]; //Stop player. Last number in vector/array isn't zero because we need to compensate for gravity.
                                ["", false, -((SLE_JET_fuel_consumption_CBAS / 20) * SLE_JET_hover_fuel_consumption_CBAS), false, false] call fnc_SLE_JET_fuel_core; //And deducting LESS fuel because player not being slowed down drammatically.
                                player setVariable ["SLE_JET_Semi_auto_hover_counter", (player getVariable "SLE_JET_Semi_auto_hover_counter") + 1, false]; //increase autohover counter by one.
                            };
                            sleep 0.05; // repeat this while {} do {} part 20 times per second
                        };
                        player setVariable ["SLE_JET_Semi_auto_hover_counter", 0, false]; //Exit autohover mode if player somehow ends up on the ground.
                    };
                };
            } else { //(2) if autohover counter is high enough we swap functionality and now keyDown will terminate code.
                if (!isNull SLE_JET_brake_spawn_handle) then { //This check won't allow to delete spawned code that do not exist. Ths ain't that bad but will spam errors wherever errors are on.
                    terminate SLE_JET_brake_spawn_handle; //Delete spawned code effectivley stoping this function from changin player velocity further.
                    player setVariable ["SLE_JET_Semi_auto_hover_counter", 0, false]; //reset autohover counter.
                };
            };
        } else {  //(1) ... delete spawned code on keyUp.
            if (!isNull SLE_JET_brake_spawn_handle) then {
                if (((player getVariable "SLE_JET_Semi_auto_hover_counter") <= (SLE_JET_autohover_delay_CBAS * 20)) or (_brake_key_override)) then { //... but only if player wasn't hovering for certain time.
                    terminate SLE_JET_brake_spawn_handle;
                    player setVariable ["SLE_JET_Semi_auto_hover_counter", 0, false]; //reset autohover counter.
                };
            };
        };
    };
};

/*Automatic brake. Unlike rest of physic functions it can't be directly called by player and not interrupted by lack of fuel.
It gets called in by automatic brake calculator when player about to cross point of no return and collide into something and only stops when the danger has passed.
Breaking still consumes fuel to avoid exploiting. This may get fuel below zero which is a normal condition.*/
fnc_SLE_JET_autobrake =
{
  params["_autobrake_signal_state"];
  private _autobrake_signal_state = _this select 0;
    if (!isTouchingGround player) then {
        if (_autobrake_signal_state) then {
            if (isNull SLE_JET_autobrake_spawn_handle) then {
                SLE_JET_autobrake_spawn_handle = [] spawn {
                      while {!isTouchingGround player} do {
                          private _velocity = velocityModelSpace player;
                          private _velocity_norm = vectorNormalized _velocity;
                          player setVelocityModelSpace [
                              (_velocity select 0) - ((_velocity_norm select 0) * (2.3 max (SLE_JET_base_acceleration_CBAS / 13.3)) * (60 / (25 max (60 min diag_fps)))), //Making something dependant on FPS is generraly a bad choice. But with lower framerate Arma slows down custom code. As i can't tap into game tick generator that's probably most elegant fix.
                              (_velocity select 1) - ((_velocity_norm select 1) * (2.3 max (SLE_JET_base_acceleration_CBAS / 13.3)) * (60 / (25 max (60 min diag_fps)))),
                              (_velocity select 2) - ((_velocity_norm select 2) * (2.3 max (SLE_JET_base_acceleration_CBAS / 13.3)) * (60 / (25 max (60 min diag_fps)))) + 0.6
                          ];
                          ["", false, -(SLE_JET_fuel_consumption_CBAS / 20), false, true] call fnc_SLE_JET_fuel_core;
                          sleep 0.05;
                      };
                };
                [true] call fnc_SLE_JET_engine_sound_core;
                [true] call fnc_SLE_JET_backpack_swapper;
            };
        } else {
            if (!isNull SLE_JET_autobrake_spawn_handle) then {
                terminate SLE_JET_autobrake_spawn_handle;
            };
        };
    };
};

/*
Engine sound system core. Handles jet sounds. I'll note that i fucking hate how many loops it takes to make objectbound GLOBAL sound.
Check playSound3D. Oh shit it's static
Check playSound and say2D. Realize that they basically "voice in the head" and both local.
Okay, okay we still have say3D. SIKE it's local as well and on top of that object can only have say3D at a time so using player is out of the question.
Get frustrated.
Try co cut sound into 0.1 second fragments and play with playSound3D. To no surprise it's a bitch of a process of cutting and coding in with sleep 0.1's. And it sound like shit on medium-high movement speed.
GET REALLY MAD MAD
FUCK IT. Create object. Attach object to player. Make object invisible with remoteExec. Make it say3D with remoteExec again. Delete to make it STFU.
Remember that you still need to make logical function that will handle how sound behaves and all of this process need to be integrated into it and repeated multiple times.
pepeSad
Usually called of takeoff and landings. It is horrendous chunk of code written in sadness in frustration. I'm defenetly not proud of it.
Now it is actually decent after implementation of new sound emitter object and rewrite.
*/

fnc_SLE_JET_engine_sound_core = {
  private _jet_sound_state = param [0, false, [true]];
    if (_jet_sound_state) then { //Takeoff event.
        if (!isNull SLE_JET_stop_sound_repeater_spawn_handle) then { //Deletes engine stop sound emitter if it exists. This way the player won't keep hearing engines wind down after landing and immediate takeoff.
            terminate SLE_JET_stop_sound_repeater_spawn_handle;
            deleteVehicle SLE_JET_engine_stop_sound_emitter;
        };
        if (isNull SLE_JET_sound_repeater_spawn_handle) then { //Check to ensure no duplicates.
            SLE_JET_engine_sound_emitter = "SLE_JET_Sound_emitter" createVehicle position player; //Create sound emitter.
            SLE_JET_engine_sound_emitter attachTo [player, [0, -0.1, 1.2]]; //Attach it to player's back.
            SLE_JET_sound_repeater_spawn_handle = [] spawn {
                [SLE_JET_engine_sound_emitter, ["SLE_JET_engine_start", 300, 1, false, 0]] remoteExec ["say3D", ([0, -2] select isDedicated), false]; //Emmit engine start sound.
                uiSleep 1.4; //wait 1.4 seconds before starting the loop. As we dealing with sound that have certain real time length we must use uiSleep.
                while {(!isTouchingGround player) and
                      (!(((animationState player) find "aswm" != -1) or
                      ((animationState player) find "absw" != -1) or
                      ((animationState player) find "adve" != -1) or
                      ((animationState player) find "asdv" != -1) or
                      ((animationState player) find "assw" != -1)
                      ))} do {
                    waitUntil {!isGamePaused}; //Pause execution if player paused of alt-tabbed. This is necessary. I can tell from experience.
                    [SLE_JET_engine_sound_emitter, ["SLE_JET_engine_run", 300, 1, false, 0]] remoteExec ["say3D", ([0, -2] select isDedicated), false];
                    for "_i" from 0 to 42 step 1 do { //Actuall sound loop delay made in small chunks to ensure engine shutdown sound plays right after landing.
                      uiSleep 0.1;
                      if ((isTouchingGround player) or //If player lands on ground or falls in water loop will be stopped.
                      ((animationState player) find "aswm" != -1) or
                      ((animationState player) find "absw" != -1) or
                      ((animationState player) find "adve" != -1) or
                      ((animationState player) find "asdv" != -1) or
                      ((animationState player) find "assw" != -1)
                      ) exitWith {};
                    };
                };
                [false] call fnc_SLE_JET_engine_sound_core; //As the aforementioned loop stops we'll arrive here. More precisely we'll arrive here either way. (Unless player flies indefently or his PC dies.) Calls in sound core with argument "false" which starts landing sequence. Also sound core can be called externaly with same argument by player going unconscious or lack of fuel.
            };
        };
    } else { //Landing event.
        if (!isNull SLE_JET_sound_repeater_spawn_handle) then { //Stops engine sound only if it exists. If there is no active engine sound no action is taken at all.
            terminate SLE_JET_sound_repeater_spawn_handle;
            deleteVehicle SLE_JET_engine_sound_emitter;
            if (!isNull SLE_JET_stop_sound_repeater_spawn_handle) then { //Stops engine STOP sound if it exists. Heh.
                terminate SLE_JET_stop_sound_repeater_spawn_handle;
                deleteVehicle SLE_JET_engine_stop_sound_emitter;
            };
            SLE_JET_stop_sound_repeater_spawn_handle = [] spawn {
                SLE_JET_engine_stop_sound_emitter = "SLE_JET_Sound_emitter" createVehicle position player; //Again create emitter.
                SLE_JET_engine_stop_sound_emitter attachTo [player, [0, -0.1, 1.2]]; //Attach.
                [SLE_JET_engine_stop_sound_emitter, ["SLE_JET_engine_shutdown", 300, 1, false, 0]] remoteExec ["say3D", ([0, -2] select isDedicated), false]; //Play sound
                uiSleep 3.5;
                deleteVehicle SLE_JET_engine_stop_sound_emitter; //Delete emitter after sound played.
                [false] call fnc_SLE_JET_backpack_swapper; //Also call backpack swapper. This may look wierd but this part of sound core executes on landing (or if jet shuts down for other reasons). And this is perfect spot right after engine stop sound is done playing.
            };
        };
    };
};

//Event sound system core. Handles all kinds of warnings and conditional voicelines.
fnc_SLE_JET_event_sound_core = {
//Placeholder. Implementation pending?
};

//Backpack swapper function. Swaps appropriate backpacks on takeoff and landing. Called in similarly to sound core.
fnc_SLE_JET_backpack_swapper = {
  private _backpack_state = param [0, false, [true]];
    if (_backpack_state) then {
        //Takeoff
        if (backpack player == "B_JETPACK_Nospace_off_SLE") then {
            removeBackpack player;
            player addBackpack "B_JETPACK_Nospace_on_SLE";
        };
        if (backpack player == "B_JETPACK_Yesspace_off_SLE") then {
            ["save"] call fnc_SLE_JET_backpack_inventory_saver;
            removeBackpack player;
            player addBackpack "B_JETPACK_Yesspace_on_SLE";
            ["load"] call fnc_SLE_JET_backpack_inventory_saver;
        };
    } else {
        //Landing
        if (backpack player == "B_JETPACK_Nospace_on_SLE") then {
            removeBackpack player;
            player addBackpack "B_JETPACK_Nospace_off_SLE";
        };
        if (backpack player == "B_JETPACK_Yesspace_on_SLE") then {
            ["save"] call fnc_SLE_JET_backpack_inventory_saver;
            removeBackpack player;
            player addBackpack "B_JETPACK_Yesspace_off_SLE";
            ["load"] call fnc_SLE_JET_backpack_inventory_saver;
        };
    };
};
//Inventory saver. Stores inventory in several arrays and restores later. Due to potential wipe of items in player backpack it will perform actions only when called with specific argument. For that reason i used string instead of bool.
fnc_SLE_JET_backpack_inventory_saver = {
  private _backpack_inventory_direction = param [0, "", [""]];
    //Save
    if (_backpack_inventory_direction == "save") then {
        player setVariable ["SLE_JET_backpack_mags", magazinesAmmo backpackContainer player, false];
        player setVariable ["SLE_JET_backpack_guns", weaponsItems backpackContainer player, false];
        player setVariable ["SLE_JET_backpack_items", getItemCargo  backpackContainer player, false];
    };
    //Load
    if (_backpack_inventory_direction == "load") then {
        private _backpack_mags = player getVariable "SLE_JET_backpack_mags";
        private _backpack_guns = player getVariable "SLE_JET_backpack_guns";
        private _backpack_items = player getVariable "SLE_JET_backpack_items";
        if (count (_backpack_mags) > 0) then {
            {
                (backpackContainer player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
            } forEach _backpack_mags;
        };
        if (count (_backpack_guns) > 0) then {
            {
                (backpackContainer player) addWeaponWithAttachmentsCargoGlobal [_x, 1];
            } forEach _backpack_guns;
        };
        if (count (_backpack_items) > 0) then {
            for "_i" from 0 to (count (_backpack_items select 0)-1) do {
                (backpackContainer player) addItemCargoGlobal [(_backpack_items select 0) select _i, (_backpack_items select 1) select _i];
            };
        };
    };
};

//Jetpack deactivation function. Terminates all things that can't run in background unnoticed by player.
fnc_SLE_JET_Disable_Jetpack = {
    if (!isNil "PEH_SLE_JET_In_air_no_sway") then {
        player removeEventHandler ["AnimChanged", PEH_SLE_JET_In_air_no_sway];
        PEH_SLE_JET_In_air_no_sway = nil;
    };
    if (!isNil "PEH_SLE_JET_Sound_KILLswitch") then {
        player removeEventHandler ["Killed", PEH_SLE_JET_Sound_KILLswitch];
        PEH_SLE_JET_Sound_KILLswitch = nil;
    };

    if (!isNil "SLE_JET_autobrake_physic_calculator_spawn_handle") then {
        terminate SLE_JET_autobrake_physic_calculator_spawn_handle;
        SLE_JET_autobrake_physic_calculator_spawn_handle = nil;
    };

    if (!isNil "SLE_JET_fuel_generation_spawn_handle") then {
        terminate SLE_JET_fuel_generation_spawn_handle;
        SLE_JET_fuel_generation_spawn_handle = nil;
    };
    if (!isNil "SLE_JET_height_limiter_spawn_handle") then {
        terminate SLE_JET_height_limiter_spawn_handle;
        SLE_JET_height_limiter_spawn_handle = nil;
    };
    if (!isNil "SLE_JET_autohover_over_water_spawn_handle") then {
        terminate SLE_JET_autohover_over_water_spawn_handle;
        SLE_JET_autohover_over_water_spawn_handle = nil;
    };
    if (!isNil "SLE_JET_unconscious_detector_spawn_handle") then {
        terminate SLE_JET_unconscious_detector_spawn_handle;
        SLE_JET_unconscious_detector_spawn_handle = nil;
    };

    if (player getVariable "SLE_JET_Sway_fix_on") then {
        player setanimspeedcoef 1;
        player setCustomAimCoef 1;
        removeMissionEventHandler ["EachFrame", MEH_SLE_JET_In_air_no_sway_repeater];
        player setVariable ["SLE_JET_Sway_fix_on", false, false];
    };

    if (!isNull SLE_JET_sound_repeater_spawn_handle) then {
        terminate SLE_JET_sound_repeater_spawn_handle;
    };
    if (!isNull SLE_JET_stop_sound_repeater_spawn_handle) then {
        terminate SLE_JET_stop_sound_repeater_spawn_handle;
    };

    {
            if (typeOf _x == "SLE_JET_Sound_emitter") then {
                deleteVehicle _x;
            };
    } forEach nearestObjects [player, ["all"], 2] - allUnits;

    [false] call fnc_SLE_JET_up;
    [false] call fnc_SLE_JET_forw;
    [false] call fnc_SLE_JET_backw;
    [false] call fnc_SLE_JET_left;
    [false] call fnc_SLE_JET_right;
    [false, true] call fnc_SLE_JET_brake;

    player setVariable ["SLE_JET_Jetpak_activation_state", false, false];
};

//Jetpack UI deactivation function.
fnc_SLE_JET_Disable_Jetpack_ui = {
    if (!isNil "MEH_JET_FPV") then {
        removeMissionEventHandler ["Draw3D", MEH_JET_FPV];
        MEH_JET_FPV = nil;
    };
    if (!isNil "MEH_JET_CCIP") then {
        removeMissionEventHandler ["Draw3D", MEH_JET_CCIP];
        MEH_JET_CCIP = nil;
    };

    disableSerialization;
    ("layer_sle_jet_fuel_bar" call BIS_fnc_rscLayer) cutRsc ["RscTitleDisplayEmpty", "plain"];

    player setVariable ["SLE_JET_Jetpak_ui_activation_state", false, false];
};
