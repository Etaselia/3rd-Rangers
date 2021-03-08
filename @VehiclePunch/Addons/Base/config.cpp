requiredAddons[] = {"cba_settings"};

class cfgPatches
{
    class VehiclePunch
    {
        name = "VehiclePunch";
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
	class my_preInit
	{
		init="call compile preProcessFileLineNumbers 'Base\XEH_preInit.sqf'";
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
