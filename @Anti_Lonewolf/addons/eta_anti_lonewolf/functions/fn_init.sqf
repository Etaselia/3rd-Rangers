waitUntil { not isNull player };

f_anti_lonewolf = {
  player spawn {
    while {eta_activate_lonewolf} do {
      sleep 3;
      eta_teamleader = leader group player;
      {
          if (_x getVariable ['eta_teamlead', false]) then {
            eta_teamleader = _x;
          };
      } forEach units player;
      if ((player distance2D leader player >= eta_distance_to_leader) and ((player distance2D eta_teamleader >= eta_distance_to_leader) and (alive eta_teamleader))) then {
        player spawn {
          while {(player distance2D leader player >= eta_distance_to_leader) and ((player distance2D eta_teamleader >= eta_distance_to_leader) and (alive eta_teamleader))} do {
            //TODO Point at TL instead of SL if he is closer
            [[format["<t color='#ff0000' size='5'>STAY WITH YOUR SL!</t><br/>Your SL is %1<br/>He is bearing %2<br/>He is %3m away", name leader player, round (player getdir leader player),round (player distance2d leader player)], "PLAIN", 0, true, true]] remoteExec["titleText",player];
            sleep 3;
          };
          [[format[""], "PLAIN", 0, true, true]] remoteExec["titleText", player];
        };
      };
    };
  };
};

f_ace_assign_eta_teamlead = {
  params ["_ace_player"];
  {
      _x setVariable ['eta_teamlead', false, true];
  } forEach (units _ace_player);
  hint str(_ace_player);
  _ace_player setVariable ['eta_teamlead', true, true];
  [[format["<t color='#00FF00' size='2'>%1 took TeamLead!</t>", name _ace_player], "PLAIN", 0, true, true]] remoteExec["titleText",player];
};

[] remoteExec ["f_anti_lonewolf"];
