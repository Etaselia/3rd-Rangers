this addEventHandler ["Fired",{_this select 0 turretUnit [0] setAmmo ["rhs_weap_yakB", 5000];}];

this addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
	_var_hit_selection = _this select 1;
	_var_damage = _this select 2;
	_var_damage_temp = _this select 0 gethit _var_hit_selection;


	if (_var_damage - _var_damage_temp <= 0.1) then {
		_var_damage = _var_damage_temp;
	};
	if (_var_damage - _var_damage_temp >= 0.5) then {
		_var_damage = _var_damage_temp + 0.25;
	};
	if (_var_damage >= 0.75) then {
		if (_var_hit_selection isEqualTo "") then {
			_var_damage = damage _unit;
		}
		else
		{
			_var_damage = 0.75;
		};
	};
	if (_this select 7 in ["hitvrotor","hitengine","hitengine1","hitengine2","hitrfwheel","hitlfwheel","hitrf2wheel","hitlf2wheel"]) then {
		if (_var_damage - _var_damage_temp <=0.1) then {
			_var_damage = _damage;
		};
	};

	_damage = _var_damage;
	_damage
}];
