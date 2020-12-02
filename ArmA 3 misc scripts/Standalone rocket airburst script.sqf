//---Airburst standalone script.
//Works for most of things that can be described as rocket or missile.
//Same script also weaved into nanosuit.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if(isNil "AirburstReInit") then {AirburstReInit = 0;};
if(isNil "ABswitch") then {ABswitch = 0};

removeallactions player;
player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}];

if (AirburstReInit == 1) then {
removeMissionEventHandler ["EachFrame", MEH_ABHUDandRange];
player removeEventHandler ["FiredMan", EH_ShotsFiredAirburst];
};

DisLocked = 100;

MEH_ABHUDandRange = addMissionEventHandler ["EachFrame", {
_ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
_cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
DisMes = if (count _ins > 0) then [{str(round _cursor_distance)},{"---"}];
DisNum = if (count _ins > 0) then [{(round _cursor_distance)+3},{9999}];
DisLockedUI = if (ABswitch == 0) then {DisLocked} else {"OFF"};
hintSilent formatText ["Distance: %1 m%3Airburst: %2 m",DisMes ,DisLockedUI, lineBreak];
}];

EH_ShotsFiredAirburst = player addEventHandler ["FiredMan", {
  if (ABswitch == 0) then {
  Projectile = _this select 6;
  StartPos = ASLToAGL (getPosASL player);
    [Projectile,StartPos,DisLocked] spawn {
      for [{_i = 0}, {_i < 3000}, {_i = _i + 1}] do
      {
        _CurrentDist = (_this select 1) distance (_this select 0);
        if (_CurrentDist >= (_this select 2)) then {triggerAmmo (_this select 0);};
        if (_CurrentDist >= (_this select 2)) exitWith {};
        sleep 0.01
      };
    };
  };
}];

if (AirburstReInit == 0) then {
  ABLockKeyRespawn = {
      ABKeyStandalone = [] spawn {
          waitUntil {inputAction "gunElevAuto" > 0};
          DisLocked = DisNum;
          Sleep 0.2;
          [] call ABLockKeyRespawn;
      };
  };
[] call ABLockKeyRespawn;
AirburstReInit = 1;
};
