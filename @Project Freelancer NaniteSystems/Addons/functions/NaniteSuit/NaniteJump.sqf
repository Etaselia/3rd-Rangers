/*
NaniteJump

Description: This code enables the player to perform a jump, propelling them upwards with a specific velocity. It requires the player to be in contact with the ground and have sufficient energy to perform the jump.

Usage: Call 'NaniteJump' to execute the nanite jump functionality.

Notes:
- The nanite jump propels the player vertically with a variable velocity based on CBA settings.
- The player's energy is reduced by the 'naniteJumpEnergyCostCBAS' value after a successful jump.
- The 'NaniteJumpStuckCheck' function is called to monitor if the player is stuck in mid-air, and it resets player's velocity. In arma you will stuck under roof if you'll get propelled upwards indoors.

Variables:
- naniteJumpEnergyCostCBAS (Number): Represents the energy cost required to perform a jump. Dictated by CBA settings.
- naniteJumpSpeedCBAS (Number): Represents the velocity player will get when performing a jump. Dictated by CBA settings.
- naniteEnergy (Number): Player's suit energy.
*/

NaniteJump = {
	if ((vehicle player) != player) exitWith {};
	if (!isTouchingGround player) exitWith {};
	private _jumpEnCost = player getVariable "naniteJumpEnergyCostCBAS";
	if ((player getVariable "naniteEnergy") <= _jumpEnCost) exitWith {};

	private _jumpSpeed= player getVariable "naniteJumpSpeedCBAS";
	player setVelocity [(velocity player select 0), (velocity player select 1), _jumpSpeed];
	player setVariable ["naniteEnergy", ((player getVariable "naniteEnergy") - _jumpEnCost)];

	[] spawn {[] call NaniteJumpStuckCheck;};
};

NaniteJumpStuckCheck = {
	while ((velocity player select 2) > 0.1) do {
		private _SpeedUpward = (velocity player select 2);
		sleep 0.1;
		Private _SpeedUpward2 = (velocity player select 2);
		if ((_SpeedUpward - _SpeedUpward2) < 0.5) then {player setVelocity [0,0,0];};
		sleep 0.1;
	};
};
