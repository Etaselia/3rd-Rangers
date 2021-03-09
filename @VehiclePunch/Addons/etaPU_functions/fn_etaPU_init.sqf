waitUntil { not isNull player };
  etaPU_VehiclePunch_fnc ={
    _current_uniform = uniform player;
    if ([_current_uniform, etaPU_punch_uniforms] call BIS_fnc_inString or etaPU_all_can_punch) then {
      _target = cursorTarget;
      if ((player distance _target <= etaPU_max_punch_distance and _target call BIS_fnc_objectType select 0 in ["Vehicle","Soldier"])) then {

      [player, etaPU_punch_animation] remoteExec ["switchMove", 0];

      if (getDammage _target + 0.75 < 1) then {
      _target setDamage(getDammage _target + 0.75);
    }
    else {
      _target setDamage 0.95;
    };
      _target setHitPointDamage ["hitEngine", 1.0];
      _target setVelocity [sin direction player * 10,cos direction player * 10,2
      ];
      if (_target call BIS_fnc_objectType select 0 == "vehicle") then {
        playSound3D ["A3\Sounds_F\sfx\explosion1.wss", _target];
        if (etaPU_punch_crew_kill) then {
          {_x setDamage 1} forEach crew _target;
        };
      }
      else {
        playSound3D ["A3\Sounds_F\sfx\ZoomOut.wss", player];
        sleep 0.1;
        _target setDamage 1;
      };
      }
      else {
          hintSilent "Nothing to Punch";
      };
    };
  };
