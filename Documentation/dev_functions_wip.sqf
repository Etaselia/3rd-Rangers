test_bool = false;
  [] spawn {
  while {test_bool} do {
    [vehicle player] remoteExec [ "eta_cloak_fnc_transition"];
    sleep 0.5;
  };
};

[SIDE,FORWARD,Z]

fnc_vehicle_stealth = {
  params ["_player"];
  _com = getCenterOfMass _player;
  _pos = position _player;
  _adj_pos = [(_pos select 0) + (_com select 0), (_pos select 1) + (_com select 1), (_pos select 2) + (_com select 2)];

  _dimension = sizeOf typeOf _player;
  _size_multiplier = (_dimension / 10) /2;
  _oct_side = 10 * _size_multiplier;
  _oct_radius = _oct_side/2 * (1 + sqrt 2);

  //get coordinates via simple geometric maths and attach to the coordinates
  for [{private _i = 0 }, {_i <= 8 }, { _i = _i + 1 }] do
  {
     _angle = _i * 45;
     _front_lenght = _oct_radius * sin(_angle);
     _side_lenght = sqrt(_oct_radius^2 - _front_lenght^2);

     //adjust for negative coordinates
     if ((_angle + 90 < 180) or (_angle + 90 > 360)) then {
       _side_lenght = _side_lenght * -1;
     };

     //some functions need to be executed twice to get around arma weirdness
     _attached_object_current = createVehicle ["UserTexture10m_F", _adj_pos, [], 0, "CAN_COLLIDE"];
     _attached_object_current attachTo [_player,[_side_lenght,_front_lenght,0]];
     _attached_object_current setdir ((_i * 45) + 90);
     _attached_object_current attachTo [_player,[_side_lenght,_front_lenght,0]];
     _attached_object_current setdir ((_i * 45) + 90);
     _attached_object_current setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
     _attached_object_current setObjectMaterialGlobal [0, "stealth_effect2.rvmat"];
     _attached_object_current setObjectScale _size_multiplier;
   };
   _player setVariable ["textures", getObjectTextures _player];
   _player setVariable ["materials", getObjectMaterials _player];

  _player setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
  _player setObjectTextureGlobal [1,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
  _player setObjectTextureGlobal [2,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
  _player setObjectTextureGlobal [3,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];

  _player setObjectMaterialGlobal [0, "stealth_effect2.rvmat"];
  _player setObjectMaterialGlobal [1, "stealth_effect2.rvmat"];
  _player setObjectMaterialGlobal [2, "stealth_effect2.rvmat"];
  _player setObjectMaterialGlobal [3, "stealth_effect2.rvmat"];
};

fnc_remove_vehicle_stealth = {
  params ["_player"];
  {
      deleteVehicle _x;
  } forEach attachedObjects _player;
  _testtextures = _player getVariable ["textures", objNull];
  _testmats = _player getVariable ["materials", objNull];
  if !(_testtextures isEqualTo objNull) then
  {
    private _i = 0;
    {
        _player setObjectTextureGlobal [_i,_x];
        _i = _i+1;
    } forEach _testtextures;
  };
  if !(_testmats isEqualTo objNull) then
  {
    private _i = 0;
    {
        _player setObjectMaterialGlobal [_i,_x];
        _i = _i+1;
    } forEach _testmats;
  };
};
[test_unit] spawn test_remove_stealth;
[test_unit] spawn test_fnc_attach;

[[B Alpha 1-1:1 (Eta),"driver",-1,[],false],[B Alpha 1-2:1,"cargo",0,[],false],[B Alpha 1-2:2,"cargo",1,[],false],[B Alpha 1-2:3,"cargo",2,[],false],[B Alpha 1-2:4,"cargo",3,[],false]]
