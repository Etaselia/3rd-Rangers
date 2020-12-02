//---Guidance for all projectiles.
//Can be activated by player or separate eventhandler can be added to eden object.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~remove~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player removeEventHandler ["FiredMan", EH_GiudedShotsFired];
onEachFrame {};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~main~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        onEachFrame {
            if (name cursorTarget == "Error: No unit") then
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, typeOf cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            }
            else
            {
                drawIcon3D ['A3\ui_f_curator\Data\CfgCurator\entity_disabled_ca.paa', [0,1,1,1], [visiblePosition cursorTarget select 0, visiblePosition cursorTarget select 1, (getPosATL cursorTarget select 2) + 1], 1, 1, 0, name cursorTarget, 2, 0.05, 'PuristaMedium', 'center', false];
            };
        };

EH_GiudedShotsFired = player addEventHandler ["FiredMan", {
_WeaponType = _this select 1;
if (_WeaponType == "Throw") exitWith {Hint "Grenades excluded for technical reasons."};

_target = cursorTarget;

if (isNull _target) exitWith {Hint "No target."};
_Projectile = _this select 6;
_MCSOrdStartPos = [(getPosASL _Projectile)select 0,(getPosASL _Projectile)select 1,((getPosASL _Projectile)select 2)+0.1];
_MCSAmmoSpeed = velocityModelSpace _Projectile select 1;

_MCSOffset = if (_target isKindOf "MAN") then {_target selectionPosition "pelvis";} else {getCenterOfMass _target;};

[_MCSOrdStartPos, _Projectile, _target, _MCSAmmoSpeed, false, _MCSOffset, 10, "", false] remoteExec ["BIS_fnc_EXP_camp_guidedProjectile", 2];
}];

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~EH~for~EDEN~object~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this addEventHandler ["Fired", {
_WeaponType = _this select 1;
if (_WeaponType == "Throw") exitWith {Hint "Grenades excluded for technical reasons."};

_target = cursorTarget;

if (isNull _target) exitWith {Hint "No target. Make sure to press spot button (T) on target and keep target in center of the screen."};
_Projectile = _this select 6;
_MCSOrdStartPos = [(getPosASL _Projectile)select 0,(getPosASL _Projectile)select 1,((getPosASL _Projectile)select 2)+0.1];
_MCSAmmoSpeed = velocityModelSpace _Projectile select 1;

_MCSOffset = if (_target isKindOf "MAN") then {_target selectionPosition "pelvis";} else {getCenterOfMass _target;};

[_MCSOrdStartPos, _Projectile, _target, _MCSAmmoSpeed, false, _MCSOffset, 10, "", false] remoteExec ["BIS_fnc_EXP_camp_guidedProjectile", 2];
}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
