requiredAddons[] = {"cba_settings"};

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
    };
};

/*
class CfgMods
{
    class Mod_Base;
    class SLE_Smart_jet: Mod_Base
    {
        name="Smart Jetpack";
        author="SLE/klockhov";
        logo=""; // Logo displayed in the main menu
        logoOver=""; // When the mouse is over, in the main menu
        logoSmall=""; // Display in creative lists, next to the entities added by the mod
        picture=""; // Picture displayed from the expansions menu. Optimal size is 2048x1024
        tooltip="Smart Jetpack";
        tooltipOwned="Smart Jetpack";
        hideName="true";
        actionName="GitHub";
        action="https://github.com/klockhov";
        dlcColor[]={0,1,0,1};
        dir="SLE_Smart_jet";
    };
};
*/

class Extended_PreInit_EventHandlers
{
    class sle_jet_preInit
    {
        init = "call compile preProcessFileLineNumbers 'Base\sle_jet_preInit.sqf'";
    };
};


class CfgFunctions
{
    class ADDON
    {
        class sle_jetpack_core
        {
            file = "\sle_jetpack_core";
            class sle_jetpack {postInit = 1;};
        };
    };
};

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

class CfgVehicles
{
    class B_CombinationUnitRespirator_01_F;
    class B_JETPACK_01_SLE: B_CombinationUnitRespirator_01_F
    {
        author = "SLE";
        displayName = "Jetpack";
        maximumLoad = 100;
        mass = 120;
    };

    class B_Parachute;
    class B_JETPACK_02_SLE: B_Parachute
    {
        author = "SLE";
        displayName = "Jetpack";
        maximumLoad = 100;
        mass = 120;
    };
};

class CfgSounds
{
    class SLE_JET_engine_start
    {
        sound[] = {"sle_jetpack_core\JetSound\1start1_6s.ogg", 1, 1}; //filename volume and pitch levels
        titles[] = {}; //subtitle delay in seconds, subtitle text
    };

    class SLE_JET_engine_run
    {
        sound[] = {"sle_jetpack_core\JetSound\2mid5s.ogg", 1, 1}; //filename volume and pitch levels
        titles[] = {}; //subtitle delay in seconds, subtitle text
    };

    class SLE_JET_engine_shutdown
    {
        sound[] = {"sle_jetpack_core\JetSound\3end3_5s.ogg", 1, 1}; //filename volume and pitch levels
        titles[] = {}; //subtitle delay in seconds, subtitle text
    };
};
