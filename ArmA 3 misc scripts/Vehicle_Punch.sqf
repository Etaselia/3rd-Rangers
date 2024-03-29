

PunchKeyRespawn = {
  PunchKey = [] spawn {
    waitUntil {inputAction "User1" > 0};
    _target = cursorTarget;
    if ((player distance _target <= 8 and _target call BIS_fnc_objectType select 0 in ["Vehicle","Soldier"])) then {

    [player, "AwopPercMstpSgthWrflDnon_End1"] remoteExec ["switchMove", 0];

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
    sleep 0.5;

    [] call PunchKeyRespawn;
  };
};
[] call PunchKeyRespawn;
