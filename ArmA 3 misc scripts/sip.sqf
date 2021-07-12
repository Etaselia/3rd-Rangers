this addEventHandler ["HandleDamage", {
var_hit_selection = _this select 1;
var_damage = _this select 2;
var_damage_temp = _this select 0 gethit var_hit_selection;


if (var_damage_temp + var_damage >= 0.75) then {
	if (_this select 7 in ["","hitfuel","hithull"]) then {
		var_damage = 0.75;
	};
};

_damage = var_damage;
_damage
}];
