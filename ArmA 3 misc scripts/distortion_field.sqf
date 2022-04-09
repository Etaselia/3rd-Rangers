//UNIT DAMAGE NEEDS TO BE DISABLED
this addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
  if (_unit getVariable ["eta_distortionfield",50] >= 0) then {
    _unit setPos(_unit getRelPos [5, random [0, 180, 360]]);
    _damage = 0;
    _current_distortion = _unit getVariable ["eta_distortionfield",50];
    _current_distortion = _current_distortion - 1;
		if (_current_distortion % 10 == 0) then {
			_unit globalchat "Xiànchǎng sǔnhuài, hòutuì!";
		};
    _unit setVariable ["eta_distortionfield", _current_distortion, true];
    "modulelightning_f" createUnit [_unit getRelPos[5,random [0, 180, 360]],group _unit];
  }
  else{
    _unit setDamage 1;
  }
}];
