Nano_Suit_SPARTAN ={

SPARTAN_Suit_Active = true;
DevOptions = false;                          comment "[Boolean]  Development options. Used for script debuging.";
TextureArmor      = "Uniform\NanoArmor.jpg";     comment "[String]   Texture name of Armor mode texture.";
TextureSpeed      = "Uniform\NanoSpeed.jpg";     comment "[String]   Texture name of Speed mode texture.";
TextureArmorSpeed = "Uniform\NanoBoth.jpg";      comment "[String]   Texture name of Armor+Speed mode texture.";
TextureIdle       = "Uniform\NanoBase.jpg";      comment "[String]   Texture name of default texture when no abilities listed above active.";
TextureHandling = true;

player setVariable ["_eta_cloak_cooldown", true, true];
AbiliyActive = 0;
ArmorActive = 0;
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
shield_size_switch = 0;
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
terminate NanABKey;

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
  if (nanite_new_UI_SPARTAN) then {

    //UI VALUES SET
    if (!NanoAirburst_SPARTAN) then {
      DisLockedUI = "DISABLED";
    };
    if (!ConstantRangefinder_SPARTAN) then {
      DisMes = "DISABLED";
    };

    _suit_status = "INACTIVE";
    if(AbiliyActive == 1) then {
      _suit_status = "ACTIVE";
    };

    _weapon_handling = "INACTIVE";
    if (NanoAIMSW == 1) then {
      _weapon_handling = "ACTIVE";
    };

    //INITIALIZATION
    disableSerialization;
    ("layer_eta_nanite_hud_menu" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_additional_information", "plain", -1, false];
    ("layer_eta_nanite_energy_bar_empty" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_fuel_bar_empty", "plain",-1,false];
    ("layer_eta_nanite_energy_bar" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_energy_bar", "plain", -1, false];
    ("layer_eta_nanite_HUD" call BIS_fnc_rscLayer) cutRsc ["eta_rsc_nanite_hud_menu_background", "plain", -1, false];
    ("layer_eta_nanite_active" call BIS_fnc_rscLayer) cutText ["", "plain"];

    //UPDATE POWER BAR
    private _display = uiNamespace getVariable "eta_nanite_energy_bar";
    private _set_bar = _display displayCtrl 629211;
    _set_bar progressSetPosition (SuitPower_SPARTAN/100);

    if (!nanite_GUI_HidePercentage_SPARTAN) then {
      ("layer_eta_nanite_display_percentage" call BIS_fnc_rscLayer) cutRsc ["eta_nanite_hud_energy_percentage", "plain", -1, false];
      _display_percentage = uiNamespace getVariable "eta_nanite_hud_energy_percentage_idd";
      _control = _display_percentage displayCtrl 629216;
      private _percentage = UISuitPower;
      _percentage = format ["<t valign='middle' align='center' size='2' fonts='Zeppelin33' color='#3bb7f3'>%1%2</t>", _percentage,"%"];
      _control ctrlSetStructuredText parseText _percentage;
    };

    _display_percentage = uiNamespace getVariable "eta_nanite_hud_menu_idd";
    _control = _display_percentage displayCtrl 629217;
    _updated_text = format["<t valign='middle' align='left' size='0.75' fonts='Zeppelin33' color='#3bb7f3'>Suit Status:  <t align='right'>%1%2</t><br/><br/>Distance to Target: <t align='right'>%3</t><br/><br/>Airburst: <t align='right'>%4</t><br/><br/>Gun Handling: <t align='right'>%5</t><br/><br/></t>",_suit_status,"",DisMes,DisLockedUI,_weapon_handling];
    _control ctrlSetStructuredText parseText _updated_text;
  }
  else {
    if ((!NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4", UISuitPower, "%", lineBreak,ChargeGraph];};
    if ((!NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes];};
    if ((!NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3User health: %5 %2", UISuitPower, "%", lineBreak, ChargeGraph, Health];};
    if ((!NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3User health: %6 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, Health];};
    if ((NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
    if ((NanoAirburst_SPARTAN)and(!NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes,DisLockedUI];};
    if ((NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(!ConstantRangefinder_SPARTAN)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
    if ((NanoAirburst_SPARTAN)and(NanoHeal_SPARTAN)and(ConstantRangefinder_SPARTAN)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m%3User health: %7 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, DisLockedUI, Health];};
  };

  comment "Rebreather module.";
  if (NanoRebreather_SPARTAN) then {player setOxygenRemaining 1;};

}];
systemChat "EventHandlers loaded.";

  comment "Adding functions for hotkeys handling.";
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

fnc_shield_size_switch_addaction = {
  player removeAction shield_switch_action_id;
  shield_switch_action_id = player addAction[format["<t color='#C4CACE'>>>Shield Size %1</t>",(["[ >SINGLE | GROUP ]","[ SINGLE | >GROUP ]"] select shield_size_switch)],{if (shield_size_switch == 0) then {shield_size_switch = 1} else {shield_size_switch = 0}; Nano_menu2effHidden;   if (FastAsFuckTick == FastAsFuckTickMAX_SPARTAN) then {[] call Nano_menu2eff;}else {[] call Nano_menu2max;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

Nano_menu2eff = {
  removeallactions player;
   if (MaximumArmorSwitch_SPARTAN)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
   if (shield_size_switch_SPARTAN) then {player call fnc_shield_size_switch_addaction;};

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
     if (shield_size_switch_SPARTAN) then {player call fnc_shield_size_switch_addaction;};
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
          }
          else {
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
    if (ArmorActive == 0) then {
      systemChat "Maximum armor";
      playSound "Hint";
      if (shield_switch_SPARTAN) then {
        [] call Nano_Shield;
      }
      else {
        [] call Nano_Armor2;
      };
    };
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

Nano_Shield = {
  if (SuitPower_SPARTAN > 0) then {
    if (TextureHandling) then {if (SpeedActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureArmor];};};
    if (!ActiveRecharge_SPARTAN) then {AbiliyActive = 1;};
    if (ArmorActive == 0) then {
      if (player == vehicle player) then {
        if (shield_size_switch == 0) then {
          _player_shield = createVehicle ["OPTRE_FC_Energy_shield", position player, [], 0, "CAN_COLLIDE"];
          _player_shield attachTo [player, [0, 0, 1]];
          _player_shield setObjectScale eta_small_shield_size_SPARTAN;
          shield_power_drain = eta_small_shield_power_drain_SPARTAN;
        };
        if (shield_size_switch == 1) then {
          _player_shield = createVehicle ["OPTRE_FC_Energy_shield", position player, [], 0, "CAN_COLLIDE"];
          _player_shield attachTo [player, [0, 0, 1]];
          _player_shield setObjectScale eta_big_shield_size_SPARTAN;
          shield_power_drain = eta_big_shield_power_drain_SPARTAN;
        };
      }
      else {
        if (eta_vehicle_shield_SPARTAN) then
        {
          _dimension = sizeOf typeOf vehicle player;
          _player_shield = createVehicle ["OPTRE_FC_Energy_shield", position player, [], 0, "CAN_COLLIDE"];
          _player_shield attachTo [vehicle player, [0, 0, 0]];
          _player_shield setObjectScale (_dimension / 3.5) / 2;
          shield_power_drain = eta_vehicle_shield_power_drain_SPARTAN;

          _VehicleShieldEH = player addEventHandler ["GetOutMan", {
	           params ["_unit", "_role", "_vehicle", "_turret"];
             //Despawn Shield when player exits
             {
               if (_x isKindOf "OPTRE_FC_Energy_shield") then {
                 deleteVehicle _x;
               };
             } forEach attachedObjects _vehicle;

             if (shield_size_switch == 0) then {
               _player_shield = createVehicle ["OPTRE_FC_Energy_shield", position player, [], 0, "CAN_COLLIDE"];
               _player_shield attachTo [player, [0, 0, 1]];
               _player_shield setObjectScale eta_small_shield_size_SPARTAN;
               shield_power_drain = eta_small_shield_power_drain_SPARTAN;
             };
             if (shield_size_switch == 1) then {
               _player_shield = createVehicle ["OPTRE_FC_Energy_shield", position player, [], 0, "CAN_COLLIDE"];
               _player_shield attachTo [player, [0, 0, 1]];
               _player_shield setObjectScale eta_big_shield_size_SPARTAN;
               shield_power_drain = eta_big_shield_power_drain_SPARTAN;
             };

             player removeEventHandler ["GetOutMan", _thisEventHandler];
          }];
        }
        else {
          hint "Shields are not powerful enough to cover the vehicle";
        };
      };

    };
    ArmorActive = 1;
    SuitPower_SPARTAN = SuitPower_SPARTAN - shield_power_drain;
    uiSleep ArmorTick_SPARTAN;
    [] call Nano_Shield;
  } else {
    if (SuitPower_SPARTAN > -5) then {systemChat "Out of energy"; playSound "Alarm";};
    ArmorActive = 0;
    AbiliyActive = 0;
    {
      if (_x isKindOf "OPTRE_FC_Energy_shield") then {
        deleteVehicle _x;
      };
    } forEach attachedObjects vehicle player;
    player removeEventHandler ["GetOutMan",_VehicleShieldEH];
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
    if (InvisActive == 0) then {
      if (player getVariable ["_eta_cloak_cooldown", true]) then {
        [player,"eta_sound_cloak_charge"] remoteExec ["say"];
        sleep eta_sneak_chargeup_SPARTAN;
        systemChat "Cloak Engaged";
        playSound "Hint";
        [] call Nano_Sneak2;}
        else {
          playsound "Alarm";
          systemchat "Cloak Field Recalibrating";
        }
      };
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
          [player] remoteExec["hideobject",0,true];
          if ((vehicle player) != player) then{
            if (eta_cloak_vehicles_SPARTAN) then {
              if (InvisActive == 0) then {
                player setVariable ["tts_cloak_isCloaked", false,true];
                systemChat "VehicleStealth Activated";
                [vehicle player] call fnc_vehicle_stealth;
                _player_stealth_vehicle_exit_EH = player addEventHandler ["GetOutMan",
                {
                   params ["_unit", "_role", "_vehicle", "_turret"];
                   [_vehicle] call fnc_remove_vehicle_stealth;
                   if (eta_nanite_cloak_particles_SPARTAN) then {
                     player setVariable ["tts_cloak_isCloaked", true,true];
                     [player] spawn eta_cloak_fnc_cloakParticles;
                     _unit removeEventHandler ["GetOutMan", _thisEventHandler];
                   };
                }];
                player setVariable ["_player_stealth_vehicle_exit_EH", _player_stealth_vehicle_exit_EH];

                _passenger_stealth_vehicle_exit_EH = vehicle player addEventHandler ["GetOut",
                {
                   params ["_vehicle", "_role", "_unit", "_turret"];
                   _captive_list = _vehicle getVariable ["captive_list", objNull];
                   if !(_unit in _captive_list) then
                   {
                     _unit setCaptive false;
                   };
                }];
                player setVariable ["_passenger_stealth_vehicle_exit_EH", _passenger_stealth_vehicle_exit_EH];
                player setCaptive true;
              };
            };
          }
          else
          {
            if (InvisActive == 0) then {
            systemChat "STEALTH ACTIVATED";
            if (eta_nanite_cloak_particles_SPARTAN) then {
              player setVariable ["tts_cloak_isCloaked", true,true];
              [player] spawn eta_cloak_fnc_cloakParticles;
              [player] call eta_cloak_fnc_transition;
            };
            player setCaptive true;
          };
          };
            if (AdvancedInvisibility_SPARTAN) then {
              PlayerSpeed = (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6);
              EnergyConsumption = (exp (PlayerSpeed*0.005)-0.95)+((PlayerSpeed^3)/10000);
              InvisActive = 1;
              SuitPower_SPARTAN = SuitPower_SPARTAN - (selectMin [EnergyConsumption,5]);
              uiSleep 0.1;
            } else {
              InvisActive = 1;
              SuitPower_SPARTAN = SuitPower_SPARTAN - 1;
              if (vehicle player != player) then {
                SuitPower_SPARTAN = SuitPower_SPARTAN - eta_vehicle_stealth_energy_cost_SPARTAN;
              };
              uiSleep SneakTick_SPARTAN;
            };
        [] call Nano_Sneak2;
      } else {
        if (SuitPower_SPARTAN > -5) then {systemChat "Out of energy"; playSound "Alarm";};
        AbiliyActive = 0;
        InvisActive = 0;
        InvisBreakRDY = 0;
        _player_stealth_vehicle_exit_EH = player getVariable ["_player_stealth_vehicle_exit_EH", objNull];
        _passenger_stealth_vehicle_exit_EH = player getVariable ["_passenger_stealth_vehicle_exit_EH", objNull];
        player removeEventHandler ["GetOutMan", _player_stealth_vehicle_exit_EH];
        vehicle player removeEventHandler ["GetOut", _passenger_stealth_vehicle_exit_EH];

        player setVariable ["tts_cloak_isCloaked", false,true];
        [vehicle player] call fnc_remove_vehicle_stealth;
        [player,false] remoteExec["hideobject",0];
        player setCaptive false;
        if (TextureHandling) then {player setObjectTextureGlobal [0,TextureIdle];};
        uiSleep (DisengageTick + GenStopTick + 0.1);
        if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
      };
      }
      else
      {
      if (vehicle player != player) then
      {
        [vehicle player] call fnc_remove_vehicle_stealth;
      };
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

Nano_Shield_Charge = {
  if (SuitPower_SPARTAN >= eta_energy_shield_recharge_cost_SPARTAN) then {
    player setVariable ["optre_stopcharging", false, true];
    _optre_suit_energy = player getVariable ["optre_suit_energy", 100];
    _new_suit_energy = _optre_suit_energy + eta_energy_shield_recharge_amount_SPARTAN;
    if (_new_suit_energy > 100) then {_new_suit_energy = 100};
    player setVariable ["optre_suit_energy", _new_suit_energy, true];
    SuitPower_SPARTAN = SuitPower_SPARTAN - eta_energy_shield_recharge_cost_SPARTAN;
    systemChat "Shields Charged";
  }
  else {
    playSound "Alarm";
    systemchat "Not Enough Energy to charge Shields";
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
  SuitPower_SPARTAN = -1000;   comment "That's a neat trick to disengage armor/sneak/speed functions without [Out of energy] alarm. Functions disengaging if energy at 0 but alarm triggered when energy above -5. In normal 0 energy scenario both force disengagement and alarm being triggered. But with manual disengagement energy is set to -10 for the duration of disengagement and restored after. That way functions disengaged like they out of energy but alarm isn't triggered.";
  AbiliyActive = 0;
  InvisActive = 0;
  InvisBreakRDY = 0;
  ArmorActive = 0;
  SpeedActive = 0;
  [] spawn {
    player setVariable ["_eta_cloak_cooldown", false, true];
    sleep eta_cloak_cooldown_timer_SPARTAN;
    player setVariable ["_eta_cloak_cooldown", true, true];
  };
  {
    if (_x isKindOf "OPTRE_FC_Energy_shield") then {
      deleteVehicle _x;
    };
  } forEach attachedObjects player;
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
  onEachFrame{};
  if (TraceBullets_SPARTAN) then {[player, 0] spawn BIS_fnc_traceBullets;};
  uiSleep 0.01;
  if ((TraceBullets_SPARTAN) and (NanoAIMSW == 1)) then {[player, TraceNumber_SPARTAN] spawn BIS_fnc_traceBullets;};
  player allowDamage true;
  [vehicle player] remoteExec ["fnc_remove_vehicle_stealth"];
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
