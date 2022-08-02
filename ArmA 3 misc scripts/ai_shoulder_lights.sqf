params ["_unit"];

_light = "reflector_cone_01_wide_white_f" createVehicle getPosATL _unit;
_light attachTo [_unit, [-0.1, 0.1, 0.5], "Pelvis"];
[_light, vectorDir _unit] remoteExec ["setVectorDir",0,true];
_light enableDynamicSimulation true;

_unit setVariable ["_light", _light, true];

_unit addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
  _light = _unit getVariable ["_light", Null];
  deleteVehicle _light;
}];

//CALL VIA
//[this] execVM "ai_shoulder_lights.sqf";
