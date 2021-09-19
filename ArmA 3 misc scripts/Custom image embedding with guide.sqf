comment "
Handling code in windows notepad is a nightmare and SLE strongly recommends these tools:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Notepad++
https://notepad-plus-plus.org/downloads/
SQF syntax for notepad. Not to confuse with SQL.
http://www.armaholic.com/page.php?id=8680
OR use Visual Studio Code with ""SQF Language"" extention.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
";

comment "
SLE's giude to image imbedding.
This is for static screen. (Or custom camo.) Applies on mission start.
Put this in object init field.
"this setObjectTextureGlobal [0,"example.jpg"];"
In case of camo you may wanna add same line with other number to paint turret/interior/wheels/tracks. Depends on vehicle and need experimentation.
"this setObjectTextureGlobal [1,"example.jpg"];"
or/and
"this setObjectTextureGlobal [2,"example.jpg"];"

Switchable screen.
Screen must have certain name. I'll use ""ScreenName"" as example.
Player will see scroll menu action named ""ActionName""
Put this in any object init field (can be screen itself or some kind of remote).
To add several pictures just add same script line as many times as needed. Just change path to image and Action name.
To turn off screen just leave path to image empty. [0,""]

"this addAction ["<t>"ActionName"</t>", {"ScreenName" setObjectTextureGlobal [0,"example.jpg"];}];"


Picture must be in same folder as mission in *User*/Documents/ArmA3 or ArmA3 other profiles/*ProfileName*/mpmissions/*MissionName.TerrainName*
Subfolder can be created in mission folder if needed.
In that case path will look like this: ""*SubfolderName*/example.jpg""
";

//---Image usage example scripts.
//Code:
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
this setObjectTextureGlobal [0,"example.jpg"];
this addAction ["<t>ActionName</t>", {ScreenName setObjectTextureGlobal [0,"example.jpg"];}];
this addAction ["<t>Repaint</t>", {IFV1 setObjectTextureGlobal [0,"Gcamo.jpg"]; IFV1 setObjectTextureGlobal [2,"Gcamo.jpg"]; IFV1 removeAction 0;}];
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~