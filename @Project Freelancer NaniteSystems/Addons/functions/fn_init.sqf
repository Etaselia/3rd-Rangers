waitUntil { not isNull player };

ONI_Suit_Active = false;
SPARTAN_Suit_Active = false;
SPARTAN_V2_Suit_Active = false;

//function for supply beacon, gets called on init
EH_ShotsFiredResupply = player addEventHandler ["FiredMan", {
AmmoType = _this select 4;
  if (AmmoType == "Resupply_Beacon") then {
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

_AirCrate addItemCargoGlobal ["ACE_packingBandage", 50];
_AirCrate addItemCargoGlobal ["ACE_elasticBandage", 50];

_AirCrate addItemCargoGlobal ["ACE_splint", 20];
_AirCrate addItemCargoGlobal ["ACE_surgicalKit", 2];
_AirCrate addItemCargoGlobal ["ACE_tourniquet", 20];

_AirCrate addItemCargoGlobal ["ACE_salineIV_500", 10];
_AirCrate addItemCargoGlobal ["ACE_salineIV", 5];


_AirCrate addItemCargoGlobal ["ACE_epinephrine", 20];
_AirCrate addItemCargoGlobal ["ACE_adenosine", 20];
_AirCrate addItemCargoGlobal ["ACE_morphine", 20];

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

Nano_Off = {
comment "Remove eventHandlers.";
if ((ShotBreakInvis_ONI and ONI_Suit_Active) or (ShotBreakInvis_SPARTAN and SPARTAN_Suit_Active) or (ShotBreakInvis_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then {
  player removeEventHandler ["FiredMan", EH_ShotsFired];
};
if ((ProximitySensor_ONI and ONI_Suit_Active) or (ProximitySensor_SPARTAN and SPARTAN_Suit_Active) or (ProximitySensor_SPARTAN_V2 and SPARTAN_Suit_Active)) then {
  player removeEventHandler ["FiredNear", EH_ProximitySensor];
};
if ((NoFallDamageACEmedicalCompat_ONI and ONI_Suit_Active) or (NoFallDamageACEmedicalCompat_SPARTAN and SPARTAN_Suit_Active) or (NoFallDamageACEmedicalCompat_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then {

  removeMissionEventHandler ["EachFrame", MEH_CompatACE];
}
else
  {
    player removeEventHandler ["HandleDamage", EH_NoFallDamage];
  };

if ((WeaponCoreNoSway_ONI and ONI_Suit_Active) or (WeaponCoreNoSway_SPARTAN and SPARTAN_Suit_Active) and (WeaponCoreNoSway_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    [] call Nano_AIM;
    [] call Nano_STOP;
    removeMissionEventHandler ["EachFrame", MEH_NoSway];
  };
removeMissionEventHandler ["EachFrame", MEH_HUD];

comment "Remove sceduled code.";
terminate NanABKey;

comment "Remove scrollmenu.";
if (!DisableScrollMenu_ONI) then {removeallactions player;};
if (!DisableScrollMenu_SPARTAN_V2) then {removeallactions player;};
if (!DisableScrollMenu_SPARTAN) then {removeallactions player;};

comment "Remove functions.";
NoFallDamageACE = {};
SuitGenerator = {};
GeneratorStop = {};
GeneratorScan = {};
GeneratorRestart = {};
Nano_Armor2_ACT = {};
Nano_Armor2 = {};
Nano_Sneak2_ACT = {};
Nano_Sneak2 = {};
Nano_FAFB2_ACT = {};
Nano_FAFB2 = {};
Nano_JUMP = {};
Nano_JUMP_Stuck_Check = {};
Nano_AIM = {};
Nano_STOP_ACT = {};
Nano_STOP = {};

comment "Zero some variables.";
SuitPower = 0;
AbiliyActive = 0;
InvisActive = 0;
InvisBreakRDY = 0;
ArmorActive = 0;
SpeedActive = 0;
NanoAIMSW = 0;
ONI_Suit_Active = false;
SPARTAN_Suit_Active = false;
SPARTAN_V2_Suit_Active = false;


comment "Remove abuilities effects.";
player allowDamage true;
[player,false] remoteExec["hideobject",0];
player setCaptive false;
player setAnimSpeedCoef 1;
[player, 0] spawn BIS_fnc_traceBullets;
player setCustomAimCoef 1;
player setUnitRecoilCoefficient 1;

comment "Overwrite suit UI hint. UI update already disabled by removing MEH_HUD eventHandler.";
Hint "Suit removed";

Nanite_Suit_Active = 0;
};

cats_assault ={
	hintSilent formatText ["Assault C.A.T.S. Online %1 Detection Range: %2m",linebreak,prox_distance];
	cats_prox_detector = player addEventHandler ["FiredNear", {
		if (!(_this select 1 in allPlayers) and ((getposASL player) vectorDistance (getposASL (_this select 1)) <= prox_distance)) then {
		UnluckyBastard = _this select 1;
		ShotLocation = [(getPosATL UnluckyBastard select 0), (getPosATL UnluckyBastard select 1), (getPosATL UnluckyBastard select 2) + 1];
		  addMissionEventHandler ["EachFrame", {
		  drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [1,0,0,0.5], ShotLocation, 1, 1, 0,"Shot detected!", 2, 0.05, 'RobotoCondensed', 'center', true];
		  }];
		};
	}];
	["itemAdd", ["cats_remove", {
	if (goggles player != "CATS_CQC") then {
	hintSilent formatText ["C.A.T.S Removed"];
	player removeEventHandler ["FiredNear",cats_prox_detector];
	["itemRemove", ["cats_cats_remove"]] call BIS_fnc_loop;
	};
	}, 5]] call BIS_fnc_loop;
};

cats_marksman ={
	bcu_active = true;
	["itemAdd", ["cats_range", {
		_ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
		_cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
		DisMes = if (count _ins > 0) then [{round _cursor_distance},{9999}];
		_VarDisMes = (DisMes*(1 + random [((distance_fail / 100) * -1), 0, (distance_fail/100)]));

		if (DisMes >= trace_dist) then {
			if (!bcu_active) then {
			[player, 1] spawn BIS_fnc_traceBullets;
			BCU = "ON";
			bcu_active = true;
			};
		}
		else {
			[player, 0] spawn BIS_fnc_traceBullets;
			BCU = "OFF";
			bcu_active = false;
		};
	hintSilent formatText ["Distance: ~%1m %2 BCU: %3",round _VarDisMes, lineBreak, BCU];

	if (goggles player != "CATS_Marksman") then {
		[player, 0] spawn BIS_fnc_traceBullets;
		Hint "C.A.T.S. Removed";
		["itemRemove", ["cats_range"]] call BIS_fnc_loop;
	};
	}, 1]] call BIS_fnc_loop;
};
