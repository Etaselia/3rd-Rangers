

//Jump function.
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