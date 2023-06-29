
//Reboot suit. Called in on CBA setting changes. "Have you tried to turn it off and on?"
NaniteSettingChangeReboot = {
    if (player getVariable "naniteActivationState") then {
        //Function names are specifically different to avoid confusion.
        [] call NaniteDisableSuit; //PLACEHOLDER
        [] call NaniteSuitActivation; //PLACEHOLDER
    };
};
//Disable suit systems on respawn.
player addEventHandler ["Respawn", {
    if (player getVariable "naniteActivationState") then {
        [] call NaniteDisableSuit; //PLACEHOLDER
    };
}];