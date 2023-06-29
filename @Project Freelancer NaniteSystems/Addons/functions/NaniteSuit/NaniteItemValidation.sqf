/*
Item validation

Description: This code is responsible for item validation. Validation typically occurs when player exits arsenal, closes inventory or presses any functional button. When player exits arsenal his energy also resets. Activation or deactivation functions respectiveley called  when necessary. Function returns boolean which is 'false' if no item present and 'true' otherwise.

Usage: Call NaniteItemCheck with parameter [false] to validate item. If you also want to reset energy level call with parameter [true].

Variables:
- naniteCapableItemsCBAS (String): Global variable dictated by CBA setting. List of suit classes.
- naniteActivationState (Bool): Suit activation state. True if suit is active False if not. Set by suit activation and deactivation functions.
*/

//Item check on exiting vanilla arsenal. Either activates or deactivates suit systems. Also resets energy level.
[missionNamespace, "arsenalClosed", {
    [true] call NaniteItemCheck;
}] call BIS_addScriptedEventHandler;
//Item check on exiting inventory. Either activates or deactivates suit systems.
player addEventHandler ["InventoryClosed", {
    [false] call NaniteItemCheck;
}];

//Item check function. Called by inventory check, arsenal check and hotkey input. Either activates or deactivates suit systems.
NaniteItemCheck = {
  private _withReset = param [0, false, [true]];
    private _returnVal = true; //return value for key check
    if (player getVariable "naniteActivationState") then {
        //suit was active
        if ((uniform player) in (naniteCapableItemsCBAS splitString ",")) then { //PLACEHOLDER
            if (_withReset) then {[true] call NaniteGeneratorV3;}; //Resets suit if function called by exiting arsenal
            _returnVal = true; //Return value of this function is essentially used by naniteOnKeyItemCheck to choose between proceeding or not doing anything with key input.
        }
        else {
            [] call NaniteDisableSuit; //PLACEHOLDER
            if (_withReset) then {[true] call NaniteGeneratorV3;};
            _returnVal = false;
        };
    }
    else {
        //suit was inactive
        if ((uniform player) in (naniteCapableItemsCBAS splitString ",")) then {
            [] call NaniteSuitActivation; //PLACEHOLDER
            if (_withReset) then {[true] call NaniteGeneratorV3;};
            _returnVal = true;
        }
        else {
            _returnVal = false;
        };
    };
    _returnVal; //And here we actually return value.
};