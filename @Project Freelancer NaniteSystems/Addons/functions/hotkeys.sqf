////////////////////////////////////////////////////////////////////////////////////
fnc_MaximumArmorKey={
  if ((MaximumArmorSwitch_ONI and ONI_Suit_Active) or (MaximumArmorSwitch_SPARTAN and SPARTAN_Suit_Active) or (MaximumArmorSwitch_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    if ((HotkeysEnabeled_ONI and ONI_Suit_Active) or (HotkeysEnabeled_SPARTAN and SPARTAN_Suit_Active) or (HotkeysEnabeled_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
    {
      if (ArmorActive == 0) then {
          [] spawn {[] call Nano_Armor2_ACT;};
      };
    };
  };
};

fnc_CloakKey={
  if ((CloakSwitch_ONI and ONI_Suit_Active) or (CloakSwitch_SPARTAN and SPARTAN_Suit_Active) or (CloakSwitch_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    if ((HotkeysEnabeled_ONI and ONI_Suit_Active) or (HotkeysEnabeled_SPARTAN and SPARTAN_Suit_Active) or (HotkeysEnabeled_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
    {
      if (InvisActive == 0) then {
          [] spawn {[] call Nano_Sneak2_ACT;};
      };
    };
  };
};

fnc_MaximumSpeedKey={
  if ((MaximumSpeedSwitch_ONI and ONI_Suit_Active) or (MaximumSpeedSwitch_SPARTAN and SPARTAN_Suit_Active) or (MaximumSpeedSwitch_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    if ((HotkeysEnabeled_ONI and ONI_Suit_Active) or (HotkeysEnabeled_SPARTAN and SPARTAN_Suit_Active) or (HotkeysEnabeled_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
    {
      if (SpeedActive == 0) then {
        [] spawn {[] call Nano_FAFB2_ACT;};
      };
    };
  };
};

fnc_JumpKey={
  if ((JumpSwitch_ONI and ONI_Suit_Active) or (JumpSwitch_SPARTAN and SPARTAN_Suit_Active) or (JumpSwitch_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    if ((HotkeysEnabeled_ONI and ONI_Suit_Active) or (HotkeysEnabeled_SPARTAN and SPARTAN_Suit_Active) or (HotkeysEnabeled_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
    {
      if (isTouchingGround player) then {
        [] spawn {[] call Nano_JUMP;};
      };
    };
  };
};

fnc_Disengage_Key={
  [] spawn {[] call Nano_STOP_ACT;};
};

fnc_WeaponKey={
  if ((WeaponHandlingSwitch_ONI and ONI_Suit_Active) or (WeaponHandlingSwitch_SPARTAN and SPARTAN_Suit_Active) or (WeaponHandlingSwitch_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    if ((HotkeysEnabeled_ONI and ONI_Suit_Active) or (HotkeysEnabeled_SPARTAN and SPARTAN_Suit_Active) or (HotkeysEnabeled_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
    {
      if ((isNil "NanoAIMSW") or (NanoAIMSW == 0)) then {
        [] spawn {[] call Nano_AIM;};
      };
    };
  };
};

fnc_ShieldKey={
  if ((ShieldChargeSwitch_ONI and ONI_Suit_Active) or (ShieldChargeSwitch_SPARTAN and SPARTAN_Suit_Active) or (ShieldChargeSwitch_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
  {
    if ((HotkeysEnabeled_ONI and ONI_Suit_Active) or (HotkeysEnabeled_SPARTAN and SPARTAN_Suit_Active) or (HotkeysEnabeled_SPARTAN_V2 and SPARTAN_V2_Suit_Active)) then
    {
      [] spawn {[] call Nano_Shield_Charge;};
    };
  };
};
