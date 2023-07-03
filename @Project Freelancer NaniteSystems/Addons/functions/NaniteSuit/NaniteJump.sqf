/*
NaniteJump

Description: This code enables the player to perform a nanite jump, propelling them upwards with a specific velocity. It requires the player to be in contact with the ground and have sufficient nanite energy to perform the jump.

Usage: Call 'NaniteJump' to execute the nanite jump functionality.

Global Variables:
- naniteJumpEnergyCostCBAS (Number): Represents the nanite energy cost required to perform a jump. This variable is retrieved from the player's variables.
- naniteEnergy (Number): Represents the current value of the player's nanite energy.

Dependencies: Requires the 'NaniteJumpStuckCheck' function to be called to check if the player is stuck in mid-air after the jump.

Notes:
- The nanite jump propels the player vertically with a fixed velocity of 20 units per second.
- The player's nanite energy is reduced by the 'naniteJumpEnergyCostCBAS' value after a successful jump.
- The 'NaniteJumpStuckCheck' function is called to monitor if the player is stuck in mid-air, and it adjusts the player's velocity accordingly.
*/

NaniteJump = {
	if ((vehicle player) != player) exitWith {};
	if (!isTouchingGround player) exitWith {};
	private _jumpEnCost = player getVariable "naniteJumpEnergyCostCBAS";
	if ((player getVariable "naniteEnergy") <= _jumpEnCost) exitWith {};

	player setVelocity [(velocity player select 0), (velocity player select 1), 20];
	player setVariable ["naniteEnergy", ((player getVariable "naniteEnergy") - _jumpEnCost)];
	[] call NaniteJumpStuckCheck;
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
