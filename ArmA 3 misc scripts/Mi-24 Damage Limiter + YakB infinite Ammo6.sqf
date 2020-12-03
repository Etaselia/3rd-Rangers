this addEventHandler ["Fired",{_this select 0 turretUnit [0] setAmmo ["rhs_weap_yakB", 5000];}];

this addEventHandler ["HandleDamage", {
var_hit_selection = _this select 1;
var_damage = _this select 2;
var_damage_temp = _this select 0 gethit var_hit_selection;


if (var_damage - var_damage_temp <= 0.1) then {
	var_damage = var_damage_temp;
};
if (var_damage - var_damage_temp >= 0.5) then {
	var_damage = var_damage_temp + 0.25;
};
if (var_damage >= 0.75) then {
	if (var_hit_selection isEqualTo "") then {
		var_damage = damage test_unit;
	}
	else
	{
		var_damage = 0.75;
	};
};
if (_this select 7 in ["hitvrotor","hitengine","hitengine1","hitengine2"]) then {
	if (var_damage - var_damage_temp <=0.1) then {
		var_damage = _damage;
	};
};

hintSilent formatText ["Damage: %1 GetHit: %2",var_damage,var_damage_temp];

_damage = var_damage;
_damage
}];
