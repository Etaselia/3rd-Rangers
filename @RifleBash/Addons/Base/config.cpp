requiredAddons[] = {"cba_settings"};

class cfgPatches
{
    class VehiclePunch
    {
        name = "RifleBash";
        author = "Eta";
		    text= "";
        url = "";
        version="1.0";
        versionStr="1.0";
		requiredAddons[] = {
		"cba_jr"
		};
  };
};

class Extended_PreInit_EventHandlers
{
	class eta_bash_preInit
	{
		init="call compile preProcessFileLineNumbers 'Base\eta_bash_preInit.sqf'";
	};
};


class CfgFunctions
{

	class ADDON{
		class eta_bash_functions
		{
			file = "\eta_bash_functions";
			class eta_bash_init{postInit = 1;};
		};
	};
};
