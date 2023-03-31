//Tools section. These are not for players to use. It's designed to help with creating scripts by easily extracting different information from game.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//---Shot info.
//Tool to configure and create scripts that depends on weapon related parameters.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player removeAllEventHandlers "FiredMan";
EH_ShotsFired = player addEventHandler ["FiredMan", {
  UnitFiredType = _this select 0;
  WeaponType = _this select 1;
  MuzzleType = _this select 2;
  FireMode = _this select 3;
  AmmoType = _this select 4;
  MagType = _this select 5;
  Projectile = _this select 6;
  VehicleType = _this select 7;
  AttachmentArray = player weaponAccessories primaryWeapon player;
  AttachmentString = AttachmentArray joinString " , ";
  removeallactions player;
  hintSilent formatText [" Weapon: %1%2 Muzzle: %3%4 Firemode: %5%6 Ammo: %7%8 Magazine: %9%10 Projectile: %11%12 Vehicle: %13%14 Attachments: %15", WeaponType, lineBreak, MuzzleType, lineBreak, FireMode, lineBreak, AmmoType, lineBreak, MagType, lineBreak, Projectile, lineBreak, VehicleType, lineBreak, AttachmentString];
  player addAction ["<t>Copy Weapon name</t>",     {copyToClipboard WeaponType;}];
  player addAction ["<t>Copy Muzzle name</t>",     {copyToClipboard MuzzleType;}];
  player addAction ["<t>Copy Firemode name</t>",   {copyToClipboard FireMode;}];
  player addAction ["<t>Copy Ammo name</t>",       {copyToClipboard AmmoType;}];
  player addAction ["<t>Copy Magazine name</t>",   {copyToClipboard MagType;}];
  player addAction ["<t>Copy Attachments</t>",     {copyToClipboard AttachmentString;}];
}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//---Copy sceduled code
//Tool to copy all sceduled code awaiting execution. Include Spawn and ExecVM.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
copyToClipboard (str diag_activeSQFScripts);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//---Health check tool
//Used mostly to test weapon damage
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
onEachFrame {
hint formatText ["Vehicle integrigy: %1 %2", 100-((damage (cursorTarget))*100), "%"];
};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//---Projectile speed tool
//Used to debug and test jetpack ballistic calculator.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player removeAllEventHandlers "FiredMan";
EH_ShotsFired = player addEventHandler ["FiredMan", {
  Projectile = _this select 6;
  onEachFrame {
  hint formatText ["Speed: %1 %2", [(abs ((velocity Projectile) select 0))+(abs ((velocity Projectile) select 1))+(abs ((velocity Projectile) select 2))], "m/s"];
  };
}];

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
