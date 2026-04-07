w["ROOMS"].push("R_FOYER");

w["R_FOYER"] = #{};
w["R_FOYER"].name = "Předsíň"; 
w["R_FOYER"].exits = ["R_BEDROOM", "R_BATHROOM", "R_KITCHEN", "R_LIVING_ROOM", "R_GARAGE"];
w["R_FOYER"].description = "A normal foyer. Nothing unusual here."; 
w["R_FOYER"]["R_GARAGE"] = #{};
w["R_FOYER"]["R_GARAGE"]["IS_LOCKED"] = true; 
w["R_FOYER"]["R_GARAGE"]["MOVE"] = foyer_garage_move;
w["R_FOYER"]["R_GARAGE"]["UNLOCK"] = foyer_garage_unlock;


fn foyer_garage_move(player) {
  const FROM = "R_FOYER";
  const TO = "R_GARAGE";

  let is_unlocked = !this[FROM][TO]["IS_LOCKED"];
  if is_unlocked {
    return true;
  }

  print("The door is locked. You need to find and use the key to unlock it");
  return false;
};

fn foyer_garage_unlock(player) {
  const FROM = "R_FOYER";
  const TO = "R_GARAGE";
   
  let is_locked = this[FROM][TO]["IS_LOCKED"];
  if !is_locked {
    print("It's already unlocked");
    return;
  }

  let inventory = this[player].inventory;
  if "I_KEY" in inventory {
    this[FROM][TO]["IS_LOCKED"] = false;
    print("Unlocked");
    return;
  }

  print("You need to find and use the key to unlock it")
};

// w["R_FOYER"]["R_GARAGE"]["LOCK"] = |w, e| {
//   let is_locked = w["R_FOYER"]["R_GARAGE"]["IS_LOCKED"];
//   switch is_locked {
//     true => print("It's already locked"),
//     false => {
//       w["R_FOYER"]["R_GARAGE"]["IS_LOCKED"] = true;
//       print("Locked");
//     }
//   }
// };