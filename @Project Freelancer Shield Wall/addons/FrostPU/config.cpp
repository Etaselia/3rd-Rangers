#define _ARMA_

class CfgPatches
{
	class frost_frostspowerups
	{
		addonRootClass = "A3_Armor_F_Beta";
		requiredAddons[] = {"A3_Armor_F_Beta","A3_Data_F","A3_Weapons_F_Gamma"};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgEditorCategories
{
	class Frosts_Editor_Props
	{
		displayName = "Frosts Props";
	};
};

class CfgEditorSubcategories
{
	class Frosts_Props
	{
		displayName = "Power Ups";
	};

};


class Extended_PostInit_EventHandlers
{
	class eta_handshield_fnc
	{
		init="execVM '\FrostPU\functions\functions.sqf';";
	};
};

class Extended_PreInit_EventHandlers
{
	class eta_handshield_preInit
	{
		init="call compile preProcessFileLineNumbers 'FrostPU\XEH_preInit.sqf'";
	};
};

class cfgWeapons
{
	class ToolKit;
	class HandShieldGenerator:ToolKit
	{
			displayName = "HandShieldGenerator";
			displayNameShort = "HSG-X1";
			descriptionShort = "Generator for a HandShield";
			useAction = false;
			author = "Eta";
			icon = "FrostPU\textures\ShieldGeneratorLogo.paa";
			picture = "FrostPU\textures\ShieldGeneratorLogo.paa";
	}
};

class CfgVehicles
	{
		class OPTRE_FC_Energy_shield;
		class EtaShieldWall: OPTRE_FC_Energy_shield
		{
			scope = 2;
	    scopeCurator = 2;
			displayname = "Shield Wall";
			model = "FrostPU\ShieldWall.p3d";
	    editorcategory = "Frosts_Editor_Props";
			editorSubcategory = "Frosts_Props";
	    };
			class EtaShieldWall_yellow: OPTRE_FC_Energy_shield
			{
				scope = 2;
				scopeCurator = 2;
				displayname = "Shield Wall YELLOW";
				model = "FrostPU\ShieldWall_yellow.p3d";
				editorcategory = "Frosts_Editor_Props";
				editorSubcategory = "Frosts_Props";
			};
			class EtaShieldWall_red: OPTRE_FC_Energy_shield
			{
				scope = 2;
				scopeCurator = 2;
				displayname = "Shield Wall RED";
				model = "FrostPU\ShieldWall_red.p3d";
				editorcategory = "Frosts_Editor_Props";
				editorSubcategory = "Frosts_Props";
			};
			class Man;
			class CAManBase: Man
			{
					class ACE_SelfActions
					{
						class eta_HandShield_ace
						{
							condition = "'HandShieldGenerator' in items player";
							displayName = "HandShieldGenerator";
							class eta_HandShield_ace_ON
							{
								displayName = "ENABLE";
								exceptions[] = {};
								statement = "[_player] call fncInitiateShield";
							};
							class eta_HandShield_ace_OFF
							{
								displayName = "DISABLE";
								exceptions[] = {};
								statement = "[_player] call fncInitiateShieldDespawn";
							};
						};
					};
			};
};

class CfgSounds
{
   class eta_sound_ShieldWall_Broke
   {
         name = "";
         sound[] = {"\FrostPU\sfx\ShieldBroke.ogg",100, 1,100};
         titles[] = {0, ""};
   };
	 class eta_sound_ShieldWall_OFF
	 {
				 name = "";
				 sound[] = {"\FrostPU\sfx\ShieldOff.ogg",100, 1,100};
				 titles[] = {0, ""};
	 };
	 class eta_sound_ShieldWall_ON
	 {
				 name = "";
				 sound[] = {"\FrostPU\sfx\ShieldOn.ogg",100, 1,100};
				 titles[] = {0, ""};
	 };
};
