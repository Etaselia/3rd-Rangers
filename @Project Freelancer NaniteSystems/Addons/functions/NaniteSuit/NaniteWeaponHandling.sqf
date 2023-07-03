/*
Weapon handling

Description: This code handles weapon behavior modification, such as reduced sway and recoil compensation.

Functions:
NaniteWeaponHandling: Handles the activation and deactivation of weapon handling modifications based on a control signal.
EH_ShotsFiredWC: Event handler that calculates nanite energy consumption per shot when the player fires a weapon.

Variables:
WeaponHandlingState (Boolean): Represents the activation state of the weapon handling mode. Set to 'true' when the mode is active.
traceBullets (Boolean): Dictates state of feature for showing bullet path while weapon handling active. Dictated by CBA settings.
traceNumberCBAS  (Number): Number of bullets that will be traced if feature is on. Dictated by CBA settings.
swayModificatorCBAS (Number): Modifies the aim coefficient to reduce weapon sway. Dictated by CBA settings.
energyPerShotCBAS (Number): Represents the energy consumption per shot for recoil compensation. Dictated by CBA settings.
recoilModificatorCBAS (Number): Modifies the unit recoil coefficient to reduce weapon recoil. Dictated by CBA settings.
naniteEnergy (Number): Represents the current value of the player's nanite energy.
*/

//Weapons handling function.
NaniteWeaponHandling = {
  private _controlSignal = param [0, false, [true]];

	if (_controlSignal) then {
			if (!(player getVariable ["WeaponHandlingState", false])) then {
			MEH_NoSwayWC = addMissionEventHandler ["EachFrame", {player setCustomAimCoef (player getVariable"swayModificatorCBAS");}];
			};
		if (player getVariable "traceBulletsCBAS") then {[player, (player getVariable "traceNumberCBAS")] spawn BIS_fnc_traceBullets;};
		player setUnitRecoilCoefficient (player getVariable "recoilModificatorCBAS");
		player setVariable["WeaponHandlingState",true];
	}
	else {
		removeMissionEventHandler ["EachFrame", MEH_NoSwayWC];
			[] spawn {
				sleep 0.4;
				[player, 0] spawn BIS_fnc_traceBullets;
			};
		player setCustomAimCoef 1;
		player setUnitRecoilCoefficient 1;
		player setVariable["WeaponHandlingState",false];
	};
};

EH_ShotsFiredWC = player addEventHandler ["Fired", {
	//Recoil compensation energy consumption backend.
	private _energyPerShot = player getVariable "energyPerShotCBAS";
	if (player getVariable "WeaponHandlingState") then {
		private _naniteEnergy = (player getVariable "naniteEnergy") - _energyPerShot;
		player setVariable["naniteEnergy",_naniteEnergy];
	};
}];