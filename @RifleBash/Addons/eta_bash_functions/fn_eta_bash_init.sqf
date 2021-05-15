waitUntil { not isNull player };
  eta_bash_fnc ={
    //secondary function def
    fnc_bash_sound ={
      sleep 0.7;
      playSound3D ["a3\sounds_f\weapons\hits\wood_5.wss", player];
    };
    //checking of player has weapon
    if (primaryWeapon player != "") then {
      //non SOG compat
      if (eta_bash_SOG_animation) then {
        player playActionNow "vn_bayonet_buttstrike";
      }
      else{
        [player, "AwopPercMstpSgthWrflDnon_End1"] remoteExec ["switchMove", 0];
      };
      playSound3D ["a3\sounds_f\characters\human-sfx\P05\Hit_Max_4.wss", player];
      _target = cursorTarget;
      if ((player distance _target <= eta_bash_max_distance and _target call BIS_fnc_objectType select 0 in ["Soldier"])) then {
        if (eta_melee_ace_compat) then {
          [] remoteExec ["fnc_bash_sound", clientOwner, false];
          [_target] spawn {
            params ["_target"];
            sleep 0.7;
            [_target, 0.2, "head", "blunt"] call ace_medical_fnc_addDamageToUnit;
            [_target, true] call ace_medical_fnc_setUnconscious;
          };
        }
        //I don't like this, just instakilling infantry via bash seems dumb
        else {
          [] remoteExec ["fnc_bash_sound", clientOwner, false];
          [_target] spawn {
            params ["_target"];
            sleep 0.7;
            _target setDamage 1;
          };
        };
      };
    };
  };
