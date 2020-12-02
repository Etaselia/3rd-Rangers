//---Nanosuit powers [SIMPLE]
//Sometimes simple solutions is the best. This version is dead simple reliable and easily configubable.
//No longer maintaied because of superior but more complicated version.
//I left it for zeuses that want to do something fancy like nanosuit but afraid that something will go wrong. Well not with this one. This thing is like a rock. Imagine you have state of the art assault rifle and you have a rock. It's a rock. No jams. No misfires. No ejection failures. It's a fucking rock. Pick it and YEET it. That's as simple as it gets.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
comment "Settings";
SuitRechargeTime = 40;
ArmorTime = 10;
SneakTime = 15;
FastAsFuckTime = 10;
GottaGoFastMultiplier = 10;
comment "End settings";

player addAction ["<t>Activate Suit</t>", {[] call Nano_menu;}];
Nano_menu = {
removeallactions player;
player addAction ["<t color='#C4CACE'>Maximum Armor</t>", {[] call Nano_Armor;}];
player addAction ["<t color='#606060'>Engage Cloak</t>", {[] call Nano_Sneak;}];
player addAction ["<t color='#FF0000'>Maximum Speed</t>", {[] call Nano_FAFB;}];
};
Nano_Armor = {
removeallactions player;
   player allowDamage false;
   systemChat "Maximum armor";
   playSound "Hint";
 uiSleep ArmorTime;
   player allowDamage true;
   systemChat "Energy depleted";
   playSound "Alarm";
 uiSleep SuitRechargeTime;
  systemChat "Suit Charged";
  playSound "Hint";
[] call Nano_menu;
};
Nano_Sneak = {
removeallactions player;
   [player] remoteExec["hideobject",0,true];
   player setCaptive true;
   systemChat "Cloak Engaged";
   playSound "Hint";
 uiSleep SneakTime;
   systemChat "Energy depleted";
   playSound "Alarm";
   [player,false] remoteExec["hideobject",0];
   player setCaptive false;
 uiSleep SuitRechargeTime;
  systemChat "Suit Charged";
  playSound "Hint";
[] call Nano_menu;
};
Nano_FAFB = {
removeallactions player;
   onEachFrame{player setAnimSpeedCoef GottaGoFastMultiplier;};
   systemChat "Maximum speed";
   playSound "Hint";
 uiSleep FastAsFuckTime;
   systemChat "Energy depleted";
   playSound "Alarm";
   player setAnimSpeedCoef 1;
   onEachFrame{};
 uiSleep SuitRechargeTime;
  systemChat "Suit Charged";
  playSound "Hint";
[] call Nano_menu;
};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
