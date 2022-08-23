
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
		"cba_jr",
    "cba_settings",
    "Project_MJOLNIR"
		};
        units[] = {};
        weapons[] = {};
    };
};

class Extended_PreInit_EventHandlers
{
	class eta_Nanite_preInit
	{
		init="call compile preProcessFileLineNumbers 'Uniform\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers
{
	class eta_nanite_suit_functions
	{
		init="execVM '\functions\fn_init.sqf';";
	};
	class eta_nanite_suit_hotkeys
	{
		init="execVM '\functions\hotkeys.sqf';";
	};
  class eta_ONI_suit
  {
    init="execVM 'functions\ONI_suit.sqf';"
  };
  class eta_spartan_suit
  {
    init="execVM 'functions\spartan_suit.sqf';"
  };
  class eta_spartan_suit_v2
  {
    init="execVM 'functions\spartan_suit_v2.sqf';"
  };
  class eta_medical_nanitesuit
  {
    init="execVM 'functions\medical_suit.sqf';"
  };
  class eta_speed_nanitesuit
  {
    init="execVM 'functions\speed_suit.sqf';"
  };
  class tts_active_cloak_particles
  {
    init="execVM 'functions\active_camo\fn_cloakParticles.sqf';"
  };
  class tts_active_cloak_transition
  {
    init="execVM 'functions\active_camo\fn_cloakTransition.sqf';"
  };
  class eta_vehicle_cloak
  {
    init="execVM 'functions\active_camo\eta_vehicles\fn_vehicle_stealth.sqf';"
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

  class NANITE_ACTIVE_DEBUG: O_Soldier_base_F
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
      class activate_suit_SPARTAN_v2
      {
        condition = "uniform _player == 'MJOLNIR_MKVI_Undersuit_v2'";
        displayName = "Activate NaniteSuitv2";
        statement = "[ [], 'Nano_Suit_SPARTAN_V2', player ] call BIS_fnc_MP;";
      };
      class activate_suit_MEDICAL
      {
        condition = "uniform _player == 'NaniteSuitMEDICAL' or uniform _player == 'MJOLNIR_MKVI_Undersuit_v3'";
        displayName = "Activate Medical NaniteSuit";
        statement = "[ [], 'fnc_Nano_Suit_MEDICAL', player ] call BIS_fnc_MP;";
      };

      class activate_suit_SPEED
      {
        condition = "uniform _player == 'NaniteSuitSpeed' or uniform _player == 'MJOLNIR_MKVI_Undersuit_v3S'";
        displayName = "Activate Speed NaniteSuit";
        statement = "[ [], 'fnc_Nano_Suit_SPEED', player ] call BIS_fnc_MP;";
      };

      class deactivate_suit_medical
      {
        condition = "uniform _player == 'NaniteSuitSpeed' or uniform _player == 'MJOLNIR_MKVI_Undersuit_v3S'";
      displayName = "Deactivate Speed NaniteSuit";
      statement = "[ [], 'fnc_nanite_deactivation_speed', player ] call BIS_fnc_MP;";
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
  class UniformItem;
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
    class MJOLNIR_MKVI_Undersuit;
    class MJOLNIR_MKVI_Undersuit_v2: MJOLNIR_MKVI_Undersuit
    {
      scope = 2;
      author = "Eta";
      displayName = "MJOLNIR MKVI Undersuit v2";
      class ItemInfo: UniformItem
        {
          uniformClass="MJOLNIR_Mark_VI_Undersuit";
          containerClass="Supply300";
          mass=10;
        };
    };


    class MJOLNIR_MKVI_Undersuit_v3: MJOLNIR_MKVI_Undersuit
    {
      scope = 2;
      author = "Eta";
      displayName = "MJOLNIR MKVI Undersuit v1.Medical";
      class ItemInfo: UniformItem
        {
          uniformClass="MJOLNIR_Mark_VI_Undersuit";
          containerClass="Supply300";
          mass=10;
        };
    };

    class MJOLNIR_MKVI_Undersuit_v3S: MJOLNIR_MKVI_Undersuit
    {
      scope = 2;
      author = "Eta";
      displayName = "MJOLNIR MKVI Undersuit v1.Speed";
      class ItemInfo: UniformItem
        {
          uniformClass="MJOLNIR_Mark_VI_Undersuit";
          containerClass="Supply300";
          mass=10;
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
    class NaniteSuitMEDICAL: Uniform_Base
    {
      scope = 2;
      author = "Eta";
      displayName = "Medical NaniteSuit";
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

    class NaniteSuitSpeed: Uniform_Base
    {
      scope = 2;
      author = "Eta";
      displayName = "Speed NaniteSuit";
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

class CfgSounds
{
   class eta_sound_cloak_charge
   {
         name = "";
         sound[] = {"\Uniform\sounds\charging.ogg",100, 1,100};
         titles[] = {0, ""};
   };
};

#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_GROUP_BOX       96
#define ST_GROUP_BOX2      112
#define ST_ROUNDED_CORNER  ST_GROUP_BOX + ST_CENTER
#define ST_ROUNDED_CORNER2 ST_GROUP_BOX2 + ST_CENTER

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4



class eta_RscStructuredText_HUD
{
  idc = -1;
  type = CT_STRUCTURED_TEXT;
  style = ST_LEFT;
  colorBackground[] = { 1, 1, 1, 1 };
  x = 0.1;
  y = 0.1;
  w = 0.3;
  h = 0.1;
  size = 0.018;
  text = "fook_off";
  class Attributes
  {
    font = "TahomaB";
    color = "#000000";
    align = "center";
    valign = "middle";
    shadow = false;
    shadowColor = "#ff0000";
    size = "1";
  };
};


class RscTitles
{
  class eta_nanite_hud_energy_percentage
  {
  	idd = 629216;
  	onLoad = "uiNamespace setVariable ['eta_nanite_hud_energy_percentage_idd', _this select 0]";
  	movingEnable = 1;
  	fadeIn  = 0;
  	fadeOut = 0;
  	duration = 10e10;

  	class controls
  	{
  		class eta_nanite_hud_energy_percentage:eta_RscStructuredText_HUD
  		{
  			idc = 629216;
        style = ST_CENTER;
        colorText[]={0,0,1,1};
        colorBackground[] = {0,0,0,0};
        //["0.898589 * safezoneW + safezoneX","0.1205 * safezoneH + safezoneY","0.04125 * safezoneW","0.022 * safezoneH"]
        x = 0.898589 * safezoneW + safezoneX;
        y = 0.1205 * safezoneH + safezoneY;
        w = 0.04125 * safezoneW;
        h = 0.022 * safezoneH;
  		};
  	};
  };

  class eta_nanite_hud_additional_information
  {
    idd = -1;
    onLoad = "uiNamespace setVariable ['eta_nanite_hud_menu_idd', _this select 0]";
    movingEnable = 1;
    fadeIn  = 0;
    fadeOut = 0;
    duration = 10e10;

    class controls
    {
      class eta_nanite_hud_additional_information:eta_RscStructuredText_HUD
      {
        idc = 629217;
        type = CT_STRUCTURED_TEXT;
        style = ST_MULTI;
        colorText[]={0,0,1,1};
        colorBackground[] = {0,0,0,0};
        //["0.850625 * safezoneW + safezoneX","0.181 * safezoneH + safezoneY","0.134062 * safezoneW","0.198 * safezoneH"]
        x = 0.850625 * safezoneW + safezoneX;
        y = 0.181 * safezoneH + safezoneY;
        w = 0.134062 * safezoneW;
        h = 0.198 * safezoneH;
        font = "Zeppelin33";
        color = "#3bb7f3";
        align = "center";
        valign = "middle";
        shadow = false;
        shadowColor = "#ff0000";
        size = "0.05";

      };
    };
  };

    class RscProgress;
    class eta_energy_bar_progess:RscProgress
    {
        type = 8;
        style = 0;
        shadow = 0;
        colorFrame[] = {0,0,0,0};
        colorBar[] =
        {
            "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
            "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
            "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
            "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
        };
        texture = "textures\fuel_bar_test.paa";
        //["0.83 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.165 * safezoneW","0.033 * safezoneH"]
        x = 0.83 * safezoneW + safezoneX;
        y = 0.115 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.033 * safezoneH;
    };

    class eta_nanite_energy_bar
    {
        idd = 430099;
        onload = "uiNamespace setVariable ['eta_nanite_energy_bar',_this select 0]";
        duration = 1e+6;
        class Controls
        {
            class eta_energy_bar_progress_v2: eta_energy_bar_progess
            {
                idc = 629211;
                color[] = {0,0,0,0};
                colorFrame[] = {0,0,0,0};
                colorBar[] = {0.53, 0.83, 0.90, 1};
                colorBackground[] = {0,0,0,0};

                x = 0.83 * safezoneW + safezoneX;
                y = 0.115 * safezoneH + safezoneY;
                w = 0.165 * safezoneW;
                h = 0.033 * safezoneH;
            };
        };
    };
    class RscPicture;
    class eta_rsc_nanite_hud
    {
      duration = 1e+6;
  		fadeIn = 0;
  		fadeOut = 0;
  		movingEnable = false;
  		idd = -1;
      class controls
		  {
  			class eta_nanite_hud_rsc_picture : RscPicture
  			{
  				text = "textures\eta_nanite_activity_bar_v2.paa";
  				x = "SafeZoneX + (495 / 1920) * SafeZoneW";
  				y = "SafeZoneY + (855 / 1080) * SafeZoneH";
  				w = "(120 / 1920) * SafeZoneW";
  				h = "(135 / 1080) * SafeZoneH";
  			};
      };
    };

    class eta_rsc_nanite_hud_fuel_bar_empty
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_SYSTEM_STATUS_picture : RscPicture
        {
          text = "textures\fuel_bar_empty.paa";
          idd = -1;
          //["0.83 * safezoneW + safezoneX","0.159 * safezoneH + safezoneY","0.170156 * safezoneW","0.033 * safezoneH"]
          x = 0.83 * safezoneW + safezoneX;
          y = 0.115 * safezoneH + safezoneY;
          w = 0.165 * safezoneW;
          h = 0.033 * safezoneH;
        };
      };
    };

    class eta_rsc_nanite_hud_SYSTEM_STATUS_READY
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_SYSTEM_STATUS_picture : RscPicture
        {
          text = "textures\system_status_ready.paa";
          idd = -1;
          //["0.83 * safezoneW + safezoneX","0.159 * safezoneH + safezoneY","0.170156 * safezoneW","0.033 * safezoneH"]
          x = "0.83 * safezoneW + safezoneX";
          y = "0.159 * safezoneH + safezoneY";
          w = "0.170156 * safezoneW";
          h = "0.033 * safezoneH";
        };
      };
    };

    class eta_rsc_nanite_hud_SYSTEM_STATUS_CHARGING
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_SYSTEM_STATUS_picture : RscPicture
        {
          text = "textures\system_status_charging.paa";
          idd = -1;
          //["0.83 * safezoneW + safezoneX","0.159 * safezoneH + safezoneY","0.170156 * safezoneW","0.033 * safezoneH"]
          x = "0.83 * safezoneW + safezoneX";
          y = "0.159 * safezoneH + safezoneY";
          w = "0.170156 * safezoneW";
          h = "0.033 * safezoneH";
        };
      };
    };

    class eta_rsc_nanite_hud_speed_redline
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_speed_redline_picture : RscPicture
        {
          text = "textures\hexgrid_red_exp.paa";
          idd = -1;
          //["0.83 * safezoneW + safezoneX","0.159 * safezoneH + safezoneY","0.170156 * safezoneW","0.033 * safezoneH"]
          x = "-0.000156274 * safezoneW + safezoneX";
          y = "0.00500001 * safezoneH + safezoneY";
          w = "1.00031 * safezoneW";
          h = "1.001 * safezoneH";
        };
      };
    };

    class eta_rsc_nanite_hud_speed_normal
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_speed_normal_picture : RscPicture
        {
          text = "textures\hexgrid_exp.paa";
          idd = -1;
          //["-0.000156274 * safezoneW + safezoneX","0.00500001 * safezoneH + safezoneY","1.00031 * safezoneW","1.001 * safezoneH"]
          x = "-0.000156274 * safezoneW + safezoneX";
          y = "0.00500001 * safezoneH + safezoneY";
          w = "1.00031 * safezoneW";
          h = "1.001 * safezoneH";
        };
      };
    };

    class eta_rsc_nanite_hud_menu_background
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_hud_menu_background_picture : RscPicture
        {
          text = "textures\menu.paa";
          idd = -1;
          //["-0.000156274 * safezoneW + safezoneX","0.00500001 * safezoneH + safezoneY","1.00031 * safezoneW","1.001 * safezoneH"]
          x = 0.840312 * safezoneW + safezoneX;
          y = 0.159 * safezoneH + safezoneY;
          w = 0.149531 * safezoneW;
          h = 0.242 * safezoneH;
        };
      };
    };


    class eta_rsc_nanite_energy_bar_static
    {
      duration = 1e+6;
      fadeIn = 0;
      fadeOut = 0;
      movingEnable = false;
      idd = -1;
      class controls
      {
        class eta_nanite_hud_rsc_picture : RscPicture
        {
          colorBackground[] = {0,0,0,0};
          text = "textures\eta_nanite_energy_bar.paa";
          x = 0.825 * safezoneW + safezoneX;
          y = 0.112 * safezoneH + safezoneY;
          w = 0.165 * safezoneW;
          h = 0.015 * safezoneH;
        };
      };
    };

};
