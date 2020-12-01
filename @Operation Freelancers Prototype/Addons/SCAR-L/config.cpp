#include "BIS_AddonInfo.hpp"
class cfgPatches
{
    class SCARL_Conversion
    {
        name = "SCARL Conversion Mod";
        author = "$STR_RHSSAF_AUTHOR_FULL";
		text= "QUOTE(RHS_TAG VERSION)";
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

class WeaponSlotsInfo;
class MuzzleSlot;
class SlotInfo;
class CowsSlot;
class PointerSlot;
class MAGAZINESLOT;

class CfgAmmo
{
	class B_762x51_Ball;
	class Eta_SLAP: B_762x51_Ball
	{
		ACE_caliber=7.823;
		ACE_bulletLength=33.495998;
		ACE_bulletMass=10.229462;
		ACE_ballisticCoefficients[]={0.359};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={800,1000,1200};
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655,-2.5469999,-2.2850001,-2.0120001,-1.698,-1.28,-0.764,-0.153,0.59600002,1.517,2.619};
		ACE_barrelLengths[]={330,406,508};
		airFriction=-0.00107148;
		caliber=3.5999999;
		indirectHitRange = 0.5;
		indirectHit = 2;
		hit=8;
		typicalSpeed=1000;
		tracerScale=1.2;
		tracerStartTime=0.072999999;
		tracerEndTime=2.15957;
		cartridge="FxCartridge_762";
	};
	class Eta_HEDP : Eta_SLAP
	{
		ACE_caliber=7.823;
		ACE_bulletLength=33.495998;
		ACE_bulletMass=10.229462;
		ACE_ballisticCoefficients[]={0.359};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={500,600,800};
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655,-2.5469999,-2.2850001,-2.0120001,-1.698,-1.28,-0.764,-0.153,0.59600002,1.517,2.619};
		ACE_barrelLengths[]={330,406,508};
		airFriction=-0.00107148;
		caliber=3.5999999;
		explosive = 0.4;
		explosionEffects = GrenadeExplosion;
		indirectHitRange = 3;
		indirectHit = 8;
		hit=8;
		typicalSpeed=600;
		tracerScale=1.2;
		tracerStartTime=0.072999999;
		tracerEndTime=2.15957;
		cartridge="FxCartridge_762";
		effectsSmoke = [0,0,0,0];
		SoundSetExplosion[]=
		{
			"MiniGrenade_Exp_SoundSet",
			"MiniGrenade_Tail_SoundSet",
			"Explosion_Debris_SoundSet"
		};
		class CamShakeHit
		{
			power = 25;
			duration = 1;
			frequency = 20;
		};
	};
};
class cfgmagazines
{
	class rhs_mag_30Rnd_556x45_M855A1_PMAG;
	class eta_30rd_556_mag : rhs_mag_30Rnd_556x45_M855A1_PMAG
	{
		ammo="Eta_SLAP";
		displayName="30rnd XA-1 Ranger";
		displayNameShort="XA-1";
	}
	class rhs_mag_20Rnd_556x45_M193_Stanag;
	class eta_10rd_HEDP_mag : rhs_mag_20Rnd_556x45_M193_Stanag
	{
		ammo="Eta_HEDP";
		displayName="10rnd XA-2 HEDP";
		displayNameShort="XA-2";
		count = 10;
		mass = 22;
	}
};

class CfgVehicles
{
	class Weapon_Base_F;
	class item_rhs_weap_SCARL_CQC: Weapon_Base_F
	{
		scope=2;
		scopeCurator=2;
		vehicleClass="WeaponsPrimary";
		author="$STR_RHSSAF_AUTHOR_FULL";
		displayName="SCAR-L (CQC)";
		class TransportItems
		{
			class _xx_rhs_weap_SCARL_CQC
			{
				name="rhs_weap_SCARL_CQC";
				count=1;
			};
		};
	};
	
	class item_rhs_weap_SCARL_LB: Weapon_Base_F
	{
		scope=2;
		scopeCurator=2;
		vehicleClass="WeaponsPrimary";
		author="$STR_RHSSAF_AUTHOR_FULL";
		displayName="SCAR-L (LB)";
		class TransportItems
		{
			class _xx_rhs_weap_SCARL_LB
			{
				name="rhs_weap_SCARL_LB";
				count=1;
			};
		};
	};	
	
	class item_rhs_weap_SCARL_STD: Weapon_Base_F
	{
		scope=2;
		scopeCurator=2;
		vehicleClass="WeaponsPrimary";
		author="$STR_RHSSAF_AUTHOR_FULL";
		displayName="SCAR-L (STD)";
		class TransportItems
		{
			class _xx_rhs_weap_SCARL_STD
			{
				name="rhs_weap_SCARL_STD";
				count=1;
			};
		};
	};	
		
	class item_rhs_weap_SCARL_FDE_CQC: Weapon_Base_F
	{
		scope=2;
		scopeCurator=2;
		vehicleClass="WeaponsPrimary";
		author="$STR_RHSSAF_AUTHOR_FULL";
		displayName="SCAR-L (CQC)";
		class TransportItems
		{
			class _xx_rhs_weap_SCARL_FDE_CQC
			{
				name="rhs_weap_SCARL_FDE_CQC";
				count=1;
			};
		};
	};
	
	class item_rhs_weap_SCARL_FDE_LB: Weapon_Base_F
	{
		scope=2;
		scopeCurator=2;
		vehicleClass="WeaponsPrimary";
		author="$STR_RHSSAF_AUTHOR_FULL";
		displayName="SCAR-L (LB)";
		class TransportItems
		{
			class _xx_rhs_weap_SCARL_FDE_LB
			{
				name="rhs_weap_SCARL_FDE_LB";
				count=1;
			};
		};
	};	
	
	class item_rhs_weap_SCARL_FDE_STD: Weapon_Base_F
	{
		scope=2;
		scopeCurator=2;
		vehicleClass="WeaponsPrimary";
		author="$STR_RHSSAF_AUTHOR_FULL";
		displayName="SCAR-L (STD)";
		class TransportItems
		{
			class _xx_rhs_weap_SCARL_FDE_STD
			{
				name="rhs_weap_SCARL_FDE_STD";
				count=1;
			};
		};
	};	
};

class CfgWeapons
{
	class rhs_weap_SCARH_CQC;
	class rhs_weap_SCARL_CQC : rhs_weap_SCARH_CQC
    {
		scope=2;
		author="$STR_RHSSAF_AUTHOR_FULL";
        displayName="SCAR-L (CQC)";
		descriptionShort = "Assault rifle<br/>Caliber: 5.56x45mm NATO";
		magazines[] =
		{
		"eta_30rd_556_mag","eta_10rd_HEDP_mag"
		};
		magazineWell[] = {"STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"};
		baseWeapon="rhs_weap_SCARL_CQC";   
   };
	
	class rhs_weap_SCARH_LB;
	class rhs_weap_SCARL_LB : rhs_weap_SCARH_LB
    {
		scope=2;
		author="$STR_RHSSAF_AUTHOR_FULL";
        displayName="SCAR-L (LB)";
		descriptionShort = "Assault rifle<br/>Caliber: 5.56x45mm NATO";
		magazines[] =
		{
		"eta_30rd_556_mag","eta_10rd_HEDP_mag"	
		};
		magazineWell[] = {"STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"};
		baseWeapon="rhs_weap_SCARL_LB";   
    };	
	
	class rhs_weap_SCARH_STD;
	class rhs_weap_SCARL_STD : rhs_weap_SCARH_STD
    {
		scope=2;
		author="$STR_RHSSAF_AUTHOR_FULL";
        displayName="SCAR-L (STD)";
		descriptionShort = "Assault rifle<br/>Caliber: 5.56x45mm NATO";
		magazines[] =
		{
		"eta_30rd_556_mag","eta_10rd_HEDP_mag"
		};
        magazineWell[] = {"STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"};
 		baseWeapon="rhs_weap_SCARL_STD";   
   };	
	
	class rhs_weap_SCARH_FDE_CQC;
	class rhs_weap_SCARL_FDE_CQC : rhs_weap_SCARH_FDE_CQC
    {
		scope=2;
		author="$STR_RHSSAF_AUTHOR_FULL";
        displayName="SCAR-L (CQC)";
		descriptionShort = "Assault rifle<br/>Caliber: 5.56x45mm NATO";
		magazines[] =
		{
		"eta_30rd_556_mag","eta_10rd_HEDP_mag"
		};
		magazineWell[] = {"STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"};
		baseWeapon="rhs_weap_SCARL_FDE_CQC";   
    };
	
	class rhs_weap_SCARH_FDE_LB;
	class rhs_weap_SCARL_FDE_LB : rhs_weap_SCARH_FDE_LB
    {
		scope=2;
		author="$STR_RHSSAF_AUTHOR_FULL";
        displayName="SCAR-L (LB)";
		descriptionShort = "Assault rifle<br/>Caliber: 5.56x45mm NATO";
		magazines[] =
		{
		"eta_30rd_556_mag","eta_10rd_HEDP_mag"
		};
		magazineWell[] = {"STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"};
		baseWeapon="rhs_weap_SCARL_FDE_LB";   
    };	
	
	class rhs_weap_SCARH_FDE_STD;
	class rhs_weap_SCARL_FDE_STD : rhs_weap_SCARH_FDE_STD
    {
		scope=2;
		author="$STR_RHSSAF_AUTHOR_FULL";
        displayName="SCAR-L (STD)";
		descriptionShort = "Assault rifle<br/>Caliber: 5.56x45mm NATO";
		magazines[] =
		{
		"eta_30rd_556_mag","eta_10rd_HEDP_mag"
		};
        magazineWell[] = {"STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"};
		baseWeapon="rhs_weap_SCARL_FDE_STD";   
	};			
};