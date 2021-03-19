waitUntil { not isNull player };

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

_AirCrate allowDamage false;

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
player removeEventHandler ["FiredMan", EH_ShotsFired];
player removeEventHandler ["FiredMan", EH_ShotsFiredAirburst];
player removeEventHandler ["FiredNear", EH_ProximitySensor];
player removeEventHandler ["HandleDamage", EH_NoFallDamage];
removeMissionEventHandler ["EachFrame", MEH_CompatACE];
removeMissionEventHandler ["EachFrame", MEH_HUD];
removeMissionEventHandler ["EachFrame", MEH_NoSway];

comment "Remove sceduled code.";
terminate ArmorKey;
terminate SneakKey;
terminate SpeedKey;
terminate JumpKey;
terminate WeaponKey;
terminate NanABKey;
terminate DisengageKey;

comment "Remove scrollmenu.";
if (!DisableScrollMenu) then {removeallactions player;};

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





//function definition for NaniteSuit, gets called in Uniform config.cpp
Nano_Suit ={

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
FastAsFuckTick = FastAsFuckTickEff;
GottaGoFastMultiplier = GottaGoFastMultiplierEff;
GenStopTick = RechargeTick + 0.2;
DisengageTick = selectMax [ArmorTick,SneakTick,FastAsFuckTick] +0.1;
if (NanoAirburst) then {ConstantRangefinder = true;};
AbiliyActive = 0;
ArmorActive = 0;
InvisActive = 0;
SpeedActive = 0;
InvisBreakRDY = 0;
NanoStopping = 0;
Cease = 0;
InvisSTOP = 0;
ActiveScan = 0;
FastAsFuckTick = FastAsFuckTickEff;
GottaGoFastMultiplier = GottaGoFastMultiplierEff;
GenStopTick = RechargeTick + 0.2;
DisengageTick = selectMax [ArmorTick,SneakTick,FastAsFuckTick] +0.1;
if (NanoAirburst) then {ConstantRangefinder = true;};
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
if (!NoFallDamageACEmedicalCompat) then{
NoFallDamage = {_damage = 0; if((_this select 4) != "") then { _damage = _this select 2;}; _damage };
EH_NoFallDamage = player addEventHandler ["HandleDamage", { _this call NoFallDamage }];
};
  comment "ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat) then{
  NoFallDamageACE = {
    if (isTouchingGround player) then {
      if (ArmorActive == 0) then {player allowDamage true;};
    } else {
    player allowDamage false;
    };
  };
};
  comment "Adding eventHandler for ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat) then{
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
if (ShotBreakInvis) then {
  if (InvisBreakRDY == 1) then {
    if (!ExcludeSuppressed) then {InvisSTOP = 1;} else {
      switch (RecoilConmpensationWeaponType) do
      {
        case "KA_dagger":                 {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "KA_knife":                  {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "KA_machete":                {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "KA_axe":                    {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "Hatchet":                   {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "KA_crossbow_black":         {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "KA_crossbow_wood":          {if (SuitPower >= 1)  then{SuitPower = SuitPower - 1;}  else {InvisSTOP = 1;};};
        case "rhs_weap_m3a1_specops":     {if (SuitPower >= 5)  then{SuitPower = SuitPower - 5;}  else {InvisSTOP = 1;};};
        case "rhs_weap_pb_6p9":           {if (SuitPower >= 10) then{SuitPower = SuitPower - 10;} else {InvisSTOP = 1;};};
        case "KA_MP5SD3":                 {if (SuitPower >= 10) then{SuitPower = SuitPower - 10;} else {InvisSTOP = 1;};};
        case "hlc_smg_mp5sd5":            {if (SuitPower >= 10) then{SuitPower = SuitPower - 10;} else {InvisSTOP = 1;};};
        case "hlc_smg_mp5sd6":            {if (SuitPower >= 10) then{SuitPower = SuitPower - 10;} else {InvisSTOP = 1;};};
        case "hlc_rifle_honeybadger":     {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval":            {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_grip":       {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_npz":        {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_asval_grip_npz":   {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss":              {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_grip":         {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_npz":          {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "rhs_weap_vss_grip_npz":     {if (SuitPower >= 20) then{SuitPower = SuitPower - 20;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert":        {if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert_FDE":    {if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};};
        case "hlc_rifle_awcovert_BL":     {if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};};
        case "KA_VSSK":                   {if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};};
        case "srifle_DMR_04_F":           {if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};};
        case "srifle_DMR_04_Tan_F":       {if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};};
        case "rhs_weap_m32":              {if (SuitPower >= 50) then{SuitPower = SuitPower - 50;} else {InvisSTOP = 1;};};
        case "ATA_XM25_F":                {if (SuitPower >= 50) then{SuitPower = SuitPower - 50;} else {InvisSTOP = 1;};};
        case "ATA_XM29_F":                {
                                              if (RecoilConmpensationMuzzleType == "ATA_XM29_F") then{
                                                  if (SuitPower >= 50) then{SuitPower = SuitPower - 50;} else {InvisSTOP = 1;};
                                              } else {
                                                  if ("XM29_KE_Suppressor" in (player weaponAccessories primaryWeapon player)) then{
                                                      if (SuitPower >= 30) then{SuitPower = SuitPower - 30;} else {InvisSTOP = 1;};
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
        case "Single":     {if (SuitPower >= 5) then{SuitPower = SuitPower - 5;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "Burst":      {if (SuitPower >= 3) then{SuitPower = SuitPower - 3;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "FullAuto":   {if (SuitPower >= 2) then{SuitPower = SuitPower - 2;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
      };
    };
    case "LAGO_KU5K":                 {
      switch (RecoilConmpensationFiremodeType) do {
        case "FullAuto1":   {if (SuitPower >= 3) then{SuitPower = SuitPower - 3;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
        case "FullAuto2":   {if (SuitPower >= 2) then{SuitPower = SuitPower - 2;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
      };
    };
    case "LAGO_KU98K_NSK":            {if (SuitPower >= 10) then{SuitPower = SuitPower - 10;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "LAGO_CP":                   {};
    case "weap_RPK":                  {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_CQC":        {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_CQC":    {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_LB":         {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_LB":     {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_STD":        {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "rhs_weap_SCARL_FDE_STD":    {if (SuitPower >= 4) then{SuitPower = SuitPower - 4;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_Hand":      {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_AFG":       {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_EGLM":      {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Black_Grip":      {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_Hand":        {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_AFG":         {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_EGLM":        {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    case "KA_SCAR_H_Tan_Grip":        {if (SuitPower >= 6) then{SuitPower = SuitPower - 6;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
    default                           {if (SuitPower >= RecoilConmpensationEnergyPerShot) then{SuitPower = SuitPower - RecoilConmpensationEnergyPerShot;} else {SuitPower = 0; playSound "Alarm"; [] call Nano_AIM;};};
  };
};

  comment "Airburst part.";
if (NanoAirburst) then {
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
if (NanoGuidance) then {
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
    ) then { if (SuitPower >= 30) then{SuitPower = SuitPower - 30; } else {InvisSTOP = 1;};} else {InvisSTOP = 1;};
};

  comment "Adding eventHandler for proximity sensor if needed.";
if (ProximitySensor) then {
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

  if (SuitPower >= 0 ) then {ChargeGraph = "[..................................................]"};
  if (SuitPower >= 2 ) then {ChargeGraph = "[|.................................................]"};
  if (SuitPower >= 4 ) then {ChargeGraph = "[||................................................]"};
  if (SuitPower >= 6 ) then {ChargeGraph = "[|||...............................................]"};
  if (SuitPower >= 8 ) then {ChargeGraph = "[||||..............................................]"};
  if (SuitPower >= 10) then {ChargeGraph = "[|||||.............................................]"};
  if (SuitPower >= 12) then {ChargeGraph = "[||||||............................................]"};
  if (SuitPower >= 14) then {ChargeGraph = "[|||||||...........................................]"};
  if (SuitPower >= 16) then {ChargeGraph = "[||||||||..........................................]"};
  if (SuitPower >= 18) then {ChargeGraph = "[|||||||||.........................................]"};
  if (SuitPower >= 20) then {ChargeGraph = "[||||||||||........................................]"};
  if (SuitPower >= 22) then {ChargeGraph = "[|||||||||||.......................................]"};
  if (SuitPower >= 24) then {ChargeGraph = "[||||||||||||......................................]"};
  if (SuitPower >= 26) then {ChargeGraph = "[|||||||||||||.....................................]"};
  if (SuitPower >= 28) then {ChargeGraph = "[||||||||||||||....................................]"};
  if (SuitPower >= 30) then {ChargeGraph = "[|||||||||||||||...................................]"};
  if (SuitPower >= 32) then {ChargeGraph = "[||||||||||||||||..................................]"};
  if (SuitPower >= 34) then {ChargeGraph = "[|||||||||||||||||.................................]"};
  if (SuitPower >= 36) then {ChargeGraph = "[||||||||||||||||||................................]"};
  if (SuitPower >= 38) then {ChargeGraph = "[|||||||||||||||||||...............................]"};
  if (SuitPower >= 40) then {ChargeGraph = "[||||||||||||||||||||..............................]"};
  if (SuitPower >= 42) then {ChargeGraph = "[|||||||||||||||||||||.............................]"};
  if (SuitPower >= 44) then {ChargeGraph = "[||||||||||||||||||||||............................]"};
  if (SuitPower >= 46) then {ChargeGraph = "[|||||||||||||||||||||||...........................]"};
  if (SuitPower >= 48) then {ChargeGraph = "[||||||||||||||||||||||||..........................]"};
  if (SuitPower >= 50) then {ChargeGraph = "[|||||||||||||||||||||||||.........................]"};
  if (SuitPower >= 52) then {ChargeGraph = "[||||||||||||||||||||||||||........................]"};
  if (SuitPower >= 54) then {ChargeGraph = "[|||||||||||||||||||||||||||.......................]"};
  if (SuitPower >= 56) then {ChargeGraph = "[||||||||||||||||||||||||||||......................]"};
  if (SuitPower >= 58) then {ChargeGraph = "[|||||||||||||||||||||||||||||.....................]"};
  if (SuitPower >= 60) then {ChargeGraph = "[||||||||||||||||||||||||||||||....................]"};
  if (SuitPower >= 62) then {ChargeGraph = "[|||||||||||||||||||||||||||||||...................]"};
  if (SuitPower >= 64) then {ChargeGraph = "[||||||||||||||||||||||||||||||||..................]"};
  if (SuitPower >= 66) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||.................]"};
  if (SuitPower >= 68) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||................]"};
  if (SuitPower >= 70) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||...............]"};
  if (SuitPower >= 72) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||..............]"};
  if (SuitPower >= 74) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||.............]"};
  if (SuitPower >= 76) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||............]"};
  if (SuitPower >= 78) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||...........]"};
  if (SuitPower >= 80) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||..........]"};
  if (SuitPower >= 82) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||.........]"};
  if (SuitPower >= 84) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||........]"};
  if (SuitPower >= 86) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||.......]"};
  if (SuitPower >= 88) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||......]"};
  if (SuitPower >= 90) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||.....]"};
  if (SuitPower >= 92) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||||....]"};
  if (SuitPower >= 94) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||||...]"};
  if (SuitPower >= 96) then {ChargeGraph = "[||||||||||||||||||||||||||||||||||||||||||||||||..]"};
  if (SuitPower >= 98) then {ChargeGraph = "[|||||||||||||||||||||||||||||||||||||||||||||||||.]"};
  if (SuitPower >= 100) then {ChargeGraph= "[||||||||||||||||||||||||||||||||||||||||||||||||||]"};

      comment "Rangefinder.";
    if (ConstantRangefinder) then {
      _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
      _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
      DisMes = if (count _ins > 0) then [{str(round _cursor_distance)},{"---"}];
        if (NanoAirburst) then {
          DisNum = if (count _ins > 0) then [{(round _cursor_distance)+3},{9999}];
          DisLockedUI = if (ABswitch == 0) then {DisLocked} else {"OFF"};
        };
    };
      comment "Get player health (vanilla).";
    if (NanoHeal) then {Health = 100-((damage player)*100);};

      comment "Not letting players see negative power values when manual stop used.";
    if (SuitPower < -0.01) then {UISuitPower = "Reboot"} else {UISuitPower = (selectMin [100,SuitPower]) toFixed 1;};

  comment "Information output.";
  if ((!NanoAirburst)and(!NanoHeal)and(!ConstantRangefinder)) then {hintSilent formatText ["Power: %1 %2%3%4", UISuitPower, "%", lineBreak,ChargeGraph];};
  if ((!NanoAirburst)and(!NanoHeal)and(ConstantRangefinder)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes];};
  if ((!NanoAirburst)and(NanoHeal)and(!ConstantRangefinder)) then {hintSilent formatText ["Power: %1 %2%3%4%3User health: %5 %2", UISuitPower, "%", lineBreak, ChargeGraph, Health];};
  if ((!NanoAirburst)and(NanoHeal)and(ConstantRangefinder)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3User health: %6 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, Health];};
  if ((NanoAirburst)and(!NanoHeal)and(!ConstantRangefinder)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst)and(!NanoHeal)and(ConstantRangefinder)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes,DisLockedUI];};
  if ((NanoAirburst)and(NanoHeal)and(!ConstantRangefinder)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst)and(NanoHeal)and(ConstantRangefinder)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m%3User health: %7 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, DisLockedUI, Health];};

  comment "Rebreather module.";
  if (NanoRebreather) then {player setOxygenRemaining 1;};

}];
systemChat "EventHandlers loaded.";

  comment "Adding functions for hotkeys handling.";
if (HotkeysEnabeled) then{

if (MaximumArmorSwitch) then {
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

if (CloakSwitch) then {
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

if (MaximumSpeedSwitch) then {
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

if (JumpSwitch) then {
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

if (WeaponHandlingSwitch) then {
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

if (NanoAirburst) then {
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

if (!DisableScrollMenu) then {removeallactions player;};

NanoActivateActionID = player addAction ["<t>Activate Suit</t>", {
  if (!DisableScrollMenu) then {
    [] call Nano_menu2eff;
    player removeAction NanoActivateActionID;
    [] call GeneratorStop;
    [] call SuitGenerator;
  } else {
    player removeAction NanoActivateActionID;
    systemChat "Scrollmenu disabled. Please use hotkeys.";
      if (!HotkeysEnabeled) then {
        systemChat "ERR. Hotkeys disabled too. Please contact missionmaker and tell that he did big OOF. Suit is unusable.";
      };
    [] call GeneratorStop;
    [] call SuitGenerator;
  };
}];

Nano_menu2eff = {
removeallactions player;
 if (MaximumArmorSwitch)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (TwoSpeedModeSwitch)    then {player addAction ["<t>Speed mode switch [ >Eff | MAX ]</t>", {FastAsFuckTick = FastAsFuckTickMAX; GottaGoFastMultiplier = GottaGoFastMultiplierMAX; DisengageTick = selectMax [ArmorTick,SneakTick,FastAsFuckTick] +0.1; [] call Nano_menu2max;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (NanoAirburst)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2effHidden;}];
 if (JumpSwitch)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
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
 if (MaximumArmorSwitch)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>Speed mode switch [ Eff | >MAX ]</t>", {FastAsFuckTick = FastAsFuckTickEff; GottaGoFastMultiplier = GottaGoFastMultiplierEff; DisengageTick = selectMax [ArmorTick,SneakTick,FastAsFuckTick] +0.1; [] call Nano_menu2eff;}];
 if (NanoAirburst)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2maxHidden;}];
 if (JumpSwitch)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
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
    if (SuitPower < 100) then {
        if (AbiliyActive == 0) then {
          SuitPower = round (SuitPower + 1);
          PlayerSpeedPower = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
          if ((StaticRecharge)and(PlayerSpeedPower == 0) and(SuitPower < 100)) then {SuitPower = round (SuitPower + 1);};
          uiSleep RechargeTick;
        };
if (Cease == 0) then {[] call SuitGenerator;};
    } else {
      uiSleep 1;
      if (NanoHeal) then {player setDamage ((getDammage player) - NanoHealRate);};
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
  if ((SuitPower < 50) and (SuitPower >= -1)) then {
    SuitPowerACCBRK = SuitPower;
    ActiveScan = 1;
      for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do {
        SuitPowerACCBRK = round (SuitPowerACCBRK + 1);
        if ((StaticRecharge)and(PlayerSpeedPower == 0) and(SuitPowerACCBRK < 100)) then {SuitPowerACCBRK = round (SuitPowerACCBRK + 1);};
        uiSleep RechargeTick;
      };
    ActiveScan = 0;
    if ((SuitPower - SuitPowerACCBRK)>8) then {
      [] call GeneratorStop;
      systemChat "Abnormal power flux detected. Preparing to restart generator.";
      [] spawn {[] call GeneratorRestart;};
    };
  };
};
GeneratorRestart = {
  if (SuitPower != 100) then{
  SuitPowerACCDEB = SuitPower;
  uiSleep (RechargeTick * 3);
    if (SuitPower == SuitPowerACCDEB) then {
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
    if (MaximumArmorSwitch) then {
  comment "Armor activation function.";
Nano_Armor2_ACT = {
  if (SuitPower >= 10) then {
    if (ArmorActive == 0) then {systemChat "Maximum armor"; playSound "Hint"; [] call Nano_Armor2;};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Armor function.";
Nano_Armor2 = {
  if (SuitPower > 0) then {
    if (TextureHandling) then {if (SpeedActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureArmor];};};
    if (!ActiveRecharge) then {AbiliyActive = 1;};
    ArmorActive = 1;
    SuitPower = SuitPower - 1;
    player allowDamage false;
    uiSleep ArmorTick;
    [] call Nano_Armor2;
  } else {
    if (SuitPower > -5) then {systemChat "Out of energy"; playSound "Alarm";};
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
    if (CloakSwitch) then {
  comment "Cloak activation function.";
Nano_Sneak2_ACT = {
  if (SuitPower >= 10) then {
    if (InvisActive == 0) then {systemChat "Cloak Engaged"; playSound "Hint"; if ((vehicle player) != player) then{systemchat "Vehicles cannot be hidden and will cause suspition.";}; [] call Nano_Sneak2;};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Cloak function.";
Nano_Sneak2 = {
  if (InvisSTOP == 0) then{
      if (SuitPower > 0) then {
          if (!ActiveRecharge) then {AbiliyActive = 1;};
          if (ShotBreakInvis) then {InvisBreakRDY = 1;};
          InvisActive = 1;
          [player] remoteExec["hideobject",0,true];
          if ((vehicle player) == player) then{player setCaptive true;};
            if (AdvancedInvisibility) then {
              PlayerSpeed = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
              EnergyConsumption = (exp (PlayerSpeed*0.005)-0.95)+((PlayerSpeed^3)/10000);
              SuitPower = SuitPower - (selectMin [EnergyConsumption,5]);
              uiSleep 0.1;
            } else {
              SuitPower = SuitPower - 1;
              uiSleep SneakTick;
            };
        [] call Nano_Sneak2;
      } else {
        if (SuitPower > -5) then {systemChat "Out of energy"; playSound "Alarm";};
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
      if (AndZeroPower) then {SuitPower = 0;};
  };
};
    };

  comment "Speed global switch.";
    if (MaximumSpeedSwitch) then {
  comment "Speed activation function.";
Nano_FAFB2_ACT = {
  if (SuitPower >= 10) then {
    if ((vehicle player) == player) then{
      if (SpeedActive == 0) then {systemChat "Maximum speed"; playSound "Hint"; [] call Nano_FAFB2;};
    } else {systemChat "Cramped space detected. Action canceled.";};
  } else {
    systemChat "At least 10 percent needed.";
  };
};
  comment "Speed function.";
Nano_FAFB2 = {
  if (SuitPower > 0) then {
    if (TextureHandling) then {if (ArmorActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureSpeed];};};
    if (!ActiveRecharge) then {AbiliyActive = 1;};
    SuitPower = SuitPower - 1;
    onEachFrame{player setAnimSpeedCoef GottaGoFastMultiplier};
    SpeedActive = 1;
    uiSleep FastAsFuckTick;
    [] call Nano_FAFB2;
  } else {
    if (SuitPower > -5) then {systemChat "Out of energy"; playSound "Alarm";};
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
    if (JumpSwitch) then {
  comment "Jump function.";
Nano_JUMP = {
  if ((vehicle player) == player) then{
    if (isTouchingGround player) then {
      if (SuitPower >= JumpEnergyCost) then {
        player setVelocity [(velocity player select 0),(velocity player select 1), 20];
        SuitPower = SuitPower - JumpEnergyCost;
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
    if (WeaponHandlingSwitch) then {
  comment "Weapons handling function.";
Nano_AIM = {
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
    if (NanoAIMSW == 0) then{
      if (SuitPower >= 10) then {
        NanoAIMSW = 1;
         if (WeaponCoreNoSway) then{
          MEH_NoSway = addMissionEventHandler ["EachFrame", {player setCustomAimCoef WeaponCoreSwayMultiplier;}];
          };
        if (WeaponCoreNoRecharge) then {AbiliyActive = 1;};
        if (TraceBullets) then {[player, TraceNumber] spawn BIS_fnc_traceBullets;};
        player setUnitRecoilCoefficient RecoilModificator;
        systemChat "Weapon handling protocols activated.";
        playSound "Hint";
      } else {
        systemChat "At least 10 percent needed.";
      };
    } else {
      NanoAIMSW = 0;
      removeMissionEventHandler ["EachFrame", MEH_NoSway];
      if (WeaponCoreNoRecharge) then {AbiliyActive = 0;};
          [] spawn {
              if (TraceBullets) then {sleep 0.4;[player, 0] spawn BIS_fnc_traceBullets;};
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
  SuitPowerACC = SuitPower;
  SuitPower = -10;   comment "That's a neat trick to disengage armor/sneak/speed functions without [Out of energy] alarm. Functions disengaging if energy at 0 but alarm triggered when energy above -5. In normal 0 energy scenario both force disengagement and alarm being triggered. But with manual disengagement energy is set to -10 for the duration of disengagement and restored after. That way functions disengaged like they out of energy but alarm isn't triggered.";
  AbiliyActive = 0;
  InvisActive = 0;
  InvisBreakRDY = 0;
  ArmorActive = 0;
  SpeedActive = 0;
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
  onEachFrame{};
  if (TraceBullets) then {[player, 0] spawn BIS_fnc_traceBullets;};
  uiSleep 0.01;
  if ((TraceBullets) and (NanoAIMSW == 1)) then {[player, TraceNumber] spawn BIS_fnc_traceBullets;};
  player allowDamage true;
  [player,false] remoteExec["hideobject",0];
  player setCaptive false;
  systemChat "Abilities disengaged.";
  playSound "Hint";
  uiSleep 0.02;
  player setAnimSpeedCoef 1;
  uiSleep DisengageTick;
  SuitPower = SuitPowerACC;
  uiSleep 0.02;
  NanoStopping = 0;
  if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
};
systemChat "Functions loaded.";

systemChat "Self scan complete. Press [Activate suit] to start.";
Nanite_Suit_Active = 1;
};



cats_assault ={
	hintSilent formatText ["Assault C.A.T.S. Online %1 Detection Range: %2m",linebreak,prox_distance];
  ShotLocation = [];

  ["itemAdd", ["cats_assault", {

    all_units = nearestObjects [player, ["Man"], prox_distance];
    {
      if !(_x in units player) then
      {
          EH_GetShotPos = _x addEventHandler["Fired",
          {
            unit_shot = _this select 0;
            ShotLocation = getPosATL unit_shot;
            ShotLocation set [2, (ShotLocation select 2) + 1];
            if (ShotLocation vectorDistance getPosATL player > 200) then
            {
              unit_shot removeAllEventHandlers "Fired";
              hintSilent formatText ["Distance: %1",ShotLocation vectorDistance getPosATL player];
            };
          }];
      };
    }forEach all_units;
    all_units = [];
    EH_Draw_Icon = addMissionEventHandler["EachFrame",{
      player spawn{
        if (count ShotLocation != 0) then {
            drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [1,0,0,0.5], ShotLocation, 1, 1, 0,"Shot detected!", 2, 0.05, 'RobotoCondensed', 'center', true];
            sleep 1;
            ShotLocation = [];
            };
        };
    }];

    if (goggles player == "CATS_CQC") then {
      hintSilent formatText ["C.A.T.S Removed"];
      ["itemRemove", ["cats_assault"]] call BIS_fnc_loop;
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
