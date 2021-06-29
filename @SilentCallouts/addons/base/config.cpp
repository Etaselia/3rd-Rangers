class cfgPatches
{
    class eta_silent_callouts
    {
        name = "SilentCallouts";
        author = "Eta";
		    text= "";
        url = "";
        version="1.0";
        versionStr="1.0";
  };
};

class CfgFunctions
{
	class eta_SilentCallouts_fnc
  {
		class eta_silence_functions
		{
			file = "\eta_silence_functions";
			class eta_silence_init{postInit = 1;};
		};
	};
};
