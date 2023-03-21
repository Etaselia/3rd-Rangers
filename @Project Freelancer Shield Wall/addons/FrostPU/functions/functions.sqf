
//////////////////////////////////////

/*
REQUIREMENTS:
	-	Shield should have its own HP pool, despawns if its depleted 								--TESTING - STAGE II
	- Shield should change color depening on its state														--TESTING - STAGE II
		- 3 States, Blue, Orange, Red
	- Shield should make noises when spawned, despawned, broken										--TESTING - STAGE II
	- User should not be able to shoot while shield active!!!											--TESTING - STAGE II
	- Shield activation via ACE or Hotkey, IF CERTAIN ITEM IN INVENTORY						--DONE

TODO:
	- Add Conditions for Shield Recharge																					--TESTING - STAGE II
	- Fix Disable Weapons																													--TESTING - STAGE II
*/


// Global Variables
/*
defaultHandShieldHP = 100; 				// How much Health the HandShield Spawns with
maxHandShieldHP = 100;						//how much it can maximally charge to

handShieldColorBlue = 50;
handShieldColorYellow = 30;

handShieldChargeTick = 5; 				//How long between updates to the charge state
handShieldChargePercentage = 20; 	//How much does it get charged each charge tick

handShieldAlwaysRecharge = false; //Is active Recharge active
*/

//Called by User
fncInitiateShield ={
	params ["_user"];
	_user = player;
	_shieldName = _user getVariable ["_handShieldColor", "EtaShieldWall"];
	if("HandShieldGenerator" in items player && !(_shieldName in attachedObjects _user)) then{
		_user say3D ["eta_sound_ShieldWall_ON", 10];
		[_user] call fncSpawnHandShield;
	};
};

//Called by Script, Spawns the Shield and handles its Damage
fncSpawnHandShield ={
	params ["_user"];
	if(!handShieldAlwaysRecharge) then {
			_user setVariable ["_handShieldCharging",false];
	};
	_user setVariable ["_handShieldActive",true];
	_shieldName = _user getVariable ["_handShieldColor", "EtaShieldWall"];
	private _ShieldWall = _shieldName createVehicle getPos _user;
	//SOUND, MOVE THIS
	_ShieldWall attachto [_user,[0,0,-0.1],"lefthand"];
	//Model is facing the wrong way!
	_ShieldWall setDir 180;

	//delete shield on user death
	_user addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
	  {
				[attachedto _target] call fncDespawnHandShield;
	  } forEach attachedObjects _unit;
	}];

	//Spawn Shield and handle HP
	_ShieldWall addEventHandler ["HitPart", {
		(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
	  _currentShield = attachedTo _target getVariable ["_handShieldPoints", defaultHandShieldHP];
	  attachedTo _target setVariable ["_handShieldPoints", (_currentShield - (_ammo select 0)), false];
	 	_currentShield = attachedto _target getVariable "_handShieldPoints";

	  if(_currentShield <= 0 || !alive attachedTo _target || !("HandShieldGenerator" in items player) ) then {
			//play shield break
			attachedTo _target say3D ["eta_sound_ShieldWall_Broke", 10];
			[attachedto _target] call fncDespawnHandShield;
	  } else {
			[attachedTo _target] call fncSelectShieldColor;
		};
	}];

	//Stop weapon from firing
	//overrides the firing key, doesn't mess with Melee
	_user addAction ["", {}, "", 0, false, true, "DefaultAction", "(_target getVariable ['_handShieldActive', false])",-1];
	_checker = _user getVariable ["_etaHandShieldCheckActive", false];

	//removes shield if item got removed from inventory
	if(!_checker) then {
		[_user] spawn {
			params ["_user"];
			_user setVariable ["_etaHandShieldCheckActive", true];
			while {_user getVariable ["_etaHandShieldCheckActive", true]} do {
				if(!("HandShieldGenerator" in items _user)) then {
					[_user] call fncDespawnHandShield;
					_user setVariable ["_etaHandShieldCheckActive", false];
				};
				sleep 10;
			};
		};
	};
};

//Helper Function, called whenever shield is hit
fncSelectShieldColor ={
	params ["_user"];
	_currentColor = _user getVariable ["_handShieldColor", "EtaShieldWall"];
	_currentShield = _user getVariable ["_handShieldPoints", defaultHandShieldHP];
	_shieldObject = "EtaShieldWall";
	if(_currentShield < handShieldColorBlue) then {
		_shieldObject = "EtaShieldWall_yellow";
		if(_currentShield < handShieldColorYellow) then {
			_shieldObject = "EtaShieldWall_red";
		};
	};
	_user setVariable ["_handShieldColor", _shieldObject, false];
	if(_currentColor != _shieldObject && _currentShield > 0) then {
		[_user] call fncDespawnHandShield;
		[_user] call fncSpawnHandShield;
	};
};

//Called by User, Plays sound, then despawns shield
fncInitiateShieldDespawn = {
	params ["_user"];
	_user = player;
	if("HandShieldGenerator" in items player) then{
	_user say3D ["eta_sound_ShieldWall_OFF", 10];
	[_user] call fncDespawnHandShield;
	};
};

//Called by Script, Despawns Shield and Calls Recharge Function
fncDespawnHandShield ={
	params ["_user"];
	_user setVariable ["_handShieldActive",false];
	{
	    if(typeOf _x in ["EtaShieldWall","EtaShieldWall_yellow","EtaShieldWall_red"]) then {
				[attachedTo _x] call fncHandShieldRecharge;
				deleteVehicle _x;
			}
	} forEach attachedObjects _user;
};

//handles passive recharge, checks if recharging already is the case
fncHandShieldRecharge ={
	params ["_user"];
	[_user] spawn {
		params ["_user"];
		//CHECK IF SHIELD IS ALREADY CHARGING
		if(!(_user getVariable ["_handShieldCharging", false])) then {
			//UPDATE VAR TO BE CHARGING
			_user setVariable ["_handShieldCharging", true];
			//Check to account for immidiate re-activations
			sleep 0.05;
			if(_user getVariable ["_handShieldActive", true] && !handShieldAlwaysRecharge) then {
				_user setVariable ["_handShieldCharging", false];
			};

			while {_user getVariable ["_handShieldCharging", true]} do {
					_currentShield = _user getVariable ["_handShieldPoints", 100];
					_currentShield = _currentShield + ((handShieldChargePercentage / 100) * maxHandShieldHP);
					//update shield color if always charging
					if(_currentShield >= maxHandShieldHP) then {
						_currentShield = maxHandShieldHP;
						_user setVariable ["_handShieldPoints", _currentShield, true];
						//BREAK CONDITION
						//Global Setting
						if(!handShieldAlwaysRecharge) then {
								_user setVariable ["_handShieldCharging",false];
						};
					}else {
						_user setVariable ["_handShieldPoints", _currentShield, true];
					};
					if(handShieldAlwaysRecharge && _user getVariable ["_handShieldActive",true]) then {
						[_user] call fncSelectShieldColor;
					};
					sleep handShieldChargeTick;
			};
		};
	};
};
