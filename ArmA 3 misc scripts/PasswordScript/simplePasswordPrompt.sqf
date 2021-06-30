//This requires https://steamcommunity.com/sharedfiles/filedetails/?id=1673595418 to be either loaded via the mission or for all clients
//Add this to whichever object you want your intel to be



laptop_0 = this;
pw_attempts_0 = 3;
laptop_0_password = "yourpw";
password_check_id0 = this addAction ["Enter Password", {
  [
      [true,""],
      "Enter Password",
      {
          if _confirmed then
          {
            if (_text == laptop_0_password) then {
              systemchat format["Login Successfull"];
              laptop_0 removeAction password_check_id0;

              [laptop_0, "test.jpg", "TextGoesHere"] call BIS_fnc_initInspectable;
            }
            else
            {
              if (pw_attempts_0 < 1) then {
                systemchat "To many Attempts, locking OS";
                laptop_0 removeAction password_check_id0;
              }
              else
              {
                systemchat format["You have %1 tries remaining",pw_attempts_0];
                pw_attempts_0 = pw_attempts_0 - 1;
              };
            };
          }
          else
          {
            systemchat "Login Attempt Cancelled";
          };
      },
      "Login",
      ""
  ] call CAU_UserInputMenus_fnc_text;

}];
