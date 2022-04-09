//LAUNCHERS

//M136 VARIANTS

this addAction ["Take M136 - HEDP", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";
    _caller addItemToBackpack "rhs_weap_m136_hedp";
    _caller addItemToBackpack "rhs_weap_m136_hedp";
    _caller addweapon "rhs_weap_m136_hedp";

    call{sle_ai_1 sidechat "One - Time?";};
    call{sle_ai_1 sidechat "Just flip up the optics and you are good to go, blyat";};
    call{sle_ai_1 sidechat "Thats an HEDP, so its no use against anything with more than paper armor, good for bunkers though, blyat";};
}];

this addAction ["Take M136 - HEAT", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";
    _caller addItemToBackpack "rhs_weap_m136_heat";
    _caller addItemToBackpack "rhs_weap_m136_heat";
    _caller addweapon "rhs_weap_m136_heat";

    call{sle_ai_1 sidechat "One - Time?";};
    call{sle_ai_1 sidechat "Just flip up the optics and you are good to go, blyat";};
    call{sle_ai_1 sidechat "Thats a HEAT, good enough against light armor, still works against infantry as well, blyat";};
}];

this addAction ["Take M136 - HP", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";
    _caller addItemToBackpack "rhs_weap_m136_hp";
    _caller addItemToBackpack "rhs_weap_m136_hp";
    _caller addweapon "rhs_weap_m136_hp";

    call{sle_ai_1 sidechat "One - Time?";};
    call{sle_ai_1 sidechat "Just flip up the optics and you are good to go, blyat";};
    call{sle_ai_1 sidechat "Thats an HP, not like the printer, blyat";};
    call{sle_ai_1 sidechat "Its High Penetration, can even punch through a T-72";};
}];

//MAAWS
this addAction ["Take MAAWS", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "MRAWS_HEAT_F";
    _caller addItemToBackpack "MRAWS_HEAT55_F";
    _caller addItemToBackpack "MRAWS_HE_F";
    _caller addItemToBackpack "MRAWS_HE_F";

    _caller addweapon "launch_MRAWS_green_F";

    call{sle_ai_1 sidechat "MAAWS?";};
    call{sle_ai_1 sidechat "Good Choice, SLE approves, blyat";};
    call{sle_ai_1 sidechat "Got a selection of rounds 55 Heat is good against anything less than tanks, HE goes boom, got it blyat?";};
}];

//TITAN AT
this addAction ["Take Titan AT", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "Titan_AT";
    _caller addItemToBackpack "Titan_AT";
    _caller addItemToBackpack "Titan_AP";
    _caller addItemToBackpack "Titan_AP";

    _caller addweapon "launch_I_Titan_short_F";

    call{sle_ai_1 sidechat "Titan AT?";};
    call{sle_ai_1 sidechat "Good Choice, SLE approves, blyat";};
    call{sle_ai_1 sidechat "It's an ATGM, so good at long range and definitly kills, heavy though, blyat";};
}];

//TITAN AA
this addAction ["Take Titan AA", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "Titan_AA";
    _caller addItemToBackpack "Titan_AA";
    _caller addItemToBackpack "Titan_AA";
    _caller addItemToBackpack "Titan_AA";

    _caller addweapon "launch_B_Titan_F";

    call{sle_ai_1 sidechat "Titan AA?";};
    call{sle_ai_1 sidechat "Don't like the helicopters, blyat?";};
    call{sle_ai_1 sidechat "Just point it at flying things and wait for a lock and fire, lot of backblast so stay clear, blyat";};
}];

//MAIN WEAPONS

//SCARL
this addAction ["Take SCAR-L", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "eta_30rd_556_mag";
    _caller addItemToBackpack "eta_30rd_556_mag";
    _caller addItemToBackpack "eta_30rd_556_mag";
    _caller addItemToBackpack "eta_30rd_556_mag";
    _caller addItemToBackpack "eta_30rd_556_mag";

    _caller addweapon "rhs_weap_SCARL_FDE_CQC";

    call{awi_ai_1 sidechat "SCAR?";};
    call{awi_ai_1 sidechat "It may be ugly but its effective, standard infantry weapon around here";};
    call{awi_ai_1 sidechat "Blame Eta";};
}];

//RPK-5
this addAction ["Take RPK-5", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "eta_75rd_556_Amag";
    _caller addItemToBackpack "eta_75rd_556_Amag";
    _caller addItemToBackpack "eta_75rd_556_Amag";
    _caller addItemToBackpack "eta_75rd_556_Amag";
    _caller addItemToBackpack "eta_75rd_556_Amag";

    _caller addweapon "weap_RPK";

    call{awi_ai_1 sidechat "When you first laid eyes upon it where you blinded by its majesty?";};
    call{awi_ai_1 sidechat "Best gun around, eats a lot of rounds though, can't keep sustained fire up too long either";};
    call{awi_ai_1 sidechat "Looks and feels good though";};
}];

//MINIMI
this addAction ["Take Minimi", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "200Rnd_556x45_Box_F";
    _caller addItemToBackpack "200Rnd_556x45_Box_F";
    _caller addItemToBackpack "200Rnd_556x45_Box_F";
    _caller addItemToBackpack "200Rnd_556x45_Box_F";

    _caller addweapon "LMG_03_F";

    call{awi_ai_1 sidechat "Minimi?";};
    call{awi_ai_1 sidechat "Just use the RPK, unless you really don't wanna let go of the trigger";};
    call{awi_ai_1 sidechat "The full auto - fuller auto switch is nice though";};
}];

//417
this addAction ["Take HK417", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller addBackpack "B_Kitbag_mcamo";

    _caller addItemToBackpack "20Rnd_762x51_Mag";
    _caller addItemToBackpack "20Rnd_762x51_Mag";
    _caller addItemToBackpack "20Rnd_762x51_Mag";
    _caller addItemToBackpack "20Rnd_762x51_Mag";

    _caller addweapon "arifle_SPAR_03_blk_F";

    call{awi_ai_1 sidechat "HK417?";};
    call{awi_ai_1 sidechat "Just an HK with bigger rounds, good for staying in the back though";};
    call{awi_ai_1 sidechat "Or if your enemy really has good armor";};
}];


//entity
//Condition
call{player inArea thistrigger && alive mechanic1;
//execute
call{fixer1 sidechat "Text Here";}

//Teleport
this addAction ["Go to Marksman Range", {
    params ["_target", "_caller", "_actionId", "_arguments"];

    call{ed_ai_1 sidechat "Going to the Marksman Range?";};
    call{ed_ai_1 sidechat "Cpl. Ein is gonna teach ya good!";};

    _caller setPos(getPos(fire_range_marksman_tp));
}];

this addAction ["Go to Infantry Range", {
    params ["_target", "_caller", "_actionId", "_arguments"];

    call{ed_ai_1 sidechat "Going to the Infantry Range?";};
    call{ed_ai_1 sidechat "Stay away from Spc. AWi's RPK, he bites!";};

    _caller setPos(getPos(infantry_range_marksman_tp));
}];

call{ed_ai_1 sidechat "Want to go somewhere?";};
call{ed_ai_1 sidechat "Jump in!";};



this addAction ["Take Marksman Gear", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    _caller setDamage 0;
    _caller setDamage 0;
    [_caller] call ace_medical_treatment_fnc_fullHealLocal;
}];
