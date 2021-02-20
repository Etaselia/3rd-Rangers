prox_distance = 200;
hintSilent formatText ["Assault C.A.T.S. Online %1 Detection Range: %2m",linebreak,prox_distance];
ShotLocation = [];
["itemAdd", ["cats_assault", {
  all_units = nearestObjects [player, ["Man"], prox_distance];
  {
    if !(_x in units player) then {
        EH_GetShotPos = _x addEventHandler["Fired", {
          unit_shot = _this select 0;
          ShotLocation = getPosATL unit_shot;
          ShotLocation set [2, (ShotLocation select 2) + 1];
          if (ShotLocation vectorDistance getPosATL player > 200) then {
            unit_shot removeAllEventHandlers "Fired";
            hintSilent formatText ["Distance: %1",ShotLocation vectorDistance getPosATL player];
          };
      }];
    };
  }forEach all_units;
  all_units = [];
  EH_Draw_Icon = addMissionEventHandler["EachFrame",{
    player spawn{
      if (count ShotLocation != 0) then {
          drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [1,0,0,0.5], ShotLocation, 1, 1, 0,"Shot detected!", 2, 0.05, 'RobotoCondensed', 'center', true];
          sleep 1;
          ShotLocation = [];
          };
      };
  }];
}, 5]] call BIS_fnc_loop;
