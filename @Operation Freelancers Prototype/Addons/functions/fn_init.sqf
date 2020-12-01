waitUntil { not isNull player };

ONI_Suit_Active = false;
SPARTAN_Suit_Active = false;

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
if ((ShotBreakInvis_ONI and ONI_Suit_Active) or (ShotBreakInvis_SPARTAN and SPARTAN_Suit_Active)) then {
  player removeEventHandler ["FiredMan", EH_ShotsFired];
};
if ((ProximitySensor_ONI and ONI_Suit_Active) or (ProximitySensor_SPARTAN and SPARTAN_Suit_Active)) then {
  player removeEventHandler ["FiredNear", EH_ProximitySensor];
};
if ((NoFallDamageACEmedicalCompat_ONI and ONI_Suit_Active) or (NoFallDamageACEmedicalCompat_SPARTAN and SPARTAN_Suit_Active)) then {

  removeMissionEventHandler ["EachFrame", MEH_CompatACE];
}
else
  {
    player removeEventHandler ["HandleDamage", EH_NoFallDamage];
  };

if ((WeaponCoreNoSway_ONI and ONI_Suit_Active) or (WeaponCoreNoSway_SPARTAN and SPARTAN_Suit_Active)) then
  {
    [] call Nano_AIM;
    [] call Nano_STOP;
    removeMissionEventHandler ["EachFrame", MEH_NoSway];
  };
removeMissionEventHandler ["EachFrame", MEH_HUD];

comment "Remove sceduled code.";
terminate ArmorKey;
terminate SneakKey;
terminate SpeedKey;
terminate JumpKey;
terminate WeaponKey;
terminate NanABKey;
terminate DisengageKey;

comment "Remove scrollmenu.";
if (!DisableScrollMenu_ONI) then {removeallactions player;};
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





//function definitions for NaniteSuit, gets called in Uniform config.cpp
Nano_Suit_ONI ={

ONI_Suit_Active = true;
DevOptions = false;                          comment "[Boolean]  Development options. Used for script debuging.";
TextureArmor      = "Uniform\NanoArmor.jpg";     comment "[String]   Texture name of Armor mode texture.";
TextureSpeed      = "Uniform\NanoSpeed.jpg";     comment "[String]   Texture name of Speed mode texture.";
TextureArmorSpeed = "Uniform\NanoBoth.jpg";      comment "[String]   Texture name of Armor+Speed mode texture.";
TextureIdle       = "Uniform\NanoBase.jpg";      comment "[String]   Texture name of default texture when no abilities listed above active.";
TextureHandling = true;

AbiliyActive = 0;
ArmorActive = 0;
InvisActive = 0;
SpeedActive = 0;
InvisBreakRDY = 0;
NanoStopping = 0;
Cease = 0;
InvisSTOP = 0;
ActiveScan = 0;
FastAsFuckTick = FastAsFuckTickEff_ONI;
GottaGoFastMultiplier = GottaGoFastMultiplierEff_ONI;
GenStopTick = RechargeTick_ONI + 0.2;
DisengageTick = selectMax [ArmorTick_ONI,SneakTick_ONI,FastAsFuckTick] +0.1;
if (NanoAirburst_ONI) then {ConstantRangefinder_ONI = true;};
AbiliyActive = 0;
ArmorActive = 0;
InvisActive = 0;
SpeedActive = 0;
InvisBreakRDY = 0;
NanoStopping = 0;
Cease = 0;
InvisSTOP = 0;
ActiveScan = 0;
FastAsFuckTick = FastAsFuckTickEff_ONI;
GottaGoFastMultiplier = GottaGoFastMultiplierEff_ONI;
GenStopTick = RechargeTick_ONI + 0.2;
DisengageTick = selectMax [ArmorTick_ONI,SneakTick_ONI,FastAsFuckTick] +0.1;
if (NanoAirburst_ONI) then {ConstantRangefinder_ONI = true;};
if(isNil "ABswitch") then {ABswitch = 0; DisLocked = 100;};

  comment "Removing eventHandlers in case of multiple script activations.";
player removeEventHandler ["FiredMan", EH_ShotsFired];
player removeEventHandler ["FiredNear", EH_ProximitySensor];
player removeEventHandler ["HandleDamage", EH_NoFallDamage];
removeMissionEventHandler ["EachFrame", MEH_CompatACE];
removeMissionEventHandler ["EachFrame", MEH_HUD];
removeMissionEventHandler ["EachFrame", MEH_NoSway];

  comment "Removing sceduled hotkey code in case of multiple script activations.";
terminate ArmorKey;
terminate SneakKey;
terminate SpeedKey;
terminate JumpKey;
terminate WeaponKey;
terminate NanABKey;
terminate DisengageKey;

  comment "No fall damage. It's integral part of jump function and speed mode. Small bump on high speed will kill player because game don't distinguish between vertical and horizontal speed for fall damage calculation.";
if (!NoFallDamageACEmedicalCompat_ONI) then{
NoFallDamage = {_damage = 0; if((_this select 4) != "") then { _damage = _this select 2;}; _damage };
EH_NoFallDamage = player addEventHandler ["HandleDamage", { _this call NoFallDamage }];
};
  comment "ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat_ONI) then{
  NoFallDamageACE = {
    if (isTouchingGround player) then {
      if (ArmorActive == 0) then {player allowDamage true;};
    } else {
    player allowDamage false;
    };
  };
};
  comment "Adding eventHandler for ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat_ONI) then{
  MEH_CompatACE = addMissionEventHandler ["EachFrame", {
  [] call NoFallDamageACE;
  }];
};

  comment "Adding eventHandler for invisibility break and recoil compensator energy consumption.";
        EH_ShotsFired = player addEventHandler ["FiredMan", {
RecoilConmpensationWeaponType = _this select 1;
RecoilConmpensationMuzzleType = _this select 2;
RecoilConmpensationFiremodeType = _this select 3;
if ((_this select 5) == "LAGO_KU5K_MAG_buck") then {player setAmmo [currentWeapon player, 0]; systemChat "Please don't use this ammo. It causing performance drop.";};
  comment "Break invis on shot backend.Includes energy consumption if setting is enabled. It's a big list because of how eventhandlers [fired] and [firedNear] works. Making generalized suppressor check won't work because script only scanning attachments on main weapon. (Yes it is possible to scan attachments on pistol too.) Generalized script won't care which slot weapon belongs to simply because eventhandler only provides weapon name, not slot in which weapon located. If you have suppressed 9mm SMG and fire RPG generalized script will only count fact of shot and RPG shot will be equal to 9mm bullet. Only way to get around this that i see now is list of weapons that can be used to convert weapon name to slot. So essentially same thing i did but with extra steps.";
if (ShotBreakInvis_ONI) then {
  if (InvisBreakRDY == 1) then {
    if (!ExcludeSuppressed_ONI) then {InvisSTOP = 1;} else {
      switch (RecoilConmpensationWeaponType) do
      {
        case "KA_dagger":                 {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "KA_knife":                  {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "KA_machete":                {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "KA_axe":                    {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "Hatchet":                   {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "KA_crossbow_black":         {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "KA_crossbow_wood":          {if (SuitPower_ONI >= 1)  then{SuitPower_ONI = SuitPower_ONI - 1;}  else {InvisSTOP = 1;};};
        case "rhs_weap_m3a1_specops":     {if (SuitPower_ONI >= 5)  then{SuitPower_ONI = SuitPower_ONI - 5;}  else {InvisSTOP = 1;};};
        case "rhs_weap_pb_6p9":           {if (SuitPower_ONI >= 10) then{SuitPower_ONI = SuitPower_ONI - 10;} else {InvisSTOP = 1;};};
        case "KA_MP5SD3":                 {if (SuitPower_ONI >= 10) then{SuitPower_ONI = SuitPower_ONI - 10;} else {InvisSTOP = 1;};};
        case "hlc_smg_mp5sd5":            {if (SuitPower_ONI >= 10) then{SuitPower_ONI = SuitPower_ONI - 10;} else {InvisSTOP = 1;};};
        case "hlc_smg_mp5sd6":            {if (SuitPower_ONI >= 10) then{SuitPower_ONI = SuitPower_ONI - 10;} else {InvisSTOP = 1;};};
        case "hlc_rifle_honeybadger":     {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval":            {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_grip":       {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_npz":        {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_grip_npz":   {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss":              {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_grip":         {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_npz":          {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_grip_npz":     {if (SuitPower_ONI >= 20) then{SuitPower_ONI = SuitPower_ONI - 20;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert":        {if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert_FDE":    {if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert_BL":     {if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};};
        case "KA_VSSK":                   {if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};};
        case "srifle_DMR_04_F":           {if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};};
        case "srifle_DMR_04_Tan_F":       {if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};};
        case "rhs_weap_m32":              {if (SuitPower_ONI >= 50) then{SuitPower_ONI = SuitPower_ONI - 50;} else {InvisSTOP = 1;};};
        case "ATA_XM25_F":                {if (SuitPower_ONI >= 50) then{SuitPower_ONI = SuitPower_ONI - 50;} else {InvisSTOP = 1;};};
        case "ATA_XM29_F":                {
                                              if (RecoilConmpensationMuzzleType == "ATA_XM29_F") then{
                                                  if (SuitPower_ONI >= 50) then{SuitPower_ONI = SuitPower_ONI - 50;} else {InvisSTOP = 1;};
                                              } else {
                                                  if ("XM29_KE_Suppressor" in (player weaponAccessories primaryWeapon player)) then{
                                                      if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30;} else {InvisSTOP = 1;};
                                                  } else {
                                                      InvisSTOP = 1;
                                                  };
                                              };
                                          };
        case "weap_RPK":                  {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_CQC":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_FDE_CQC":    {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_LB":         {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_FDE_LB":     {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_STD":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_FDE_STD":    {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_Hand":      {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_AFG":       {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_EGLM":      {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_Grip":      {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_Hand":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_AFG":         {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_EGLM":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_Grip":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        default {InvisSTOP = 1;};
      };
    };
  };
};

  comment "Recoil compensation energy consumption backend.";
if (NanoAIMSW == 1) then {
  switch (RecoilConmpensationWeaponType) do
  {
    case "LAGO_KU3K":                 {    comment "These weapons (KU3 and KU5) have different accuracy in different firemodes so energy consumtion balanced accordingly.";
      switch (RecoilConmpensationFiremodeType) do {
        case "Single":     {if (SuitPower_ONI >= 5) then{SuitPower_ONI = SuitPower_ONI - 5;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "Burst":      {if (SuitPower_ONI >= 3) then{SuitPower_ONI = SuitPower_ONI - 3;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "FullAuto":   {if (SuitPower_ONI >= 2) then{SuitPower_ONI = SuitPower_ONI - 2;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
      };
    };
    case "LAGO_KU5K":                 {
      switch (RecoilConmpensationFiremodeType) do {
        case "FullAuto1":   {if (SuitPower_ONI >= 3) then{SuitPower_ONI = SuitPower_ONI - 3;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "FullAuto2":   {if (SuitPower_ONI >= 2) then{SuitPower_ONI = SuitPower_ONI - 2;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
      };
    };
    case "LAGO_KU98K_NSK":            {if (SuitPower_ONI >= 10) then{SuitPower_ONI = SuitPower_ONI - 10;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "LAGO_CP":                   {};
    case "weap_RPK":                  {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_CQC":        {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_CQC":    {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_LB":         {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_LB":     {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_STD":        {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_STD":    {if (SuitPower_ONI >= 4) then{SuitPower_ONI = SuitPower_ONI - 4;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_Hand":      {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_AFG":       {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_EGLM":      {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_Grip":      {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_Hand":        {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_AFG":         {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_EGLM":        {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_Grip":        {if (SuitPower_ONI >= 6) then{SuitPower_ONI = SuitPower_ONI - 6;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
    default                           {if (SuitPower_ONI >= RecoilConmpensationEnergyPerShot_ONI) then{SuitPower_ONI = SuitPower_ONI - RecoilConmpensationEnergyPerShot_ONI;} else {SuitPower_ONI = 0; playSound "Alarm"; [] call Nano_AIM;};};
  };
};

  comment "Airburst part.";
if (NanoAirburst_ONI) then {
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
};

  comment "Guidance for LAGO Multiple rocket launcher.";
if (NanoGuidance_ONI) then {
_AmmoType = _this select 4;
if (_AmmoType != "LAGO_CP_BOOM") exitWith {};

_WeaponType = _this select 1;
if (_WeaponType == "Throw") exitWith {Hint "Grenades excluded for technical reasons."};

_target = cursorTarget;

if (isNull _target) exitWith {Hint "No target. Make sure to press spot button (T) on target and keep target in center of the screen."};
_Projectile = _this select 6;
_MCSOrdStartPos = [(getPosASL _Projectile)select 0,(getPosASL _Projectile)select 1,((getPosASL _Projectile)select 2)+0.1];
_MCSAmmoSpeed = velocityModelSpace _Projectile select 1;

_MCSOffset = if (_target isKindOf "MAN") then {_target selectionPosition "pelvis";} else {getCenterOfMass _target;};

[_MCSOrdStartPos, _Projectile, _target, _MCSAmmoSpeed, false, _MCSOffset, 10, "", false] remoteExec ["BIS_fnc_EXP_camp_guidedProjectile", 2];
};

        }];

  comment "Suppressor check function.";
SuppressorCheck = {
  params ["_AttachmentsArray"];
  _AttachmentsArray = _this select 0;
    if (
    ("muzzle_snds_B"                     in _AttachmentsArray) or
    ("muzzle_snds_B_arid_F"              in _AttachmentsArray) or
    ("muzzle_snds_B_khk_F"               in _AttachmentsArray) or
    ("muzzle_snds_B_lush_F"              in _AttachmentsArray) or
    ("muzzle_snds_B_snd_F"               in _AttachmentsArray) or
    ("rhsusf_acc_aac_762sd_silencer"     in _AttachmentsArray) or
    ("rhsusf_acc_aac_762sdn6_silencer"   in _AttachmentsArray) or
    ("rhsusf_acc_aac_scarh_silencer"     in _AttachmentsArray) or
    ("rhsgref_sdn6_suppressor"           in _AttachmentsArray) or
    ("hlc_muzzle_300blk_KAC"             in _AttachmentsArray) or
    ("SCAR_13_Inches_Barrel_Silencer"    in _AttachmentsArray) or
    ("SCAR_16_Inches_Barrel_Silencer"    in _AttachmentsArray) or
    ("SCAR_20_Inches_Barrel_Silencer"    in _AttachmentsArray)
    ) then { if (SuitPower_ONI >= 30) then{SuitPower_ONI = SuitPower_ONI - 30; } else {InvisSTOP = 1;};} else {InvisSTOP = 1;};
};

  comment "Adding eventHandler for proximity sensor if needed.";
if (ProximitySensor_ONI) then {
  EH_ProximitySensor = player addEventHandler ["FiredNear", {
    if (!(_this select 1 in allPlayers)) then {
    UnluckyBastard = _this select 1;
    ShotLocation = [(getPosATL UnluckyBastard select 0), (getPosATL UnluckyBastard select 1), (getPosATL UnluckyBastard select 2) + 1];
      onEachFrame {
      drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [1,0,0,0.5], ShotLocation, 1, 1, 0,"Shot detected!", 2, 0.05, 'RobotoCondensed', 'center', true];
      };
    };
  }];
};

  comment "Adding eventHandler responsible for HUD in form of hint and rangefinding. As of now i can't make actuall HUD that not depends on mission files and this script is universal.";
MEH_HUD = addMissionEventHandler ["EachFrame", {

  if (SuitPower_ONI >= 0 ) then {ChargeGraph = "[..................................................]"};
  if (SuitPower_ONI >= 2 ) then {ChargeGraph = "[|.................................................]"};
  if (SuitPower_ONI >= 4 ) then {ChargeGraph = "[||................................................]"};
  if (SuitPower_ONI >= 6 ) then {ChargeGraph = "[|||...............................................]"};
  if (SuitPower_ONI >= 8 ) then {ChargeGraph = "[||||..............................................]"};
  if (SuitPower_ONI >= 10) then {ChargeGraph = "[|||||.............................................]"};
  if (SuitPower_ONI >= 12) then {ChargeGraph = "[||||||............................................]"};
  if (SuitPower_ONI >= 14) then {ChargeGraph = "[|||||||...........................................]"};
  if (SuitPower_ONI >= 16) then {ChargeGraph = "[||||||||..........................................]"};
  if (SuitPower_ONI >= 18) then {ChargeGraph = "[|||||||||.........................................]"};
  if (SuitPower_ONI >= 20) then {ChargeGraph = "[||||||||||........................................]"};
  if (SuitPower_ONI >= 22) then {ChargeGraph = "[|||||||||||.......................................]"};
  if (SuitPower_ONI >= 24) then {ChargeGraph = "[||||||||||||......................................]"};
  if (SuitPower_ONI >= 26) then {ChargeGraph = "[|||||||||||||.....................................]"};
  if (SuitPower_ONI >= 28) then {ChargeGraph = "[||||||||||||||....................................]"};
  if (SuitPower_ONI >= 30) then {ChargeGraph = "[|||||||||||||||...................................]"};
  if (SuitPower_ONI >= 32) then {ChargeGraph = "[||||||||||||||||..................................]"};
  if (SuitPower_ONI >= 34) then {ChargeGraph = "[|||||||||||||||||.................................]"};
  if (SuitPower_ONI >= 36) then {ChargeGraph = "[||||||||||||||||||................................]"};
  if (SuitPower_ONI >= 38) then {ChargeGraph = "[|||||||||||||||||||...............................]"};
  if (SuitPower_ONI >= 40) then {ChargeGraph = "[||||||||||||||||||||..............................]"};
  if (SuitPower_ONI >= 42) then {ChargeGraph = "[|||||||||||||||||||||.............................]"};
  if (SuitPower_ONI >= 44) then {ChargeGraph = "[||||||||||||||||||||||............................]"};
  if (SuitPower_ONI >= 46) then {ChargeGraph = "[|||||||||||||||||||||||...........................]"};
  if (SuitPower_ONI >= 48) then {ChargeGraph = "[||||||||||||||||||||||||..........................]"};
  if (SuitPower_ONI >= 50) then {ChargeGraph = "[|||||||||||||||||||||||||.........................]"};
  if (SuitPower_ONI >= 52) then {ChargeGraph = "[||||||||||||||||||||||||||........................]"};
  if (SuitPower_ONI >= 54) then {ChargeGraph = "[|||||||||||||||||||||||||||.......................]"};
  if (SuitPower_ONI >= 56) then {ChargeGraph = "[||||||||||||||||||||||||||||......................]"};
  if (SuitPower_ONI >= 58) then {ChargeGraph = "[|||||||||||||||||||||||||||||.....................]"};
  if (SuitPower_ONI >= 60) then {ChargeGraph = "[||||||||||||||||||||||||||||||....................]"};
  if (SuitPower_ONI >= 62) then {ChargeGraph = "[|||||||||||||||||||||||||||||||...................]"};
  if (SuitPower_ONI >= 64) then {ChargeGraph = "[||||||||||||||||||||||||||||||||..................]"};
  if (SuitPower_ONI >= 66) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||.................]"};
  if (SuitPower_ONI >= 68) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||................]"};
  if (SuitPower_ONI >= 70) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||...............]"};
  if (SuitPower_ONI >= 72) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||..............]"};
  if (SuitPower_ONI >= 74) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||.............]"};
  if (SuitPower_ONI >= 76) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||............]"};
  if (SuitPower_ONI >= 78) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||...........]"};
  if (SuitPower_ONI >= 80) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||..........]"};
  if (SuitPower_ONI >= 82) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||.........]"};
  if (SuitPower_ONI >= 84) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||........]"};
  if (SuitPower_ONI >= 86) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||.......]"};
  if (SuitPower_ONI >= 88) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||......]"};
  if (SuitPower_ONI >= 90) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||.....]"};
  if (SuitPower_ONI >= 92) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||||....]"};
  if (SuitPower_ONI >= 94) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||||...]"};
  if (SuitPower_ONI >= 96) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||||||..]"};
  if (SuitPower_ONI >= 98) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||||||.]"};
  if (SuitPower_ONI >= 100) then {ChargeGraph= "[||||||||||||||||||||||||||||||||||||||||||||||||||]"};

      comment "Rangefinder.";
    if (ConstantRangefinder_ONI) then {
      _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
      _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
      DisMes = if (count _ins > 0) then [{str(round _cursor_distance)},{"---"}];
        if (NanoAirburst_ONI) then {
          DisNum = if (count _ins > 0) then [{(round _cursor_distance)+3},{9999}];
          DisLockedUI = if (ABswitch == 0) then {DisLocked} else {"OFF"};
        };
    };
      comment "Get player health (vanilla).";
    if (NanoHeal_ONI) then {Health = 100-((damage player)*100);};

      comment "Not letting players see negative power values when manual stop used.";
    if (SuitPower_ONI < -0.01) then {UISuitPower = "Reboot"} else {UISuitPower = (selectMin [100,SuitPower_ONI]) toFixed 1;};

  comment "Information output.";
  if ((!NanoAirburst_ONI)and(!NanoHeal_ONI)and(!ConstantRangefinder_ONI)) then {hintSilent formatText ["Power: %1 %2%3%4", UISuitPower, "%", lineBreak,ChargeGraph];};
  if ((!NanoAirburst_ONI)and(!NanoHeal_ONI)and(ConstantRangefinder_ONI)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes];};
  if ((!NanoAirburst_ONI)and(NanoHeal_ONI)and(!ConstantRangefinder_ONI)) then {hintSilent formatText ["Power: %1 %2%3%4%3User health: %5 %2", UISuitPower, "%", lineBreak, ChargeGraph, Health];};
  if ((!NanoAirburst_ONI)and(NanoHeal_ONI)and(ConstantRangefinder_ONI)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3User health: %6 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, Health];};
  if ((NanoAirburst_ONI)and(!NanoHeal_ONI)and(!ConstantRangefinder_ONI)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst_ONI)and(!NanoHeal_ONI)and(ConstantRangefinder_ONI)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes,DisLockedUI];};
  if ((NanoAirburst_ONI)and(NanoHeal_ONI)and(!ConstantRangefinder_ONI)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst_ONI)and(NanoHeal_ONI)and(ConstantRangefinder_ONI)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m%3User health: %7 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, DisLockedUI, Health];};

  comment "Rebreather module.";
  if (NanoRebreather_ONI) then {player setOxygenRemaining 1;};

}];
systemChat "EventHandlers loaded.";

  comment "Adding functions for hotkeys handling.";
if (HotkeysEnabeled_ONI) then{

if (MaximumArmorSwitch_ONI) then {
  ArmorKeyRespawn = {
      ArmorKey = [] spawn {
          waitUntil {inputAction "User9" > 0};
          [] spawn {[] call Nano_Armor2_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call ArmorKeyRespawn;
      };
  };
[] call ArmorKeyRespawn;
};

if (CloakSwitch_ONI) then {
  SneakKeyRespawn = {
      SneakKey = [] spawn {
          waitUntil {inputAction "User10" > 0};
          [] spawn {[] call Nano_Sneak2_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call SneakKeyRespawn;
      };
  };
[] call SneakKeyRespawn;
};

if (MaximumSpeedSwitch_ONI) then {
  SpeedKeyRespawn = {
      SpeedKey = [] spawn {
          waitUntil {inputAction "User11" > 0};
          [] spawn {[] call Nano_FAFB2_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call SpeedKeyRespawn;
      };
  };
[] call SpeedKeyRespawn;
};

if (JumpSwitch_ONI) then {
  JumpKeyRespawn = {
      JumpKey = [] spawn {
          waitUntil {inputAction "User12" > 0};
          [] spawn {[] call Nano_JUMP;};
          Sleep (DisengageTick + 0.1);
          [] call JumpKeyRespawn;
      };
  };
[] call JumpKeyRespawn;
};

if (WeaponHandlingSwitch_ONI) then {
  WeapnHandlingKeyRespawn = {
      WeaponKey = [] spawn {
          waitUntil {inputAction "User13" > 0};
          [] spawn {[] call Nano_AIM;};
          Sleep (DisengageTick + 0.1);
          [] call WeapnHandlingKeyRespawn;
      };
  };
[] call WeapnHandlingKeyRespawn;
};

if (NanoAirburst_ONI) then {
  ABLockKeyRespawn = {
      NanABKey = [] spawn {
          waitUntil {inputAction "gunElevAuto" > 0};
          DisLocked = DisNum;
          Sleep 0.2;
          [] call ABLockKeyRespawn;
      };
  };
[] call ABLockKeyRespawn;
};

  DisengageKeyRespawn = {
      DisengageKey = [] spawn {
          waitUntil {inputAction "User14" > 0};
          [] spawn {[] call Nano_STOP_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call DisengageKeyRespawn;
      };
  };
[] call DisengageKeyRespawn;

systemChat "Hotkeys loaded.";
};

  comment "Scrollmenu functions.";

if (!DisableScrollMenu_ONI) then {removeallactions player;};

NanoActivateActionID = player addAction ["<t>Activate Suit</t>", {
  if (!DisableScrollMenu_ONI) then {
    [] call Nano_menu2eff;
    player removeAction NanoActivateActionID;
    [] call GeneratorStop;
    [] call SuitGenerator;
  } else {
    player removeAction NanoActivateActionID;
    systemChat "Scrollmenu disabled. Please use hotkeys.";
      if (!HotkeysEnabeled_ONI) then {
        systemChat "ERR. Hotkeys disabled too. Please contact missionmaker and tell that he did big OOF. Suit is unusable.";
      };
    [] call GeneratorStop;
    [] call SuitGenerator;
  };
}];

Nano_menu2eff = {
removeallactions player;
 if (MaximumArmorSwitch_ONI)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch_ONI)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch_ONI)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch_ONI)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch_ONI)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (TwoSpeedModeSwitch_ONI)    then {player addAction ["<t>Speed mode switch [ >Eff | MAX ]</t>", {FastAsFuckTick = FastAsFuckTickMAX_ONI; GottaGoFastMultiplier = GottaGoFastMultiplierMAX_ONI; DisengageTick = selectMax [ArmorTick_ONI,SneakTick_ONI,FastAsFuckTick] +0.1; [] call Nano_menu2max;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (NanoAirburst_ONI)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2effHidden;}];
 if (JumpSwitch_ONI)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Restart suit generator</t>", {[] call GeneratorRestart;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if ((DevOptions) and (TextureHandling)) then {player addAction ["<t>[DEV] Check textures.</t>", {player setObjectTextureGlobal [0,TextureArmor]; sleep 0.5; player setObjectTextureGlobal [0,TextureSpeed]; sleep 0.5; player setObjectTextureGlobal [0,TextureArmorSpeed]; sleep 0.5;player setObjectTextureGlobal [0,TextureIdle];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Start generator (no checks)</t>", {[] call SuitGenerator;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Stop generator</t>", {[] call GeneratorStop;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
};
Nano_menu2effHidden = {
removeallactions player;
player addAction ["<t color='#BBBBBB'>>>Nano menu</t>", {[] call Nano_menu2eff;}];
};

Nano_menu2max = {
removeallactions player;
 if (MaximumArmorSwitch_ONI)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch_ONI)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch_ONI)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch_ONI)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch_ONI)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>Speed mode switch [ Eff | >MAX ]</t>", {FastAsFuckTick = FastAsFuckTickEff_ONI; GottaGoFastMultiplier = GottaGoFastMultiplierEff_ONI; DisengageTick = selectMax [ArmorTick_ONI,SneakTick_ONI,FastAsFuckTick] +0.1; [] call Nano_menu2eff;}];
 if (NanoAirburst_ONI)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2maxHidden;}];
 if (JumpSwitch_ONI)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Restart suit generator</t>", {[] call GeneratorRestart;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if ((DevOptions) and (TextureHandling)) then {player addAction ["<t>[DEV] Check textures.</t>", {player setObjectTextureGlobal [0,TextureArmor]; sleep 0.5; player setObjectTextureGlobal [0,TextureSpeed]; sleep 0.5; player setObjectTextureGlobal [0,TextureArmorSpeed]; sleep 0.5;player setObjectTextureGlobal [0,TextureIdle];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Start generator (no checks)</t>", {[] call SuitGenerator;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Stop generator</t>", {[] call GeneratorStop;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
};
Nano_menu2maxHidden = {
removeallactions player;
player addAction ["<t color='#BBBBBB'>>>Nano menu</t>", {[] call Nano_menu2max;}];
};
systemChat "Menu loaded.";


  comment "Power generation structure. Yea it's that simple. And yes, i know that ExitWith exist. No kinkshaming pls.";
SuitGenerator = {
    if (SuitPower_ONI < 100) then {
        if (AbiliyActive == 0) then {
          SuitPower_ONI = round (SuitPower_ONI + 1);
          PlayerSpeedPower = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
          if ((StaticRecharge_ONI)and(PlayerSpeedPower == 0) and(SuitPower_ONI < 100)) then {SuitPower_ONI = round (SuitPower_ONI + 1);};
          uiSleep RechargeTick_ONI;
        };
if (Cease == 0) then {[] call SuitGenerator;};
    } else {
      uiSleep 1;
      if (NanoHeal_ONI) then {player setDamage ((getDammage player) - NanoHealRate_ONI);};
      if (Cease == 0) then {[] call SuitGenerator;};
    };
};
  comment "Generator debugging functions.";
GeneratorStop = {
  Cease = 1;
  uiSleep GenStopTick;
  Cease = 0;
};
GeneratorScan = {
  if ((SuitPower_ONI < 50) and (SuitPower_ONI >= -1)) then {
    SuitPowerACCBRK = SuitPower_ONI;
    ActiveScan = 1;
      for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do {
        SuitPowerACCBRK = round (SuitPowerACCBRK + 1);
        if ((StaticRecharge_ONI)and(PlayerSpeedPower == 0) and(SuitPowerACCBRK < 100)) then {SuitPowerACCBRK = round (SuitPowerACCBRK + 1);};
        uiSleep RechargeTick_ONI;
      };
    ActiveScan = 0;
    if ((SuitPower_ONI - SuitPowerACCBRK)>8) then {
      [] call GeneratorStop;
      systemChat "Abnormal power flux detected. Preparing to restart generator.";
      [] spawn {[] call GeneratorRestart;};
    };
  };
};
GeneratorRestart = {
  if (SuitPower_ONI != 100) then{
  SuitPowerACCDEB = SuitPower_ONI;
  uiSleep (RechargeTick_ONI * 3);
    if (SuitPower_ONI == SuitPowerACCDEB) then {
    systemChat "Error confirmed. Restarting generator now.";
    AbiliyActive = 0;[] call SuitGenerator;
    } else {
    systemChat "Suit seems to be functioning normally. Try to reload script if problem exist. If you tried to launch several generators for faster recharge, then fuck you.";
    };
  } else {
    systemChat "Suit fully charged. Therefore debug not needed now.";
  };
};

  comment "Armor global switch.";
    if (MaximumArmorSwitch_ONI) then {
  comment "Armor activation function.";
Nano_Armor2_ACT = {
  if (SuitPower_ONI >= 10) then {
    if (ArmorActive == 0) then {systemChat "Maximum armor"; playSound "Hint"; [] call Nano_Armor2;};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Armor function.";
Nano_Armor2 = {
  if (SuitPower_ONI > 0) then {
    if (TextureHandling) then {if (SpeedActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureArmor];};};
    if (!ActiveRecharge_ONI) then {AbiliyActive = 1;};
    ArmorActive = 1;
    SuitPower_ONI = SuitPower_ONI - 1;
    player allowDamage false;
    uiSleep ArmorTick_ONI;
    [] call Nano_Armor2;
  } else {
    if (SuitPower_ONI > -5) then {systemChat "Out of energy"; playSound "Alarm";};
    ArmorActive = 0;
    AbiliyActive = 0;
    player allowDamage true;
    if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
    if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
  };
};
    };

  comment "Cloak global switch.";
    if (CloakSwitch_ONI) then {
  comment "Cloak activation function.";
Nano_Sneak2_ACT = {
  if (SuitPower_ONI >= 10) then {
    if (InvisActive == 0) then {systemChat "Cloak Engaged"; playSound "Hint"; if ((vehicle player) != player) then{systemchat "Vehicles cannot be hidden and will cause suspition.";}; [] call Nano_Sneak2;};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Cloak function.";
Nano_Sneak2 = {
  if (InvisSTOP == 0) then{
      if (SuitPower_ONI > 0) then {
          if (!ActiveRecharge_ONI) then {AbiliyActive = 1;};
          if (ShotBreakInvis_ONI) then {InvisBreakRDY = 1;};
          InvisActive = 1;
          [player] remoteExec["hideobject",0,true];
          if ((vehicle player) == player) then{player setCaptive true;};
            if (AdvancedInvisibility_ONI) then {
              PlayerSpeed = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
              EnergyConsumption = (exp (PlayerSpeed*0.005)-0.95)+((PlayerSpeed^3)/10000);
              SuitPower_ONI = SuitPower_ONI - (selectMin [EnergyConsumption,5]);
              uiSleep 0.1;
            } else {
              SuitPower_ONI = SuitPower_ONI - 1;
              uiSleep SneakTick_ONI;
            };
        [] call Nano_Sneak2;
      } else {
        if (SuitPower_ONI > -5) then {systemChat "Out of energy"; playSound "Alarm";};
        AbiliyActive = 0;
        InvisActive = 0;
        InvisBreakRDY = 0;
        [player,false] remoteExec["hideobject",0];
        player setCaptive false;
        if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
        if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
      };
  }else{
      [player,false] remoteExec["hideobject",0];
      player setCaptive false;
      systemChat "Shot fired. Cloak failure.";
      playSound "Alarm";
      AbiliyActive = 0;
      InvisActive = 0;
      InvisBreakRDY = 0;
      InvisSTOP = 0;
      if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
      if (AndZeroPower_ONI) then {SuitPower_ONI = 0;};
  };
};
    };

  comment "Speed global switch.";
    if (MaximumSpeedSwitch_ONI) then {
  comment "Speed activation function.";
Nano_FAFB2_ACT = {
  if (SuitPower_ONI >= 10) then {
    if ((vehicle player) == player) then{
      if (SpeedActive == 0) then {systemChat "Maximum speed"; playSound "Hint"; [] call Nano_FAFB2;};
    } else {systemChat "Cramped space detected. Action canceled.";};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Speed function.";
Nano_FAFB2 = {
  if (SuitPower_ONI > 0) then {
    if (TextureHandling) then {if (ArmorActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureSpeed];};};
    if (!ActiveRecharge_ONI) then {AbiliyActive = 1;};
    SuitPower_ONI = SuitPower_ONI - 1;
    onEachFrame{player setAnimSpeedCoef GottaGoFastMultiplier};
    SpeedActive = 1;
    uiSleep FastAsFuckTick;
    [] call Nano_FAFB2;
  } else {
    if (SuitPower_ONI > -5) then {systemChat "Out of energy"; playSound "Alarm";};
    onEachFrame{};
    uiSleep 0.02;
    player setAnimSpeedCoef 1;
    SpeedActive = 0;
    AbiliyActive = 0;
    if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
    if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
  };
};
    };

  comment "Jump global switch.";
    if (JumpSwitch_ONI) then {
  comment "Jump function.";
Nano_JUMP = {
  if ((vehicle player) == player) then{
    if (isTouchingGround player) then {
      if (SuitPower_ONI >= JumpEnergyCost_ONI) then {
        player setVelocity [(velocity player select 0),(velocity player select 1), 20];
        SuitPower_ONI = SuitPower_ONI - JumpEnergyCost_ONI;
        if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
        [] spawn {[] call Nano_JUMP_Stuck_Check;};
      } else {
        systemChat "Not enough energy to jump.";
      };
    } else {systemChat "Can't jump in air without violating conservation of momentum.";};
  } else {systemChat "Cramped space detected. Action canceled.";};
};
Nano_JUMP_Stuck_Check = {
  uiSleep 0.1;
  SpeedUpward = (velocity player select 2);
  uiSleep 0.1;
  SpeedUpward2 = (velocity player select 2);
  if ((SpeedUpward - SpeedUpward2)<0.5) then {player setVelocity [0,0,0];};
  if ((velocity player select 2) < 0.1) exitWith {};
  [] call Nano_JUMP_Stuck_Check;
};
    };

  comment "Weapons handling global switch.";
    if (WeaponHandlingSwitch_ONI) then {
  comment "Weapons handling function.";
Nano_AIM = {
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
    if (NanoAIMSW == 0) then{
      if (SuitPower_ONI >= 10) then {
        NanoAIMSW = 1;
         if (WeaponCoreNoSway_ONI) then{
          MEH_NoSway = addMissionEventHandler ["EachFrame", {player setCustomAimCoef WeaponCoreSwayMultiplier_ONI;}];
          };
        if (WeaponCoreNoRecharge_ONI) then {AbiliyActive = 1;};
        if (TraceBullets_ONI) then {[player, TraceNumber_ONI] spawn BIS_fnc_traceBullets;};
        player setUnitRecoilCoefficient RecoilModificator_ONI;
        systemChat "Weapon handling protocols activated.";
        playSound "Hint";
      } else {
        systemChat "At least 10 percent needed.";
      };
    } else {
      NanoAIMSW = 0;
      removeMissionEventHandler ["EachFrame", MEH_NoSway];
      if (WeaponCoreNoRecharge_ONI) then {AbiliyActive = 0;};
          [] spawn {
              if (TraceBullets_ONI) then {sleep 0.4;[player, 0] spawn BIS_fnc_traceBullets;};
          };
      player setCustomAimCoef 1;
      player setUnitRecoilCoefficient 1;
      systemChat "Weapon handling protocols disengaged.";
      playSound "Hint";
    };
};
    };

  comment "Disengage activation function";
Nano_STOP_ACT = {
  if (NanoStopping == 0) then {[] call Nano_STOP;};
};
  comment "Disengage abilities";
Nano_STOP = {
  NanoStopping = 1;
  SuitPowerACC = SuitPower_ONI;
  SuitPower_ONI = -10;   comment "That's a neat trick to disengage armor/sneak/speed functions without [Out of energy] alarm. Functions disengaging if energy at 0 but alarm triggered when energy above -5. In normal 0 energy scenario both force disengagement and alarm being triggered. But with manual disengagement energy is set to -10 for the duration of disengagement and restored after. That way functions disengaged like they out of energy but alarm isn't triggered.";
  AbiliyActive = 0;
  InvisActive = 0;
  InvisBreakRDY = 0;
  ArmorActive = 0;
  SpeedActive = 0;
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
  onEachFrame{};
  if (TraceBullets_ONI) then {[player, 0] spawn BIS_fnc_traceBullets;};
  uiSleep 0.01;
  if ((TraceBullets_ONI) and (NanoAIMSW == 1)) then {[player, TraceNumber_ONI] spawn BIS_fnc_traceBullets;};
  player allowDamage true;
  [player,false] remoteExec["hideobject",0];
  player setCaptive false;
  systemChat "Abilities disengaged.";
  playSound "Hint";
  uiSleep 0.02;
  player setAnimSpeedCoef 1;
  uiSleep DisengageTick;
  SuitPower_ONI = SuitPowerACC;
  uiSleep 0.02;
  NanoStopping = 0;
  if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
};
systemChat "Functions loaded.";

systemChat "Self scan complete. Press [Activate suit] to start.";
};

Nano_Suit_SPARTAN ={

SPARTAN_Suit_Active = true;
DevOptions = false;                          comment "[Boolean]  Development options. Used for script debuging.";
TextureArmor      = "Uniform\NanoArmor.jpg";     comment "[String]   Texture name of Armor mode texture.";
TextureSpeed      = "Uniform\NanoSpeed.jpg";     comment "[String]   Texture name of Speed mode texture.";
TextureArmorSpeed = "Uniform\NanoBoth.jpg";      comment "[String]   Texture name of Armor+Speed mode texture.";
TextureIdle       = "Uniform\NanoBase.jpg";      comment "[String]   Texture name of default texture when no abilities listed above active.";
TextureHandling = false;

AbiliyActive = 0;
ArmorActive = 0;
InvisActive = 0;
SpeedActive = 0;
InvisBreakRDY = 0;
NanoStopping = 0;
Cease = 0;
InvisSTOP = 0;
ActiveScan = 0;
FastAsFuckTick = FastAsFuckTickEff_SPARTAN;
GottaGoFastMultiplier = GottaGoFastMultiplierEff_SPARTAN;
GenStopTick = RechargeTick_SPARTAN + 0.2;
DisengageTick = selectMax [ArmorTick_SPARTAN,SneakTick_SPARTAN,FastAsFuckTick] +0.1;
if (NanoAirburst_SPARTAN) then {ConstantRangefinder_SPARTAN = true;};
AbiliyActive = 0;
ArmorActive = 0;
InvisActive = 0;
SpeedActive = 0;
InvisBreakRDY = 0;
NanoStopping = 0;
Cease = 0;
InvisSTOP = 0;
ActiveScan = 0;
FastAsFuckTick = FastAsFuckTickEff_SPARTAN;
GottaGoFastMultiplier = GottaGoFastMultiplierEff_SPARTAN;
GenStopTick = RechargeTick_SPARTAN + 0.2;
DisengageTick = selectMax [ArmorTick_SPARTAN,SneakTick_SPARTAN,FastAsFuckTick] +0.1;
if (NanoAirburst_SPARTAN) then {ConstantRangefinder_SPARTAN = true;};
if(isNil "ABswitch") then {ABswitch = 0; DisLocked = 100;};

  comment "Removing eventHandlers in case of multiple script activations.";
player removeEventHandler ["FiredMan", EH_ShotsFired];
player removeEventHandler ["FiredNear", EH_ProximitySensor];
player removeEventHandler ["HandleDamage", EH_NoFallDamage];
removeMissionEventHandler ["EachFrame", MEH_CompatACE];
removeMissionEventHandler ["EachFrame", MEH_HUD];
removeMissionEventHandler ["EachFrame", MEH_NoSway];

  comment "Removing sceduled hotkey code in case of multiple script activations.";
terminate ArmorKey;
terminate SneakKey;
terminate SpeedKey;
terminate JumpKey;
terminate WeaponKey;
terminate NanABKey;
terminate DisengageKey;

  comment "No fall damage. It's integral part of jump function and speed mode. Small bump on high speed will kill player because game don't distinguish between vertical and horizontal speed for fall damage calculation.";
if (!NoFallDamageACEmedicalCompat_SPARTAN) then{
NoFallDamage = {_damage = 0; if((_this select 4) != "") then { _damage = _this select 2;}; _damage };
EH_NoFallDamage = player addEventHandler ["HandleDamage", { _this call NoFallDamage }];
};
  comment "ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat_SPARTAN) then{
  NoFallDamageACE = {
    if (isTouchingGround player) then {
      if (ArmorActive == 0) then {player allowDamage true;};
    } else {
    player allowDamage false;
    };
  };
};
  comment "Adding eventHandler for ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat_SPARTAN) then{
  MEH_CompatACE = addMissionEventHandler ["EachFrame", {
  [] call NoFallDamageACE;
  }];
};

  comment "Adding eventHandler for invisibility break and recoil compensator energy consumption.";
        EH_ShotsFired = player addEventHandler ["FiredMan", {
RecoilConmpensationWeaponType = _this select 1;
RecoilConmpensationMuzzleType = _this select 2;
RecoilConmpensationFiremodeType = _this select 3;
if ((_this select 5) == "LAGO_KU5K_MAG_buck") then {player setAmmo [currentWeapon player, 0]; systemChat "Please don't use this ammo. It causing performance drop.";};
  comment "Break invis on shot backend.Includes energy consumption if setting is enabled. It's a big list because of how eventhandlers [fired] and [firedNear] works. Making generalized suppressor check won't work because script only scanning attachments on main weapon. (Yes it is possible to scan attachments on pistol too.) Generalized script won't care which slot weapon belongs to simply because eventhandler only provides weapon name, not slot in which weapon located. If you have suppressed 9mm SMG and fire RPG generalized script will only count fact of shot and RPG shot will be equal to 9mm bullet. Only way to get around this that i see now is list of weapons that can be used to convert weapon name to slot. So essentially same thing i did but with extra steps.";
if (ShotBreakInvis_SPARTAN) then {
  if (InvisBreakRDY == 1) then {
    if (!ExcludeSuppressed_SPARTAN) then {InvisSTOP = 1;} else {
      switch (RecoilConmpensationWeaponType) do
      {
        case "KA_dagger":                 {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "KA_knife":                  {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "KA_machete":                {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "KA_axe":                    {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "Hatchet":                   {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "KA_crossbow_black":         {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "KA_crossbow_wood":          {if (SuitPower_SPARTAN >= 1)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 1;}  else {InvisSTOP = 1;};};
        case "rhs_weap_m3a1_specops":     {if (SuitPower_SPARTAN >= 5)  then{SuitPower_SPARTAN = SuitPower_SPARTAN - 5;}  else {InvisSTOP = 1;};};
        case "rhs_weap_pb_6p9":           {if (SuitPower_SPARTAN >= 10) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 10;} else {InvisSTOP = 1;};};
        case "KA_MP5SD3":                 {if (SuitPower_SPARTAN >= 10) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 10;} else {InvisSTOP = 1;};};
        case "hlc_smg_mp5sd5":            {if (SuitPower_SPARTAN >= 10) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 10;} else {InvisSTOP = 1;};};
        case "hlc_smg_mp5sd6":            {if (SuitPower_SPARTAN >= 10) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 10;} else {InvisSTOP = 1;};};
        case "hlc_rifle_honeybadger":     {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval":            {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_grip":       {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_npz":        {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_grip_npz":   {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss":              {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_grip":         {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_npz":          {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_grip_npz":     {if (SuitPower_SPARTAN >= 20) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 20;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert":        {if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert_FDE":    {if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert_BL":     {if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};};
        case "KA_VSSK":                   {if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};};
        case "srifle_DMR_04_F":           {if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};};
        case "srifle_DMR_04_Tan_F":       {if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};};
        case "rhs_weap_m32":              {if (SuitPower_SPARTAN >= 50) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 50;} else {InvisSTOP = 1;};};
        case "ATA_XM25_F":                {if (SuitPower_SPARTAN >= 50) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 50;} else {InvisSTOP = 1;};};
        case "ATA_XM29_F":                {
                                              if (RecoilConmpensationMuzzleType == "ATA_XM29_F") then{
                                                  if (SuitPower_SPARTAN >= 50) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 50;} else {InvisSTOP = 1;};
                                              } else {
                                                  if ("XM29_KE_Suppressor" in (player weaponAccessories primaryWeapon player)) then{
                                                      if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30;} else {InvisSTOP = 1;};
                                                  } else {
                                                      InvisSTOP = 1;
                                                  };
                                              };
                                          };
        case "weap_RPK":                  {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_CQC":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_FDE_CQC":    {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_LB":         {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_FDE_LB":     {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_STD":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "rhs_weap_SCARL_FDE_STD":    {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_Hand":      {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_AFG":       {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_EGLM":      {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Black_Grip":      {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_Hand":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_AFG":         {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_EGLM":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        case "KA_SCAR_H_Tan_Grip":        {[player weaponAccessories primaryWeapon player] call SuppressorCheck;};
        default {InvisSTOP = 1;};
      };
    };
  };
};

  comment "Recoil compensation energy consumption backend.";
if (NanoAIMSW == 1) then {
  switch (RecoilConmpensationWeaponType) do
  {
    case "LAGO_KU3K":                 {    comment "These weapons (KU3 and KU5) have different accuracy in different firemodes so energy consumtion balanced accordingly.";
      switch (RecoilConmpensationFiremodeType) do {
        case "Single":     {if (SuitPower_SPARTAN >= 5) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 5;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "Burst":      {if (SuitPower_SPARTAN >= 3) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 3;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "FullAuto":   {if (SuitPower_SPARTAN >= 2) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 2;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
      };
    };
    case "LAGO_KU5K":                 {
      switch (RecoilConmpensationFiremodeType) do {
        case "FullAuto1":   {if (SuitPower_SPARTAN >= 3) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 3;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "FullAuto2":   {if (SuitPower_SPARTAN >= 2) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 2;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
      };
    };
    case "LAGO_KU98K_NSK":            {if (SuitPower_SPARTAN >= 10) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 10;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "LAGO_CP":                   {};
    case "weap_RPK":                  {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_CQC":        {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_CQC":    {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_LB":         {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_LB":     {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_STD":        {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_STD":    {if (SuitPower_SPARTAN >= 4) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 4;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_Hand":      {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_AFG":       {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_EGLM":      {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_Grip":      {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_Hand":        {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_AFG":         {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_EGLM":        {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_Grip":        {if (SuitPower_SPARTAN >= 6) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 6;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
    default                           {if (SuitPower_SPARTAN >= RecoilConmpensationEnergyPerShot_SPARTAN) then{SuitPower_SPARTAN = SuitPower_SPARTAN - RecoilConmpensationEnergyPerShot_SPARTAN;} else {SuitPower_SPARTAN = 0; playSound "Alarm"; [] call Nano_AIM;};};
  };
};

  comment "Airburst part.";
if (NanoAirburst_SPARTAN) then {
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
};

  comment "Guidance for LAGO Multiple rocket launcher.";
if (NanoGuidance_SPARTAN) then {
_AmmoType = _this select 4;
if (_AmmoType != "LAGO_CP_BOOM") exitWith {};

_WeaponType = _this select 1;
if (_WeaponType == "Throw") exitWith {Hint "Grenades excluded for technical reasons."};

_target = cursorTarget;

if (isNull _target) exitWith {Hint "No target. Make sure to press spot button (T) on target and keep target in center of the screen."};
_Projectile = _this select 6;
_MCSOrdStartPos = [(getPosASL _Projectile)select 0,(getPosASL _Projectile)select 1,((getPosASL _Projectile)select 2)+0.1];
_MCSAmmoSpeed = velocityModelSpace _Projectile select 1;

_MCSOffset = if (_target isKindOf "MAN") then {_target selectionPosition "pelvis";} else {getCenterOfMass _target;};

[_MCSOrdStartPos, _Projectile, _target, _MCSAmmoSpeed, false, _MCSOffset, 10, "", false] remoteExec ["BIS_fnc_EXP_camp_guidedProjectile", 2];
};

        }];

  comment "Suppressor check function.";
SuppressorCheck = {
  params ["_AttachmentsArray"];
  _AttachmentsArray = _this select 0;
    if (
    ("muzzle_snds_B"                     in _AttachmentsArray) or
    ("muzzle_snds_B_arid_F"              in _AttachmentsArray) or
    ("muzzle_snds_B_khk_F"               in _AttachmentsArray) or
    ("muzzle_snds_B_lush_F"              in _AttachmentsArray) or
    ("muzzle_snds_B_snd_F"               in _AttachmentsArray) or
    ("rhsusf_acc_aac_762sd_silencer"     in _AttachmentsArray) or
    ("rhsusf_acc_aac_762sdn6_silencer"   in _AttachmentsArray) or
    ("rhsusf_acc_aac_scarh_silencer"     in _AttachmentsArray) or
    ("rhsgref_sdn6_suppressor"           in _AttachmentsArray) or
    ("hlc_muzzle_300blk_KAC"             in _AttachmentsArray) or
    ("SCAR_13_Inches_Barrel_Silencer"    in _AttachmentsArray) or
    ("SCAR_16_Inches_Barrel_Silencer"    in _AttachmentsArray) or
    ("SCAR_20_Inches_Barrel_Silencer"    in _AttachmentsArray)
    ) then { if (SuitPower_SPARTAN >= 30) then{SuitPower_SPARTAN = SuitPower_SPARTAN - 30; } else {InvisSTOP = 1;};} else {InvisSTOP = 1;};
};

  comment "Adding eventHandler for proximity sensor if needed.";
if (ProximitySensor_SPARTAN) then {
  EH_ProximitySensor = player addEventHandler ["FiredNear", {
    if (!(_this select 1 in allPlayers)) then {
    UnluckyBastard = _this select 1;
    ShotLocation = [(getPosATL UnluckyBastard select 0), (getPosATL UnluckyBastard select 1), (getPosATL UnluckyBastard select 2) + 1];
      onEachFrame {
      drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [1,0,0,0.5], ShotLocation, 1, 1, 0,"Shot detected!", 2, 0.05, 'RobotoCondensed', 'center', true];
      };
    };
  }];
};

  comment "Adding eventHandler responsible for HUD in form of hint and rangefinding. As of now i can't make actuall HUD that not depends on mission files and this script is universal.";
MEH_HUD = addMissionEventHandler ["EachFrame", {

  if (SuitPower_SPARTAN >= 0 ) then {ChargeGraph = "[..................................................]"};
  if (SuitPower_SPARTAN >= 2 ) then {ChargeGraph = "[|.................................................]"};
  if (SuitPower_SPARTAN >= 4 ) then {ChargeGraph = "[||................................................]"};
  if (SuitPower_SPARTAN >= 6 ) then {ChargeGraph = "[|||...............................................]"};
  if (SuitPower_SPARTAN >= 8 ) then {ChargeGraph = "[||||..............................................]"};
  if (SuitPower_SPARTAN >= 10) then {ChargeGraph = "[|||||.............................................]"};
  if (SuitPower_SPARTAN >= 12) then {ChargeGraph = "[||||||............................................]"};
  if (SuitPower_SPARTAN >= 14) then {ChargeGraph = "[|||||||...........................................]"};
  if (SuitPower_SPARTAN >= 16) then {ChargeGraph = "[||||||||..........................................]"};
  if (SuitPower_SPARTAN >= 18) then {ChargeGraph = "[|||||||||.........................................]"};
  if (SuitPower_SPARTAN >= 20) then {ChargeGraph = "[||||||||||........................................]"};
  if (SuitPower_SPARTAN >= 22) then {ChargeGraph = "[|||||||||||.......................................]"};
  if (SuitPower_SPARTAN >= 24) then {ChargeGraph = "[||||||||||||......................................]"};
  if (SuitPower_SPARTAN >= 26) then {ChargeGraph = "[|||||||||||||.....................................]"};
  if (SuitPower_SPARTAN >= 28) then {ChargeGraph = "[||||||||||||||....................................]"};
  if (SuitPower_SPARTAN >= 30) then {ChargeGraph = "[|||||||||||||||...................................]"};
  if (SuitPower_SPARTAN >= 32) then {ChargeGraph = "[||||||||||||||||..................................]"};
  if (SuitPower_SPARTAN >= 34) then {ChargeGraph = "[|||||||||||||||||.................................]"};
  if (SuitPower_SPARTAN >= 36) then {ChargeGraph = "[||||||||||||||||||................................]"};
  if (SuitPower_SPARTAN >= 38) then {ChargeGraph = "[|||||||||||||||||||...............................]"};
  if (SuitPower_SPARTAN >= 40) then {ChargeGraph = "[||||||||||||||||||||..............................]"};
  if (SuitPower_SPARTAN >= 42) then {ChargeGraph = "[|||||||||||||||||||||.............................]"};
  if (SuitPower_SPARTAN >= 44) then {ChargeGraph = "[||||||||||||||||||||||............................]"};
  if (SuitPower_SPARTAN >= 46) then {ChargeGraph = "[|||||||||||||||||||||||...........................]"};
  if (SuitPower_SPARTAN >= 48) then {ChargeGraph = "[||||||||||||||||||||||||..........................]"};
  if (SuitPower_SPARTAN >= 50) then {ChargeGraph = "[|||||||||||||||||||||||||.........................]"};
  if (SuitPower_SPARTAN >= 52) then {ChargeGraph = "[||||||||||||||||||||||||||........................]"};
  if (SuitPower_SPARTAN >= 54) then {ChargeGraph = "[|||||||||||||||||||||||||||.......................]"};
  if (SuitPower_SPARTAN >= 56) then {ChargeGraph = "[||||||||||||||||||||||||||||......................]"};
  if (SuitPower_SPARTAN >= 58) then {ChargeGraph = "[|||||||||||||||||||||||||||||.....................]"};
  if (SuitPower_SPARTAN >= 60) then {ChargeGraph = "[||||||||||||||||||||||||||||||....................]"};
  if (SuitPower_SPARTAN >= 62) then {ChargeGraph = "[|||||||||||||||||||||||||||||||...................]"};
  if (SuitPower_SPARTAN >= 64) then {ChargeGraph = "[||||||||||||||||||||||||||||||||..................]"};
  if (SuitPower_SPARTAN >= 66) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||.................]"};
  if (SuitPower_SPARTAN >= 68) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||................]"};
  if (SuitPower_SPARTAN >= 70) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||...............]"};
  if (SuitPower_SPARTAN >= 72) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||..............]"};
  if (SuitPower_SPARTAN >= 74) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||.............]"};
  if (SuitPower_SPARTAN >= 76) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||............]"};
  if (SuitPower_SPARTAN >= 78) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||...........]"};
  if (SuitPower_SPARTAN >= 80) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||..........]"};
  if (SuitPower_SPARTAN >= 82) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||.........]"};
  if (SuitPower_SPARTAN >= 84) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||........]"};
  if (SuitPower_SPARTAN >= 86) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||.......]"};
  if (SuitPower_SPARTAN >= 88) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||......]"};
  if (SuitPower_SPARTAN >= 90) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||.....]"};
  if (SuitPower_SPARTAN >= 92) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||||....]"};
  if (SuitPower_SPARTAN >= 94) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||||...]"};
  if (SuitPower_SPARTAN >= 96) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||||||..]"};
  if (SuitPower_SPARTAN >= 98) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||||||.]"};
  if (SuitPower_SPARTAN >= 100) then {ChargeGraph= "[||||||||||||||||||||||||||||||||||||||||||||||||||]"};

      comment "Rangefinder.";
    if (ConstantRangefinder_SPARTAN) then {
      _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
      _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
      DisMes = if (count _ins > 0) then [{str(round _cursor_distance)},{"---"}];
        if (NanoAirburst_SPARTAN) then {
          DisNum = if (count _ins > 0) then [{(round _cursor_distance)+3},{9999}];
          DisLockedUI = if (ABswitch == 0) then {DisLocked} else {"OFF"};
        };
    };
      comment "Get player health (vanilla).";
    if (NanoHeal_SPARTAN) then {Health = 100-((damage player)*100);};

      comment "Not letting players see negative power values when manual stop used.";
    if (SuitPower_SPARTAN < -0.01) then {UISuitPower = "Reboot"} else {UISuitPower = (selectMin [100,SuitPower_SPARTAN]) toFixed 1;};

  comment "Information output.";
  if ((!NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4", UISuitPower, "%", lineBreak,ChargeGraph];};
  if ((!NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes];};
  if ((!NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3User health: %5 %2", UISuitPower, "%", lineBreak, ChargeGraph, Health];};
  if ((!NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3User health: %6 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, Health];};
  if ((NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes,DisLockedUI];};
  if ((NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m%3User health: %7 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, DisLockedUI, Health];};

  comment "Rebreather module.";
  if (NanoRebreather_SPARTAN) then {player setOxygenRemaining 1;};

}];
systemChat "EventHandlers loaded.";

  comment "Adding functions for hotkeys handling.";
if (HotkeysEnabeled_SPARTAN) then{

if (MaximumArmorSwitch_SPARTAN) then {
  ArmorKeyRespawn = {
      ArmorKey = [] spawn {
          waitUntil {inputAction "User9" > 0};
          [] spawn {[] call Nano_Armor2_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call ArmorKeyRespawn;
      };
  };
[] call ArmorKeyRespawn;
};

if (CloakSwitch_SPARTAN) then {
  SneakKeyRespawn = {
      SneakKey = [] spawn {
          waitUntil {inputAction "User10" > 0};
          [] spawn {[] call Nano_Sneak2_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call SneakKeyRespawn;
      };
  };
[] call SneakKeyRespawn;
};

if (MaximumSpeedSwitch_SPARTAN) then {
  SpeedKeyRespawn = {
      SpeedKey = [] spawn {
          waitUntil {inputAction "User11" > 0};
          [] spawn {[] call Nano_FAFB2_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call SpeedKeyRespawn;
      };
  };
[] call SpeedKeyRespawn;
};

if (JumpSwitch_SPARTAN) then {
  JumpKeyRespawn = {
      JumpKey = [] spawn {
          waitUntil {inputAction "User12" > 0};
          [] spawn {[] call Nano_JUMP;};
          Sleep (DisengageTick + 0.1);
          [] call JumpKeyRespawn;
      };
  };
[] call JumpKeyRespawn;
};

if (WeaponHandlingSwitch_SPARTAN) then {
  WeapnHandlingKeyRespawn = {
      WeaponKey = [] spawn {
          waitUntil {inputAction "User13" > 0};
          [] spawn {[] call Nano_AIM;};
          Sleep (DisengageTick + 0.1);
          [] call WeapnHandlingKeyRespawn;
      };
  };
[] call WeapnHandlingKeyRespawn;
};

if (NanoAirburst_SPARTAN) then {
  ABLockKeyRespawn = {
      NanABKey = [] spawn {
          waitUntil {inputAction "gunElevAuto" > 0};
          DisLocked = DisNum;
          Sleep 0.2;
          [] call ABLockKeyRespawn;
      };
  };
[] call ABLockKeyRespawn;
};

  DisengageKeyRespawn = {
      DisengageKey = [] spawn {
          waitUntil {inputAction "User14" > 0};
          [] spawn {[] call Nano_STOP_ACT;};
          Sleep (DisengageTick + 0.1);
          [] call DisengageKeyRespawn;
      };
  };
[] call DisengageKeyRespawn;

systemChat "Hotkeys loaded.";
};

  comment "Scrollmenu functions.";

if (!DisableScrollMenu_SPARTAN) then {removeallactions player;};

NanoActivateActionID = player addAction ["<t>Activate Suit</t>", {
  if (!DisableScrollMenu_SPARTAN) then {
    [] call Nano_menu2eff;
    player removeAction NanoActivateActionID;
    [] call GeneratorStop;
    [] call SuitGenerator;
  } else {
    player removeAction NanoActivateActionID;
    systemChat "Scrollmenu disabled. Please use hotkeys.";
      if (!HotkeysEnabeled_SPARTAN) then {
        systemChat "ERR. Hotkeys disabled too. Please contact missionmaker and tell that he did big OOF. Suit is unusable.";
      };
    [] call GeneratorStop;
    [] call SuitGenerator;
  };
}];

Nano_menu2eff = {
removeallactions player;
 if (MaximumArmorSwitch_SPARTAN)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch_SPARTAN)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch_SPARTAN)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch_SPARTAN)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch_SPARTAN)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (TwoSpeedModeSwitch_SPARTAN)    then {player addAction ["<t>Speed mode switch [ >Eff | MAX ]</t>", {FastAsFuckTick = FastAsFuckTickMAX_SPARTAN; GottaGoFastMultiplier = GottaGoFastMultiplierMAX_SPARTAN; DisengageTick = selectMax [ArmorTick_SPARTAN,SneakTick_SPARTAN,FastAsFuckTick] +0.1; [] call Nano_menu2max;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (NanoAirburst_SPARTAN)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2effHidden;}];
 if (JumpSwitch_SPARTAN)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Restart suit generator</t>", {[] call GeneratorRestart;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if ((DevOptions) and (TextureHandling)) then {player addAction ["<t>[DEV] Check textures.</t>", {player setObjectTextureGlobal [0,TextureArmor]; sleep 0.5; player setObjectTextureGlobal [0,TextureSpeed]; sleep 0.5; player setObjectTextureGlobal [0,TextureArmorSpeed]; sleep 0.5;player setObjectTextureGlobal [0,TextureIdle];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Start generator (no checks)</t>", {[] call SuitGenerator;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Stop generator</t>", {[] call GeneratorStop;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
};
Nano_menu2effHidden = {
removeallactions player;
player addAction ["<t color='#BBBBBB'>>>Nano menu</t>", {[] call Nano_menu2eff;}];
};

Nano_menu2max = {
removeallactions player;
 if (MaximumArmorSwitch_SPARTAN)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch_SPARTAN)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch_SPARTAN)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch_SPARTAN)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch_SPARTAN)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>Speed mode switch [ Eff | >MAX ]</t>", {FastAsFuckTick = FastAsFuckTickEff_SPARTAN; GottaGoFastMultiplier = GottaGoFastMultiplierEff_SPARTAN; DisengageTick = selectMax [ArmorTick_SPARTAN,SneakTick_SPARTAN,FastAsFuckTick] +0.1; [] call Nano_menu2eff;}];
 if (NanoAirburst_SPARTAN)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2maxHidden;}];
 if (JumpSwitch_SPARTAN)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Restart suit generator</t>", {[] call GeneratorRestart;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if ((DevOptions) and (TextureHandling)) then {player addAction ["<t>[DEV] Check textures.</t>", {player setObjectTextureGlobal [0,TextureArmor]; sleep 0.5; player setObjectTextureGlobal [0,TextureSpeed]; sleep 0.5; player setObjectTextureGlobal [0,TextureArmorSpeed]; sleep 0.5;player setObjectTextureGlobal [0,TextureIdle];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Start generator (no checks)</t>", {[] call SuitGenerator;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions)                              then {player addAction ["<t>[DEV] Stop generator</t>", {[] call GeneratorStop;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
};
Nano_menu2maxHidden = {
removeallactions player;
player addAction ["<t color='#BBBBBB'>>>Nano menu</t>", {[] call Nano_menu2max;}];
};
systemChat "Menu loaded.";


  comment "Power generation structure. Yea it's that simple. And yes, i know that ExitWith exist. No kinkshaming pls.";
SuitGenerator = {
    if (SuitPower_SPARTAN < 100) then {
        if (AbiliyActive == 0) then {
          SuitPower_SPARTAN = round (SuitPower_SPARTAN + 1);
          PlayerSpeedPower = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
          if ((StaticRecharge_SPARTAN)and(PlayerSpeedPower == 0) and(SuitPower_SPARTAN < 100)) then {SuitPower_SPARTAN = round (SuitPower_SPARTAN + 1);};
          uiSleep RechargeTick_SPARTAN;
        };
if (Cease == 0) then {[] call SuitGenerator;};
    } else {
      uiSleep 1;
      if (NanoHeal_SPARTAN) then {player setDamage ((getDammage player) - NanoHealRate_SPARTAN);};
      if (Cease == 0) then {[] call SuitGenerator;};
    };
};
  comment "Generator debugging functions.";
GeneratorStop = {
  Cease = 1;
  uiSleep GenStopTick;
  Cease = 0;
};
GeneratorScan = {
  if ((SuitPower_SPARTAN < 50) and (SuitPower_SPARTAN >= -1)) then {
    SuitPowerACCBRK = SuitPower_SPARTAN;
    ActiveScan = 1;
      for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do {
        SuitPowerACCBRK = round (SuitPowerACCBRK + 1);
        if ((StaticRecharge_SPARTAN)and(PlayerSpeedPower == 0) and(SuitPowerACCBRK < 100)) then {SuitPowerACCBRK = round (SuitPowerACCBRK + 1);};
        uiSleep RechargeTick_SPARTAN;
      };
    ActiveScan = 0;
    if ((SuitPower_SPARTAN - SuitPowerACCBRK)>8) then {
      [] call GeneratorStop;
      systemChat "Abnormal power flux detected. Preparing to restart generator.";
      [] spawn {[] call GeneratorRestart;};
    };
  };
};
GeneratorRestart = {
  if (SuitPower_SPARTAN != 100) then{
  SuitPowerACCDEB = SuitPower_SPARTAN;
  uiSleep (RechargeTick_SPARTAN * 3);
    if (SuitPower_SPARTAN == SuitPowerACCDEB) then {
    systemChat "Error confirmed. Restarting generator now.";
    AbiliyActive = 0;[] call SuitGenerator;
    } else {
    systemChat "Suit seems to be functioning normally. Try to reload script if problem exist. If you tried to launch several generators for faster recharge, then fuck you.";
    };
  } else {
    systemChat "Suit fully charged. Therefore debug not needed now.";
  };
};

  comment "Armor global switch.";
    if (MaximumArmorSwitch_SPARTAN) then {
  comment "Armor activation function.";
Nano_Armor2_ACT = {
  if (SuitPower_SPARTAN >= 10) then {
    if (ArmorActive == 0) then {systemChat "Maximum armor"; playSound "Hint"; [] call Nano_Armor2;};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Armor function.";
Nano_Armor2 = {
  if (SuitPower_SPARTAN > 0) then {
    if (TextureHandling) then {if (SpeedActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureArmor];};};
    if (!ActiveRecharge_SPARTAN) then {AbiliyActive = 1;};
    ArmorActive = 1;
    SuitPower_SPARTAN = SuitPower_SPARTAN - 1;
    player allowDamage false;
    uiSleep ArmorTick_SPARTAN;
    [] call Nano_Armor2;
  } else {
    if (SuitPower_SPARTAN > -5) then {systemChat "Out of energy"; playSound "Alarm";};
    ArmorActive = 0;
    AbiliyActive = 0;
    player allowDamage true;
    if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
    if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
  };
};
    };

  comment "Cloak global switch.";
    if (CloakSwitch_SPARTAN) then {
  comment "Cloak activation function.";
Nano_Sneak2_ACT = {
  if (SuitPower_SPARTAN >= 10) then {
    if (InvisActive == 0) then {systemChat "Cloak Engaged"; playSound "Hint"; if ((vehicle player) != player) then{systemchat "Vehicles cannot be hidden and will cause suspition.";}; [] call Nano_Sneak2;};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Cloak function.";
Nano_Sneak2 = {
  if (InvisSTOP == 0) then{
      if (SuitPower_SPARTAN > 0) then {
          if (!ActiveRecharge_SPARTAN) then {AbiliyActive = 1;};
          if (ShotBreakInvis_SPARTAN) then {InvisBreakRDY = 1;};
          InvisActive = 1;
          [player] remoteExec["hideobject",0,true];
          if ((vehicle player) == player) then{player setCaptive true;};
            if (AdvancedInvisibility_SPARTAN) then {
              PlayerSpeed = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
              EnergyConsumption = (exp (PlayerSpeed*0.005)-0.95)+((PlayerSpeed^3)/10000);
              SuitPower_SPARTAN = SuitPower_SPARTAN - (selectMin [EnergyConsumption,5]);
              uiSleep 0.1;
            } else {
              SuitPower_SPARTAN = SuitPower_SPARTAN - 1;
              uiSleep SneakTick_SPARTAN;
            };
        [] call Nano_Sneak2;
      } else {
        if (SuitPower_SPARTAN > -5) then {systemChat "Out of energy"; playSound "Alarm";};
        AbiliyActive = 0;
        InvisActive = 0;
        InvisBreakRDY = 0;
        [player,false] remoteExec["hideobject",0];
        player setCaptive false;
        if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
        if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
      };
  }else{
      [player,false] remoteExec["hideobject",0];
      player setCaptive false;
      systemChat "Shot fired. Cloak failure.";
      playSound "Alarm";
      AbiliyActive = 0;
      InvisActive = 0;
      InvisBreakRDY = 0;
      InvisSTOP = 0;
      if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
      if (AndZeroPower_SPARTAN) then {SuitPower_SPARTAN = 0;};
  };
};
    };

  comment "Speed global switch.";
    if (MaximumSpeedSwitch_SPARTAN) then {
  comment "Speed activation function.";
Nano_FAFB2_ACT = {
  if (SuitPower_SPARTAN >= 10) then {
    if ((vehicle player) == player) then{
      if (SpeedActive == 0) then {systemChat "Maximum speed"; playSound "Hint"; [] call Nano_FAFB2;};
    } else {systemChat "Cramped space detected. Action canceled.";};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Speed function.";
Nano_FAFB2 = {
  if (SuitPower_SPARTAN > 0) then {
    if (TextureHandling) then {if (ArmorActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureSpeed];};};
    if (!ActiveRecharge_SPARTAN) then {AbiliyActive = 1;};
    SuitPower_SPARTAN = SuitPower_SPARTAN - 1;
    onEachFrame{player setAnimSpeedCoef GottaGoFastMultiplier};
    SpeedActive = 1;
    uiSleep FastAsFuckTick;
    [] call Nano_FAFB2;
  } else {
    if (SuitPower_SPARTAN > -5) then {systemChat "Out of energy"; playSound "Alarm";};
    onEachFrame{};
    uiSleep 0.02;
    player setAnimSpeedCoef 1;
    SpeedActive = 0;
    AbiliyActive = 0;
    if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
    if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
  };
};
    };

  comment "Jump global switch.";
    if (JumpSwitch_SPARTAN) then {
  comment "Jump function.";
Nano_JUMP = {
  if ((vehicle player) == player) then{
    if (isTouchingGround player) then {
      if (SuitPower_SPARTAN >= JumpEnergyCost_SPARTAN) then {
        player setVelocity [(velocity player select 0),(velocity player select 1), 20];
        SuitPower_SPARTAN = SuitPower_SPARTAN - JumpEnergyCost_SPARTAN;
        if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
        [] spawn {[] call Nano_JUMP_Stuck_Check;};
      } else {
        systemChat "Not enough energy to jump.";
      };
    } else {systemChat "Can't jump in air without violating conservation of momentum.";};
  } else {systemChat "Cramped space detected. Action canceled.";};
};
Nano_JUMP_Stuck_Check = {
  uiSleep 0.1;
  SpeedUpward = (velocity player select 2);
  uiSleep 0.1;
  SpeedUpward2 = (velocity player select 2);
  if ((SpeedUpward - SpeedUpward2)<0.5) then {player setVelocity [0,0,0];};
  if ((velocity player select 2) < 0.1) exitWith {};
  [] call Nano_JUMP_Stuck_Check;
};
    };

  comment "Weapons handling global switch.";
    if (WeaponHandlingSwitch_SPARTAN) then {
  comment "Weapons handling function.";
Nano_AIM = {
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
    if (NanoAIMSW == 0) then{
      if (SuitPower_SPARTAN >= 10) then {
        NanoAIMSW = 1;
         if (WeaponCoreNoSway_SPARTAN) then{
          MEH_NoSway = addMissionEventHandler ["EachFrame", {player setCustomAimCoef WeaponCoreSwayMultiplier_SPARTAN;}];
          };
        if (WeaponCoreNoRecharge_SPARTAN) then {AbiliyActive = 1;};
        if (TraceBullets_SPARTAN) then {[player, TraceNumber_SPARTAN] spawn BIS_fnc_traceBullets;};
        player setUnitRecoilCoefficient RecoilModificator_SPARTAN;
        systemChat "Weapon handling protocols activated.";
        playSound "Hint";
      } else {
        systemChat "At least 10 percent needed.";
      };
    } else {
      NanoAIMSW = 0;
      removeMissionEventHandler ["EachFrame", MEH_NoSway];
      if (WeaponCoreNoRecharge_SPARTAN) then {AbiliyActive = 0;};
          [] spawn {
              if (TraceBullets_SPARTAN) then {sleep 0.4;[player, 0] spawn BIS_fnc_traceBullets;};
          };
      player setCustomAimCoef 1;
      player setUnitRecoilCoefficient 1;
      systemChat "Weapon handling protocols disengaged.";
      playSound "Hint";
    };
};
    };

  comment "Disengage activation function";
Nano_STOP_ACT = {
  if (NanoStopping == 0) then {[] call Nano_STOP;};
};
  comment "Disengage abilities";
Nano_STOP = {
  NanoStopping = 1;
  SuitPowerACC = SuitPower_SPARTAN;
  SuitPower_SPARTAN = -10;   comment "That's a neat trick to disengage armor/sneak/speed functions without [Out of energy] alarm. Functions disengaging if energy at 0 but alarm triggered when energy above -5. In normal 0 energy scenario both force disengagement and alarm being triggered. But with manual disengagement energy is set to -10 for the duration of disengagement and restored after. That way functions disengaged like they out of energy but alarm isn't triggered.";
  AbiliyActive = 0;
  InvisActive = 0;
  InvisBreakRDY = 0;
  ArmorActive = 0;
  SpeedActive = 0;
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
  onEachFrame{};
  if (TraceBullets_SPARTAN) then {[player, 0] spawn BIS_fnc_traceBullets;};
  uiSleep 0.01;
  if ((TraceBullets_SPARTAN) and (NanoAIMSW == 1)) then {[player, TraceNumber_SPARTAN] spawn BIS_fnc_traceBullets;};
  player allowDamage true;
  [player,false] remoteExec["hideobject",0];
  player setCaptive false;
  systemChat "Abilities disengaged.";
  playSound "Hint";
  uiSleep 0.02;
  player setAnimSpeedCoef 1;
  uiSleep DisengageTick;
  SuitPower_SPARTAN = SuitPowerACC;
  uiSleep 0.02;
  NanoStopping = 0;
  if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
};
systemChat "Functions loaded.";

systemChat "Self scan complete. Press [Activate suit] to start.";
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