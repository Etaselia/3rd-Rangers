//---Nanosuit powers v2 electric boogaloo /w power system [COMPLICATED].
//This version is complicated but have a lot more features like abilities disengagement to save energy, using several abilities at the same time, active recharge, invisibility that can be broken on shot and can drain all energy. Just look at the settings section. While doing this script i heavily focused on flexibility and customization by mission maker. So script ended up a bit of clusterfuck of "if" statements. And there's a lot of variables that connect different parts of script. That makes it farley hard to modify so please stick to settings if you not sure what you doing.
//todo:
//Add visual effects? Radial blur - fuck blur. Chromatic aberration - taken by ACE pain, will confuse people. Wet distortion - maybe on activation. Color correction - maybe. Dynamic blur - fuck blur. Film grain - meh. Color inversion - maybe with color correction.
//Add crysis sounds? Possible coryright issues if loaded to workshop.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       comment "Activation by static Eden object.";
                       this addAction ["<t>Take suit. v1.6</t>", {

comment "Settings";

comment "First of all you need to understand basics of data types. These settings use 3 types of data:
[Variable] - Any number. Used in different mathematical operations in script. Influence how long process will be going or how strong will effects be.
[Boolean]  - 1 or 0 where 1 stands for true or in terms of settings - enabeled. Using something other than 1 or 0 in these settings can cause script failure.
[String]   - String of text. Currently used to define path to texture files.
";

  comment "Global feature swithces.";
  comment "Turning off feature wil turn off scrollmenu option, hotkey and technical backend of feature. Thus making it completley unavailabe for players. Please note that hotkeys can be activated once and if you want to remove/add abuilities you'll have to restart mission.";
    MaximumArmorSwitch = 1;                  comment "[Boolean]  Controls availability of Maximum armor mode.";
    CloakSwitch = 1;                         comment "[Boolean]  Controls availability of Cloak mode.";
    MaximumSpeedSwitch = 1;                  comment "[Boolean]  Controls availability of Maximum speed mode.";
    TwoSpeedModeSwitch = 1;                  comment "[Boolean]  Allows player to switch between two speed modes. If set to off(0) player will only have efficient mode.";
    JumpSwitch = 1;                          comment "[Boolean]  Controls availability of Jump feature.";
    WeaponHandlingSwitch = 1;                comment "[Boolean]  Controls availability of Weapon handling mode.";
    ConstantRangefinder = 1;                 comment "[Boolean]  Controls availability of Rangefinder feature.";
    ProximitySensor = 1;                     comment "[Boolean]  Mark exact point of last shot in 50-meter radius. Only work on AI. Ignores any players friend or foe. Still works on remote controlled AI.";
    NanoHeal = 0;                            comment "[Boolean]  Vanilla health only! Regenerate player health when energy is full. Also add player health value to HUD. Heal rate can be adjusted in [other settings].";
    NanoRebreather = 1;                      comment "[Boolean]  Provides infinite oxygen underwater to player. No energy consumption needed.";
    NanoAirburst = 1;                        comment "[Boolean]  Provides airburst feature. WILL FORCE RANGEFINDER ON! Works for most of things that can be described as rocket or missile.";
    NanoGuidance = 1;                        comment "[Boolean]  Guidance for LAGO Multiple rocket launcher.";

  comment "Energy recharge settings.";
    SuitPower = 90;                          comment "[Variable] Suit power at initialization.";
    ActiveRecharge = 0;                      comment "[Variable] Power generation while abilities are active. May be very OP and require full timing rebalancing. Also will result in infinite invisibility when advanced invisibility is used.";
    StaticRecharge = 1;                      comment "[Boolean]  Doubles power generation when player not moving.";
    RechargeTick = 0.4;                      comment "[Variable] Time in which suit power increase by 1 percent. 0.4*100=40 seconds for full recharge.";

  comment "Energy consumption settings for core modes.";
    ArmorTick = 0.1;                         comment "[Variable] Time in which suit power decrease by 1 percent. 0.1*100=10 seconds for full discharge. (Maximum armor mode).";
    SneakTick = 0.2;                         comment "[Variable] Time in which suit power decrease by 1 percent. 0.2*100=20 seconds for full discharge. (Simple  cloak mode).";
    FastAsFuckTickEff = 0.4;                 comment "[Variable] Time in which suit power decrease by 1 percent. 0.4*100=40 seconds for full discharge. (Efficient run mode).";
    GottaGoFastMultiplierEff = 5;            comment "[Variable] How fast player will move compared to normal when speed activated. 90km/h on 5x        (Efficient run mode).";
    FastAsFuckTickMAX = 0.1;                 comment "[Variable] Time in which suit power decrease by 1 percent. 0.1*100=10 seconds for full discharge. (Maximum speed mode).";
    GottaGoFastMultiplierMAX = 10;           comment "[Variable] How fast player will move compared to normal when speed activated. 180km/h on 10x      (Maximum speed mode).";

  comment "Advanced invisibility settings.";
    AdvancedInvisibility = 1;                comment "[Boolean]  Advanced invisibility power consumption calculation (speed based, nonlinear). Ignores SneakTick setting if on.";
    ShotBreakInvis = 1;                      comment "[Boolean]  Break invisibility on shot.";
    AndZeroPower = 0;                        comment "[Boolean]  Break invisibility will also drain all energy.";
    ExcludeSuppressed = 1;                   comment "[Boolean]  Exclude weapons with integrated suppressors from invisibility break. Each shot will drain considerable amount of energy though. List of weapons:
KA weapons: melee weapons, crossbows, Mp5SD, VSSK, XM25 and XM29(GL)(Suppressor check for 5.56). RHS: 6p9 pistol, all As-Val and VSS variants, M32, M3A1SD. NiArms: Honey bager, suppressed AWMs, Mp5SDs. Marksman DLC ASP KIR. Ranger weapons and KA SCAR-H also works if have suppressors.";

  comment "Weapon handling core settings.";
    RecoilConmpensationEnergyPerShot = 6;    comment "[Variable] How much energy per shot recoil compensator consume by default. Additionally, different setting for different guns available in EH_ShotsFired eventhandler.";
    RecoilModificator = 0.1;                 comment "[Variable] Recoil multiplier in weapon handling mode. 0.1 - 10% of original recoil.";
    WeaponCoreNoSway = 1;                    comment "[Boolean]  Activating weapon handling core will decrease weapon sway.";
    WeaponCoreSwayMultiplier = 0;            comment "[Variable] How much weapon sway will change. 0-No sway at all, 0.3 - 30% of normal sway. Note that when unit hit and don't have full health it will still have sway even if it set to 0.";
    WeaponCoreNoRecharge = 0;                comment "[Boolean]  Activating weapon handling core will turn energy recharge off. Not intersecting with ActiveRecharge setting.";
    TraceBullets = 1;                        comment "[Boolean]  Shows bullet paths when weapon core is active.";
    TraceNumber = 2;                         comment "[Variable] Number of bullets traced. Values over 2 can start blocking view and over 20 can impact framerate.";

  comment "Jump settings.";
    JumpEnergyCost = 40;                     comment "[Variable] Energy cost to perform jump.";
    NoFallDamageACEmedicalCompat = 1;        comment "[Boolean]  Compatibility with ACE medical. Vanilla variant through HandleDammage is somewhat more reliable but gets overridden by ACE. Also ACE version gives you maximum armor benefits in flight. So adjust energy cost accordingly because jump don't give armor in vanilla variant. Or use ACE compatible version if you want players to have automatic armor in air.";

  comment "Texture handling settings.";
    TextureHandling = 0;                     comment "[Boolean]  Texture handling. Global switch. Change textures when armor/speed activated. Invisibility not included because hideObject will override texture in in both third and first person.";
    TextureArmor      = "NanoArmor.jpg";     comment "[String]   Texture name of Armor mode texture.";
    TextureSpeed      = "NanoSpeed.jpg";     comment "[String]   Texture name of Speed mode texture.";
    TextureArmorSpeed = "NanoBoth.jpg";      comment "[String]   Texture name of Armor+Speed mode texture.";
    TextureIdle       = "NanoBase.jpg";      comment "[String]   Texture name of default texture when no abilities listed above active.";

  comment "Other settings.";
    HotkeysEnabeled = 1;                     comment "[Boolean]  Hotkeys handling. Allow players to press buttons instead of scrollmenu.";
    DisableScrollMenu = 0;                   comment "[Boolean]  Disable scrollmenu. Provides compatability with missions or other scripts that use scrollmenu. Speed switch, airburst disabling and debug options will be unavailabe.";
    DevOptions = 0;                          comment "[Boolean]  Development options. Used for script debuging.";
    NanoHealRate = 0.01;                     comment "[Variable] Health regeneration per second. Range from 1 to 0. 0.01 - 1% per second";
  comment "End settings";

  comment "Start chaos. Also this sentence is false.";

  comment "VAR";
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
if (NanoAirburst == 1) then {ConstantRangefinder = 1;};
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
if (NoFallDamageACEmedicalCompat == 0) then{
NoFallDamage = {_damage = 0; if((_this select 4) != "") then { _damage = _this select 2;}; _damage };
EH_NoFallDamage = player addEventHandler ["HandleDamage", { _this call NoFallDamage }];
};
  comment "ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat == 1) then{
  NoFallDamageACE = {
    if (isTouchingGround player) then {
      if (ArmorActive == 0) then {player allowDamage true;};
    } else {
    player allowDamage false;
    };
  };
};
  comment "Adding eventHandler for ACE compatible no fall damage.";
if (NoFallDamageACEmedicalCompat == 1) then{
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
if (ShotBreakInvis == 1) then {
  if (InvisBreakRDY == 1) then {
    if (ExcludeSuppressed == 0) then {InvisSTOP = 1;} else {
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
if (NanoAirburst == 1) then {
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
if (NanoGuidance == 1) then {
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
if (ProximitySensor == 1) then {
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
    if (ConstantRangefinder == 1) then {
      _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
      _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
      DisMes = if (count _ins > 0) then [{str(round _cursor_distance)},{"---"}];
        if (NanoAirburst == 1) then {
          DisNum = if (count _ins > 0) then [{(round _cursor_distance)+3},{9999}];
          DisLockedUI = if (ABswitch == 0) then {DisLocked} else {"OFF"};
        };
    };

      comment "Get player health (vanilla).";
    if (NanoHeal == 1) then {Health = 100-((damage player)*100);};

      comment "Not letting players see negative power values when manual stop used.";
    if (SuitPower < -0.01) then {UISuitPower = "Reboot"} else {UISuitPower = (selectMin [100,SuitPower]) toFixed 1;};

  comment "Information output.";
  if ((NanoAirburst == 0)and(NanoHeal == 0)and(ConstantRangefinder == 0)) then {hintSilent formatText ["Power: %1 %2%3%4", UISuitPower, "%", lineBreak,ChargeGraph];};
  if ((NanoAirburst == 0)and(NanoHeal == 0)and(ConstantRangefinder == 1)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes];};
  if ((NanoAirburst == 0)and(NanoHeal == 1)and(ConstantRangefinder == 0)) then {hintSilent formatText ["Power: %1 %2%3%4%3User health: %5 %2", UISuitPower, "%", lineBreak, ChargeGraph, Health];};
  if ((NanoAirburst == 0)and(NanoHeal == 1)and(ConstantRangefinder == 1)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3User health: %6 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, Health];};
  if ((NanoAirburst == 1)and(NanoHeal == 0)and(ConstantRangefinder == 0)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst == 1)and(NanoHeal == 0)and(ConstantRangefinder == 1)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m", UISuitPower, "%", lineBreak ,ChargeGraph, DisMes,DisLockedUI];};
  if ((NanoAirburst == 1)and(NanoHeal == 1)and(ConstantRangefinder == 0)) then {hint "Something really went wrong if you see this. That shouldn't be possible.";};
  if ((NanoAirburst == 1)and(NanoHeal == 1)and(ConstantRangefinder == 1)) then {hintSilent formatText ["Power: %1 %2%3%4%3Distance: %5 m%3Airburst: %6 m%3User health: %7 %2", UISuitPower, "%", lineBreak, ChargeGraph, DisMes, DisLockedUI, Health];};

  comment "Rebreather module.";
  if (NanoRebreather == 1) then {player setOxygenRemaining 1;};
}];
systemChat "EventHandlers loaded.";

  comment "Adding functions for hotkeys handling.";
if (HotkeysEnabeled == 1) then{

if (MaximumArmorSwitch == 1) then {
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

if (CloakSwitch  == 1) then {
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

if (MaximumSpeedSwitch  == 1) then {
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

if (JumpSwitch  == 1) then {
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

if (WeaponHandlingSwitch  == 1) then {
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

if (NanoAirburst == 1) then {
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

if (DisableScrollMenu == 0) then {removeallactions player;};

NanoActivateActionID = player addAction ["<t>Activate Suit</t>", {
  if (DisableScrollMenu == 0) then {
    [] call Nano_menu2eff;
    player removeAction NanoActivateActionID;
    [] call GeneratorStop;
    [] call SuitGenerator;
  } else {
    player removeAction NanoActivateActionID;
    systemChat "Scrollmenu disabled. Please use hotkeys.";
      if (HotkeysEnabeled == 0) then {
        systemChat "ERR. Hotkeys disabled too. Please contact missionmaker and tell that he did big OOF. Suit is unusable.";
      };
    [] call GeneratorStop;
    [] call SuitGenerator;
  };
}];

Nano_menu2eff = {
removeallactions player;
 if (MaximumArmorSwitch == 1)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch == 1)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch  == 1)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch == 1)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch == 1)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (TwoSpeedModeSwitch  == 1)    then {player addAction ["<t>Speed mode switch [ >Eff | MAX ]</t>", {FastAsFuckTick = FastAsFuckTickMAX; GottaGoFastMultiplier = GottaGoFastMultiplierMAX; DisengageTick = selectMax [ArmorTick,SneakTick,FastAsFuckTick] +0.1; [] call Nano_menu2max;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (NanoAirburst == 1)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2effHidden;}];
 if (JumpSwitch == 1)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Restart suit generator</t>", {[] call GeneratorRestart;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if ((DevOptions == 1) and (TextureHandling == 1)) then {player addAction ["<t>[DEV] Check textures.</t>", {player setObjectTextureGlobal [0,TextureArmor]; sleep 0.5; player setObjectTextureGlobal [0,TextureSpeed]; sleep 0.5; player setObjectTextureGlobal [0,TextureArmorSpeed]; sleep 0.5;player setObjectTextureGlobal [0,TextureIdle];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions == 1)                              then {player addAction ["<t>[DEV] Start generator (no checks)</t>", {[] call SuitGenerator;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions == 1)                              then {player addAction ["<t>[DEV] Stop generator</t>", {[] call GeneratorStop;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
};
Nano_menu2effHidden = {
removeallactions player;
player addAction ["<t color='#BBBBBB'>>>Nano menu</t>", {[] call Nano_menu2eff;}];
};

Nano_menu2max = {
removeallactions player;
 if (MaximumArmorSwitch == 1)     then {player addAction ["<t color='#C4CACE'>>>Maximum Armor</t>", {[] call Nano_Armor2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (CloakSwitch == 1)            then {player addAction ["<t color='#606060'>>>Engage Cloak</t>", {[] call Nano_Sneak2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (MaximumSpeedSwitch  == 1)    then {player addAction ["<t color='#FF0000'>>>Maximum Speed</t>", {[] call Nano_FAFB2_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>>Disengage abilities</t>", {[] call Nano_STOP_ACT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if (JumpSwitch == 1)             then {player addAction ["<t>^Jump^</t>", {[] call Nano_JUMP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (WeaponHandlingSwitch == 1)   then {player addAction ["<t>>Weapon handling</t>", {[] call Nano_AIM;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t>Speed mode switch [ Eff | >MAX ]</t>", {FastAsFuckTick = FastAsFuckTickEff; GottaGoFastMultiplier = GottaGoFastMultiplierEff; DisengageTick = selectMax [ArmorTick,SneakTick,FastAsFuckTick] +0.1; [] call Nano_menu2eff;}];
 if (NanoAirburst == 1)           then {player addAction ["<t>Switch airburst ON/OFF</t>", {if (ABswitch == 0) then{ABswitch = 1;}else{ABswitch = 0;};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#BBBBBB'>>>Hide menu</t>", {[] call Nano_menu2maxHidden;}];
 if (JumpSwitch == 1)             then {player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Unstuck (don't use jump in buildings next time)</t>", {player setVelocity [0,0,0];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
                                        player addAction ["<t color='#ff6700'>[Manual debug]</t><t> Restart suit generator</t>", {[] call GeneratorRestart;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 if ((DevOptions == 1) and (TextureHandling == 1)) then {player addAction ["<t>[DEV] Check textures.</t>", {player setObjectTextureGlobal [0,TextureArmor]; sleep 0.5; player setObjectTextureGlobal [0,TextureSpeed]; sleep 0.5; player setObjectTextureGlobal [0,TextureArmorSpeed]; sleep 0.5;player setObjectTextureGlobal [0,TextureIdle];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions == 1)                              then {player addAction ["<t>[DEV] Start generator (no checks)</t>", {[] call SuitGenerator;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
 if (DevOptions == 1)                              then {player addAction ["<t>[DEV] Stop generator</t>", {[] call GeneratorStop;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];};
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
          if ((StaticRecharge == 1)and(PlayerSpeedPower == 0) and(SuitPower < 100)) then {SuitPower = round (SuitPower + 1);};
          uiSleep RechargeTick;
        };
if (Cease == 0) then {[] call SuitGenerator;};
    } else {
      uiSleep 1;
      if (NanoHeal == 1) then {player setDamage ((getDammage player) - NanoHealRate);};
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
        if ((StaticRecharge == 1)and(PlayerSpeedPower == 0) and(SuitPowerACCBRK < 100)) then {SuitPowerACCBRK = round (SuitPowerACCBRK + 1);};
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
    if (MaximumArmorSwitch == 1) then {
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
    if (TextureHandling == 1) then {if (SpeedActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureArmor];};};
    if (ActiveRecharge == 0) then {AbiliyActive = 1;};
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
    if (TextureHandling == 1) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
    if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
  };
};
    };

  comment "Cloak global switch.";
    if (CloakSwitch == 1) then {
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
          if (ActiveRecharge == 0) then {AbiliyActive = 1;};
          if (ShotBreakInvis == 1) then {InvisBreakRDY = 1;};
          InvisActive = 1;
          [player] remoteExec["hideobject",0,true];
          if ((vehicle player) == player) then{player setCaptive true;};
            if (AdvancedInvisibility == 1) then {
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
        if (TextureHandling == 1) then {player setObjectTextureGlobal [0,TextureIdle];};
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
      if (TextureHandling == 1) then {player setObjectTextureGlobal [0,TextureIdle];};
      if (AndZeroPower == 1) then {SuitPower = 0;};
  };
};
    };

  comment "Speed global switch.";
    if (MaximumSpeedSwitch == 1) then {
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
    if (TextureHandling == 1) then {if (ArmorActive == 1) then {player setObjectTextureGlobal [0,TextureArmorSpeed];} else {player setObjectTextureGlobal [0,TextureSpeed];};};
    if (ActiveRecharge == 0) then {AbiliyActive = 1;};
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
    if (TextureHandling == 1) then {player setObjectTextureGlobal [0,TextureIdle];};
    uiSleep (DisengageTick + GenStopTick + 0.1);
    if (ActiveScan == 0) then {[] spawn{[] call GeneratorScan;};};
  };
};
    };

  comment "Jump global switch.";
    if (JumpSwitch == 1) then {
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
    if (WeaponHandlingSwitch == 1) then {
  comment "Weapons handling function.";
Nano_AIM = {
  if(isNil "NanoAIMSW") then {NanoAIMSW = 0};
    if (NanoAIMSW == 0) then{
      if (SuitPower >= 10) then {
        NanoAIMSW = 1;
         if (WeaponCoreNoSway == 1) then{
          MEH_NoSway = addMissionEventHandler ["EachFrame", {player setCustomAimCoef WeaponCoreSwayMultiplier;}];
          };
        if (WeaponCoreNoRecharge == 1) then {AbiliyActive = 1;};
        if (TraceBullets == 1) then {[player, TraceNumber] spawn BIS_fnc_traceBullets;};
        player setUnitRecoilCoefficient RecoilModificator;
        systemChat "Weapon handling protocols activated.";
        playSound "Hint";
      } else {
        systemChat "At least 10 percent needed.";
      };
    } else {
      NanoAIMSW = 0;
      removeMissionEventHandler ["EachFrame", MEH_NoSway];
      if (WeaponCoreNoRecharge == 1) then {AbiliyActive = 0;};
          [] spawn {
              if (TraceBullets == 1) then {sleep 0.4;[player, 0] spawn BIS_fnc_traceBullets;};
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
  if (TraceBullets == 1) then {[player, 0] spawn BIS_fnc_traceBullets;};
  uiSleep 0.01;
  if ((TraceBullets == 1) and (NanoAIMSW == 1)) then {[player, TraceNumber] spawn BIS_fnc_traceBullets;};
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
  if (TextureHandling == 1) then {player setObjectTextureGlobal [0,TextureIdle];};
};
systemChat "Functions loaded.";

systemChat "Self scan complete. Press [Activate suit] to start.";

                       comment "Activation by object bracket.";
                       }, nil, 1.5, true, true, "", "true", 5, false, "", ""];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//--- Nanosuit removal tool.
//Removes all nanosuit functional from player. WARNING do not activate if players in air. Also removes all backend to save performance. Only thing left will be empty functions and variables that do nothing at this point.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
if (DisableScrollMenu == 0) then {removeallactions player;};

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
onEachFrame{};

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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
