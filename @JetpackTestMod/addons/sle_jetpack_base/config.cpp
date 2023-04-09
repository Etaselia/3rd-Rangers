requiredAddons[] = {"cba_settings"};

//cfgPatches supposed to contain mod description but apparently does not work as of 2022 summer due to bug. Description currently placed in mod.cpp
class cfgPatches
{
    class SLE_Smart_jet
    {
        name = "SmartJetpack";
        author = "SLE/klockhov";
        text = "";
        url = "";
        version = "1.0";
        versionStr = "1.0";
        requiredAddons[] = {
            "cba_jr"
        };
        units[] = {};
        weapons[] = {};
    };

    class OPTRE_FunctionsLibrary
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		version=0.11;
		author="Article 2 Studios";
	};
};

//PreInit currently contains CBA keybinds and settings.
class Extended_PreInit_EventHandlers
{
    class sle_jet_preInit
    {
        init = "call compile preProcessFileLineNumbers 'sle_jetpack_base\sle_jet_preInit.sqf'";
    };
};

//Whole backend of this mod currently contained in one function.
class CfgFunctions
{
    class SLE_JET_ADDON
    {
        class sle_jetpack_core
        {
            file = "\sle_jetpack_core\Logic";
            class sle_jetpack {postInit = 1;};
        };
    };
    class OPTRE
        {
            class Jetpack
            {
                file = "\sle_jetpack_core\OptreCompat";
            };
        };
};

//UI classes for fuel bar.
class RscTitles
{
    class RscProgress
    {
        type = 8;
        style = 0;
        shadow = 0;
        colorFrame[] = {0,0,0,1};
        colorBar[] =
        {
            "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
            "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
            "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
            "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
        };
        texture = "sle_jetpack_core\UI\sle_jet_fuel_bar.paa";

        w = 0.165 * safezoneW;
        h = 0.015 * safezoneH;
    };

    class SLE_JET_Fuel_Bar
    {
        idd = 430099;
        onload = "uiNamespace setVariable ['SLE_JET_Fuel_bar',_this select 0]";
        duration = 1e+6;
        class Controls
        {
            class Progress: RscProgress
            {
                idc = 629211;
                color[] = {0,0,0,0};
                colorFrame[] = {0,0,0,1};
                colorBar[] = {1, 0.58, 0, 1};
                colorBackground[] = {0,0,0,0};

                x = 0.825 * safezoneW + safezoneX;
                y = 0.112 * safezoneH + safezoneY;
            };
        };
    };
};

//Facewear classes.
class cfgGlasses
{
    class G_Tactical_Clear;
    class G_Jet_UI_Clear: G_Tactical_Clear
    {
        author = "SLE";
        displayname = "Jetpack HUD (Clear)";
        mass = 4;
      };

    class G_Tactical_Black;
    class G_Jet_UI_Shade: G_Tactical_Black
    {
        author = "SLE";
        displayname = "Jetpack HUD (Cool)";
        mass = 4;
    };

    class G_Goggles_VR;
    class G_Jet_UI_VR: G_Goggles_VR
    {
        author = "SLE";
        displayname = "Jetpack HUD (Edgy)";
        mass = 4;
    };
};

//Backpack classes.
class CfgVehicles
{
  //Import base class.
    class B_AssaultPack_blk;
  //Simple 0 storage dynamic version.
    class B_JETPACK_Nospace_off_SLE: B_AssaultPack_blk
    {
        author = "SLE";
        displayName = "Jetpack (No storage, Folding engines)";
        maximumLoad = 0;
        mass = 120;
        model = "sle_jetpack_core\model\JetPackPas.p3d";
        picture = "sle_jetpack_core\model\sle_jet_logo.paa";
    };

    class B_JETPACK_Nospace_on_SLE: B_AssaultPack_blk
    {
        author = "SLE";
        displayName = "I got my dollar store camera ON";
        maximumLoad = 0;
        mass = 120;
        model = "sle_jetpack_core\model\JetPackAct.p3d";
        picture = "sle_jetpack_core\model\sle_jet_logo.paa";
        scopeArsenal = 0;
    };
  //Simple 100 storage static version.
    class B_JETPACK_Yesspace_fixed_SLE: B_AssaultPack_blk
    {
        author = "SLE";
        displayName = "Jetpack (Simple storage, Fixed engines)";
        maximumLoad = 100;
        mass = 120;
        model = "sle_jetpack_core\model\JetPackAct.p3d";
        picture = "sle_jetpack_core\model\sle_jet_logo.paa";
    };
  //Script-heavy 100 storage dynamic version.
    class B_JETPACK_Yesspace_off_SLE: B_AssaultPack_blk
    {
        author = "SLE";
        displayName = "Jetpack (Experemental scriped storage, Folding engines)";
        maximumLoad = 100;
        mass = 120;
        model = "sle_jetpack_core\model\JetPackPas.p3d";
        picture = "sle_jetpack_core\model\sle_jet_logo.paa";
    };

    class B_JETPACK_Yesspace_on_SLE: B_AssaultPack_blk
    {
        author = "SLE";
        displayName = "I got my dollar store camera ON";
        maximumLoad = 100;
        mass = 120;
        model = "sle_jetpack_core\model\JetPackAct.p3d";
        picture = "sle_jetpack_core\model\sle_jet_logo.paa";
        scopeArsenal = 0;
    };

    class Sign_Arrow_Green_F;
    class SLE_JET_Sound_emitter: Sign_Arrow_Green_F
    {
        author = "SLE";
        displayName = "Jetpack sound emitter";
        model = "\A3\Weapons_F\empty.p3d";
        scopeEditor = 0;
    };
};

//Sound classes.
class CfgSounds
{
    class SLE_JET_engine_start
    {
        sound[] = {"sle_jetpack_core\Sound\1start1_6s.ogg", 1, 1}; //filename volume and pitch levels
        titles[] = {}; //subtitle delay in seconds, subtitle text
    };

    class SLE_JET_engine_run
    {
        sound[] = {"sle_jetpack_core\Sound\2mid5s.ogg", 1, 1}; //filename volume and pitch levels
        titles[] = {}; //subtitle delay in seconds, subtitle text
    };

    class SLE_JET_engine_shutdown
    {
        sound[] = {"sle_jetpack_core\Sound\3end3_5s.ogg", 1, 1}; //filename volume and pitch levels
        titles[] = {}; //subtitle delay in seconds, subtitle text
    };
};
