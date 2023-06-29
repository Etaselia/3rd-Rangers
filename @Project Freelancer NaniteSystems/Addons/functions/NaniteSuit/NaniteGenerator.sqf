/*
NaniteGeneratorV3

Description: This code represents a nanite generator functionality in SQF (Scripting Language for Arma series). The nanite generator allows the player to recharge their nanite energy over time.

Usage: Call 'NaniteGeneratorV3' (with parameter [false]) to activate the nanite generator for the player. Call 'NaniteGeneratorV3' with parameter [true] to reset player's energy to initial value. Call 'NaniteGeneratorStop' to deactivate the nanite generator.

Global Variables:
- naniteActivationState (Boolean): Represents the activation state of the nanite generator for the player. Set to 'true' when the generator is active.
- naniteGeneratorActive (Boolean): Represents the current state of the nanite generator. Set to 'true' when the generator is active.
- naniteEnergyStartingValue (Number): Represents the initial value of the player's nanite energy. Default value is 25.
- naniteEnergy (Number): Represents the current value of the player's nanite energy.
- naniteEnergyRechargePerSecond (Number): Represents the rate at which the player's nanite energy recharges per second. Default value is 1.
*/

NaniteGeneratorV3 = {
  private _energyReset = param [0, false, [true]];

	if (!player getVariable["naniteActivationState",false]) exitWith {};

	if (_energyReset) exitWith {
		private _naniteStartingValue = player getVariable["naniteEnergyStartingValue",25];
		player setVariable["naniteEnergy",_naniteStartingValue];
	};

	player setVariable["naniteGeneratorActive",true];
	player spawn {
		private _naniteStartingValue = player getVariable["naniteEnergyStartingValue",25];
		private _naniteEnergy = player getVariable["naniteEnergy",_naniteStartingValue];
		while {player getVariable["naniteGeneratorActive",false]} do {
			_naniteEnergy = _naniteEnergy + player getVariable["naniteEnergyRechargePerSecond",1];
			player setVariable["naniteEnergy",_naniteEnergy];
			sleep 1;
		};
		private _naniteEnergy = player getVariable["naniteEnergy",_naniteStartingValue];
	};
};

NaniteGeneratorStop = {
	player setVariable["naniteGeneratorActive",false];
};
