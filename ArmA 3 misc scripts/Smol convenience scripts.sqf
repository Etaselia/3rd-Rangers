//---SP Slow-mo
//Pretty self explanatory. Do not work in multiplayer! In case of singleplayer even if script located in init of Eden object it will be applied to player.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
removeallactions player;
player addAction ["Time (Sanic)", {setAccTime 10}];
player addAction ["Time (Really Fast)", {setAccTime 4}];
player addAction ["Time (Fast)", {setAccTime 2}];
player addAction ["Time (Normal)", {setAccTime 1}];
player addAction ["Time (Medium)", {setAccTime 0.5}];
player addAction ["Time (Slow)", {setAccTime 0.25}];
player addAction ["Time (Slow-mo)", {setAccTime 0.1}];
player addAction ["Time (Dark)", {setAccTime 0.01}];
player addAction ["Time (Stop Hammertime)", {setAccTime 0}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Bullet path
//Allows you to see bullet path. No, really. Number is maximal amount of traces.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[player, 30] spawn BIS_fnc_traceBullets;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Arsenal
//Nuff said. You can change text and text color of action though.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["<t color='#00FF00'>Arsenal</t>", {["Open",true] spawn BIS_fnc_arsenal}, nil, 1.5, true, true, "", "true", 5, false, "", ""];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Infinite ammo
//Works on any vehicles/turrets/AI/Players. Player guns still jam though. Affects UGLs but not AT/AA launchers. DAKKA DAKKA DAKKA DAKKA
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1;}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Image usage scripts (just code).
//Extended giude located above.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this setObjectTextureGlobal [0,"example.jpg"];
this addAction ["<t>ActionName</t>", {ScreenName setObjectTextureGlobal [0,"example.jpg"];}];
this addAction ["<t>Repaint</t>", {IFV1 setObjectTextureGlobal [0,"Gcamo.jpg"]; IFV1 setObjectTextureGlobal [2,"Gcamo.jpg"]; IFV1 removeAction 0;}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Bloodravenable intel
//Delete object called intel. Must be placed in init field of intel object. Object will delete itself on activation. Second variant can be placed in init field of any object.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["<t>PRESS ANY BUTTON TO APPROPRIATE</t>", {deletevehicle intel}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
intel addAction ["<t>PRESS ANY BUTTON TO APPROPRIATE</t>", {deletevehicle intel}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Text intel with line break
//Used to make static intel. Will be white no matter how UI set up on client. Also shows how to make action with custom text color. Intel text between <t color='#FFFFFF'> and </t>. <br/> is just line break.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["<t color='#FFFFFF'>Text<br/>text</t>", {}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---TP
//Used to make teleport. Teleport player to TPBeacon. As many teleports as needed can be added. And as many beacons as needed (As long as beacon names is unique). To add multiple teleport directions/options just add same line as many times as needed with different beacon names. Second version setting fixed direction for player allowing to synchronize doors if they have different angles.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TP~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["TP", {player setPosASL (getPosASL TPBeacon);}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TP~and~turn~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["TP", {player setPosASL (getPosASL TPBeacon); player setDir 45;}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Any NATO camo to MTP
//Add it to any object. Might as well to arsenal.
//Player clicking action on object and receiving action that works for him and reference to him. After executing action it set camo for that player globally and deletes action.
//>Problem: Camo will reset when player enters virtual arsenal.
//Works on most NATO uniforms.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["<t>Request action</t>", {player addAction ["<t>Set me MTP</t>", {player setObjectTextureGlobal [0,"\a3\characters_f\BLUFOR\Data\clothing1_co.paa"]; removeallactions player;}];}];
//~~~~~~~~~~~~~~~~~~~~~~~~Init~field~variant~[static]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this setObjectTextureGlobal [0,"\a3\characters_f\BLUFOR\Data\clothing1_co.paa"];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Other camo patterns:
\a3\characters_f_epa\BLUFOR\Data\clothing1_mtp_co.paa           //(CTRG Desert)
\a3\characters_f_exp\BLUFOR\Data\clothing1_mtp_urban_co.paa     //(CTRG Urban/Green with silver)
\a3\characters_f_exp\BLUFOR\Data\U_B_CTRG_Soldier_F_co.paa      //(CTRG Stealth/Tropic green)

//---Texture grabber
//You want to make stealth uniform with thermal cloak but in MTP camo but don't know how texture called? Or swap any vanilla/DLC textures? Then this texturegrabber is just for you.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["<t>Grab texture</t>", {_textures = getObjectTextures Analyzable_object; systemChat (formatText ["%1",_textures]);}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Repair,Refuel,Rearm triggers.
//Code goes to On activation field of trigger. Affect anyone entering it player or vehicle. Second variant is expanded with speed limitation and message system.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{_x setDamage 0} Foreach thislist;
{_x setFuel 1} Foreach thislist;
{_x setVehicleAmmo 1} Foreach thislist;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{if (speed _x < 300) then{_x setDamage 0; playSound "Hint"; systemChat "Repaired. You fucked up - we unfuck it. Also you owe us 29 toasters.";}else{systemChat "Too fast for resupply. Move below 300km/h";};} Foreach thislist;
{if (speed _x < 300) then{_x setFuel 1; playSound "Hint"; systemChat "Refueled. Did you know that your fuel can be used as alcohol?";}else{systemChat "Too fast for resupply. Move below 300km/h";};} Foreach thislist;
{if (speed _x < 300) then{_x setVehicleAmmo 1; playSound "Hint"; systemChat "Rearmed. Deliver these shells on enemies of the imperium.";}else{systemChat "Too fast for resupply. Move below 300km/h";};} Foreach thislist;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Speedometers.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_measure = [] spawn {call {while {true} do {hint formatText ["%1", (speed vehicle player)]; sleep 0.01}}};  comment "Not displaying speed correctly for object if it's moving sideways. Only good for vehicles.";
_measure = [] spawn {call {while {true} do {hint formatText ["X: %1 %2 Y: %3 %4 Z: %5", (velocity player select 0),lineBreak,(velocity player select 1),lineBreak,(velocity player select 2)]; sleep 0.01}}}; comment "Speed in 3 axis(m/s).";
_measure = [] spawn {call {while {true} do {hint formatText ["%1 km/h (true 3D)", (((abs(velocity player select 0)) + (abs(velocity player select 1)) + (abs(velocity player select 2)))*3.6)]; sleep 0.01}}}; comment "Combined speed in km/h. Most reliable but not precise. Seems to give slightly higher number.";
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Vehicle health monitor.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addAction ["<t>Get vehicle health indicator.</t>", {
onEachFrame {
if ((vehicle player) != player) then{
hint formatText ["Vehicle integrigy: %1 %2", 100-((damage (vehicle player))*100), "%"];
}else{Hint "Get in vehicle to start.";};
};
[] spawn {
waitUntil {!alive player};
onEachFrame {};
};
}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
