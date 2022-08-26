
  //TODO
  /*
  1: ADJUST GENERATOR
    1.0: Energy System  -->  DONE
  2: SPEED SELECT
    1.1: create different speeds
    1.2: Redline (call ace damage?)
  3: UI
    3.1: Different effects for speed?
    3.2: UI for speed selection
  4: Activation / Deactivation
  */

/*
GLOBAL Variables

nanite_GUI_HidePercentage_speed = false;

nanite_energy_default_speed = 100;
nanite_energy_gain_speed = 1;
nanite_energy_tick_speed = 1;
nanite_energy_activation_energy = 20;

nanite_maximum_energy_drain_speed = 5;
nanite_minimum_energy_drain_speed = 1;
nanite_speed_lamda = 0.18;

nanite_speed_default_mult = 5;
nanite_speed_redline = 10;
nanite_speed_half_redline = true;
nanite_redline_knockout = 10;
nanite_speed_redline_no_power = true;

nanite_speed_tick = 1;

nanite_redline_pain = 0.5;
nanite_redline_player_none_ace_damage = 0.01;
nanite_spartan_compat_speed = true;
*/


fnc_Nano_Suit_SPEED ={
  nanite_speed_active = true;

    fnc_nanite_deactivation_speed = {
      [player] spawn {
          removeAllActions player;
          //KILL GENERATOR
          nanite_speed_active = false;
          player setVariable ["nanite_energy", 0, true];
          player setVariable ["nanite_speed_active", false, true];
          player setAnimSpeedCoef 1;
          //WAIT TO MAKE SURE ITS OFF
          sleep (2 * nanite_energy_tick_speed);

          //DISABLE UI
          ("layer_eta_nanite_hud_menu" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_energy_bar_empty" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_energy_bar" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_energy_percentage" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_redline_active" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_speed_active" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_HUD" call BIS_fnc_rscLayer) cutText ["", "plain"];
          ("layer_eta_nanite_display_percentage" call BIS_fnc_rscLayer) cutText ["", "plain"];

      };
    };

    fnc_nanite_generator_system_v2 = {
      disableSerialization;
      ("layer_eta_nanite_hud_menu" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_additional_information", "plain", -1, false];
      ("layer_eta_nanite_energy_bar_empty" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_fuel_bar_empty", "plain",-1,false];
      ("layer_eta_nanite_energy_bar" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_energy_bar", "plain", -1, false];
      ("layer_eta_nanite_HUD" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_menu_background", "plain", -1, false];

      if (!nanite_GUI_HidePercentage_speed) then {
        ("layer_eta_nanite_display_percentage" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_energy_percentage", "plain", -1, false];
      };


      fnc_nanite_generator_ui_v2 = {
          //UI WIP
          [player] spawn {
            while {nanite_speed_active} do {
              ("layer_eta_nanite_redline_active" call BIS_fnc_rscLayer) cutText ["", "plain"];
              ("layer_eta_nanite_speed_active" call BIS_fnc_rscLayer) cutText ["", "plain"];

              //Background Grid
              _speed_mode_active = player getVariable ["nanite_speed_active", false];
              _speed_coef = player getVariable ["nanite_speed_mult", nanite_speed_default_mult];
              _energy_drain = player getVariable ["nanite_speed_energy_cost_active", 1];
              _energy_drain = [_energy_drain, 1] call BIS_fnc_cutDecimals;
              _redline = (_speed_coef >= nanite_speed_redline);
              _active = player getVariable ["nanite_speed_active",false];

              _display_percentage = uiNamespace getVariable "eta_nanite_hud_menu_idd";
              _control = _display_percentage displayCtrl 629217;
              _updated_text = format["<t valign='middle' align='left' size='0.75' fonts='Zeppelin33' color='#3bb7f3'>Current Speed:  <t align='right'>%1x</t><br/><br/>Energy Drain/sec: <t align='right'>%2%3</t><br/><br/>Suit Active: <t align='right'>%4</t><br/><br/>User Redline: <t align='right'>%5</t></t>",_speed_coef,_energy_drain,"%",_active,_redline];
              _control ctrlSetStructuredText parseText _updated_text;


              if (_speed_mode_active) then {
                //call normal UI
                ("layer_eta_nanite_redline_active" call BIS_fnc_rscLayer) cutText ["", "plain"];
                ("layer_eta_nanite_speed_active" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_speed_normal", "plain", -1, false];
                if (_speed_coef >= nanite_speed_redline) then {
                  //call redline UI
                  ("layer_eta_nanite_speed_active" call BIS_fnc_rscLayer) cutText ["", "plain"];
                  ("layer_eta_nanite_redline_active" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_speed_redline", "plain", -1, false];
                };
              };


              private _display = uiNamespace getVariable "eta_nanite_energy_bar";
              private _set_bar = _display displayCtrl 629211;
              _set_bar progressSetPosition (player getVariable "nanite_energy") / 100;

              if (!nanite_GUI_HidePercentage_speed) then {
                _display_percentage = uiNamespace getVariable "eta_nanite_hud_energy_percentage_idd";
                _control = _display_percentage displayCtrl 629216;
                private _percentage = player getVariable ["nanite_energy", nanite_energy_default_speed];
                _percentage = [_percentage, 0] call BIS_fnc_cutDecimals;
                _percentage = format ["<t valign='middle' align='center' size='2' fonts='Zeppelin33' color='#3bb7f3'>%1%2</t>", _percentage,"%"];
                _control ctrlSetStructuredText parseText _percentage;
              };
              //TODO CHANGE UNIFORM

              if !(uniform player in ["NaniteSuitSpeed","MJOLNIR_MKVI_Undersuit_v3S"]) then {
                call fnc_nanite_deactivation_speed;
              };
              sleep 0.5;
            };
        };
      };

      [player] spawn {
        while {nanite_speed_active} do {
          _nanite_energy = player getVariable ["nanite_energy", nanite_energy_default_speed];
          if (_nanite_energy >= 99) then {
            player setVariable ["nanite_energy", 100, true];
          }
          else {
            player setVariable ["nanite_energy", (_nanite_energy + nanite_energy_gain_speed), true];
          };
          sleep nanite_energy_tick_speed;
        };
      };
      call fnc_nanite_generator_ui_v2;
    };

    fnc_nanite_speed_activation = {
      _nanite_speed_active = true;
      player setVariable ["nanite_speed_active", true, true];
      _nanite_energy = player getVariable ["nanite_energy", nanite_energy_default_speed];

        //activate nanite speed
        //Energy Drain
        [player,_nanite_speed_active,_nanite_energy] spawn {
          params ["_player","_nanite_speed_active","_nanite_energy"];
          while {_nanite_speed_active} do {
            _nanite_speed_active = _player getVariable ["nanite_speed_active", false];
            _speed_coef = player getVariable ["nanite_speed_mult", nanite_speed_default_mult];
            [_player,_speed_coef,_nanite_speed_active] spawn {
              params ["_player","_speed_coef","_nanite_speed_active"];
              //SPARTAN COMPAT --> TAKES A LOT OF RESSOURCES
              while {_nanite_speed_active and nanite_spartan_compat_speed} do {
                _player setAnimSpeedCoef _speed_coef;
                _nanite_speed_active = _player getVariable ["nanite_speed_active", false];
                sleep 0.01;
              };
              _player setAnimSpeedCoef 1;
            };
            _player setAnimSpeedCoef _speed_coef;
            if (_speed_coef >= nanite_speed_redline) then {
                if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
                  [_player, nanite_redline_pain ] remoteExec ["ace_medical_fnc_adjustPainLevel",_player];
                  [_player, nanite_redline_pain, "rightleg", "stab", player] remoteExec ["ace_medical_fnc_addDamageToUnit",_player];
                  [_player, nanite_redline_pain, "leftleg", "stab", player] remoteExec ["ace_medical_fnc_addDamageToUnit",_player];

                  [_player,_nanite_speed_active,_speed_coef] spawn {
                    params ["_player","_nanite_speed_active","_speed_coef"];
                    sleep nanite_redline_knockout;
                    _nanite_speed_active = player getVariable ["nanite_speed_active", false];
                    _speed_coef = player getVariable ["nanite_speed_mult", 2];

                    if (_nanite_speed_active and _speed_coef >= nanite_speed_redline) then {
                      [_player, true, 20, true] remoteExec ["ace_medical_fnc_setUnconscious",_player];
                      _player setVariable ["nanite_speed_active", false, true];
                    };
                  };
                }
                else {
                  _player_health = damage _player;
                  _player_health = _player_health - nanite_redline_player_none_ace_damage;
                };
            };

            _current_energy_cost = _player getVariable ["nanite_speed_energy_cost_active", 1];
            _nanite_energy = _nanite_energy - _current_energy_cost;
              if (_nanite_energy <= 0) then {
                _nanite_speed_active = false;
                _player setVariable ["nanite_speed_active", false, true];
                _player setVariable ["nanite_energy", 0, true];
                _player setAnimSpeedCoef 1;
              }
              else {
                _player setVariable ["nanite_energy", _nanite_energy, true];
              };
              if (!_nanite_speed_active) then {
                _player setAnimSpeedCoef 1;
              };
              sleep nanite_speed_tick;
          };
        };
      };

    fnc_nanite_speed_deactivation = {
      player setVariable ["nanite_speed_active", false, true];
    };

    //call vial [_user,_adjusting_value] call fnc_nanite_speed_mulpt_set;
    fnc_nanite_speed_mulpt_set = {
      params ["_active_user","_adjust_energy"];
      _speed_coef = _active_user getVariable ["nanite_speed_mult", nanite_speed_default_mult];
      _nanite_energy_cost = _active_user getVariable ["nanite_speed_energy_cost_active", 1];

      _speed_coef = _speed_coef + _adjust_energy;
      if (_speed_coef <= 2) then {_speed_coef = 2;};
      if (_speed_coef >= nanite_speed_redline) then {_speed_coef = nanite_speed_redline;};
      if (nanite_speed_half_redline) then {
        if (_speed_coef > (nanite_speed_redline / 2)) then {
          _speed_coef = nanite_speed_redline;
          if (_adjust_energy < 0) then {
            _speed_coef = nanite_speed_redline / 2;
          };
        };
      };
      _active_user setVariable ["nanite_speed_mult", _speed_coef, true];

      //Logistical Function to determine intermidiate energy drain --> https://www.maa.org/book/export/html/115630
      _minimum_drain_actual = (nanite_maximum_energy_drain_speed / nanite_minimum_energy_drain_speed) - 2;

      _nanite_energy_drain_actual = nanite_maximum_energy_drain_speed/(1 + _minimum_drain_actual*(exp(-nanite_speed_lamda*_speed_coef)));
      if (nanite_speed_redline_no_power and _speed_coef >= nanite_speed_redline) then {
        _nanite_energy_drain_actual = 0;
      };
      _active_user setVariable ["nanite_speed_energy_cost_active", _nanite_energy_drain_actual, true];
    };

    fnc_nanite_key_speed_up = {
      [player,1] call fnc_nanite_speed_mulpt_set;
    };

    fnc_nanite_key_speed_down = {
      [player,-1] call fnc_nanite_speed_mulpt_set;
    };

    fnc_nanite_key_speed_right = {
      [player,5] call fnc_nanite_speed_mulpt_set;
    };

    fnc_nanite_key_speed_left = {
      [player,-5] call fnc_nanite_speed_mulpt_set;
    };

    fnc_speed_mode_menu = {
      player addAction ["ACTIVATE SPEED MODE", {call fnc_nanite_speed_activation}];
      player addAction ["DEACTIVATE SPEED MODE", {call fnc_nanite_speed_deactivation}];
      player addAction ["ADJUST SPEED OPTIONS",{
        removeAllActions player;
        player addAction ["ADD 1 SPEED", {[player,1] call fnc_nanite_speed_mulpt_set}];
        player addAction ["ADD 5 SPEED", {[player,5] call fnc_nanite_speed_mulpt_set}];
        player addAction ["REMOVE 1 SPEED", {[player,-1] call fnc_nanite_speed_mulpt_set}];
        player addAction ["REMOVE 5 SPEED", {[player,-5] call fnc_nanite_speed_mulpt_set}];
        player addAction ["CANCEL ADJUSTMENT", {
          removeAllActions player ;
          call fnc_speed_mode_menu;
        }];
      }];
    };

    call fnc_speed_mode_menu;
    call fnc_nanite_generator_system_v2;
};




/* DEBUG TEXTURES

disableSerialization;
("layer_eta_nanite_fuel_bar_empty" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_fuel_bar_empty", "plain", -1, false];
