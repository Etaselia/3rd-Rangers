fnc_SetPitchBankYaw = {
	private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY","_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp",
	"_upXTemp"];
	_object = _this select 0;
	_rotations = _this select 1;
	_aroundX = _rotations select 0;
	_aroundY = _rotations select 1;
	_aroundZ = (360 - (_rotations select 2)) - 360;
	_dirX = 0;
	_dirY = 1;
	_dirZ = 0;
	_upX = 0;
	_upY = 0;
	_upZ = 1;
	if (_aroundX != 0) then {
		_dirY = cos _aroundX;
		_dirZ = sin _aroundX;
		_upY = -sin _aroundX;
		_upZ = cos _aroundX;
	};
	if (_aroundY != 0) then {
		_dirX = _dirZ * sin _aroundY;
		_dirZ = _dirZ * cos _aroundY;
		_upX = _upZ * sin _aroundY;
		_upZ = _upZ * cos _aroundY;
	};
	if (_aroundZ != 0) then {
		_dirXTemp = _dirX;
		_dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
		_dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);
		_upXTemp = _upX;
		_upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
		_upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
	};
	_dir = [_dirX,_dirY,_dirZ];
	_up = [_upX,_upY,_upZ];
	_object setVectorDirAndUp [_dir,_up];
};


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

     _top_front_lenght = (_oct_radius - _oct_side/2) * sin(_angle);
     _top_side_lenght = sqrt((_oct_radius - _oct_side/2)^2 - _top_front_lenght^2);

     //adjust for negative coordinates
     if ((_angle + 90 < 180) or (_angle + 90 > 360)) then {
       _side_lenght = _side_lenght * -1;
       _top_side_lenght = _top_side_lenght * -1;
     };

     //some functions need to be executed twice to get around arma weirdness
     //SIDE REFLACTION TEXTURES
     _attached_object_current = createVehicle ["UserTexture10m_F", _adj_pos, [], 0, "CAN_COLLIDE"];
     _attached_object_current attachTo [_player,[_side_lenght,_front_lenght,0]];
     _attached_object_current setdir ((_i * 45) + 90);
     _attached_object_current attachTo [_player,[_side_lenght,_front_lenght,0]];
     _attached_object_current setdir ((_i * 45) + 90);
     _attached_object_current setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
     _attached_object_current setObjectMaterialGlobal [0, "\textures\stealth_effect.rvmat"];
     _attached_object_current setObjectScale _size_multiplier;

     //TOP REFLACTION TEXTURES
     _attached_object_top = createVehicle ["UserTexture10m_F", _adj_pos, [], 0, "CAN_COLLIDE"];
     _attached_object_top attachTo [_player,[_top_side_lenght,_top_front_lenght,(_oct_side/2)]];
     [_attached_object_top,[-90,0,((_i * 45) + 90)]] call fnc_SetPitchBankYaw;
     _attached_object_top setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
     _attached_object_top setObjectMaterialGlobal [0, "\textures\stealth_effect.rvmat"];
     _attached_object_top setObjectScale _size_multiplier;

     //BOTTOM REFLACTION TEXTURES
     _attached_object_bottom = createVehicle ["UserTexture10m_F", _adj_pos, [], 0, "CAN_COLLIDE"];
     _attached_object_bottom attachTo [_player,[_top_side_lenght,_top_front_lenght,-(_oct_side/2)]];
     [_attached_object_bottom,[90,0,((_i * 45) + 90)]] call fnc_SetPitchBankYaw;
     _attached_object_bottom setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
     _attached_object_bottom setObjectMaterialGlobal [0, "\textures\stealth_effect.rvmat"];
     _attached_object_bottom setObjectScale _size_multiplier;
   };
   //straight bottom and top texture, (fills a gap in the adjusted parameter textures)
   _attached_object_top = createVehicle ["UserTexture10m_F", _adj_pos, [], 0, "CAN_COLLIDE"];
   _attached_object_top attachTo [_player,[0,0,(_oct_side/2)]];
   [_attached_object_top,[-90,0,0]] call fnc_SetPitchBankYaw;
   _attached_object_top setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
   _attached_object_top setObjectMaterialGlobal [0, "\textures\stealth_effect.rvmat"];
   _attached_object_top setObjectScale _size_multiplier;

   _attached_object_bottom = createVehicle ["UserTexture10m_F", _adj_pos, [], 0, "CAN_COLLIDE"];
   _attached_object_bottom attachTo [_player,[0,0,-(_oct_side/2)]];
   [_attached_object_bottom,[90,0,0]] call fnc_SetPitchBankYaw;
   _attached_object_bottom setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.75,0.75,0.75,1.0,co)"];
   _attached_object_bottom setObjectMaterialGlobal [0, "\textures\stealth_effect.rvmat"];
   _attached_object_bottom setObjectScale _size_multiplier;


   _player setVariable ["textures", getObjectTextures _player, true];
   _player setVariable ["materials", getObjectMaterials _player, true];

  _player setObjectTextureGlobal [0,"\textures\transparent_ca.paa"];
  _player setObjectTextureGlobal [1,"\textures\transparent_ca.paa"];
  _player setObjectTextureGlobal [2,"\textures\transparent_ca.paa"];
  _player setObjectTextureGlobal [3,"\textures\transparent_ca.paa"];

  _player setObjectMaterialGlobal [0, "\textures\stealth_effect.rvmat"];
  _player setObjectMaterialGlobal [1, "\textures\stealth_effect.rvmat"];
  _player setObjectMaterialGlobal [2, "\textures\stealth_effect.rvmat"];
  _player setObjectMaterialGlobal [3, "\textures\stealth_effect.rvmat"];

  //make AI ignore vehicle
  _passengers = fullCrew _player;
  _captive_list = [];
  {
    _current_check = _x select 0;
      if (captive _current_check) then {
        _captive_list append [_current_check];
      };
      (_current_check) setCaptive true;
  } forEach _passengers;
  _player setVariable ["captive_list",_captive_list,true];
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
  _passengers = fullCrew _player;
  _captive_list = _player getVariable ["captive_list", objNull];
  {
    _current_check = _x select 0;
    if !(_current_check in _captive_list) then
    {
      _current_check setCaptive false;
    };
  } forEach _passengers;
};

//Debug / how to spawn function
/*
[test_unit] spawn fnc_vehicle_stealth;
[test_unit] spawn fnc_remove_vehicle_stealth;
*/
