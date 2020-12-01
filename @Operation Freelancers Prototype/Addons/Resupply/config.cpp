class CfgPatches
{
	class Resupply_Beacon
	{
        name = "Resupply Beacon";
        author = "Eta";
		text= "";
        url = "";
        version="0.0.1";
        versionStr="0.0.1";
		requiredAddons[] = 
		{
		"A3_Weapons_F",
		"A3_Anims_F_Config_Sdr",
		"A3_Data_F",
		"A3_Ui_F",
		"ace_ballistics",
		"ace_common",
		"ace_smallarms",
		"ace_realisticnames",
		"cba_jr"
		};
        units[] = {};
        weapons[] = {Resupply_Beacon};
	};
};

class CfgFunctions{

	class ADDON{
		class functions
		{
			file = "\functions";
			class init{postInit = 1;};
		};
	};
};

class cfgAmmo
{
	class B_IRStrobe;
	class Resupply_Beacon: B_IRStrobe 
	{
		
	};
};


class CfgWeapons
{
    class GrenadeLauncher;
    class Throw : GrenadeLauncher
    {
        muzzles[] += {"Resupply_Muzzle"};

        class ThrowMuzzle;
        class Resupply_Muzzle : ThrowMuzzle
        {
			author = "Eta/SLE";
            magazines[] = {"Resupply_Beacon"};
        };
    };
};


class CfgMagazines 
{
	class CA_Magazine;
	class B_IR_Grenade;
	class Resupply_Beacon : B_IR_Grenade
	{
		author = "Eta/SLE";
		displayName = "Resupply Beacon XB-1";
		displayNameShort="XB-1";
		ammo = "Resupply_Beacon";
		descriptionShort = "Resupply Beacon, calls in a C130 which will drop a crate with resupplies";
		sound[] = {"", 0.000316228, 1 };
		reloadSound[] = {"", 0.000316228, 1 };
	};
}; 