waitUntil { not isNull player };

//TODO
//1: Make a condition for this to not appear if player in vehicle               //DONE
//2: Point at TL instead of SL if he is closer                                  //DONE
//3: Use custom position for UI instead of center of screen (option toggle)     //Somewhat done

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
      if ((player distance2D leader player >= eta_distance_to_leader) and (player distance2D eta_teamleader >= eta_distance_to_leader) and (alive eta_teamleader) and (vehicle player == player)) then {
        player spawn {
          while {(player distance2D leader player >= eta_distance_to_leader) and (player distance2D eta_teamleader >= eta_distance_to_leader) and (alive eta_teamleader) and (vehicle player == player)} do {
            _closest_leader = objNull;
            if (player distance2D leader player > player distance2D eta_teamleader) then {
                _closest_leader = eta_teamleader;
            }
            else
            {
              _closest_leader = leader player;
            };
            [format["<t color='#ff0000' size='2'>STAY WITH YOUR SL!</t><br/>Your SL is %1<br/>He is bearing %2<br/>He is %3m away", name _closest_leader, round (player getdir _closest_leader),round (player distance2d _closest_leader)],-1,0.65,4,0,0,1] remoteExec["BIS_fnc_dynamicText",player];
            sleep 3;
          };
          [format[""],-1,0.65,4,1,0,1] remoteExec["BIS_fnc_dynamicText", player];
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
  [format["<t color='#00FF00' size='2'>%1 took TeamLead!</t>", name _ace_player],-1,0.65,4,1,0,1] remoteExec["BIS_fnc_dynamicText",player];
};

[] remoteExec ["f_anti_lonewolf"];
