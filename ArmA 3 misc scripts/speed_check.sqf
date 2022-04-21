{
    if (_x isKindOf "LandVehicle") then {
      if (speed _x >= 50) then {
        _x setHitPointDamage [selectRandom ["hitrfwheel","hitlfwheel"], 1];
      };
    };
} forEach thisList;
