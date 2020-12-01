requiredAddons[] = {"cba_settings"};

class cfgPatches
{
    class Nanite_Uniform
    {
        name = "Nanite Uniform";
        author = "Eta";
		text= "";
        url = "";
        version="0.0.1";
        versionStr="0.0.1";
		requiredAddons[] = {
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
        weapons[] = {};
    };
};

class Extended_PreInit_EventHandlers
{
	class my_preInit
	{
		init="call compile preProcessFileLineNumbers 'Uniform\XEH_preInit.sqf'";
	};
};


class CfgFunctions
{

	class ADDON{
		class functions
		{
			file = "\functions";
			class init{postInit = 1;};
		};
	};
};



class CfgVehicles
{

class cfgFactionClasses
{
	class Nanite_Units
	{
		displayName = "Nanite";
		priority = 1000;
		side = "TWest";
	};
};

        class O_Soldier_base_F;
        class NANITE_BASE: O_Soldier_base_F
    {
        scope = 2;
        author = "Eta";
		faction = "Nanite_Units";
        model = "\A3\characters_F\BLUFOR\b_soldier_01.p3d";
        hiddenSelections[] = {"camo","insignia"};
		hiddenSelectionsTextures[] = {"\a3\characters_f\BLUFOR\Data\clothing1_co.paa"};

	};
	class NANITE_ACTIVE: O_Soldier_base_F
    {
        scope = 2;
        author = "Eta";
		faction = "Nanite_Units";
        model = "\A3\characters_F\BLUFOR\b_soldier_01.p3d";
        hiddenSelections[] = {"camo","insignia"};
		hiddenSelectionsTextures[] = {"Uniform\NanoBase.jpg"};

	};
	class Man;
    class CAManBase: Man
	{
        class ACE_SelfActions
		{
			class change_Uniform
			{
				condition = "uniform _player == 'Nanite_MTP' || uniform _player == 'NaniteSuit'";
				displayName = "Change Uniform";

                class MTP
				{
				displayName = "MTP";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'\a3\characters_f\BLUFOR\Data\clothing1_co.paa']";
				};
				class Woodland
				{
				displayName = "Woodland";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'a3\characters_f_enoch\uniforms\data\clothing_mcam_wdl_co.paa']";
				};
				class Weeb
				{
				displayName = "Weeb";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'\uniform\Wuni.jpg']";
				};
				class Winter
				{
				displayName = "Winter";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'\uniform\WintCamo.jpg']";
				};
				class CTRG_N_Combat
				{
				displayName = "CTRG Combat";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'a3\characters_f_epa\blufor\data\clothing1_mtp_co.paa']";
				};
				class CTRG_N_Stealth
				{
				displayName = "CTRG Stealth";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'a3\characters_f_exp\blufor\data\u_b_ctrg_soldier_f_co.paa']";
				};
				class CTRG_N_Urban
				{
				displayName = "CTRG Urban";
				exceptions[] = {};
				statement = "_player setObjectTextureGlobal [0,'a3\characters_f_exp\blufor\data\clothing1_mtp_urban_co.paa']";
				};
			};
			class activate_suit_ONI
			{
			condition = "uniform _player == 'NaniteSuit'";
			displayName = "Activate NaniteSuit";
			statement = "[ [], 'Nano_Suit_ONI', player ] call BIS_fnc_MP;";
			};
      class activate_suit_SPARTAN
      {
      condition = "uniform _player == 'MJOLNIR_MKVI_Undersuit'";
      displayName = "Activate NaniteSuit";
      statement = "[ [], 'Nano_Suit_SPARTAN', player ] call BIS_fnc_MP;";
      };
			class deactivate_suit
			{
			condition = "uniform _player == 'NaniteSuit' or uniform _player == 'MJOLNIR_MKVI_Undersuit'";
			displayName = "Deactivate NaniteSuit";
			statement = "[ [], 'Nano_Off', player ] call BIS_fnc_MP;";
			};
			class cats_marksman_class
			{
			condition = "goggles _player == 'CATS_Marksman' and uniform _player != 'NaniteSuit'";
			displayName = "Activate C.A.T.S";
			statement = "[ [], 'cats_marksman', player ] call BIS_fnc_MP;";
			};
			class cats_assault_class
			{
			condition = "goggles _player == 'CATS_CQC' and uniform _player != 'NaniteSuit'";
			displayName = "Activate C.A.T.S";
			statement = "[ [], 'cats_assault', player ] call BIS_fnc_MP;";
			};
		};
	};
};

class cfgWeapons
{
	class ItemInfo;
	class Uniform_Base;

    class Nanite_MTP: Uniform_Base
    {
        scope = 2;
        author = "Eta";
        displayName = "Nanite Uniform (inactive)";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
        class ItemInfo: ItemInfo
        {
            uniformModel = "-";
            uniformClass = "NANITE_BASE";
            containerClass = "Supply0";
            mass = 100;
            allowedSlots[] = {"701","801","901"};
		};
	};

	class NaniteSuit: Uniform_Base
    {
        scope = 2;
        author = "Eta";
        displayName = "NaniteSuit (active)";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
        class ItemInfo: ItemInfo
        {
            uniformModel = "-";
            uniformClass = "NANITE_ACTIVE";
            containerClass = "Supply80";
            mass = 100;
            allowedSlots[] = {"701","801","901"};
		};
	};
};

class cfgGlasses
{
	class G_Tactical_Clear;
	class CATS_Marksman: G_Tactical_Clear
	{
		author = "Eta";
		displayname = "C.A.T.S Marksman";
		mass = 4;
	};
	class CATS_CQC: G_Tactical_Clear
	{
		author = "Eta";
		displayname = "C.A.T.S Assault";
		mass = 4;
	};
};
