/*
**Code Documentation: NaniteGeneratorV3**

**Global Variables:**
1. `naniteGeneratorActive` (Boolean): Represents the activation state of the nanite generator for the player. This variable is set to `true` when the generator is active.
2. `naniteEnergyStartingValue` (Number): Represents the initial value of the player's nanite energy. If not set, it defaults to `25`.
3. `naniteEnergy` (Number): Represents the current value of the player's nanite energy. It starts with the value of `naniteEnergyStartingValue` and increases over time.
4. `naniteEnergyRechargePerSecond` (Number): Represents the rate at which the player's nanite energy recharges per second. If not set, it defaults to `1`.

The code utilizes a function named `NaniteGeneratorV3`. When called, it sets the player's `naniteGeneratorActive` variable to `true` and spawns a separate thread to handle the nanite energy regeneration process.

Inside the spawned thread, the player's initial nanite energy value is obtained from `naniteEnergyStartingValue`. Then, a loop runs as long as `naniteGeneratorActive` is `true`. During each iteration, the `_naniteEnergy` variable is incremented by the value specified in `naniteEnergyRechargePerSecond`. The updated nanite energy value is then set back to the player's `naniteEnergy` variable.
Finally, the thread sleeps for `1` second using the `sleep` command to control the recharge rate.

Make sure to initialize the necessary variables before calling the `NaniteGeneratorV3` function to ensure proper functionality.
*/

NaniteGeneratorV3 = {
	player setVariable["naniteGeneratorActive",true];
	player spawn {
		private _naniteStartingValue = player getVariable["naniteEnergyStartingValue",25];
		private _naniteEnergy = player getVariable["naniteEnergy",_naniteStartingValue];
		while {player getVariable["naniteGeneratorActive",false]} do {
			_naniteEnergy = _naniteEnergy + player getVariable["naniteEnergyRechargePerSecond",1];
			player setVariable["naniteEnergy",_naniteEnergy];
			sleep 1;
		};
	};
};
