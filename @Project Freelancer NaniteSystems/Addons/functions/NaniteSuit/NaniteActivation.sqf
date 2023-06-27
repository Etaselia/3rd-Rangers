
//Reboot suit. Called in on CBA setting changes. "Have you tried to turn it off and on?"
fnc_naniteSettingChangeReboot = {
    if (player getVariable "naniteActivationState") then {
        [] call fnc_naniteDisableSuit; //PLACEHOLDER
        [] call fnc_naniteSuitActivation; //PLACEHOLDER
    };
};
//Disable suit systems on respawn.
player addEventHandler ["Respawn", {
    if (player getVariable "naniteActivationState") then {
        [] call fnc_naniteDisableSuit; //PLACEHOLDER
    };
}];