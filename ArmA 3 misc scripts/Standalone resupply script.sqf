//---Universal resupply.
//player must activate this code one way or another and throw stone to call in supply. Use player additem "HandGrenade_Stone"; to spawn yourself a stone and give it to player.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~add~stone~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player additem "HandGrenade_Stone";
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~remove~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player removeEventHandler ["FiredMan", EH_ShotsFiredResupply];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~main~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

EH_ShotsFiredResupply = player addEventHandler ["FiredMan", {
AmmoType = _this select 4;
  if (AmmoType == "GrenadeHand_stone") then {
_Projectile = _this select 6;
_Airdrop1 = (player modelToWorld [0,-1500,1000]);
_Airdrop2 = (player modelToWorld [0,5000,1000]);
    [_Projectile, _Airdrop1, _Airdrop2] spawn {

_Projectile = _this select 0;
_Airdrop1 = _this select 1;
_Airdrop2 = _this select 2;

Sleep 1;

_Pos = [getpos _Projectile select 0, getpos _Projectile select 1, (getpos _Projectile select 2)+200];
Hint "Position locked in. Airdrop ETA: 60 seconds.";
[_Airdrop1, _Airdrop2, 1000, "FULL", "B_T_VTOL_01_infantry_F", west] call BIS_fnc_ambientFlyby;

sleep 15;

_parachute = createVehicle ["B_Parachute_02_F", _Pos, [], 0, ""];
_AirCrate = createVehicle ["Box_NATO_Equip_F", [0,0,100], [], 0, "FLY"];
_AirCrate attachTo [_parachute,[0,0,0]];
WaitUntil {((((position _AirCrate) select 2) < 0.6) || (isNil "_parachute"))};
detach _AirCrate;
_AirCrate setPos [(position _AirCrate) select 0, (position _AirCrate) select 1, 1];

clearItemCargoGlobal _AirCrate;

[_AirCrate, ["Take primary magazine.", {
  if ((primaryWeapon player) != "") then {
    if ((count (primaryWeaponMagazine player)) != 0) then {
      player addMagazine ((primaryWeaponMagazine player)select 0);
    } else {Hint "You don't have magazine in your primary. Please don't eject empty magazines.";};
  } else {Hint "You don't have primary. What chain of decisions led you to this?";};
}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take UGL round.", {
  if ((primaryWeapon player) != "") then {
    if ((count (primaryWeaponMagazine player)) != 0) then {
      player addMagazine ((primaryWeaponMagazine player)select 1);
    } else {Hint "You don't have round in your GL. Please don't eject empty magazines.";};
  } else {Hint "You don't have primary. What chain of decisions led you to this?";};
}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take AT round.", {
  if ((secondaryWeapon player) != "") then {
    if ((count (secondaryWeaponMagazine player)) != 0) then {
      player addMagazine ((secondaryWeaponMagazine player)select 0);
    } else {Hint "You don't have round in your AT laucher. Please use one of static options to get your first.";};
  } else {Hint "You don't have AT laucher. Too bad.";};
}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take sidearm magazine.", {
  if ((handgunWeapon player) != "") then {
    if ((count (handgunMagazine player)) != 0) then {
      player addMagazine ((handgunMagazine player)select 0);
    } else {Hint "You don't have magazine in your sidearm. Please don't eject empty magazines.";};
  } else {Hint "You don't have sidearm. SLE approves.";};
}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];

[_AirCrate, ["Take MAAWS AT 55.", {player addMagazine "MRAWS_HEAT55_F";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take MAAWS AT 75.", {player addMagazine "MRAWS_HEAT_F";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take MAAWS HE.", {player addMagazine "MRAWS_HE_F";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take Titan AT.", {player addMagazine "Titan_AT";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take Titan AP.", {player addMagazine "Titan_AP";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take Titan AA.", {player addMagazine "Titan_AA";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take Vorona HEAT.", {player addMagazine "Vorona_HEAT";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take Vorona HE.", {player addMagazine "Vorona_HE";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take RPG 32 AT.", {player addMagazine "RPG32_F";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
[_AirCrate, ["Take RPG 32 HE.", {player addMagazine "RPG32_HE_F";}, nil, 1.5, true, false, "", "true", 5, false, "", ""]] remoteExec ["addAction"];
    };
  };
}];
