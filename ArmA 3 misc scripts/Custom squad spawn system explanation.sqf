//---Custom squad spawn system now integrated in Mission Control System.

//---Simple custom squad spawn. Spawn AI on viewpoint and applies copied loadouts on them.
//Additional things:
//Currently MCS provides same functionallity without fuckery with entering every action. This code only serves educational purposes.

_spawnPosition = getPosASL AISpawn;  //Beacon spawn lilne.

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Explained code:
//THIS CODE WON'T WORK AND ONLY MEANT FOR EDUCATIONAL PURPOSES!!!
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
player addAction ["<t>SPAWN AT</t>", {                                           //Adds action to player.

_spawnPosition = screenToWorld [0.5, 0.5];                                       //Get spawn position. In this case It will get position you looking at with center of your screen.
                                                                                 //Remember that it use center of screen. Not weapon sights that can be off center due to weapon sway.
                                                                                 //Can be swapped with beacon line.

Squad = createGroup [east,true];                                                 //Creates group. To change side of spawned group change east to west or independent.
                                                                                 //Check list of all sides at https://community.bistudio.com/wiki/Side east and opfor seems to be interchangable.

_newLeader = "O_Soldier_SL_F" createUnit [_spawnPosition, Squad, "this=this"];   //Creates squadleader. O_Soldier_SL_F is type of soldier spawned. This for example is CSAT Sqad Leader. Unit type namings can be seen in Eden editor.

this setUnitLoadout (getUnitLoadout RefSL);                                      //Copy loadout from reference unit (RefSL) to spawned unit.
                                                                                 //Due to usage of "this" as reference to spawned unit loadouts exported from Virtual arsenal can be used.
                                                                                 //I wouldn't recommend to use it though because of maintenance issues of that needlessly big code.

sleep 0.1;                                                                       //Wait for 0.1 seconds. Used to ensure proper functioning of loadout copying.

_newUnit = "O_Medic_F" createUnit [_spawnPosition,Squad,"this=this"];            //Creates squad member. 

this setUnitLoadout (getUnitLoadout RefMED);                                     //Copy loadout.

sleep 0.1;                                                                       //Wait for 0.1 seconds. Used to ensure proper functioning of loadout copying.

_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];       //Repeat of previously explained
this setUnitLoadout (getUnitLoadout RefAT);
sleep 0.1;
_newUnit = "O_Soldier_AT_F" createUnit [_spawnPosition,Squad,"this=this"];
this setUnitLoadout (getUnitLoadout RefAT);
sleep 0.1;
}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~