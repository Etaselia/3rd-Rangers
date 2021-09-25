"
Not so brief classes overview.
Generally most classes have 4 various abilities. Exception of this rule is tactician and coordinator which essentially have 2 as they centered around certain concepts.
Each class utilize shared cooldown system which means that using one ability will disable all abilities for duration based on cooldown of used skill.
If ability have certain prolonged effect cooldown starts on activation. So for ability with 20 second cooldown and 10 seconds duration of effect cooldown will end 10 seconds after effect ends.

--Recon:
First type of weapon specialist. Extensively trained in inertia manipulation and basics of mater teleportation.
Can manipulate gun inertia to eliminate weapon sway and increase penetrating power of fired rounds. Additionally can teleport himself to achieve tactical advantage or avoid danger.
Primarily meant to use marksman and sniper rifles.
Skills:
Stabilize – Fully eliminates weapon sway for 10 seconds. Cooldown: 20 s.
Antimaterial rounds – Next 5 shots will have ballistic properties of 40mm APFSDS. Cooldown: 60 s.
Tactical teleport – Teleport within 200 meters onto any position within line of sight. Cooldown: 90 s.
Regroup – Teleport to closest ally not in vehicle and within 1 kilometer. Cooldown: 120 s.

--Gunner:
Second type of weapon specialist. Extensively trained in matter creation and basics of inertia.
Can increase gun inertia to significantly reduce recoil and create rounds for himself and his allies. 
Skills: 
Stabilize –  Significantly reduces recoil for 10 seconds. Cooldown: 30 s.
Explosive rounds –  20 next shots will have explosive effect of 20mm HE. Cooldown: 60 s.
Suppression mode –  Effectively lets you shoot without consuming ammo, auto-clear jams and cool your gun down. 20 second duration. Cooldown: 60 s.
Rearm / Rearm ally – Adds one or several mags to himself or ally. Amount of added mags depends on magazine size. Cooldown: 90/80 s.

--Medic:
Blood magic specialist. Can heal himself and allies or boost regeneration to make team invulnerable for short time. Revives himself if becomes unconscious for too long (once per 15 minutes).
Skills:
Heal / Self heal – Fully heal ally / himself. Cooldown: 30 s.
Mass heal – Heal all allies no matter how far. Cooldown: 75 s.
Uber regeneration – Make all allies invunerable for 15 seconds. Cooldown: 240 s.
Self revive – If medic in unconscious for more than 20 seconds tries to bring him back to consciousness. If it fails triggers self heal ability. Cooldown: 900 s.

--Coordinator:
Psionic cloning specialist. Summons controlled psi entities. Unfortunately they unfit for frontline combat and used as artillery operators. Have base mortars and missile system at his disposal.
ETA essentially acts as cooldown so he can’t call in another firemission until rounds arrived.
Instead of cooldowns he have limited supplies. Maximum of 12 mortar rounds and 6 missiles. Ordinance gets resupplied at rate of 1 mortar round every 100 seconds and missile every 200.
Skills:
AT missile – Tandem AT missile. Laser guided. ETA: 15 s.
HE missile – HE antipersonnel missile. Laser guided. ETA: 15 s.
Cluster missile – Cluster missile with large effective radius. Consumes 4 missile supplies. Laser guided. ETA: 20 s.
Mortar barrage –  Fire user picked amount of mortar rounds at lased location. ETA: 25 s.

--Tactician:
Displacement specialist. Can call in heavy assets but for limited amount of time after which they returned on base to resupply.
Skills:
HMG turret – Calls in .50 machinegun for 30 seconds. Cooldown: 60 s.
GMG turret – Calls in 30mm AGS-30 for 30 seconds. Cooldown: 80 s.
Autonomous HMG turret – Calls in autonomous .50 machinegun for 30 seconds. Cooldown: 100 s.
Air support mode – Calls in AH-6 Littlebird with 7x Hydra 70 and GAU-19 for 60 seconds. Tactician act as a pilot and then gets teleported to nearest ally similar to recon. Cooldown: 660 s.

--Demolisher:
Specialist on topic of pocket dimension storage, item teleportation and anything explosive. Calls in explosive weapons in his hands and explosive devices on observable battlefield.
Skills:
Telefrag – Teleports unpinned grenade to observable point within 300 meters. Cooldown: 20 s.
AT / HE launcher – Teleports AT4 HP/HEDP launcher in his hands. Cooldown: 60 s.
M32 MGL – Teleports M32 in hands while placing current weapon in pocket dimention. Weapon in pocet dimention gets full magazine and can be retrieved at any time. Cooldown: 60 s.
EXPLOSION – Act as grenade teleport but with GBU-12 :D. Renders user unconscious for 90 seconds. Cooldown: 180 s.
Return weapon – Returns weapon from pocket dimension. No cooldown.
"



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--Recon
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["Select recon", {
Comment "Common functions";
Comment "Cooldown timer function";
    fnc_class_system_wait = {
        params ["_WaitTime"];
      _WaitTime = _this select 0;

      _WaitTimeRound = (floor(_WaitTime / 10)) * 10;
      uiSleep (_WaitTime % 10);

      for "_i" from _WaitTimeRound to 10 step -10 do {
        systemChat ("CD time: " + str(_i) +" seconds.");
        uiSleep 10;
      };
      systemChat "Cooldown complete.";
    };

Comment "Prolonged ability hint";
    fnc_class_system_prolonged_abuility = {
      params ["_Duration"];
    _Duration = _this select 0;

    for "_i" from _Duration to 1 step -1 do {
      hintSilent formatText ["Time left: %1 s.", _i];
      uiSleep 1;
    };
    hint "Starting cooldown.";
    };

Comment "Ability aim helper system.";
    fnc_class_system_laser_aim = {
      params ["ClassSystemTargetFnc", "ClassSystemMaxRange", "ClassSystemIconColor"];
      ClassSystemTargetFnc = _this select 0;
      ClassSystemMaxRange = _this select 1;
      ClassSystemIconColor = _this select 2;

      onEachFrame {
        _ins = ((lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,ClassSystemMaxRange],vehicle player,objNull,true,1,"FIRE","NONE"]) select 0) select 0;
        if (count _ins > 0) then {
          drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', ClassSystemIconColor, ASLToAGL _ins, 1, 1, 0, "", 2, 0.05, 'PuristaMedium', 'center', false];
        };
      };

      removeAllActions player;
      player addAction ["<t color='#FFA500'>>>Confirm<t>", {_code = compile ClassSystemTargetFnc; call _code;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
      player addAction ["<t color='#FFA500'>Back<t>", {onEachFrame {}; [] call recon_menu;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    };
    
recon_menu = {
  removeAllActions player;
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Stabilize</t> <t color='#98ff98'>(20s)<t>", {[] call fnc_recon_stab;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Antimaterial rounds</t> <t color='#98ff98'>(60s)<t>", {[] call fnc_recon_AMR;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Tactical teleport</t> <t color='#98ff98'>(90s)<t>", {["[] call fnc_recon_TP;", 200, [0,1,1,1]] call fnc_class_system_laser_aim;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Regroup</t> <t color='#98ff98'>(120s)<t> ", {[] call fnc_recon_TpToAlly;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
};

Comment "Stabilize gun";
      fnc_recon_stab = {
        removeAllActions player;
          if (!isNil "MEH_NoSwayRecon") then {removeMissionEventHandler["EachFrame", MEH_NoSwayRecon];};
            MEH_NoSwayRecon = addMissionEventHandler ["EachFrame", {player setCustomAimCoef 0;}];
        [10] call fnc_class_system_prolonged_abuility;
          removeMissionEventHandler ["EachFrame", MEH_NoSwayRecon];
          player setCustomAimCoef 1;
        [10] call fnc_class_system_wait;
        [] call recon_menu;
      };

Comment "Antimaterial ammo";
      fnc_recon_AMR = {
        removeAllActions player;
          if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
          ReconShotsNumber = 5;
            FEH_missile = player addEventHandler ["fired", {
            _bullet = nearestObject [_this select 0,_this select 4];
            _bulletpos = getPosASL _bullet;
            _o = "B_40mm_APFSDS" createVehicle _bulletpos;
            _weapdir = player weaponDirection currentWeapon player;
            _dist = 11;
            _o setPosASL [
            (_bulletpos select 0) + (_weapdir select 0)*_dist,
            (_bulletpos select 1) + (_weapdir select 1)*_dist,
            (_bulletpos select 2) + (_weapdir select 2)*_dist
            ];
            _up = vectorUp _bullet;
            _o setVectorDirAndUp[_weapdir,_up];
            _o setVelocity velocity _bullet;
            deleteVehicle _bullet;
            ReconShotsNumber = ReconShotsNumber -1;
            if (ReconShotsNumber <= 0) then {
              player removeEventHandler["fired", FEH_missile];
              hint "Charged rounds depleted.";
            } else {
              hint formatText ["%1 Antimaterial rounds left.", ReconShotsNumber];
            };
            }];
          hint "5 Antimaterial rounds available.";
        [60] call fnc_class_system_wait;
        [] call recon_menu;
      };

Comment "Tactical teleport";
      fnc_recon_TP = {
          _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,500],vehicle player,objNull,true,1,"FIRE","NONE"];
          _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{500}];
        
          if (_cursor_distance > 200) exitWith {Hint "Maximum 200m distance exceeded."};
        removeAllActions player;
          onEachFrame {};
          player setPosASL (_ins select 0 select 0);
        [90] call fnc_class_system_wait;
        [] call recon_menu;
      };

Comment "Regroup";
      fnc_recon_TpToAlly = {
        ReconViableRegroupTargets = [];

        {
          if(!(_x in call BIS_fnc_listCuratorPlayers)) then {ReconViableRegroupTargets pushBack _x};
        } foreach (allPlayers - entities "HeadlessClient_F");

        ReconClosestAlly = (ReconViableRegroupTargets select 0);
        {
          if (((_x distance player) <= (ReconClosestAlly distance player)) and ((_x distance player)>1) and (isNull objectParent player)) then {
            ReconClosestAlly = _x;
          };
        } foreach ReconViableRegroupTargets;

        if (((ReconClosestAlly distance player) > 1000) or ((ReconClosestAlly distance player) < 1)) exitWith {Hint "No sutable aliies in 1000m radius."};

        removeAllActions player;
          player setPosASL (getPosASL ReconClosestAlly); 
        hint "Teleported";
        [120] call fnc_class_system_wait;
        [] call recon_menu;
      };
  [] call recon_menu;
  ClassSystemNonMedicCheck = true;
}, nil, 1.5, true, false, "", "true", 50, false, "", ""];


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--gunner
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["Select gunner", {
Comment "Common functions";
Comment "Cooldown timer function";
    fnc_class_system_wait = {
        params ["_WaitTime"];
      _WaitTime = _this select 0;

      _WaitTimeRound = (floor(_WaitTime / 10)) * 10;
      uiSleep (_WaitTime % 10);

      for "_i" from _WaitTimeRound to 10 step -10 do {
        systemChat ("CD time: " + str(_i) +" seconds.");
        uiSleep 10;
      };
      systemChat "Cooldown complete.";
    };

Comment "Prolonged ability hint";
    fnc_class_system_prolonged_abuility = {
      params ["_Duration"];
    _Duration = _this select 0;

    for "_i" from _Duration to 1 step -1 do {
      hintSilent formatText ["Time left: %1 s.", _i];
      uiSleep 1;
    };
    hint "Starting cooldown.";
    };

gunner_menu = {
  removeAllActions player;
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Stabilize</t> <t color='#98ff98'>(30s)<t>", {[] call fnc_gunner_stab;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Explosive rounds</t> <t color='#98ff98'>(60s)<t>", {[] call fnc_gunner_HER;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Suppression mode</t> <t color='#98ff98'>(60s)<t>", {[] call fnc_gunner_SUP;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Rearm</t> <t color='#98ff98'>(90s)<t> ", {[player] call fnc_gunner_RES;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Rearm ally</t> <t color='#98ff98'>(80s)<t> ", {[CursorTarget] call fnc_gunner_RES;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
};

Comment "Stabilize recoil";
      fnc_gunner_stab = {
        removeAllActions player;
          player setUnitRecoilCoefficient 0.2;
        [10] call fnc_class_system_prolonged_abuility;
          player setUnitRecoilCoefficient 1;
        [20] call fnc_class_system_wait;
        [] call gunner_menu;
      };

Comment "Explosive rounds";
      fnc_gunner_HER = {
        removeAllActions player;
          if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
          ReconShotsNumber = 20;
            FEH_missile = player addEventHandler ["fired", {
            _bullet = nearestObject [_this select 0,_this select 4];
            _bulletpos = getPosASL _bullet;
            _o = "B_20mm" createVehicle _bulletpos;
            _weapdir = player weaponDirection currentWeapon player;
            _dist = 11;
            _o setPosASL [
            (_bulletpos select 0) + (_weapdir select 0)*_dist,
            (_bulletpos select 1) + (_weapdir select 1)*_dist,
            (_bulletpos select 2) + (_weapdir select 2)*_dist
            ];
            _up = vectorUp _bullet;
            _o setVectorDirAndUp[_weapdir,_up];
            _o setVelocity velocity _bullet;
            deleteVehicle _bullet;
            ReconShotsNumber = ReconShotsNumber -1;
            if (ReconShotsNumber <= 0) then {
              player removeEventHandler["fired", FEH_missile];
              hint "Charged rounds depleted.";
            } else {
              hint formatText ["%1 Explosive rounds left.", ReconShotsNumber];
            };
            }];
          hint "20 Explosive rounds available.";
        [60] call fnc_class_system_wait;
        [] call gunner_menu;
      };

Comment "Suppression mode";
      fnc_gunner_SUP = {
        removeAllActions player;
          if (!isNil "FEH_Brrrrrrrrrrt") then {player removeEventHandler["fired", FEH_Brrrrrrrrrrt];};
          FEH_Brrrrrrrrrrt = player addEventHandler ["fired", {
            player setAmmo [primaryWeapon player, ((player ammo primaryWeapon player)+1)];
            [player, currentWeapon player, -15000] call ace_overheating_fnc_updateTemperature;
          }];

        	onEachFrame {
        		[player, currentWeapon player, true] call ace_overheating_fnc_clearJam;
	        	[] call dzn_EJAM_fnc_setUnjammed;
        	};

        [20] call fnc_class_system_prolonged_abuility;
          player removeEventHandler["fired", FEH_Brrrrrrrrrrt];
          onEachFrame {};
        [40] call fnc_class_system_wait;
        [] call gunner_menu;
      };

Comment "Rearm";
      fnc_gunner_RES = {
        params ["_ResTargetUnit"];
        _ResTargetUnit = _this select 0;

        if (isNull _ResTargetUnit) exitWith {Hint "No target. Command canceled.";};
        _GunnerMag = primaryWeaponMagazine _ResTargetUnit;
        if (((_GunnerMag select 0) == "rhsusf_mag_6Rnd_M433_HEDP") or ((_GunnerMag select 0) == "rhsusf_40mm_HE") or ((_GunnerMag select 0) == "rhsusf_mag_6Rnd_M397_HET")) exitWith {Hint "Clever. But you can't resupply special weapons.";};
        if (count _GunnerMag > 0) then {
          removeAllActions player;

            _AmmoTemp = (_ResTargetUnit ammo primaryWeapon _ResTargetUnit);
            _ResTargetUnit setAmmo [primaryWeapon _ResTargetUnit, 1000];

            if ((_ResTargetUnit ammo primaryWeapon _ResTargetUnit) > 50) then {
              _ResTargetUnit addMagazine (_GunnerMag select 0);
            } else {
              if ((_ResTargetUnit ammo primaryWeapon _ResTargetUnit) > 35) then {
                _ResTargetUnit addMagazines [(_GunnerMag select 0), 2];
              } else {
                _ResTargetUnit addMagazines [(_GunnerMag select 0), 3];
              };              
            };

            _ResTargetUnit setAmmo [primaryWeapon _ResTargetUnit, _AmmoTemp];
          [90] call fnc_class_system_wait;
          [] call gunner_menu;
        } else {
	        if (primaryWeapon _ResTargetUnit != "") then {
		        hint "No magazine in weapon.";
	        } else {
		        if (_ResTargetUnit == player) then {hint "How did you managed to lose your weapon???";} else {hint "Tell him he's retard.";};
	        };
        };
      };
  [] call gunner_menu;
  ClassSystemNonMedicCheck = true;
}, nil, 1.5, true, false, "", "true", 50, false, "", ""];


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--medic
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["Select medic", {
Comment "Common functions";
Comment "Cooldown timer function";
    fnc_class_system_wait = {
        params ["_WaitTime"];
      _WaitTime = _this select 0;

      _WaitTimeRound = (floor(_WaitTime / 10)) * 10;
      uiSleep (_WaitTime % 10);

      for "_i" from _WaitTimeRound to 10 step -10 do {
        systemChat ("CD time: " + str(_i) +" seconds.");
        uiSleep 10;
      };
      systemChat "Cooldown complete.";
    };

Comment "Prolonged ability hint";
    fnc_class_system_prolonged_abuility = {
      params ["_Duration"];
    _Duration = _this select 0;

    for "_i" from _Duration to 1 step -1 do {
      hintSilent formatText ["Time left: %1 s.", _i];
      uiSleep 1;
    };
    hint "Starting cooldown.";
    };

medic_menu = {
  removeAllActions player;
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Heal</t> <t color='#98ff98'>(30s)<t>", {if (isNull CursorTarget) then {Hint "No target. Command canceled.";} else {[name CursorTarget] call fnc_medic_heal;};}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Self heal</t> <t color='#98ff98'>(30s)<t>", {[false] call fnc_medic_self_heal;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Mass Heal</t> <t color='#98ff98'>(75s)<t>", {[] call fnc_medic_mass_heal;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Uber regeneration</t> <t color='#98ff98'>(240s)<t> ", {[] call fnc_medic_regen;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Self revive (Passive)</t> <t color='#98ff98'>(900s)(20s delay)<t>", {hint "This is passive ability. Duh.";}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
};

Comment "Heal";
      fnc_medic_heal = {
        params["_playerName"];
        _playerName = _this select 0;
        
        removeAllActions player;
        
        {
            if ( ( name _x ) == _playerName ) then
            {
              [[( name _x )],{
                {[player] call ace_medical_treatment_fnc_fullHealLocal;} remoteExec ["bis_fnc_call", 0];
              }] remoteExec ["spawn",_x];
            };
        } forEach allPlayers;

          hint "Healed";
        [30] call fnc_class_system_wait;
        [] call medic_menu;
      };

Comment "Self Heal";
      fnc_medic_self_heal = {
      params ["_isAutoTrigger"];
      _isAutoTrigger = _this select 0;
        removeAllActions player;
          {[player] call ace_medical_treatment_fnc_fullHealLocal;} remoteExec ["bis_fnc_call", 0];
          if (_isAutoTrigger) then {hint "Self heal was triggered. 15 minutes cooldown started.";} else {hint "Healed";};
        [30] call fnc_class_system_wait;
        [] call medic_menu;
      };

Comment "Mass Heal";
      fnc_medic_mass_heal = {
        removeAllActions player;
        
        {
          [[( name _x )],{
            {[player] call ace_medical_treatment_fnc_fullHealLocal;} remoteExec ["bis_fnc_call", 0];
          }] remoteExec ["spawn",_x];
        } forEach allPlayers;

          hint "Everyone healed";
        [75] call fnc_class_system_wait;
        [] call medic_menu;
      };

Comment "Uber regeneration";
      fnc_medic_regen = {
        removeAllActions player;
          MedicViableHealTargets = [];

          {
            if(!(_x in call BIS_fnc_listCuratorPlayers)) then {MedicViableHealTargets pushBack _x};
          } foreach (allPlayers - entities "HeadlessClient_F");

          {
            _x allowDamage false;
          } foreach MedicViableHealTargets;
        [15] call fnc_class_system_prolonged_abuility;
          {
            _x allowDamage true;
          } foreach MedicViableHealTargets;
        [225] call fnc_class_system_wait;
        [] call medic_menu;
      };

Comment "Self revive (Passive)";
      fnc_medic_self_revive = {
        if (player getVariable ["ACE_isUnconscious", false]) then {
        if (ClassSystemNonMedicCheck) exitWith {ClassSystemSelfReviveNotActive = true;};
          uiSleep 20;
          [player, false] call ace_medical_fnc_setUnconscious;
          uiSleep 1;
          if (!(player getVariable ["ACE_isUnconscious", false])) exitWith {};
          [true] call fnc_medic_self_heal;
          uiSleep 900;
        if (ClassSystemNonMedicCheck) exitWith {ClassSystemSelfReviveNotActive = true;};
          hint "Self revive available.";
          [] call fnc_medic_self_revive;
        } else {
          if (ClassSystemNonMedicCheck) exitWith {ClassSystemSelfReviveNotActive = true; hint "Class switch detected. Passive self revive deactivated.";};
          uiSleep 1;
          [] call fnc_medic_self_revive;
        };
      };
  [] call medic_menu;
  ClassSystemNonMedicCheck = false;
  if(isNil "ClassSystemSelfReviveActive") then {ClassSystemSelfReviveNotActive = true};
  if(ClassSystemSelfReviveNotActive) then {ClassSystemSelfReviveNotActive = false; hint "Passive self revive active."; [] call fnc_medic_self_revive;};
}, nil, 1.5, true, false, "", "true", 50, false, "", ""];


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--coordinator
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["Select coordinator", {

coordinator_menu = {
  removeAllActions player; 
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>AT Missile</t> <t color='#98ff98'>(ETA:15s)<t>", {[laserTarget player, "M_Scalpel_AT", 333, 5000] call fnc_coordinator_GuidedOrdnanceCore;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>HE Missile</t> <t color='#98ff98'>(ETA:15s)<t>", {[laserTarget player, "M_Titan_AP", 333, 5000] call fnc_coordinator_GuidedOrdnanceCore;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Cluster missile</t> <t color='#98ff98'>(ETA:20s)<t> ", {[laserTarget player, "ammo_Missile_Cruise_01_Cluster", 250, 5000] call fnc_coordinator_GuidedOrdnanceCore;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Mortar barrage</t> <t color='#98ff98'>(ETA:25s)<t>", {[] call fnc_coordinator_mortar_menu;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
};

Comment "Ammo system";
      MortarCounter = 12;
      MissileCounter = 6;
      hint formatText ["Mortar rounds: %1%2Missiles: %3", MortarCounter, lineBreak, MissileCounter];

      if(isNil "ClassSystemCoordinatorMortarRegen") then {ClassSystemCoordinatorMortarRegen = false};
      if(isNil "ClassSystemCoordinatorMissileRegen") then {ClassSystemCoordinatorMissileRegen = false};

      fnc_coordinator_mortar_rounds = {
        if (MortarCounter <12) then {
          ClassSystemCoordinatorMortarRegen = true;
          UiSleep 100;
          MortarCounter = MortarCounter + 1;
          hint formatText ["Mortar rounds: %1%2Missiles: %3", MortarCounter, lineBreak, MissileCounter];
          [] call fnc_coordinator_mortar_rounds;
        };
        ClassSystemCoordinatorMortarRegen = false;
      };
      fnc_coordinator_missile_rounds = {
        if (MissileCounter <6) then {
          ClassSystemCoordinatorMissileRegen = true;
          UiSleep 200;
          MissileCounter = MissileCounter + 1;
          hint formatText ["Mortar rounds: %1%2Missiles: %3", MortarCounter, lineBreak, MissileCounter];
          [] call fnc_coordinator_missile_rounds;
        };
        ClassSystemCoordinatorMissileRegen = false;
      };

Comment "Ordnance spawn system";
      fnc_coordinator_GuidedOrdnanceCore = {
      params ["_LaserDes", "_MCSAmmoClass", "_MCSAmmoSpeed", "_MCSHeightOffset"];
        if (isNull _LaserDes) exitWith {hint "Laser Designator inactive. Action canceled."};
        if (MissileCounter <= 0) exitWith {hint "Not enough ammo."};
        if ((_MCSAmmoClass == "ammo_Missile_Cruise_01_Cluster") and (MissileCounter <= 3)) exitWith {hint "Not enough ammo."};
        removeAllActions player; 
        hint "Missile incoming";

        _MCSOrdStartPos = [(getPosASL _LaserDes)select 0,(getPosASL _LaserDes)select 1,((getPosASL _LaserDes)select 2)+_MCSHeightOffset];

        [_MCSOrdStartPos, _MCSAmmoClass, _LaserDes, _MCSAmmoSpeed, false, [0, 0, 0], 10, "", false] remoteExec ["BIS_fnc_EXP_camp_guidedProjectile", 2]; 
        
        if (!ClassSystemCoordinatorMissileRegen) then {[] spawn {[] call fnc_coordinator_missile_rounds;};};

        if (_MCSAmmoClass == "ammo_Missile_Cruise_01_Cluster") then {
          MissileCounter = MissileCounter - 4; uiSleep 20; [] call coordinator_menu;
        } else {
          MissileCounter = MissileCounter - 1; uiSleep 15; [] call coordinator_menu;
        };

        hint formatText ["Mortar rounds: %1%2Missiles: %3", MortarCounter, lineBreak, MissileCounter];
      };
  
Comment "Mortar barrage";
      fnc_coordinator_mortar_menu = {
        removeAllActions player;

        player addAction [">>Back", {[] call coordinator_menu;}];
        if (MortarCounter >= 1) then {player addAction ["1", {[1] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 2) then {player addAction ["2", {[2] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 3) then {player addAction ["3", {[3] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 4) then {player addAction ["4", {[4] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 5) then {player addAction ["5", {[5] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 6) then {player addAction ["6", {[6] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 7) then {player addAction ["7", {[7] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 8) then {player addAction ["8", {[8] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 9) then {player addAction ["9", {[9] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 10) then {player addAction ["10", {[10] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 11) then {player addAction ["11", {[11] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
        if (MortarCounter >= 12) then {player addAction ["12", {[12] call fnc_coordinator_mortar;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];};
      };

      fnc_coordinator_mortar = {
      params ["_Rounds"];
        if (isNull laserTarget player) exitWith {hint "Laser Designator inactive. Action canceled."};
        
        removeAllActions player;
        _MCSHeightOffset = 3250;
        MortOrdStartPos = getPosATL (laserTarget player);
        hint "Rounds incoming.";
        uiSleep 1;

        for "_i" from 1 to _Rounds step 1 do {
         _MortarPos = [(MortOrdStartPos select 0) + (random [-50, 0, 50]), (MortOrdStartPos select 1) + (random [-50, 0, 50]), (MortOrdStartPos select 2) + _MCSHeightOffset];  comment"+ (random [-30, 0, 30])";
         _MoShell = createVehicle ["Sh_82mm_AMOS",_MortarPos,[],0,"CAN_COLLIDE"];
         _MoShell setPosATL _MortarPos;
         _MoShell setVelocity [0,0,-10];
         uiSleep 1;
         MortarCounter = MortarCounter - 1;
         hint formatText ["Mortar rounds: %1%2Missiles: %3", MortarCounter, lineBreak, MissileCounter];
        };
        if (!ClassSystemCoordinatorMortarRegen) then {[] spawn {[] call fnc_coordinator_mortar_rounds;};};
        uiSleep 25;
        [] call coordinator_menu;
      };
[] call coordinator_menu;
ClassSystemNonMedicCheck = true;
}, nil, 1.5, true, false, "", "true", 50, false, "", ""];


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--tactician
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["Select tactician", {
Comment "Common functions";
Comment "Cooldown timer function";
    fnc_class_system_wait = {
        params ["_WaitTime"];
      _WaitTime = _this select 0;

      _WaitTimeRound = (floor(_WaitTime / 10)) * 10;
      uiSleep (_WaitTime % 10);

      for "_i" from _WaitTimeRound to 10 step -10 do {
        systemChat ("CD time: " + str(_i) +" seconds.");
        uiSleep 10;
      };
      systemChat "Cooldown complete.";
    };

Comment "Prolonged ability hint";
    fnc_class_system_prolonged_abuility = {
      params ["_Duration"];
    _Duration = _this select 0;

    for "_i" from _Duration to 1 step -1 do {
      hintSilent formatText ["Time left: %1 s.", _i];
      uiSleep 1;
    };
    hint "Starting cooldown.";
    };

tactician_menu = {
  removeAllActions player;
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>HMG Turret</t> <t color='#98ff98'>(60s)<t>", {[] call fnc_tactician_HMG;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>GMG Turret</t> <t color='#98ff98'>(80s)<t>", {[] call fnc_tactician_GMG;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Autonomous HMG</t> <t color='#98ff98'>(100s)<t>", {[] call fnc_tactician_AHMG;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Air support mode</t> <t color='#98ff98'>(660s)<t> ", {[] call fnc_tactician_Heli;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
};
Comment "HMG Turret";
      fnc_tactician_HMG = {
        removeAllActions player;
          _TurretPos = player modelToWorld [0,1,0];
          _Turret = createVehicle ["I_HMG_02_F",_TurretPos,[],0,"CAN_COLLIDE"];
          _Turret setDir direction player;
        [30] call fnc_class_system_prolonged_abuility;
          {moveOut _x;} forEach crew _Turret;
          deleteVehicle _Turret;
        [30] call fnc_class_system_wait;
        [] call tactician_menu;
      };
Comment "GMG Turret";
      fnc_tactician_GMG = {
        removeAllActions player;
          _TurretPos = player modelToWorld [0,1,0];
          _Turret = createVehicle ["RHS_AGS30_TriPod_MSV",_TurretPos,[],0,"CAN_COLLIDE"];
          _Turret setDir direction player;
        [30] call fnc_class_system_prolonged_abuility;
          {moveOut _x;} forEach crew _Turret;
          deleteVehicle _Turret;
        [50] call fnc_class_system_wait;
        [] call tactician_menu;
      };
Comment "Autonomous HMG";
      fnc_tactician_AHMG = {
        removeAllActions player;
          _TurretPos = player modelToWorld [0,1,0];
          _Turret = createVehicle ["B_HMG_01_A_F",_TurretPos,[],0,"CAN_COLLIDE"];
          _Turret setDir direction player;
          createVehicleCrew _Turret;
          _Turret allowCrewInImmobile true;
        [30] call fnc_class_system_prolonged_abuility;
          {moveOut _x;} forEach crew _Turret;
          deleteVehicle _Turret;
        [70] call fnc_class_system_wait;
        [] call tactician_menu;
      };
Comment "Air support mode";
      fnc_tactician_Heli = {
        removeAllActions player;
          _HeliPos = player modelToWorld [0,0,35];
          TacticianSummonedHeli = createVehicle ["RHS_MELB_AH6M",_HeliPos,[],0,"FLY"];
          TacticianSummonedHeli setDir direction player;
          TacticianSummonedHeli setObjectTextureGlobal [0,"Psi.jpg"];

          {
            TacticianSummonedHeli setPylonLoadout [1, "rhsusf_mag_gau19_melb_left"];
            TacticianSummonedHeli setPylonLoadout [2, ""];
            TacticianSummonedHeli setPylonLoadout [3, ""];
            TacticianSummonedHeli setPylonLoadout [4, "rhs_mag_M229_7"];
            TacticianSummonedHeli setAmmoOnPylon [1, 1500]; TacticianSummonedHeli setAmmoOnPylon [2, 0]; TacticianSummonedHeli setAmmoOnPylon [3, 0]; TacticianSummonedHeli setAmmoOnPylon [4, 7];
          } remoteExec ["bis_fnc_call", 0];

          player moveInAny TacticianSummonedHeli;
        [60] call fnc_class_system_prolonged_abuility;
          {moveOut _x;} forEach crew TacticianSummonedHeli;

        TacticianViableReturnTargets = [];

          {
            if(!(_x in call BIS_fnc_listCuratorPlayers)) then {TacticianViableReturnTargets pushBack _x};
          } foreach (allPlayers - entities "HeadlessClient_F");

          TacticianClosestAlly = (TacticianViableReturnTargets select 0);
          {
            if (((_x distance player) <= (TacticianClosestAlly distance player)) and ((_x distance player)>1) and (isNull objectParent player)) then {
              TacticianClosestAlly = _x;
            };
          } foreach TacticianViableReturnTargets;

          if (((TacticianClosestAlly distance player) > 1000) or ((TacticianClosestAlly distance player) < 1)) then {
            player setPosATL [(getPosATL player)select 0, (getPosATL player)select 1, 0];
          } else {
            player setPosASL (getPosASL TacticianClosestAlly);
          };

          player setVelocity [0,0,0];
          deleteVehicle TacticianSummonedHeli;

        [600] call fnc_class_system_wait;
        [] call tactician_menu;
      };
  [] call tactician_menu;
  ClassSystemNonMedicCheck = true;
}, nil, 1.5, true, false, "", "true", 50, false, "", ""];


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//--demolisher
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["Select demolisher", {
Comment "Common functions";
Comment "Cooldown timer function";
    fnc_class_system_wait = {
        params ["_WaitTime"];
      _WaitTime = _this select 0;

      _WaitTimeRound = (floor(_WaitTime / 10)) * 10;
      uiSleep (_WaitTime % 10);

      for "_i" from _WaitTimeRound to 10 step -10 do {
        systemChat ("CD time: " + str(_i) +" seconds.");
        uiSleep 10;
      };
      systemChat "Cooldown complete.";
    };

Comment "Prolonged ability hint";
    fnc_class_system_prolonged_abuility = {
      params ["_Duration"];
    _Duration = _this select 0;

    for "_i" from _Duration to 1 step -1 do {
      hintSilent formatText ["Time left: %1 s.", _i];
      uiSleep 1;
    };
    hint "Starting cooldown.";
    };

Comment "Ability aim helper system.";
    fnc_class_system_laser_aim = {
      params ["ClassSystemTargetFnc", "ClassSystemMaxRange", "ClassSystemIconColor"];
      ClassSystemTargetFnc = _this select 0;
      ClassSystemMaxRange = _this select 1;
      ClassSystemIconColor = _this select 2;

      onEachFrame {
        _ins = ((lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,ClassSystemMaxRange],vehicle player,objNull,true,1,"FIRE","NONE"]) select 0) select 0;
        if (count _ins > 0) then {
          drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', ClassSystemIconColor, ASLToAGL _ins, 1, 1, 0, "", 2, 0.05, 'PuristaMedium', 'center', false];
        };
      };

      removeAllActions player;
      player addAction ["<t color='#FFA500'>>>Confirm<t>", {_code = compile ClassSystemTargetFnc; call _code;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
      player addAction ["<t color='#FFA500'>Back<t>", {onEachFrame {}; [] call demolisher_menu;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    };

demolisher_menu = {
  removeAllActions player;
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>Telefrag</t> <t color='#98ff98'>(20s)<t>", {["[] call fnc_demolisher_grenade;", 300, [0,1,1,1]] call fnc_class_system_laser_aim;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>AT launcher</t> <t color='#98ff98'>(60s)<t>", {[] call fnc_demolisher_AT_launcher;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>HE launcher</t> <t color='#98ff98'>(60s)<t>", {[] call fnc_demolisher_HE_launcher;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FFA500'>Skill:<t> <t color='#FFFFFF'>M32 MGL</t> <t color='#98ff98'>(60s)<t> ", {[] call fnc_demolisher_grenade_launcher;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#FF0000'>Skill:<t> <t color='#FFFFFF'>EXPLOSION</t> <t color='#98ff98'>(180s)<t> ", {["[] call fnc_demolisher_explosion;", 5000, [1,0,0,1]] call fnc_class_system_laser_aim;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
    player addAction ["<t color='#98ff98'>Pocket:<t> <t color='#FFFFFF'>Return weapon</t>", {[] call fnc_demolisher_return_weapon;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
};

Comment "Teleport grenade";
      fnc_demolisher_grenade = {
          _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,500],vehicle player,objNull,true,1,"FIRE","NONE"];
          _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{500}];
        
          if (_cursor_distance > 300) exitWith {Hint "Maximum 300m distance exceeded."};
        removeAllActions player;
          onEachFrame {}; 
          _Position = ASLToATL (_ins select 0 select 0);
          createVehicle ['GrenadeHand', _Position,[], 0, 'CAN_COLLIDE'];
          hint "Grenade out";
        [20] call fnc_class_system_wait;
        [] call demolisher_menu;
      };

Comment "AT launcher";
      fnc_demolisher_AT_launcher = {
          if ((secondaryWeapon player != "") and !("used" in secondaryWeapon player)) exitWith {hint "You already have laucher."};
        removeAllActions player;
          player addWeapon "rhs_weap_M136_hp";
          player selectWeapon "rhs_weap_M136_hp";
          hint "Rocket launcher.";
        [60] call fnc_class_system_wait;
        [] call demolisher_menu;
      };

Comment "HE launcher";
      fnc_demolisher_HE_launcher = {
          if ((secondaryWeapon player != "") and !("used" in secondaryWeapon player)) exitWith {hint "You already have laucher."};
        removeAllActions player;
          player addWeapon "rhs_weap_M136_hedp";
          player selectWeapon "rhs_weap_M136_hedp";
          hint "Rocket launcher.";
        [60] call fnc_class_system_wait;
        [] call demolisher_menu;
      };

Comment "M32 MGL";
      fnc_demolisher_grenade_launcher = {
        if (primaryWeapon player == "rhs_weap_m32") exitWith {hint "Return your weapon first."};
        removeAllActions player;
          if (primaryWeapon player != "") then {
            ClassSystemSavedWeapon = primaryWeapon player;
            ClassSystemSavedWeaponAttachments = primaryWeaponItems player;
            ClassSystemSavedWeaponMags = primaryWeaponMagazine player;
          } else {
            hint "No weapon to save."
          };

          player addWeapon "rhs_weap_m32";
          player selectWeapon "rhs_weap_m32";
          player addPrimaryWeaponItem "rhsusf_mag_6Rnd_M441_HE";
          hint "Grenade launcher.";

          player addAction ["<t color='#98ff98'>Pocket:<t> <t color='#FFFFFF'>Return weapon</t>", {[] call fnc_demolisher_return_weapon;}, nil, 1.5, true, true, "", "true", 50, false, "", ""];
        
        [60] call fnc_class_system_wait;
        [] call demolisher_menu;
      };

      fnc_demolisher_return_weapon = {
        if(isNil "ClassSystemSavedWeapon") then {ClassSystemSavedWeapon = ""};
        if (ClassSystemSavedWeapon == "") exitWith {hint "No weapon in pocket."};
        player addWeapon ClassSystemSavedWeapon;
        player selectWeapon ClassSystemSavedWeapon;

	      {
          player addPrimaryWeaponItem _x;
        } forEach ClassSystemSavedWeaponAttachments;

        if (count ClassSystemSavedWeaponMags > 0) then {
          {
            player addItem _x;
          } forEach ClassSystemSavedWeaponMags;
        };

        hint "Weapon returned.";

        ClassSystemSavedWeapon = "";
        ClassSystemSavedWeaponAttachments = [];
        ClassSystemSavedWeaponMags = [];
      };

Comment "EXPLOSION";
      fnc_demolisher_explosion = {
          _ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
          _cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyepos player)},{5000}];
        
        if (_cursor_distance >= 5000) exitWith {Hint "Maximum technical distance exceeded."};

        removeAllActions player;
          _Position = ASLToATL (_ins select 0 select 0);
          hint "GBU-12 out";
          onEachFrame {}; 
          {player say3D [ "SLEClassSystemExplosionSound", 500, 1];} remoteExec ["bis_fnc_call", 0];

          uiSleep 2;
          createVehicle ['Bo_GBU12_LGB', _Position,[], 0, 'CAN_COLLIDE'];

          uiSleep 2;
          [player, true, 90, true] call ace_medical_fnc_setUnconscious;

        [180] call fnc_class_system_wait;
        [] call demolisher_menu;
      };

  [] call demolisher_menu;
  ClassSystemNonMedicCheck = true;
}, nil, 1.5, true, false, "", "true", 50, false, "", ""];