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
	class etaPU_preInit
	{
		init="call compile preProcessFileLineNumbers 'Base\etaPU_preInit.sqf'";
	};
};


class CfgFunctions
{

	class ADDON{
		class etaPU_functions
		{
			file = "\etaPU_functions";
			class etaPU_init{postInit = 1;};
		};
	};
};
