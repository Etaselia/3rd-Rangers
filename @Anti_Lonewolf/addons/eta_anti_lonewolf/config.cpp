requiredAddons[] = {"cba_settings"};

class cfgPatches
{
    class eta_anti_lonewolf
    {
        name = "Anti Lonewolf";
        author = "Eta";
		    text= "";
        url = "";
        version="1.0";
        versionStr="1.0";
		requiredAddons[] = {
		"A3_Weapons_F",
		"A3_Anims_F_Config_Sdr",
		"A3_Data_F",
		"A3_Ui_F",
		"ace_common",
		"cba_jr"
		};
        units[] = {};
        weapons[] = {};
    };
};

class Extended_PreInit_EventHandlers
{
	class eta_preInit
	{
		init="call compile preProcessFileLineNumbers 'eta_anti_lonewolf\XEH_preInit.sqf'";
	};
};

class CfgFunctions
{

	class eta_anti_lonewolf{
		class functions
		{
			file = "eta_anti_lonewolf\functions";
			class init{postInit = 1;};
		};
	};
};

class CfgVehicles
{
	class Man;
  class CAManBase: Man
	{
    class ACE_SelfActions
		{
			class ACE_TeamManagement
			{
        class eta_teamleader_management
  			{
          condition = "!(_player getVariable ['eta_teamlead', false])";
          displayName = "Become Teamleader";
          statement = "[ [_player], 'f_ace_assign_eta_teamlead', group player ] call BIS_fnc_MP;";
        };
			};
		};
	};
};
