fncRegenHealthVanilla = {
  healing_item = "itemMap";
  health_regen_percentage = 0.2;
  delay = 1;
  while{true} do {
    if ([player, healing_item] call BIS_fnc_hasItem) then {
        player setDamage (damage player) * (1 - health_regen_percentage);
    };
    sleep delay;
  };
};

remoteExec ["fncRegenHealthVanilla", 0, true];
