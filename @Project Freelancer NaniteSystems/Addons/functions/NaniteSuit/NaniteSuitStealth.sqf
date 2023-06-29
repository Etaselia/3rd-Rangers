/*
NaniteStealth

Description: This code represents the nanite stealth functionality in SQF (Scripting Language for Arma series). It allows the player to activate stealth mode, either as an individual or while inside a vehicle, consuming nanite energy over time.

Usage: Call 'NaniteStealth' to activate nanite stealth. Call 'NaniteStealthStop' to deactivate nanite stealth.

Global Variables:
- naniteCloakisActive (Boolean): Represents the activation state of the nanite stealth. Set to 'true' when the stealth is active.
- tts_cloak_isCloaked (Boolean): Represents the cloaking state of the player. Set to 'true' when the player is cloaked.
- naniteEnergy (Number): Represents the current value of the player's nanite energy.
- naniteStealthEnergyDrain (Number): Represents the rate at which nanite energy drains while in individual stealth mode. Default value is 10.
- naniteStealthEnergyDrainVehicle (Number): Represents the rate at which nanite energy drains while in vehicle stealth mode. Default value is 50.
- naniteStealthVehicleIsActive (Boolean): Represents the activation state of the vehicle stealth. Set to 'true' when the vehicle stealth is active.
- naniteCloakVehicleStealthIsAllowed (Boolean): Represents whether vehicle stealth is allowed for the player.

Functions:
- NaniteStealth: Activates nanite stealth for the player.
- NaniteStealthStop: Deactivates nanite stealth for the player.

Note: Additional checks and code adjustments may be required for specific use cases, such as exiting a vehicle while in stealth mode.
*/


NaniteStealth = {
	//general Stealth Skill
	player setVariable ["naniteCloakisActive",true];
	player setVariable ["tts_cloak_isCloaked", true,true];
	//No need to refactor this
	[player] remoteExec ["eta_cloak_fnc_cloakParticles",0,false];
	[player] remoteExec ["eta_cloak_fnc_transition",0,false];
	[player, true] remoteExec ["hideObject", 0, true];
	//prevents phasing through walls
	player hideObject false;
	[player, true] remoteExec ["setCaptive", 0, true];

	if (vehicle player == player) then {
		player spawn {
			while {player getVariable["naniteCloakisActive",true]} do {
				_naniteEnergy = player getVariable["naniteEnergy",0];
				_energyDrain = player getVariable["naniteStealthEnergyDrain",10];
				_naniteEnergy = _naniteEnergy - _energyDrain;
				player setVariable["naniteEnergy",_naniteEnergy];
				if (_naniteEnergy <= 0) then {
					player setVariable["naniteCloakisActive",false];
					player call NaniteStealthStop;
				};
				sleep 1;
			};
		};
	}
	else{
		_vehicleStealthIsAllowed = player getVariable["naniteCloakVehicleStealthIsAllowed",false];
		if (_vehicleStealthIsAllowed) then {
			vehicle player call fnc_vehicle_stealth;
			player setVariable ["naniteStealthVehicleIsActive",true];
			player spawn {
				while {player getVariable["naniteCloakisActive",true]} do {
					_naniteEnergy = player getVariable["naniteEnergy",0];
					_energyDrain = player getVariable["naniteStealthEnergyDrainVehicle",50];
					_naniteEnergy = _naniteEnergy - _energyDrain;
					player setVariable["naniteEnergy",_naniteEnergy];
					if (_naniteEnergy <= 0) then {
						player setVariable["naniteCloakisActive",false];
						player setVariable ["naniteStealthVehicleIsActive",false];
						//TODO
						// this is going to need additional checks for someone exiting the vehicle
						vehicle player call fnc_remove_vehicle_stealth;
						player call NaniteStealthStop;
					};
					sleep 1;
				};
			};
		} else {
			systemChat "Suit Stealth Generator not calibrated for Vehicle Stealth";	
			player call NaniteStealthStop;
		};
	};
};

NaniteStealthStop ={
		//general Stealth Skill
		player setVariable ["naniteCloakisActive",false];
		player setVariable ["tts_cloak_isCloaked", false,true];
		[player, false] remoteExec ["hideObject", 0, true];
		[player, false] remoteExec ["setCaptive", 0, true];
		//vehicle Stealth
		if (player getVariable ["naniteStealthVehicleIsActive",false]) then {
			vehicle player call fnc_remove_vehicle_stealth;
			player setVariable ["naniteStealthVehicleIsActive",false];
		};
};

// TODO
// Write a EH that stops vehicle stealth if anyone exits the vehicle