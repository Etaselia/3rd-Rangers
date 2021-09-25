//SLE's code playground. Things that can be found here mostly unfinished or need serious refactoring.

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//Actions
player addAction
[
"title",// title
{
test = true; // script
},
nil,// arguments
1.5,// priority
true,// showWindow
false,// hideOnUse
"",// shortcut
"true", // condition
50,// radius
false,// unconscious
"",// selection
""// memoryPoint
];

player addAction ["title", {}, nil, 1.5, true, false, "", "true", 50, false, "", ""];
removeallactions player;
player addAction ["Test", {}];
this addAction ["Test", {}];

//code flow
[] call x_menu; x_menu = {};
if (CONDITION) then {};
if (CONDITION) then {} else {};
onEachFrame {};
for "_i" from 0 to 9 step 1 do {};
waitUntil {CONDITION};
{_x do something} Foreach array;
{script goes here} remoteExec ["bis_fnc_call", 0];
_spawnhook = [] spawn {};
terminate _spawnhook;
if(isNil "AiIgn") then {AiIgn = 0};

//eventhandling
player removeEventHandler ["type", _hook];
removeMissionEventHandler ["EachFrame", _hook];

//data extraction
systemChat "systemChad";
hintSilent formatText ["Test: %1 testunits", SuitPower];
playSound "Hint";
Hint "Hint";
hintSilent "Hint";
copyToClipboard ("");

//data conversion
str (2 + 3);
_array joinString ", ";

//textures
this setObjectTextureGlobal [0,"example.jpg"];
count _array;

//conditions
underwater player;

//actions
_unit setUnconscious true;

//physics
_object addForce [force, position]; //force and position type array
getCenterOfMass _object;
_object addTorque [1000,0,0];
_object setMass mass;

//math
_number toFixed 1;

//coordinates
ASLToAGL (aimPos player);
screenToWorld [0.5, 0.5];

//inventoty
_unit addMagazine "magazineName";
_unit addMagazines ["magazineName", number];
clearItemCargoGlobal cursorTarget;
currentMagazine player;
currentWeapon player;
primaryWeaponMagazine player;
secondaryWeaponMagazine player;
handgunMagazine player;
mortar1 enableWeaponDisassembly false;
player setUnitLoadout (getUnitLoadout Ref1);

//effects
enableCamShake bool;
addCamShake [power, duration, frequency];
resetCamShake; 

//misc
comment "";
cursorTarget;
_pos = player getHideFrom _enemy;
player setObjectMaterialGlobal [0, "A3\Structures_F\Data\Windows\window_set.rvmat"];
vehicle player setPlateNumber "Custom Plate 99";
if (hasInterface) then {{player globalRadio (str clientOwner);} remoteExec ["bis_fnc_call", 0];};
enableEnvironment [false, true];
laserTarget player;
vehicle player sendSimpleCommand "STOP";
setCompassOscillation [rad 360, 0.1, 0.2];
_car forceFollowRoad true;
vehicle setConvoySeparation 20;
_unit suppressFor 10;
triggerAmmo bomb1;
["Init"] call BIS_fnc_camera;
["Initialize", [player]] call BIS_fnc_EGSpectator;
["Terminate", [player]] call BIS_fnc_EGSpectator;


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~workplace1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~workplace2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~workplace3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~workplace4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Work in progress stuff~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Psi menu. [Need reconstruction. Failed in multiplayer.]
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player addAction ["<t>PSI TP</t>", {
_z = getpos player select 2;
TPSphere setpos [getpos player select 0,getpos player select 1,_z+1];
sleep 0.5;
(vehicle player) setPos (screenToWorld [0.5, 0.5]);
sleep 0.1;
TPSphere setpos [getpos player select 0,getpos player select 1,_z+1];
sleep 0.5;
TPSphere setPos ([8465,25090,2]);
}];

player addAction ["<t>PSI Grenade</t>", {
TPSphere setPos (screenToWorld [0.5, 0.5]);
sleep 1.0;
createVehicle ['GrenadeHand',getPosATL TPSphere,[],0,'CAN_COLLIDE'];
sleep 5.0;
TPSphere setPos ([8465,25090,2]);
}];

player addAction ["<t>PSI TP Reinforcment</t>", {
TPSphere setPos (screenToWorld [0.5, 0.5]);
sleep 5.0;
_spawnPosition = getPosASL TPSphere; 
Squad = createGroup [east,true];
_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];
this setUnitLoadout (getUnitLoadout RefQCB);
sleep 0.5;
TPSphere setPos ([8465,25090,2]);
}];

player addAction ["<t>PSI Nuke</t>", {
EXPSphere setPos (screenToWorld [0.5, 0.5]);
sleep 30.0;
createVehicle ['Bo_GBU12_LGB',getPosATL EXPSphere,[],0,'CAN_COLLIDE'];
sleep 0.1;
EXPSphere setPos ([8465,25090,2]);
}];

player addAction ["[Debug] RTB", {player setPosASL (getPosASL BBCN);}];

player addAction ["<t>[Debug] GBU target</t>", {
EXPSphere setPos (screenToWorld [0.5, 0.5]);
sleep 0.1;
createVehicle ['Bo_GBU12_LGB',getPosATL EXPSphere,[],0,'CAN_COLLIDE'];
sleep 0.1;
EXPSphere setPos ([8465,25090,2]);
}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Dynamic pylon loadout system. [Under construction. Need testing. Hard to create menus for new planes.]
//Thing for pilots. Pylons will be applied to vehicle in which player is sitting. Also zero pylons ammusition because wold be too op otherwise.
//Todo: make this work with reference plane instead of hardcoding loadouts. Use get for each pylon and set.Or make it via array. also add if with isnull or count on arra.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player addAction ["<t color='#BBBBBB'>>>Loadouts</t>", {[] call Pilot_menu;}];
Pilot_menu = {
removeallactions player;
 player addAction ["<t>1 MISSILES (ATx4 AAx4</t>", {{
(vehicle player) setPylonLoadout [1, "TIOW_Thunderbolt_Skystrike_Missiles_x2_P"];
(vehicle player) setPylonLoadout [2, "TIOW_Thunderbolt_Hellstrike_Missiles_x2_P"];
(vehicle player) setPylonLoadout [3, "TIOW_Thunderbolt_Hellstrike_Missiles_x2_P"];
(vehicle player) setPylonLoadout [4, "TIOW_Thunderbolt_Skystrike_Missiles_x2_P"];
(vehicle player) setAmmoOnPylon [1, 0]; (vehicle player) setAmmoOnPylon [2, 0]; (vehicle player) setAmmoOnPylon [3, 0]; (vehicle player) setAmmoOnPylon [4, 0];} remoteExec ["bis_fnc_call", 0];}];
 player addAction ["<t>2 ROCKETS (HEx38 Plasmax2)(</t>", {{
(vehicle player) setPylonLoadout [1, "TIOW_Thunderbolt_Rockets_x19_P"];
(vehicle player) setPylonLoadout [2, "TIOW_Thunderbolt_Plasma_Missile_x1_P"];
(vehicle player) setPylonLoadout [3, "TIOW_Thunderbolt_Plasma_Missile_x1_P"];
(vehicle player) setPylonLoadout [4, "TIOW_Thunderbolt_Rockets_x19_P"];
(vehicle player) setAmmoOnPylon [1, 0]; (vehicle player) setAmmoOnPylon [2, 0]; (vehicle player) setAmmoOnPylon [3, 0]; (vehicle player) setAmmoOnPylon [4, 0];} remoteExec ["bis_fnc_call", 0];}];
 player addAction ["<t>3 BOMBS (SmolBMBx4 BigBMBx2))</t>", {{
(vehicle player) setPylonLoadout [1, "TIOW_Thunderbolt_500_Bomb_x2_P"];
(vehicle player) setPylonLoadout [2, "TIOW_Thunderbolt_1000_Bomb_x1_P"];
(vehicle player) setPylonLoadout [3, "TIOW_Thunderbolt_1000_Bomb_x1_P"];
(vehicle player) setPylonLoadout [4, "TIOW_Thunderbolt_500_Bomb_x2_P"];
(vehicle player) setAmmoOnPylon [1, 0]; (vehicle player) setAmmoOnPylon [2, 0]; (vehicle player) setAmmoOnPylon [3, 0]; (vehicle player) setAmmoOnPylon [4, 0];} remoteExec ["bis_fnc_call", 0];}];
 player addAction ["<t>4 CAS (AAx2 ATx2 HEx19 SmolBMBx2)</t>", {{
(vehicle player) setPylonLoadout [1, "TIOW_Thunderbolt_Hellstrike_Missiles_x2_P"];
(vehicle player) setPylonLoadout [2, "TIOW_Thunderbolt_500_Bomb_x2_P"];
(vehicle player) setPylonLoadout [3, "TIOW_Thunderbolt_Rockets_x19_P"];
(vehicle player) setPylonLoadout [4, "TIOW_Thunderbolt_Skystrike_Missiles_x2_P"];
(vehicle player) setAmmoOnPylon [1, 0]; (vehicle player) setAmmoOnPylon [2, 0]; (vehicle player) setAmmoOnPylon [3, 0]; (vehicle player) setAmmoOnPylon [4, 0];} remoteExec ["bis_fnc_call", 0];}];
 player addAction ["<t>5 CAS CLUSTER (CLSx2 AAx2 ATx2)</t>", {{
(vehicle player) setPylonLoadout [1, "TIOW_Thunderbolt_Hellstrike_Missiles_x2_P"];
(vehicle player) setPylonLoadout [2, "TIOW_Thunderbolt_Hellfury_Missile_x1_P"];
(vehicle player) setPylonLoadout [3, "TIOW_Thunderbolt_Hellfury_Missile_x1_P"];
(vehicle player) setPylonLoadout [4, "TIOW_Thunderbolt_Skystrike_Missiles_x2_P"];
(vehicle player) setAmmoOnPylon [1, 0]; (vehicle player) setAmmoOnPylon [2, 0]; (vehicle player) setAmmoOnPylon [3, 0]; (vehicle player) setAmmoOnPylon [4, 0];} remoteExec ["bis_fnc_call", 0];}];
 player addAction ["<t color='#BBBBBB'>>>Close loadouts</t>", {removeallactions player; player addAction ["<t color='#BBBBBB'>>>Loadouts</t>", {[] call Pilot_menu;}];}];
};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
removeallactions player;
player addAction ["<t>List current loadout</t>", {hintSilent format ["Current loadout: %1", getPylonMagazines (vehicle player)  joinString ", "];}];
player addAction ["<t>Copy all available ordnance names to clipboard</t>", {_string = ((vehicle player) getCompatiblePylonMagazines 1) joinString ", "; copyToClipboard _string;}];
player addAction ["<t>list all options for all pylons</t>", {hintSilent format ["All ordnance for plane: %1", (vehicle player) getCompatiblePylonMagazines 0 joinString ", "];}];
player addAction ["<t>1</t>",  {hintSilent format ["Pylon1:  %1", (vehicle player) getCompatiblePylonMagazines 1  joinString ", "];}];
player addAction ["<t>2</t>",  {hintSilent format ["Pylon2:  %1", (vehicle player) getCompatiblePylonMagazines 2  joinString ", "];}];
player addAction ["<t>3</t>",  {hintSilent format ["Pylon3:  %1", (vehicle player) getCompatiblePylonMagazines 3  joinString ", "];}];
player addAction ["<t>4</t>",  {hintSilent format ["Pylon4:  %1", (vehicle player) getCompatiblePylonMagazines 4  joinString ", "];}];
player addAction ["<t>5</t>",  {hintSilent format ["Pylon5:  %1", (vehicle player) getCompatiblePylonMagazines 5  joinString ", "];}];
player addAction ["<t>6</t>",  {hintSilent format ["Pylon6:  %1", (vehicle player) getCompatiblePylonMagazines 6  joinString ", "];}];
player addAction ["<t>7</t>",  {hintSilent format ["Pylon7:  %1", (vehicle player) getCompatiblePylonMagazines 7  joinString ", "];}];
player addAction ["<t>8</t>",  {hintSilent format ["Pylon8:  %1", (vehicle player) getCompatiblePylonMagazines 8  joinString ", "];}];
player addAction ["<t>9</t>",  {hintSilent format ["Pylon9:  %1", (vehicle player) getCompatiblePylonMagazines 9  joinString ", "];}];
player addAction ["<t>10</t>", {hintSilent format ["Pylon10: %1", (vehicle player) getCompatiblePylonMagazines 10 joinString ", "];}];
player addAction ["<t>11</t>", {hintSilent format ["Pylon11: %1", (vehicle player) getCompatiblePylonMagazines 11 joinString ", "];}];
player addAction ["<t>12</t>", {hintSilent format ["Pylon12: %1", (vehicle player) getCompatiblePylonMagazines 12 joinString ", "];}];


player addAction ["<t>1</t>", {(vehicle player) setPylonLoadout [1, "TIOW_Thunderbolt_Hellstrike_Missiles_x2_P"];}];
player addAction ["<t>2</t>", {(vehicle player) setPylonLoadout [2, "TIOW_Thunderbolt_Plasma_Missile_x1_P"];}];
player addAction ["<t>3</t>", {(vehicle player) setPylonLoadout [3, "TIOW_Thunderbolt_Hellfury_Missile_x1_P"];}];
player addAction ["<t>4</t>", {(vehicle player) setPylonLoadout [4, "TIOW_Thunderbolt_Rockets_x19_P"];}];

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//Tools section. These are not for players to use. It's designed to help with creating scripts by easily extracting different information from game.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Shot info.
//Tool to configure and create scripts that depends on weapon related parameters.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player removeAllEventHandlers "FiredMan";
EH_ShotsFired = player addEventHandler ["FiredMan", {
  UnitFiredType = _this select 0;
  WeaponType = _this select 1;
  MuzzleType = _this select 2;
  FireMode = _this select 3;
  AmmoType = _this select 4;
  MagType = _this select 5;
  Projectile = _this select 6;
  VehicleType = _this select 7;
  AttachmentArray = player weaponAccessories primaryWeapon player;
  AttachmentString = AttachmentArray joinString " , ";
  removeallactions player;
  hintSilent formatText [" Weapon: %1%2 Muzzle: %3%4 Firemode: %5%6 Ammo: %7%8 Magazine: %9%10 Projectile: %11%12 Vehicle: %13%14 Attachments: %15", WeaponType, lineBreak, MuzzleType, lineBreak, FireMode, lineBreak, AmmoType, lineBreak, MagType, lineBreak, Projectile, lineBreak, VehicleType, lineBreak, AttachmentString];
  player addAction ["<t>Copy Weapon name</t>",     {copyToClipboard WeaponType;}];
  player addAction ["<t>Copy Muzzle name</t>",     {copyToClipboard MuzzleType;}];
  player addAction ["<t>Copy Firemode name</t>",   {copyToClipboard FireMode;}];
  player addAction ["<t>Copy Ammo name</t>",       {copyToClipboard AmmoType;}];
  player addAction ["<t>Copy Magazine name</t>",   {copyToClipboard MagType;}];
  player addAction ["<t>Copy Attachments</t>",     {copyToClipboard AttachmentString;}];
}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//---Copy sceduled code
//Tool to copy all sceduled code awaiting execution. Include Spawn and ExecVM.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
copyToClipboard (str diag_activeSQFScripts);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//---Health check tool
//Used mostly to test weapon damage
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
onEachFrame {
hint formatText ["Vehicle integrigy: %1 %2", 100-((damage (cursorTarget))*100), "%"];
};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
