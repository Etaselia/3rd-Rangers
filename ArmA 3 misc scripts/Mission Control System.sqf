//--- Spawn and Mission Control System.
//Menu layout can be changed relatively easy and if you have issues you can contact SLE for explanation.
//Squads can be changed in corresponding functions.
//MCStemp menu meant to be used in SLE's operations and can be fully rewritten or deleted.
//Also Go UP function very useful to spawn AI on Line of sight. Just don't forget parachute. Or godmode.
//WARNING Global (all players) do not influence players with access to Zeus interface. To make sure there's only one Zeus use "List curators [Debug]" option in switch menu. And punch Eta if he'll give himself Zeus and blow players cover.
//Now features most useful parts (SLE's opinion) of J-Wolf Admin menu. Unfortunately, he was banned and script was removed from public access because apparently some fucks wreaked havoc on official Zeus servers with that menu (when official servers had debug console). I added only utilities that duplicate and expand Zeus features so you won't need to switch between player and Zeus menu constantly for some common interactions. Some things were overlooked. For example, serverwide draw distance because we already have CH view distance. Also if you want original script you may try to google it or ask me to send you a copy. JAM part not meant to be edited because of complexity nor it need to be because of universality. If you only need MCS - copy code until JAM PORT section.

//todo:
//make target vehicle remote control.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
comment "Activation by static Eden object.";
this addAction ["<t>Activate MCS+JAM v1.9 (Zeus access only)</t>", {

comment "If zeus check.";
if (player in call BIS_fnc_listCuratorPlayers) then {

comment "Var.";
ArtyGroup1 = [];
ArtyGroup2 = [];
ArtyGroup3 = [];
ArtyGroup4 = [];
ArtyGroup5 = [];
MCSTargetOverride = "";

player addAction ["<t color='#808080'>>>Enable MCS</t>", {[] call SLE_menu;}];

comment "---------------------------------------------------------------------------------";
comment "----------------------------------=-Main menu-=----------------------------------";
comment "---------------------------------------------------------------------------------";
SLE_menu = {
removeallactions player;
player addAction ["<t>TP</t>", {(vehicle player) setPos (screenToWorld [0.5, 0.5])}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#FF0000'>Go UP</t>", {_z = getpos player select 2; player setpos [getpos player select 0,getpos player select 1,_z+2000];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#808080'>Disable menu</t>", {removeallactions player; player addAction ["<t color='#808080'>>>Enable</t>", {[] call SLE_menu;}];}];
player addAction ["<t>>>AI spawn LOS</t>", {[] call LOS_menu;}];
player addAction ["<t>>>AI spawn Beacon</t>", {[] call BCL_menu;}];
player addAction ["<t>>>Switches (God,AI-ignore,Wraith)</t>", {[] call SWC_menu;}];
player addAction [">>JAM: <t color='#42D6FC'>Ported </t><t color='#ff6600'>scripts</t>", {[] call JAM_fusion_menu;}];
player addAction ["<t>>>Ordinance support</t>", {[] call Support_Menu;}];
player addAction ["<t>>>Misc menu</t>", {[] call Misc_menu;}];
player addAction ["<t>>>MCS temporary</t>", {[] call MCS_temp_menu;}];
player addAction ["<t>>Arsenal</t>", {["Open",true] spawn BIS_fnc_arsenal}];
};

comment "---------------------------------------------------------------------------------";
comment "--------------------------=-Line of sight spawn menu-=---------------------------";
comment "---------------------------------------------------------------------------------";
LOS_menu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu;}];
player addAction ["<t>TP</t>", {(vehicle player) setPos (screenToWorld [0.5, 0.5])}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#FF0000'>Go UP</t>", {_z = getpos player select 2; player setpos [getpos player select 0,getpos player select 1,_z+2000];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Rifelman x3 Spawn(L)</t>", {[] call LOS_MEAT3;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Rifelman x6 Spawn(L)</t>", {[] call LOS_MEAT6;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Weapon squad Spawn(L)</t>", {[] call LOS_ULT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>AT team Spawn(L)</t>", {[] call LOS_AT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>MG team Spawn(L)</t>", {[] call LOS_AR;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Devastators Spawn(L)</t>", {[] call LOS_DEV;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Germans x5 Spawn(L)</t>", {[] call LOS_Germans;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Soviet x10 Spawn(L)</t>", {[] call LOS_Soviet;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Glorious T-34-85 Spawn(L)</t>", {[] call LOS_Soviet_Tonk;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

comment "---------------------------------------------------------------------------------";
comment "-----------------------------=-Beacon spawn menu-=-------------------------------";
comment "---------------------------------------------------------------------------------";
BCL_menu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu;}];
player addAction ["<t>Rifelman x3 Spawn(B)</t>", {[] call BCN_MEAT3;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Rifelman x6 Spawn(B)</t>", {[] call BCN_MEAT6;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Weapon squad Spawn(B)</t>", {[] call BCN_ULT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>AT team Spawn(B)</t>", {[] call BCN_AT;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>MG team Spawn(B)</t>", {[] call BCN_AR;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Devastators Spawn(B)</t>", {[] call BCN_DEV;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

comment "---------------------------------------------------------------------------------";
comment "-------------------------------=-Switches menu-=---------------------------------";
comment "---------------------------------------------------------------------------------";
SWC_menu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu;}];
player addAction ["<t>Zeus Fast movement on/off</t>", {if(isNil "GOFAST") then {GOFAST = 0}; if (GOFAST == 0) then{GOFAST = 1; hintSilent "Fast movement ON"; [] call Speed_repeater;}else{GOFAST = 0; player setAnimSpeedCoef 1; hintSilent "Fast movement OFF";};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Zeus AI ignore on/off</t>", {if(isNil "AiIgn") then {AiIgn = 0}; if (AiIgn == 0) then{AiIgn = 1; player setCaptive true; hintSilent "AI Ignore ON";}else{AiIgn = 0; player setCaptive false; hintSilent "AI Ignore OFF";};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Zeus Godmode on/off</t>", {if(isNil "GodMD") then {GodMD = 0}; if (GodMD == 0) then{GodMD = 1; player allowDamage false; hintSilent "God ON";}else{GodMD = 0; player allowDamage true; hintSilent "God OFF";};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Zeus Wraith on/off</t>", {if(isNil "WrthMP") then {WrthMP = 0}; if (WrthMP == 0) then{WrthMP = 1; [player] remoteExec["hideobject",0]; hintSilent "Wraith ON";}else{WrthMP = 0; [player,false] remoteExec["hideobject",0]; hintSilent "Wraith OFF";};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#e7ffc9'>Players AI ignore on/off</t>", {[] call PlayersAIIngnore;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#e7ffc9'>Players Godmode on/off</t>", {[] call PlayersGodmode;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#e7ffc9'>Players AI ignore on [debug for late joiners]</t>", {AiIgnMP = 1; {{if(!(_x in call BIS_fnc_listCuratorPlayers)) then {_x setCaptive true;}} forEach allPlayers;} remoteExec ["bis_fnc_call", 0]; hintSilent "Players AI ignore force ON";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#e7ffc9'>Players Godmode on [debug for late joiners]</t>", {GodMDMP = 1; {{if(!(_x in call BIS_fnc_listCuratorPlayers)) then {_x allowDamage false;}} forEach allPlayers;} remoteExec ["bis_fnc_call", 0]; hintSilent "Players Godmode force ON";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Fast movement multiplier (setting)</t>", {[] call FAF_setting_menu;}];
player addAction ["<t>List curators [Debug]</t>", {hintSilent formatText ["Curators: %1", call BIS_fnc_listCuratorPlayers joinString ", "];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
 player addAction ["<t>NoSway on/off</t>", {if(isNil "NoSway") then {NoSway = 0}; if (NoSway == 0) then{NoSway = 1; removeMissionEventHandler ["EachFrame", MEH_NoSwayZeus]; MEH_NoSwayZeus = addMissionEventHandler ["EachFrame", {player setCustomAimCoef 0;}]; hintSilent "NoSway ON";}else{NoSway = 0; removeMissionEventHandler ["EachFrame", MEH_NoSwayZeus]; player setCustomAimCoef 1; hintSilent "NoSway OFF";};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>NoRecoil on/off</t>", {if(isNil "NoRecoil") then {NoRecoil = 0}; if (NoRecoil == 0) then{NoRecoil = 1; player setUnitRecoilCoefficient 0; hintSilent "NoRecoil ON";}else{NoRecoil = 0; player setUnitRecoilCoefficient 1; hintSilent "NoRecoil OFF";};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#e7ffc9'>Players screen blackout</t>", {[] call PlayersBlackout;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t color='#e7ffc9'>Players NoSway on/off [For very HI-tech operations]</t>", {[] call PlayersNoSway;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

comment "---------------------------------------------------------------------------------";
comment "--------------------------=-Speed multiplier submenu-=---------------------------";
comment "---------------------------------------------------------------------------------";
FAF_setting_menu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SWC_menu;}];
player addAction ["<t>3X[55]</t>", {ZeusSpeedBoost = 3;}];
player addAction ["<t>5X[90]</t>", {ZeusSpeedBoost = 5;}];
player addAction ["<t>10X[180](default)</t>", {ZeusSpeedBoost = 10;}];
player addAction ["<t>15X[270]</t>", {ZeusSpeedBoost = 15;;}];
player addAction ["<t>20X[360]</t>", {ZeusSpeedBoost = 20;}];
};

comment "---------------------------------------------------------------------------------";
comment "-----------------------------=-Fire support menu-=-------------------------------";
comment "---------------------------------------------------------------------------------";
Support_Menu = {

        onEachFrame {
            if (name cursorTarget == "Error: No unit") then
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, typeOf cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            }
            else
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, name cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            };
        };

removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu; onEachFrame {};}];
player addAction ["<t>>Arty group control menu.</t>", {[] call Support_Arty_Submenu;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Targeting override: Your laser designator.</t>", {MCSTargetOverride = laserTarget player;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Targeting override: Target unit laser designator.</t>", {MCSTargetOverride = laserTarget cursorTarget;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>Targeting override reset</t>", {MCSTargetOverride = "";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Guided] Cruise missile (Eta: 17s)", {["ammo_Missile_Cruise_01",300,5000,false,true] call MCS_U_ded_U_just_dont_know_it_yet;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Guided] Cruise missile Cluster (17s)", {["ammo_Missile_Cruise_01_Cluster",300,5000,false,false] call MCS_U_ded_U_just_dont_know_it_yet;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Guided] [air] Macer AT (11s)", {["Missile_AGM_02_F",500,5500,true,false] call MCS_U_ded_U_just_dont_know_it_yet;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Guided] [air] GBU-12 (11s)", {["Bo_GBU12_LGB",500,5500,true,false] call MCS_U_ded_U_just_dont_know_it_yet;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Guided] Satellite railgun strike. When it REALLY need to die. (2s)", {["Sh_120mm_APFSDS_Tracer_Green",9001,18000,false,true] call MCS_U_ded_U_just_dont_know_it_yet;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

comment "---------------------------------------------------------------------------------";
comment "---------------------=-[Guided] Ammunition spawn function-=----------------------";
comment "---------------------------------------------------------------------------------";
MCS_U_ded_U_just_dont_know_it_yet = {
params ["_MCSAmmoClass", "_MCSAmmoSpeed", "_MCSHeightOffset", "_IsCAS", "_IsOneshot"];

_MCSTarget = if (typeName MCSTargetOverride == typeName "") then {cursorTarget} else {MCSTargetOverride};

if (isNull _MCSTarget) exitWith {Hint "No target. Command canceled.";};
Hint "Ammunition inbound.";

if (typeName MCSTargetOverride == typeName "") then {
  MCSOrdStartPos = [(getPosASL cursorTarget)select 0,(getPosASL cursorTarget)select 1,((getPosASL cursorTarget)select 2)+_MCSHeightOffset]
} else {
  MCSOrdStartPos = [(getPosASL MCSTargetOverride)select 0,(getPosASL MCSTargetOverride)select 1,((getPosASL MCSTargetOverride)select 2)+_MCSHeightOffset]
};

_MCSOffset = getCenterOfMass _MCSTarget;

if (_IsCAS) then {
_MCSAutoCAS1 = (player modelToWorld [0,-1500,400]);
_MCSAutoCAS2 = (player modelToWorld [0,5000,400]);
[_MCSAutoCAS1, _MCSAutoCAS2, 1000, "FULL", "B_UAV_05_F", west] call BIS_fnc_ambientFlyby;
};

[MCSOrdStartPos, _MCSAmmoClass, _MCSTarget, _MCSAmmoSpeed, _IsOneshot, _MCSOffset, 10, "", false] remoteExec ["BIS_fnc_EXP_camp_guidedProjectile", 2];
};

comment "---------------------------------------------------------------------------------";
comment "---------------------------=-Artillery control menu-=----------------------------";
comment "---------------------------------------------------------------------------------";
Support_Arty_Submenu = {
player addAction ["<t>>>Back</t>", {[] call Support_Menu;}];
player addAction ["<t>[Arty grp 1] Fire at viewpoint.</t>", {[ArtyGroup1] call Arty_Fire_Menu;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 1] Add artillery to group.</t>", {ArtyGroup1 pushBackUnique cursorTarget; Hint format ["[%1] (%2) added to arty group 1", (name cursorTarget), (typeOf cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 1] Clear arty group.</t>", {ArtyGroup1 = []; Hint "Cleared arty group 1";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>..[Arty grp 2] Fire at viewpoint.</t>", {[ArtyGroup2] call Arty_Fire_Menu;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>..[Arty grp 2] Add artillery to group.</t>", {ArtyGroup2 pushBackUnique cursorTarget; Hint format ["[%1] (%2) added to arty group 2", (name cursorTarget), (typeOf cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>..[Arty grp 2] Clear arty group.</t>", {ArtyGroup2 = []; Hint "Cleared arty group 2";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 3] Fire at viewpoint.</t>", {[ArtyGroup3] call Arty_Fire_Menu;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 3] Add artillery to group.</t>", {ArtyGroup3 pushBackUnique cursorTarget; Hint format ["[%1] (%2) added to arty group 3", (name cursorTarget), (typeOf cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 3] Clear arty group.</t>", {ArtyGroup3 = []; Hint "Cleared arty group 3";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>..[Arty grp 4] Fire at viewpoint.</t>", {[ArtyGroup4] call Arty_Fire_Menu;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>..[Arty grp 4] Add artillery to group.</t>", {ArtyGroup4 pushBackUnique cursorTarget; Hint format ["[%1] (%2) added to arty group 4", (name cursorTarget), (typeOf cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>..[Arty grp 4] Clear arty group.</t>", {ArtyGroup4 = []; Hint "Cleared arty group 4";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 5] Fire at viewpoint.</t>", {[ArtyGroup5] call Arty_Fire_Menu;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 5] Add artillery to group.</t>", {ArtyGroup5 pushBackUnique cursorTarget; Hint format ["[%1] (%2) added to arty group 5", (name cursorTarget), (typeOf cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["<t>[Arty grp 5] Clear arty group.</t>", {ArtyGroup5 = []; Hint "Cleared arty group 5";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

comment "---------------------------------------------------------------------------------";
comment "-----------------------------=-Artillery ammo menu-=-----------------------------";
comment "---------------------------------------------------------------------------------";
Arty_Fire_Menu = {
  params ["_ArtyArray"];
  _ArtyArray = _this select 0;
  ArtyGroupSelected = _ArtyArray;
  ArtyAmmoSelect = getArtilleryAmmo _ArtyArray;
  ArtyFireTarget = (screenToWorld [0.5, 0.5]);
  Hint "Ground position locked in. You can look away now.";
  _RoundsTypesNumber = count ArtyAmmoSelect;
  removeallactions player;
  player addAction ["<t>>>Back</t>", {[] call Support_Menu;}];
  player addAction ["<t>Choose ammo:</t>", {}];
  if (_RoundsTypesNumber >= 1) then {player addAction [(ArtyAmmoSelect select 0), {[(ArtyAmmoSelect select 0)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 2) then {player addAction [(ArtyAmmoSelect select 1), {[(ArtyAmmoSelect select 1)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 3) then {player addAction [(ArtyAmmoSelect select 2), {[(ArtyAmmoSelect select 2)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 4) then {player addAction [(ArtyAmmoSelect select 3), {[(ArtyAmmoSelect select 3)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 5) then {player addAction [(ArtyAmmoSelect select 4), {[(ArtyAmmoSelect select 4)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 6) then {player addAction [(ArtyAmmoSelect select 5), {[(ArtyAmmoSelect select 5)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 7) then {player addAction [(ArtyAmmoSelect select 6), {[(ArtyAmmoSelect select 6)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 8) then {player addAction [(ArtyAmmoSelect select 7), {[(ArtyAmmoSelect select 7)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 9) then {player addAction [(ArtyAmmoSelect select 8), {[(ArtyAmmoSelect select 8)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 10) then {player addAction [(ArtyAmmoSelect select 9), {[(ArtyAmmoSelect select 9)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 11) then {player addAction [(ArtyAmmoSelect select 10), {[(ArtyAmmoSelect select 10)] call Arty_fire_rounds;}];};
  if (_RoundsTypesNumber >= 12) then {player addAction [(ArtyAmmoSelect select 11), {[(ArtyAmmoSelect select 11)] call Arty_fire_rounds;}];};
};

comment "---------------------------------------------------------------------------------";
comment "-----------------------------=-Artillery fire menu-=-----------------------------";
comment "---------------------------------------------------------------------------------";
Arty_fire_rounds = {
  params ["_ArtyMag"];
  _ArtyMag = _this select 0;
  ArtyMagSet = _ArtyMag;
  removeallactions player;
  player addAction ["<t>>>Back</t>", {[] call Support_Menu;}];
  player addAction ["<t>Choose amount of rounds per unit:</t>", {}];
  player addAction ["<t>1</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 1]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>2</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 2]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>3</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 3]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>4</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 4]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>5</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 5]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>6</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 6]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>7</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 7]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>8</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 8]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>12</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 12]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>16</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 16]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>24</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 24]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>32</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 32]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
  player addAction ["<t>99</t>", {{_x doArtilleryFire [ArtyFireTarget,ArtyMagSet, 99]} forEach ArtyGroupSelected; {systemChat (str (_x getArtilleryETA [ArtyFireTarget, ArtyMagSet]));} forEach ArtyGroupSelected; Hint "Rounds ETA displayed in chat. -1 means unit cannot fire. It can be caused by target being out of range or if unit don't have selected ammo.";}];
};

comment "---------------------------------------------------------------------------------";
comment "-----------------------------=-Miscellaneous menu-=------------------------------";
comment "---------------------------------------------------------------------------------";
Misc_menu = {
        onEachFrame {
            if (name cursorTarget == "Error: No unit") then
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, typeOf cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            }
            else
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, name cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            };
        };

removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu; onEachFrame {};}];
player addAction ["[Target] Disable turret disassembly.", {cursorTarget enableWeaponDisassembly false;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Target] Set AI to convoy mode.", {cursorTarget forceFollowRoad true; cursorTarget setConvoySeparation 20;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Target] Make AI trigger happy for 10 sec.", {cursorTarget suppressFor 10;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Target] Clear vehicle/box inventory.", {clearItemCargoGlobal cursorTarget; clearWeaponCargoGlobal cursorTarget; clearMagazineCargoGlobal cursorTarget; clearBackpackCargoGlobal cursorTarget; }, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Car] Set car plate.", {vehicle player setPlateNumber (selectRandom ["SLE was here","Goddammit Eta","Awi=Edgelord","CatgirlsisLove","CatgirlsisLife","Purge heretics","2FAST4U","Git gud"]);}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Target] Freeze player input. [Very evil]", {[name cursorTarget] call JAM_fnc_freezePlayer;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Target] Drop target.", {_z = getpos cursorTarget select 2; cursorTarget setpos [getpos cursorTarget select 0,getpos cursorTarget select 1,_z+20];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Target] You can't aim. [test]", {[name cursorTarget] call JAM_fusion_offence_inhibitor;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["Open splendid camera.", {["Init"] call BIS_fnc_camera;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["Get resupply beacon.", {player additem "HandGrenade_Stone";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Local] Disable ambient animals.", {enableEnvironment [false, true];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Local] Disable camera shake.", {enableCamShake false;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
player addAction ["[Global] Rekt compass for everyone.", {if (hasInterface) then {{setCompassOscillation [rad 360, 0.1, 0.2];} remoteExec ["bis_fnc_call", 0];};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

comment "---------------------------------------------------------------------------------";
comment "-------------------------------=-Temporary menu-=--------------------------------";
comment "---------------------------------------------------------------------------------";
MCS_temp_menu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu;}];

};

comment "---------------------------------------------------------------------------------";
comment "------------------------------=-Resupply script-=--------------------------------";
comment "---------------------------------------------------------------------------------";
if(isNil "MCSResupply") then {MCSResupply = 0;};
if (MCSResupply == 0) then {
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
MCSResupply = 1;
};

comment "---------------------------------------------------------------------------------";
comment "------------------------------=-Squad functions.-=-------------------------------";
comment "---------------------------------------------------------------------------------";
LOS_MEAT3 = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
  _newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
  this setUnitLoadout (getUnitLoadout RefQCB);
  sleep 0.1;
    _newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
    this setUnitLoadout (getUnitLoadout RefQCB);
    sleep 0.1;
      _newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
      this setUnitLoadout (getUnitLoadout RefQCB);
};
LOS_MEAT6 = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
};
LOS_ULT = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSL);
sleep 0.1;
_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMED);
sleep 0.1;
_newUnit = "O_Soldier_AR_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefDAKKA);
sleep 0.1;
_newUnit = "O_Soldier_M_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMARKSMAN);
sleep 0.1;
_newUnit = "O_Soldier_GL_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefGRENADER);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
};
LOS_AT = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSL);
sleep 0.1;
_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMED);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
};
LOS_AR = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSL);
sleep 0.1;
_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMED);
sleep 0.1;
_newUnit = "O_Soldier_AR_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefDAKKA);
sleep 0.1;
_newUnit = "O_Soldier_AR_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefDAKKA);
};
LOS_DEV = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefHMG);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAA12);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM107);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM107);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM32);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM32);
};

BCN_MEAT3 = {
_spawnPosition = getPosASL AISpawn;
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
};
BCN_MEAT6 = {
_spawnPosition = getPosASL AISpawn;
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
};
BCN_ULT = {
_spawnPosition = getPosASL AISpawn;
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSL);
sleep 0.1;
_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMED);
sleep 0.1;
_newUnit = "O_Soldier_AR_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefDAKKA);
sleep 0.1;
_newUnit = "O_Soldier_M_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMARKSMAN);
sleep 0.1;
_newUnit = "O_Soldier_GL_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefGRENADER);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
};
BCN_AT = {
_spawnPosition = getPosASL AISpawn;
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSL);
sleep 0.1;
_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMED);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
};
BCN_AR = {
_spawnPosition = getPosASL AISpawn;
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSL);
sleep 0.1;
_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefMED);
sleep 0.1;
_newUnit = "O_Soldier_AR_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefDAKKA);
sleep 0.1;
_newUnit = "O_Soldier_AR_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefDAKKA);
};
BCN_DEV = {
_spawnPosition = getPosASL AISpawn;
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefHMG);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAA12);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM107);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM107);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM32);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefM32);
};
LOS_Germans = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefGermSTG);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefGermSTG);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefGermMG);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefGermAT);
sleep 0.1;
_newUnit = "O_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefGermAT);
};
LOS_Soviet = {
_spawnPosition = screenToWorld [0.5, 0.5];
Squad = createGroup [Independent,true];
_newLeader = "I_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSov);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSovFlame);
sleep 0.1;
_newUnit = "I_Soldier_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefSovFlame);
};
LOS_Soviet_Tonk = {
[screenToWorld [0.5, 0.5], 0, "LOP_AFR_OPF_T34", Independent] call BIS_fnc_spawnVehicle;
};

comment "----------------------------------------------------------------------------------------------------------------";
comment "---------=-fnc_killPlayers yoinked from Zeus Essentials by [Capt. Chris (name from sergeant hades)].-=----------";
comment "----------------------------------------------------------------------------------------------------------------";
            fnc_killPlayers = {
                {
                    if(!(_x in call BIS_fnc_listCuratorPlayers)) then {_x setDamage 1;};
                } foreach allPlayers;
            };

comment "---------------------------------------------------------------------------------";
comment "---------------------------=-MCS switch functions.-=-----------------------------";
comment "---------------------------------------------------------------------------------";
Speed_repeater = {if (GOFAST == 1) then {player setAnimSpeedCoef ZeusSpeedBoost; sleep 0.05; [] call Speed_repeater;};};

ZeusSpeedBoost = 10;

PlayersAIIngnore = {
if(isNil "AiIgnMP") then {AiIgnMP = 0};
  if (AiIgnMP == 0) then {
    AiIgnMP = 1;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          _x setCaptive true;
        }
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players AI ignore ON";
  }else{
    AiIgnMP = 0;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          _x setCaptive false;
        };
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players AI ignore OFF";
  };
};

PlayersGodmode = {
if(isNil "GodMDMP") then {GodMDMP = 0};
  if (GodMDMP == 0) then {
    GodMDMP = 1;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          _x allowDamage false;
        }
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players God ON";
  }else{
    GodMDMP = 0;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          _x allowDamage true;
        };
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players God OFF";
  };
};

PlayersNoSway = {
if(isNil "NoSwayMP") then {NoSwayMP = 0};
  if (NoSwayMP == 0) then {
    NoSwayMP = 1;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          onEachFrame{_x setCustomAimCoef 0;}
        }
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players NoSway ON";
  }else{
    NoSwayMP = 0;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          onEachFrame{};
          _x setCustomAimCoef 1;
        };
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players NoSway OFF";
  };
};

PlayersBlackout = {
if(isNil "BOutMP") then {BOutMP = 0};
  if (BOutMP == 0) then {
    BOutMP = 1;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          titleCut ["", "BLACK OUT", 1];
        }
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players Can't see now.";
   sleep 0.1;
   titleCut ["", "BLACK IN", 0.1]
  }else{
    BOutMP = 0;
    {
      {
        if (!(_x in call BIS_fnc_listCuratorPlayers)) then {
          titleCut ["", "BLACK IN", 1];
        };
      } forEach allPlayers;
    } remoteExec ["bis_fnc_call", 0];
   hintSilent "Players can see again.";
  };
};

    JAM_fusion_offence_inhibitor =
    {
        params["_playerName"];
        _playerName = _this select 0;
        if (_playerName == JAM_myName) exitWith
        {
            hint "You won't see that message. Signed: SLE"
        };
        {
            if ( ( name _x ) == _playerName ) then
            {
                [[( name _x )],
                {
                    if ((unitRecoilCoefficient player) < 10) then
                    {
                        _textNotif = "Inhibiting offence capabilities of " + (_this select 0) + "...";
                        [[_textNotif, "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
                        player setCustomAimCoef 20; player setUnitRecoilCoefficient 20;
                        hint format ["Congrats %1, you can not aim now.",(_this select 0)];
                    }
                    else
                    {
                        _textNotif = "Deinhibiting offence capabilities of " + (_this select 0) + "...";
                        [[_textNotif, "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
                        player setCustomAimCoef 1; player setUnitRecoilCoefficient 1;
                        hint format ["%1, you can aim now.",(_this select 0)];
                    };
                }] remoteExec ["spawn",_x];
            };
        } forEach allPlayers;
    };

hint parseText "<t size='2.0' color='#00FF00'>Initialization complete: MCS only</t>";

comment "----------------------------------------------------------";
comment "------------------JAM PORTED SCRIPTS----------------------";
comment "----------------------------------------------------------";

JAM_fusion_menu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call SLE_menu;}];
player addAction ["JAM: <t color='#42D6FC'>Target </t><t color='#ff6600'>menu</t>", {[] call JAM_targetMenu;}];
player addAction ["JAM: <t color='#42D6FC'>Vehicle </t><t color='#ff6600'>menu</t>", {[] call JAM_vehicleMenu;}];
player addAction ["JAM: <t color='#42D6FC'>Utilities </t><t color='#ff6600'>menu</t>", {[] call JAM_serverMenu;}];
player addAction ["JAM: <t color='#42D6FC'>HAAAX </t><t color='#ff6600'>menu</t>", {[] call JAM_cheatMenu;}];
};

    JAM_targetMenu = {
        onEachFrame {
            if (name cursorTarget == "Error: No unit") then
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, typeOf cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            }
            else
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, name cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            };
        };
removeAllActions player;
player addAction ["<t>>>Back</t>", {[] call JAM_fusion_menu;  onEachFrame {};}];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Unflip Object</t>", {_vehicle = cursorTarget; _pos = getPosATL _vehicle; _pos set [2, 7]; _vehicle setPosATL _pos;_vehicle setVectorUp [0,0,1];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Give GodMode</t>", {cursorTarget allowDamage false; Hint format ["[%1] now has damage turned off.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Remove GodMode</t>", {cursorTarget allowDamage true; Hint format ["[%1] now has damage turned on.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Add AI-Ignore</t>", {cursorTarget setCaptive true; Hint format ["[%1] will now be ignored by AI.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Remove AI-Ignore</t>", {cursorTarget setCaptive false; Hint format ["[%1] will now be noticed by AI.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Delete Object</t>", {Hint format ["[%1] has been deleted.", (name cursorTarget)]; deleteVehicle cursorTarget;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Repair (Heal)</t>", {cursorTarget setDamage 0; Hint format ["[%1] has been fully repaired.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Player: </t><t color='#ff6600'>GetIn (ignores lock)</t>", {player moveInAny cursorTarget;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Player: </t><t color='#ff6600'>GetOut (ignores lock)</t>", {moveOut player;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Destroy (Kill)</t>", {if (cursorTarget in allPlayers) then {forceRespawn cursorTarget; Hint format ["[%1] has been force-respawned.", (name cursorTarget)];} else { cursorTarget setDamage 1; Hint format ["[%1] (%2) has been destroyed.", (name cursorTarget), (typeOf cursorTarget)];};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Refuel (Vanilla stamina if player)</t>", {if (cursorTarget in allPlayers) then {cursorTarget setFatigue 0; [["Your stamina has been recharged."],{player setFatigue 0;}] remoteExec ["spawn",cursorTarget]; Hint format ["[%1] had his stamina recharged.", (name cursorTarget)];} else {cursorTarget setFuel 1; Hint format ["[%1] (%2) has been refueled.", (name cursorTarget), (typeOf cursorTarget)];};}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Empty Fuel</t>", {cursorTarget setFuel 0; Hint format ["[%1] has been depleted of fuel.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Lock Vehicle</t>", {cursorTarget lock true;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Unlock Vehicle</t>", {cursorTarget lock false;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>[+]Arsenal</t>", {["AmmoboxInit",[cursorTarget,true]] call BIS_fnc_arsenal; Hint format ["[%1] is now a full arsenal.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Strip Gear</t>", {removeAllWeapons cursorTarget; removeAllAssignedItems cursorTarget; removeAllContainers cursorTarget; removeHeadgear cursorTarget; removeGoggles cursorTarget; removeAllItems cursorTarget; removeVest cursorTarget; removeBackpack cursorTarget; Hint format ["[%1] has been stripped of his gear.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Add white Flag</t>", {cursorTarget forceFlagTexture "\A3\Data_F\Flags\flag_white_co.paa"; Hint format ["[%1] ready to surrender anytime.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Add speshul Flag</t>", {cursorTarget forceFlagTexture "NCP.jpg"; Hint format ["[%1] became heretical :D", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Remove Flag</t>", {cursorTarget forceFlagTexture ""; Hint format ["[%1] no longer has a flag.", (name cursorTarget)];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    };

comment "If you wish to use another flag here's the list https://community.bistudio.com/wiki/Flag_Textures. You can copypaste addaction line and add options for several flags.";

JAM_vehicleMenu = {
removeallactions player;
player addAction ["<t>>>Back</t>", {[] call JAM_fusion_menu;}];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>Repair</t>", {vehicle player setDamage 0;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>Unflip current vehicle</t>", {_vehicle = vehicle player; _pos = getPosATL _vehicle; _pos set [2, 7]; _vehicle setPosATL _pos;_vehicle setVectorUp [0,0,1];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Target: </t><t color='#ff6600'>Unflip Object (LOS)</t>", {_vehicle = cursorTarget; _pos = getPosATL _vehicle; _pos set [2, 7]; _vehicle setPosATL _pos;_vehicle setVectorUp [0,0,1];}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>Refuel</t>", {vehicle player setFuel 1;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>Nofuel</t>", {vehicle player setFuel 0;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>God [ON]</t>", {vehicle player allowDamage false;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>God [OFF]</t>", {vehicle player allowDamage true;playSound "Hint";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>Lock</t>", {vehicle player lock true;Hint "locked";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>Unlock</t>", {vehicle player lock false;Hint "unlocked";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>[+] Flag</t>", {vehicle player forceFlagTexture "\A3\Data_F\Flags\flag_white_co.paa"; Hint "Ready to surrender anytime.";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>[+] Speshul Flag</t>", {vehicle player forceFlagTexture "NCP.jpg"; Hint "You just became heretical :D";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>Vehicle: </t><t color='#ff6600'>[-] Flag</t>", {vehicle player forceFlagTexture ""; Hint "Flag removed.";}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
};

    JAM_serverMenu = {
        removeAllActions player;
    player addAction ["<t>>>Back</t>", {[] call JAM_fusion_menu;}];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#ff6600'>Clear dead</t>", {[] call JAM_fnc_clearDead;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#ff6600'>Update zeus objects</t>", {[] call JAM_fnc_updateZeusObj;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#ff6600'>TP all players to self</t>", {[] call JAM_fnc_TP_allToSelf;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#ff6600'>Show 3D player names (on/off)(global)</t>", {[] call JAM_fnc_show3DPlayerNames;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#ff6600'>Disable stamina (on/off)(vanilla only)</t>", {[] call JAM_fnc_disableFatigueGlobal;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#ff6600'>Arsenal at spawn (on/off)(JIP)</t>", {[] call JAM_fnc_AASJIP;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    player addAction ["JAM: <t color='#42D6FC'>Utilities: </t><t color='#FF0000'>Force repawn all server (yes you too)</t>", {removeallactions player; player addAction ["<t>Are you sure?</t>", {}]; player addAction ["<t color='#FF0000'>YES! EXTEMINATUS!</t>", {[] call JAM_fnc_respawnAll;}]; player addAction ["<t color='#e7ffc9'>NO FUCK GO BACK</t>", {[] call JAM_serverMenu;}];}];
    player addAction ["<t color='#FF0000'>Kill all players (zeus not included)</t>", {removeallactions player; player addAction ["<t>Are you sure?</t>", {}]; player addAction ["<t color='#FF0000'>YES! KILL THEM ALL!</t>", {[] call fnc_killPlayers; [] call JAM_serverMenu;}]; player addAction ["<t color='#e7ffc9'>NO FUCK GO BACK</t>", {[] call JAM_serverMenu;}];}];
    };





    JAM_cheatMenu = {
        removeAllActions player;
Hint "Be aware of flying monitors.";
player addAction ["<t>>>Back</t>", {[] call JAM_fusion_menu;}];
        player addAction ["JAM: <t color='#42D6FC'>HAAAX: </t><t color='#ff6600'>Bullet-Changer</t>", {[] call JAM_open_ammoSelectMenu;}];
        player addAction ["JAM: <t color='#42D6FC'>HAAAX: </t><t color='#ff6600'>InfAmmo (on/off)(you)</t>", {[] call jam_infAmmo;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>HAAAX: </t><t color='#ff6600'>3D-ESP | All entities (on/off)</t>", {[] call jam_esp;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>HAAAX: </t><t color='#ff6600'>Map-ESP| All entities (on/off)</t>", {[] call jam_mesp;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
        player addAction ["JAM: <t color='#42D6FC'>HAAAX: </t><t color='#ff6600'>3D-ESP | Enemy AI (on/off)</t>", {[] call jam_hostileAIEsp;}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
    };

comment "----------------------------------------------------------";
comment "---------------------JAM FUNCTIONS------------------------";
comment "----------------------------------------------------------";

JAM_myName = name player;

    JAM_fnc_freezePlayer =
    {
        params["_playerName"];
        _playerName = _this select 0;
        if (_playerName == JAM_myName) exitWith
        {
            hint "JAM: Do not freeze yourself, retard."
        };
        {
            if ( ( name _x ) == _playerName ) then
            {
                [[( name _x )],
                {
                    if (!userInputDisabled) then
                    {
                        _textNotif = "JAM: Freezing player, " + (_this select 0) + "...";
                        [[_textNotif, "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
                        disableUserInput true;
                        hint format ["%1, your input has been disabled by the Zeus. Standby for unfreeze. If the problem persists, simply ALT+F4.",(_this select 0)];
                    }
                    else
                    {
                        _textNotif = "JAM: Un-freezing player, " + (_this select 0) + "...";
                        [[_textNotif, "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
                        disableUserInput false;
                        hint format ["%1, your input has been re-enabled by Zeus.",(_this select 0)];
                    };
                }] remoteExec ["spawn",_x];
            };
        } forEach allPlayers;
    };

    JAM_fnc_clearDead =
    {
        [["JAM: Deleting dead objects...", "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
        _countUpTheDead = 0;
        _deadObjects = 0;
        { deleteVehicle _x; _deadObjects = _deadObjects + 1; } forEach allDead;
        { deleteVehicle _x; _countUpTheDead = _countUpTheDead + 1; } forEach allDeadMen;
        (format ["A grim total of %1 dead objects have been removed from the battlefield. Of those, %2 were soldiers.", _deadObjects, _countUpTheDead]) remoteExec ["hint", 0];
    };

    JAM_fnc_updateZeusObj =
    {
        [["JAM: Adding new objects to Zeus interface...", "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", player];
        [["JAM: Adding new objects to Zeus interface...", "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", allCurators];
        [[],{
            {
                _x addCuratorEditableObjects [nearestObjects [(position _x), ["All"], 35000],true];
                _x addCuratorEditableObjects [allUnits,true];
                _x addCuratorEditableObjects [vehicles,true];
                _x addCuratorEditableObjects [allPlayers,true];
            } forEach allCurators;
        }] remoteExec ["spawn", 2];
        Hint "JAM: Zeus interface updated with new objects.";
    };

    JAM_fnc_AASJIP =
    {
        if (isNil "AASJIPTggl") then {AASJIPTggl = 1};
        if (AASJIPTggl == 1) then {
            comment "toggle on";
            [["JAM: Applying respawn-arsenal (JIP)...", "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
            [[],{
                EH_AASJIP = player addEventHandler ["Respawn", {
                    [] spawn {
                        action_openArsenal = player addAction ["JAM: <t color='#42D6FC'>Open Arsenal (1x)</t>",
                        {
                            ["Preload"] call BIS_fnc_arsenal;
                            ["Open",true] spawn BIS_fnc_arsenal;
                            titleText ["<t color='#42D6FC'>Arsenal Script <t color='#FFFFFF' size='2'>by</t><t color='#42D6FC'> J-WoLF</t><br/><t color='#58D68D'>-Press ESC to exit Arsenal-</t>", "PLAIN DOWN", -1, true, true];
                            player removeAction action_openArsenal;
                        }];
                        sleep 20;
                        player removeAction action_openArsenal;
                    };
                }];
            }] remoteExec ["spawn",0,"AASJIP"];
            comment "init done";
            playSound "Hint";
            titleText ["<t color='#42D6FC'>AAS-JIP </t><t color='#FFFFFF'>[ON]</t>", "PLAIN", -1, true, true];
            AASJIPTggl = 0;
        } else {
            comment "toggle off";
            [["JAM: Removing respawn-arsenal (JIP)...", "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
            [[],{
                player removeEventHandler ["Respawn", EH_AASJIP];
                player removeAction action_openArsenal;
            }] remoteExec ["spawn",0];
            [[],{comment "do nothing";}] remoteExec ["spawn",0,"AASJIP"];
            comment "init done";
            playSound "Hint";
            titleText ["<t color='#42D6FC'>AAS-JIP </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN", -1, true, true];
            AASJIPTggl = 1;
        };
    };

    JAM_fnc_show3DPlayerNames =
    {
        if (isNil "shw3DPlrNmTggl") then {shw3DPlrNmTggl = 1;};
        if (shw3DPlrNmTggl == 1) then {
            comment "init start";
            [["shw3DPlrNmJIP"],
            {
                JAM_fini_fnc_compile3 =
                {
                    (with missionNamespace do compile (_this select 0));
                };
                JAM_toggle_allPlayers3DESP = {
                    if (isNil 'JAM_tggl_Glbl3DESP') then {JAM_tggl_Glbl3DESP = 1};
                    if (JAM_tggl_Glbl3DESP == 1) then {
                        JAM_tggl_Glbl3DESP = 0;
                        titleText ["<t color='#42D6FC'>ShowPlayerNames </t><t color='#FFFFFF'>[ON]</t>", "PLAIN DOWN", -1, true, true];
                        playSound "Hint";
                        [("
                            MissionEH_3DESP = addMissionEventHandler ['Draw3D',
                            {
                                {
                                    if (((player distance _x) < 1500) && (_x != player)) then {
                                        drawIcon3D ['', [1, 1, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2.3], 1, 1, 45, (format ['%1', name _x]), 2, 0.025, 'PuristaMedium', 'center', false];
                                    };
                                } forEach allPlayers;
                            }];
                        ")] call jam_fini_fnc_compile3;
                    } else {
                        JAM_tggl_Glbl3DESP = 1;
                        titleText ["<t color='#42D6FC'>ShowPlayerNames </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN DOWN", -1, true, true];
                        playSound "Hint";
                        [("removeMissionEventHandler['Draw3D',MissionEH_3DESP];")] call jam_fini_fnc_compile;
                    };
                };
                [] call JAM_toggle_allPlayers3DESP;
            }] remoteExec ["spawn", 0, "shw3DPlrNmJIP"];
            comment "init done";
            shw3DPlrNmTggl = 0;
        } else {
            comment "toggle off";
            [[],{
                [] call JAM_toggle_allPlayers3DESP;
            }] remoteExec ["spawn", 0];
            comment "over-write JIP message";
            [[],{comment "do nothing";}] remoteExec ["spawn",0,"shw3DPlrNmJIP"];
            shw3DPlrNmTggl = 1;
        };
    };

    JAM_fnc_disableFatigueGlobal =
    {
        if (isNil "fatigueTgglGlobal") then {fatigueTgglGlobal = 1;};
        if (fatigueTgglGlobal == 1) then {
            comment "init start";
            [["InfStam"],
            {
                JAM_toggle_cardioGlobal = {
                    if (isNil 'cardioTggleGlobal') then {cardioTggleGlobal = 1};
                    if (cardioTggleGlobal == 1) then {
                        cardioTggleGlobal = 0;
                        titleText ["<t color='#42D6FC'>Infinite Stamina </t><t color='#FFFFFF'>[ON]</t>", "PLAIN DOWN", -1, true, true];
                        player enableFatigue false;
                        EH_noFatigue = player addEventHandler ["Respawn", {
                                player enableFatigue false;
                        }];
                        Hint "JAM: EH added (Fatigue Disabled)."
                    } else {
                        cardioTggleGlobal = 1;
                        player enableFatigue true;
                        titleText ["<t color='#42D6FC'>Infinite Stamina </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN DOWN", -1, true, true];
                        player removeEventHandler ["Respawn", EH_noFatigue];
                        Hint "JAM: EH removed (Fatigue Enabled)."
                    };
                };
                [] call JAM_toggle_cardioGlobal;
            }] remoteExec ["spawn", 0, "JAM_CardioJIP"];
            comment "init done";
            fatigueTgglGlobal = 0;
        } else {
            comment "toggle off";
            [[],{
                [] call JAM_toggle_cardioGlobal;
            }] remoteExec ["spawn", 0];
            comment "over-write JIP message";
            [[],{comment "do nothing";}] remoteExec ["spawn",0,"JAM_CardioJIP"];
            fatigueTgglGlobal = 1;
        };
    };

    JAM_fnc_TP_allToSelf =
    {
        _textNotif = format ["JAM: Teleporting all players to %1...", JAM_myName];
        [[_textNotif, "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
        JAM_myCurrentPosition = getPos player;
        {
            [[JAM_myCurrentPosition,JAM_myName],{
                _pos = _this select 0;
                _name = _this select 1;
                moveOut player;
                sleep 1;
                player setPos _pos;
                (format ["JAM: Player %1 has teleported to %2.",(name player), _name]) remoteExec ["systemChat",0];
            }] remoteExec ["spawn",_x];
        } forEach allPlayers - AllCurators;
    };



    JAM_fnc_respawnAll =
    {
        [["JAM: Re-spawning all players...", "PLAIN DOWN", 0, true, false]] remoteExec ["cutText", 0];
        _countPlayers = 0;
        { forceRespawn _x; _countPlayers = _countPlayers + 1; } forEach allPlayers - allCurators;
        Hint format ["[%1] Players have been forced to respawn.", _countPlayers];
    };

    jam_infAmmo = {
        if (isNil "infAmmoTggle") then {infAmmoTggle = 1};
        if (infAmmoTggle == 1) then {
            infAmmoTggle = 0;
            titleText ["<t color='#42D6FC'>INFAMMO </t><t color='#FFFFFF'>[ON]</t>", "PLAIN DOWN", -1, true, true];
            playSound "Hint";
            [] spawn {
                while {infAmmoTggle == 0} do {
                    player setVehicleAmmo 1;
                    vehicle player setVehicleAmmo 1;
                    sleep 0.5;
                };
            };
        } else {
            infAmmoTggle = 1;
            titleText ["<t color='#42D6FC'>INFAMMO </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN DOWN", -1, true, true];
            playSound "Hint";
        };
    };

    jam_esp = {
        if (isNil 'jamESPTggle') then {jamESPTggle = 1};
        if (jamESPTggle == 1) then {
            jamESPTggle = 0;
            titleText ["<t color='#42D6FC'>ESP </t><t color='#FFFFFF'>[ON]</t>", "PLAIN DOWN", -1, true, true];
            playSound "Hint";
            [("
            jamEsp = addMi"+"ssionEve"+"ntHandler ['Dr"+"aw"+"3D',{
            {
            if ((side _x != side player) && (getPlayerUID _x != '') && ((player distance _x) < 1500)) then {
            dr"+"awIcon"+"3D['', [0, 0, 1, 1], [visi"+"blePosi"+"tion _x select 0, visi"+"blePo"+"sition _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format['%1 - %2m', name _x, round(player distance _x)]), 1, 0.04];
            } else {
            if ((getPlayerUID _x != '') && ((player distance _x) < 1500) && (name _x != name player)) then {
            d"+"rawIc"+"on3D['', [0, 0.2, 1, 1], [visi"+"blePos"+"ition _x select 0, visib"+"lePosi"+"tion _x select 1, (getPosATL _x select 2) + 2], 0.1, 0.1, 45, (format['%1 - %2m', name _x, round(player distance _x)]), 1, 0.04];
            };
            };
            } foreach call jam_fini_fnc_plrs;
            }];
            ")] call jam_fini_fnc_compile;
        } else {
            jamESPTggle = 1;
            titleText ["<t color='#42D6FC'>ESP </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN DOWN", -1, true, true];
            playSound "Hint";
            [("re"+"moveMiss"+"ionEven"+"tHandler['Dr"+"a"+"w3D',jamEsp];")] call jam_fini_fnc_compile;
        };
    };

    jam_mesp = {
        if (isNil "mespTggle") then {mespTggle = 1};
        if (mespTggle == 1) then {
            playSound "Hint";
            titleText ["<t color='#42D6FC'>MAPESP </t><t color='#FFFFFF'>[ON]</t>", "PLAIN DOWN", -1, true, true];
            mespTggle = 0;
        } else {
            playSound "Hint";
            titleText ["<t color='#42D6FC'>MAPESP </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN DOWN", -1, true, true];
            mespTggle = 1;
        };
        [] spawn {
            [("
            while {mespTggle == 0} do {
            _units = call jam_fini_fnc_plrs;
            _unitCount = count _units;
            for '_i' from 0 to (_unitCount-1) do {
            _unit = _units select _i;
            if (alive _unit) then {
            del"+"eteMar"+"kerL"+"ocal('jam_plr' + (str _i));
            _namePlayer = name _unit;
            _mark_player = 'jam_plr' + (str _i);
            _mark_player = crea"+"teM"+"arker"+"Loc"+"al[_mark_player, getPos _unit];
            _mark_player setM"+"ark"+"er"+"Type"+"Local 'wa"+"ypo"+"int';
            _mark_player set"+"Ma"+"rk"+"erPo"+"sLoc"+"al(getPos _unit);
            _mark_player set"+"Marker"+"Col"+"orLo"+"cal 'Co"+"lorB"+"lue';
            _mark_player setM"+"ark"+"erT"+"ext"+"Loc"+"al format['%1 - %2', _namePlayer, round(player di"+"st"+"ance _unit)];
            };
            };
            sleep 0.5;
            };
            for '_i' from 0 to 500 do {
            de"+"l"+"ete"+"Ma"+"rkerLo"+"cal('jam_plr' + (str _i));
            };
            ")] call jam_fini_fnc_compile;
        };
    };

    jam_hostileAIEsp =
    {
        if (isNil 'jamhostileAIESPTggle') then {jamhostileAIESPTggle = 1};
        if (jamhostileAIESPTggle == 1) then {
            jamhostileAIESPTggle = 0;
            titleText ["<t color='#42D6FC'>ENEMY AI ESP </t><t color='#FFFFFF'>[ON]</t>", "PLAIN DOWN", -1, true, true];
            playSound "Hint";

            jamhostileAIEsp = addMissionEventHandler ['Draw3D',{
                {
                    if ((side _x != side player) && ((player distance _x) < 1500)) then {
                        drawIcon3D["", [1, 0, 0, 1], [visiblePosition _x select 0, visiblePosition _x select 1, 2], 0.1, 0.1, 45, (format["%2 : %1m", round(player distance _x), name _x]), 1, 0.04, "EtelkaNarrowMediumPro"];
                    } else {
                        if (((player distance _x) < 1500) && (name _x != name player)) then {
                            drawIcon3D["", [0, 0.5, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1, 2], 0.1, 0.1, 45, (format["%2 : %1m", round(player distance _x), name _x]), 1, 0.04, "EtelkaNarrowMediumPro"];
                        };
                    };
                } forEach call jam_fini_fnc_hostileAI;
            }];

        } else {
            jamhostileAIESPTggle = 1;
            titleText ["<t color='#42D6FC'>ENEMY AI ESP </t><t color='#FFFFFF'>[OFF]</t>", "PLAIN DOWN", -1, true, true];
            playSound "Hint";
            removeMissionEventHandler['Draw3D',jamhostileAIEsp];
        };
    };

comment "ammoSelectMenu";

    JAM_open_ammoSelectMenu = {
        removeAllActions player;
player addAction ["<t>>>Back</t>", {[] call JAM_cheatMenu;}];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#ff6600'>Dragon's Breath</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            removeAllActions player;
            player addAction ["<t color='#FF0000'>Extinguish Fire</t>", {
                player removeEventHandler["fired", FEH_missile];
                {
                    if (typeOf _x == "test_EmptyObjectForFireBig") then {
                        deleteVehicle _x;
                    };
                } forEach nearestObjects [player, ["all"], 10000] - allUnits;
                removeAllActions player;
               [] call JAM_cheatMenu;
            }];
            FEH_missile = player addEventHandler ["fired", {
                dragonBullet = nearestObject [_this select 0,_this select 4];
                dragonBulletPos = getPosASL dragonBullet;
                fireBall = createVehicle ["test_EmptyObjectForFireBig",dragonBulletPos,[],0,"CAN_COLLIDE"];
                if (!(cursorTarget == ObjNull)) then {
                    bigFire = createVehicle ["test_EmptyObjectForFireBig",dragonBulletPos,[],0,"CAN_COLLIDE"];
                    bigFire attachTo [dragonBullet,[0,0,0]];
                };
                [] spawn {
                    _weapdir = player weaponDirection currentWeapon player;
                    _dist = 11;
                    fireBall setPosASL [
                        (dragonBulletPos select 0) + (_weapdir select 0)*_dist,
                        (dragonBulletPos select 1) + (_weapdir select 1)*_dist,
                        (dragonBulletPos select 2) + (_weapdir select 2)*_dist
                    ];
                    _up = vectorUp dragonBullet;
                    fireBall setVectorDirAndUp[_weapdir,_up];
                    fireBall setVelocity velocity dragonBullet;
                    sleep 3.5;
                    deleteVehicle fireBall;
                };
                [] spawn {
                    sleep 0.1;
                    detach bigFire;
                    bigFire attachTo [cursorTarget,[0,0,0]];
                    sleep 3.5;
                    deleteVehicle bigFire;
                };
            }];
            playSound "hint";
            systemChat "Fire balls Loaded into Magazine xD.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#ff6600'>82mm HE Mortar Shells</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {
            _bullet = nearestObject [_this select 0,_this select 4];
            _bulletpos = getPosASL _bullet;
            _o = "Sh_82mm_AMOS_LG" createVehicle _bulletpos;
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
            }];
            playSound "hint";
            systemChat "82mm HE Mortar Shells Loaded into Magazine xD.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#ff6600'>GBU-12</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {
            _bullet = nearestObject [_this select 0,_this select 4];
            _bulletpos = getPosASL _bullet;
            _o = "Bo_GBU12_LGB" createVehicle _bulletpos;
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
            }];
            playSound "hint";
            systemChat "GBU-12 Loaded into Magazine xD.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#ff6600'>12.7x108 mm Russian</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {
            _bullet = nearestObject [_this select 0,_this select 4];
            _bulletpos = getPosASL _bullet;
            _o = "B_127x108_Ball" createVehicle _bulletpos;
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
            }];
            playSound "hint";
            systemChat "12.7x108mm Russian Loaded.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#ff6600'>40 mm APFSDS</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
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
            }];
            playSound "hint";
            systemChat "40 mm APFSDS Loaded.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#ff6600'>40 mm GPR</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {
            _bullet = nearestObject [_this select 0,_this select 4];
            _bulletpos = getPosASL _bullet;
            _o = "B_40mm_GPR" createVehicle _bulletpos;
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
            }];
            playSound "hint";
            systemChat "40 mm GPR Loaded.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#FF8080'>Destroyer</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {cursorTarget setDamage 1;}];
            playSound "hint";
            systemChat "Destroyer Loaded.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#7CFF7E'>Fixer</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {cursorTarget setDamage 0; cursorTarget setFuel 1;}];
            playSound "hint";
            systemChat "Fixer Loaded.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#FF8080'>Deleter</t>", {
            if (!isNil "FEH_missile") then {player removeEventHandler["fired", FEH_missile];};
            FEH_missile = player addEventHandler ["fired", {deleteVehicle cursorTarget;}];
            playSound "hint";
            systemChat "Deleter Loaded.";
            systemChat "JAM: Special ammo will be automatically removed upon death.";
        }];
        player addAction ["JAM: <t color='#42D6FC'>ChangeAmmo: </t><t color='#7CFF7E'>Default</t>", {
            player removeAllEventHandlers "Fired";
            playSound "hint";
            systemChat "Default Ammo Loaded. Event handlers under [Fired] have been removed.";
        }];
    };

comment "----------------------------------------------------------";
comment "----------------------DEPENDENCES-------------------------";
comment "----------------------------------------------------------";

    JAM_fini_fnc_compile =
    {
        (with missionNamespace do compile (_this select 0));
    };

    JAM_fini_fnc_plrs =
    {
        _players = [];
        _all = player nearEntities [['Man','Land','Air','Ship'], 25000];
        {
            if ((_x isKindOf "Man") && (getPlayerUID _x != "")) then {
            _players pushBack _x;
            } else {
                if ((count crew _x) != 0) then {
                    for "_i" from 0 to (count crew _x)-1 do {
                        _l = (crew _x) select _i;
                        if (getPlayerUID _l != "") then {
                            _players pushBack _l;
                        };
                    };
                };
            };
        } forEach _all;
        _players
    };

    jam_fini_fnc_hostileAI =
    {
        _hostileai = [];
        {
            if ((_x isKindOf "Man") && (side _x != side player)) then {
                _hostileai pushBack _x;
            } else {
                if ((count crew _x) != 0) then {
                    for "_i" from 0 to (count crew _x)-1 do {
                        _l = (crew _x) select _i;
                        if (side _l != side player) then {
                            _hostileai pushBack _l;
                        };
                    };
                };
            };
        } forEach allUnits - allPlayers;
        _hostileai
    };

hint parseText "<t size='2.0' color='#00FF00'>Initialization complete: MCS+JAM</t>";

comment "If zeus check bracket.";
}else{Hint "DENIED";};

comment "Activation by object bracket.";
}, nil, 1.5, true, true, "", "true", 5, false, "", ""];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
