
  //TODO
  /*
  1: CREATE GENERATOR
    1.1: Energy System  -->  DONE
    1.2: UI --> DONE
  2: SELF HEAL
    2.1: ace compat check --> DONE
    2.2: settings implementation --> PENDING TEST
  3: Target Heal
    3.1: Icon for selection --> TODO
    3.2: ace check --> DONE
  4: Group Heal
    4.1: Area marker? --> TODO
    4.2: ace check --> DONE
  5: Shield Recharge Buff
    5.1: Implement with Mjolnir System (player getVariable ["optre_suit_energy", 100]) --> PENDING TEST
    5.2: Area Marker? --> TODO
  */

  /*
  Global Variables:
    GENERAL:
      nanite_medical_active --> true

    Nanite_generator_system_v2:
      nanite_energy_default_MEDICAL --> 100
      nanite_energy_gain_MEDICAL --> 1
      nanite_energy_tick_MEDICAL --> 1

    fnc_Nanite_self_heal:
      nanite_selfheal_cost_MEDICAL --> 50
      nanite_selfheal_cooldown_MEDICAL --> 5

    fnc_nanite_target_heal:
      nanite_targetheal_cost_MEDICAL --> 25
      nanite_targetheal_area_MEDICAL --> 1
      nanite_targetheal_cooldown_MEDICAL --> 10

    fnc_nanite_group_heal:
      nanite_groupheal_cost_MEDICAL --> 100
      nanite_groupheal_area_MEDICAL --> 5
      nanite_groupheal_cooldown_MEDICAL --> 10

    fnc_nanite_shield_recharge_MEDICAL:
      nanite_shieldrecharge_cost_MEDICAL --> 20
      nanite_shieldrecharge_area_MEDICAL --> 5
      nanite_shieldrecharge_amount_MEDICAL --> 20
      nanite_shieldrecharge_cooldown_MEDICAL --> 60
      nanite_shieldrecharge_duration_MEDICAL --> 10
      nanite_shieldrecharge_frequency_MEDICAL --> 5

    //GUI
      nanite_GUI_HidePercentage_MEDICAL --> false



  */
//DEBUG

/*
nanite_energy_default_MEDICAL = 100;
nanite_energy_gain_MEDICAL = 1;
nanite_medical_active = true;
nanite_energy_tick_MEDICAL = 1;
nanite_selfheal_cost_MEDICAL = 50;
nanite_selfheal_cooldown_MEDICAL = 5;
nanite_targetheal_cost_MEDICAL = 25;
nanite_targetheal_area_MEDICAL = 1;
nanite_targetheal_cooldown_MEDICAL = 10;
nanite_groupheal_cost_MEDICAL = 100;
nanite_groupheal_area_MEDICAL = 5;
nanite_groupheal_cooldown_MEDICAL = 10;
nanite_shieldrecharge_cost_MEDICAL = 20;
nanite_shieldrecharge_area_MEDICAL = 5;
nanite_shieldrecharge_amount_MEDICAL = 20;
nanite_shieldrecharge_cooldown_MEDICAL = 60;
nanite_shieldrecharge_duration_MEDICAL = 10;
nanite_shieldrecharge_frequency_MEDICAL = 5;
*/

fnc_nanite_deactivation_MEDICAL = {

  [player] spawn {
      removeAllActions player;
      //KILL GENERATOR
      nanite_medical_active = false;
      //WAIT TO MAKE SURE ITS OFF
      sleep nanite_energy_tick_MEDICAL;

      //DISABLE UI
      ("layer_eta_nanite_energy_bar_empty" call BIS_fnc_rscLayer) cutText ["", "plain"];
      ("layer_eta_nanite_energy_bar" call BIS_fnc_rscLayer) cutText ["", "plain"];
      ("layer_eta_nanite_charging" call BIS_fnc_rscLayer) cutText ["", "plain"];
      ("layer_eta_nanite_ready" call BIS_fnc_rscLayer) cutText ["", "plain"];

      if (!nanite_GUI_HidePercentage_MEDICAL) then {
        ("layer_eta_nanite_energy_percentage" call BIS_fnc_rscLayer) cutText ["", "plain"];
      };

      //NOTE THAT THIS DOES NOT STOP SHIELD RECHARGE
      player setVariable ["nanite_energy", 0, true];
      //Make sure you can reactivate everything
      player setVariable ["nanite_cooldown", false, true];
  };
};

fnc_Nano_Suit_MEDICAL ={
  nanite_medical_active = true;

    fnc_nanite_generator_system_v2 = {
      disableSerialization;
      ("layer_eta_nanite_energy_bar_empty" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_fuel_bar_empty", "plain",-1,false];
      ("layer_eta_nanite_energy_bar" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_energy_bar", "plain", -1, false];
      if (!nanite_GUI_HidePercentage_MEDICAL) then {
        ("layer_eta_nanite_energy_percentage" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_energy_percentage", "plain", -1, false];
      };


      fnc_nanite_generator_ui_v2 = {
          //UI WIP
          [player] spawn {
            while {nanite_medical_active} do {
              private _display = uiNamespace getVariable "eta_nanite_energy_bar";
              private _set_bar = _display displayCtrl 629211;
              _set_bar progressSetPosition (player getVariable "nanite_energy") / 100;

              if (!nanite_GUI_HidePercentage_MEDICAL) then {
                _display_percentage = uiNamespace getVariable "eta_nanite_hud_energy_percentage_idd";
                _control = _display_percentage displayCtrl 629216;
                private _percentage = player getVariable ["nanite_energy", nanite_energy_default_MEDICAL];
                _percentage = formatText ["%1%2", str(_percentage),"%"];
                _control ctrlSetText str [_percentage];
              };

              private _nanite_cooldown = player getVariable ["nanite_cooldown", false];
              if (_nanite_cooldown) then {
                ("layer_eta_nanite_ready" call BIS_fnc_rscLayer) cutText ["", "plain"];
                ("layer_eta_nanite_charging" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_SYSTEM_STATUS_CHARGING", "plain", -1, false];
              }
              else
              {
                ("layer_eta_nanite_charging" call BIS_fnc_rscLayer) cutText ["", "plain"];
                ("layer_eta_nanite_ready" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_SYSTEM_STATUS_READY", "plain", -1, false];
              };
              if !(uniform player in ["NaniteSuitMEDICAL","MJOLNIR_MKVI_Undersuit_v3"]) then {
                call fnc_nanite_deactivation_MEDICAL;
              };
              sleep 0.5;
            };
        };
      };

      [player] spawn {
        while {nanite_medical_active} do {
          _nanite_energy = player getVariable ["nanite_energy", nanite_energy_default_MEDICAL];
          if (_nanite_energy >= 99) then {
            player setVariable ["nanite_energy", 100, true];
          }
          else {
            player setVariable ["nanite_energy", (_nanite_energy + nanite_energy_gain_MEDICAL), true];
          };
          sleep nanite_energy_tick_MEDICAL;
        };
      };
      call fnc_nanite_generator_ui_v2;
    };

    fnc_nanite_self_heal = {
      _nanite_energy = player getVariable ["nanite_energy", Nil];
      _nanite_cooldown = player getVariable ["nanite_cooldown", false];
      if (!isNil {_nanite_energy}) then {

        if (_nanite_energy >= nanite_selfheal_cost_MEDICAL and !_nanite_cooldown) then
        {
          //CREATE COOLDOWN
          [player] spawn {
            params ["_player"];
            _player setVariable ["nanite_cooldown", true, false];
            sleep nanite_selfheal_cooldown_MEDICAL;
            _player setVariable ["nanite_cooldown", false, false];

            if (isClass(configFile >> "CfgPatches" >> "ace_main")) then
            {
              [_player] call ace_medical_treatment_fnc_fullHealLocal;
              //This might make issues
            }
            else
            {
              _player setDamage 0;
            };
          };
          player setVariable ["nanite_energy", _nanite_energy - nanite_selfheal_cost_MEDICAL, false];

          //CHECK FOR ACE
        }
        else
        {
          systemChat "not enough energy";
        };
      }
      else
      {
        systemChat "ERROR GENERATOR NOT INITIALIZED";
        //TODO Call systemshutdown
      };
    };

    fnc_nanite_target_heal = {
      _nanite_energy = player getVariable ["nanite_energy", Nil];
      _nanite_cooldown = player getVariable ["nanite_cooldown", false];
      if (!isNil {_nanite_energy}) then {
        if (_nanite_energy >= nanite_targetheal_cost_MEDICAL) then {
          if (!_nanite_cooldown) then {
            if (cursorTarget isKindOf "Man") then {
              //REMOVE ENERGY
              player setVariable ["nanite_energy", (_nanite_energy - nanite_targetheal_cost_MEDICAL), false];
              [player,cursorTarget] spawn {
                params ["_player", "_cursortarget"];

                _player setVariable ["nanite_cooldown", true, true];
                sleep nanite_selfheal_cooldown_MEDICAL;
                _player setVariable ["nanite_cooldown", false, true];

                //Execution
                _healing_array = nearestObjects [_cursorTarget, ["Man"], nanite_targetheal_area_MEDICAL];
                {
                    if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
                      [_x] remoteExec ["ace_medical_treatment_fnc_fullHealLocal"];
                    }
                    else {
                      _x setDamage 0;
                    };
                } forEach _healing_array;
                //TODO implement in UI
              };
              //Creating Healing Area + Healing
            }
            else {
              systemChat "cannot target inorganic matter";
            };
          }
          else {
            systemChat "not enough energy";
          };
        }
        else {
          systemChat "not enough energy";
        };
      }
      else
      {
        systemChat "ERROR GENERATOR NOT INITIALIZED";
        //TODO Call systemshutdown
      };
    };

    fnc_nanite_group_heal = {
      _nanite_energy = player getVariable ["nanite_energy", Nil];
      _nanite_cooldown = player getVariable ["nanite_cooldown", false];
      if (!isNil {_nanite_energy}) then {
        if (_nanite_energy >= nanite_groupheal_cost_MEDICAL and !_nanite_cooldown) then
        {
          //CREATE COOLDOWN + REMOVE ENERGY
          [player] spawn {
            params ["_player"];
            _player setVariable ["nanite_cooldown", true, true];
            sleep nanite_groupheal_cooldown_MEDICAL;
            _player setVariable ["nanite_cooldown", false, true];
            //TODO implement in UI

            _healing_array = nearestObjects [_player, ["Man"], nanite_groupheal_area_MEDICAL];
            {
              //CHECK FOR ACE
              if (isClass(configFile >> "CfgPatches" >> "ace_main")) then
              {
                [_x] remoteExec ["ace_medical_treatment_fnc_fullHealLocal"];
                //This might make issues
              }
              else
              {
                _x setDamage 0;
              };
            } forEach _healing_array;
          };
          player setVariable ["nanite_energy",(_nanite_energy - nanite_groupheal_cost_MEDICAL), true];

          //CREATE HEALING ARRAY
        }
        else
        {
          systemChat "not enough energy";
        };
      }
      else
      {
        systemChat "ERROR GENERATOR NOT INITIALIZED";
        //TODO Call systemshutdown
      };
    };

    fnc_nanite_shield_recharge_MEDICAL = {
      _nanite_energy = player getVariable ["nanite_energy", Nil];
      _nanite_cooldown = player getVariable ["nanite_cooldown", false];
      if (!isNil {_nanite_energy}) then {

        if (_nanite_energy >= nanite_shieldrecharge_cost_MEDICAL and !_nanite_cooldown) then
        {
          //CREATE COOLDOWN + Drain energy
          [player] spawn {
            params ["_player"];
            _player setVariable ["nanite_cooldown", true, false];
            sleep nanite_shieldrecharge_cooldown_MEDICAL;
            _player setVariable ["nanite_cooldown", false, false];
          };
          player setVariable ["nanite_energy", (_nanite_energy - nanite_shieldrecharge_cost_MEDICAL), true];

          [player] spawn {
            params ["_player"];
            //REMOVING PLAYER SHIELDS FOR THE DURATION
            _current_suit_energy = _player getVariable ["optre_suit_energy", 100];
            _player setVariable ["nanite_shieldrecharge_active", true, true];
            while {_player getVariable ["nanite_shieldrecharge_active",true]} do {
              _player setVariable ["optre_suit_energy", 0, true];
              _shield_buff_array = nearestObjects [_player, ["Man"], nanite_shieldrecharge_area_MEDICAL];
              {
                fnc_add_nanite_shield = {player setVariable ["optre_suit_energy", player getVariable ["optre_suit_energy", 100], true]};
                  if (_player != _x) then {
                    //THIS WILL LIKELY MAKE ISSUES --> DEBUG <--
                    [] remoteExec ["fnc_add_nanite_shield", owner _x, false];
                    _new_shield = (_x getVariable ["optre_suit_energy", 100]);
                    if (_new_shield + nanite_shieldrecharge_amount_MEDICAL >= 100) then {
                      _x setVariable ["optre_suit_energy", 100, true];
                    }
                    else {
                      _new_shield = _new_shield + nanite_shieldrecharge_amount_MEDICAL;
                      _x setVariable ["optre_suit_energy", _new_shield, true];
                    };
                  };
              } forEach _shield_buff_array;
              sleep nanite_shieldrecharge_duration_MEDICAL / nanite_shieldrecharge_frequency_MEDICAL;
              _counter = _player getVariable ["nanite_shield_counter", 0];
              _counter = _counter + 1;
              _player setVariable ["nanite_shield_counter", _counter, true];
              if (_counter >= nanite_shieldrecharge_frequency_MEDICAL) then {
                _player setVariable ["nanite_shieldrecharge_active", false, true];
                _player setVariable ["nanite_shield_counter", 0, true];
              };
            };
          };

        }
        else
        {
          systemChat "not enough energy";
        };
      }
      else
      {
        systemChat "ERROR GENERATOR NOT INITIALIZED";
        //TODO Call systemshutdown
      };
    };

    call fnc_nanite_generator_system_v2;

    player addAction ["Self Heal", {call fnc_nanite_self_heal;}];
    player addAction ["Target Heal", {call fnc_nanite_target_heal;}];
    player addAction ["Group Heal", {call fnc_nanite_group_heal;}];
    player addAction ["Shield Distribution", {call fnc_nanite_shield_recharge_MEDICAL;}];
};


/* DEBUG TEXTURES

disableSerialization;
("layer_eta_nanite_fuel_bar_empty" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_fuel_bar_empty", "plain", -1, false];
