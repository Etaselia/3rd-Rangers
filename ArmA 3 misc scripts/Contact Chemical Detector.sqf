
//Loop Start, repeats everything inside every 5 seconds
["itemAdd", ["chem_distance_one", {

//gets the distance to the closest target
threat_distance = selectMin[player distance2D crbn_source_1,player distance2D crbn_source_2];

//checks if threat can be displayed and if a display is available
if (threat_distance < 1000 and "ChemicalDetector_01_watch_F" in (assignedItems player)) then {
  player say "nuclear_geiger",3;
  //inverts distance and makes it usable by the ChemDetector
  _threat_actual = abs((threat_distance - 1000) / 100);
  //ChemDetector Part of the script
  "ChemDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
  private _chem_ui = uiNamespace getVariable "RscWeaponChemicalDetector";
  private _chem_obj_ctrl = _chem_ui displayCtrl 101;
  _chem_obj_ctrl ctrlAnimateModel ["Threat_Level_Source", _threat_actual, true];
}
else {
//Zeros ChemDetector
"ChemDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
private _chem_ui = uiNamespace getVariable "RscWeaponChemicalDetector";
private _chem_obj_ctrl = _chem_ui displayCtrl 101;
_chem_obj_ctrl ctrlAnimateModel ["Threat_Level_Source", 0, true];
};

}, 5]] call BIS_fnc_loop;
