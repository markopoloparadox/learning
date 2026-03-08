// This script initializes all rooms and maybe NPCs. Will see

// --- Level design ---

/* 
     |---------|     |----------|
     | Bedroom X --- X Bathroom |
     |----X----|     |-----X----|
          |                |
     |----X----------------X----|           |--------|
     |          Foyer           X-----------X Garage |  
     |----X----------------X----|           |--------|
          |                |
     |----X----|     |-----X-------|
     | Kitchen X --- X Living Room |
     |---------|     |-------------|
*/


// Rooms
w["ROOMS"] = ["R_FOYER", "R_BEDROOM", "R_BATHROOM", "R_KITCHEN", "R_LIVING_ROOM", "R_GARAGE"];

// Foyer
w["R_FOYER"] = #{};
w["R_FOYER"]["NAME"] = "Předsíň"; 
w["R_FOYER"]["EXITS"] = ["R_BEDROOM", "R_BATHROOM", "R_KITCHEN", "R_LIVING_ROOM", "R_GARAGE"];
w["R_FOYER"]["DESCRIPTION"] = "A normal foyer. Nothing unusual here."; 
// Bedroom
w["R_BEDROOM"] = #{};
w["R_BEDROOM"]["NAME"] = "Ložnice"; 
w["R_BEDROOM"]["EXITS"] = ["R_FOYER", "R_BATHROOM"];
w["R_BEDROOM"]["DESCRIPTION"] = "Somewhat small bedroom. It smells pleasant."; 
// Bathroom
w["R_BATHROOM"] = #{};
w["R_BATHROOM"]["NAME"] = "Koupelna"; 
w["R_BATHROOM"]["EXITS"] = ["R_FOYER", "R_BEDROOM"];
w["R_BATHROOM"]["DESCRIPTION"] = "Standard bathroom with 1970 Eastern European wall design."; 
// Kitchen
w["R_KITCHEN"] = #{};
w["R_KITCHEN"]["NAME"] = "Kuhyně"; 
w["R_KITCHEN"]["EXITS"] = ["R_FOYER", "R_LIVING_ROOM"];
w["R_KITCHEN"]["DESCRIPTION"] = "Big Kitchen. Nice one."; 
// Living Room
w["R_LIVING_ROOM"] = #{};
w["R_LIVING_ROOM"]["NAME"] = "Obývaci Pokoj"; 
w["R_LIVING_ROOM"]["EXITS"] = ["R_FOYER", "R_KITCHEN"];
w["R_LIVING_ROOM"]["DESCRIPTION"] = "Living room like any other."; 
// Garage
w["R_GARAGE"] = #{};
w["R_GARAGE"]["NAME"] = "Garáž"; 
w["R_GARAGE"]["EXITS"] = [];
w["R_GARAGE"]["DESCRIPTION"] = "Classic Garage."; 
w["R_FOYER"]["R_GARAGE"] = #{};
w["R_FOYER"]["R_GARAGE"]["IS_LOCKED"] = true; 


// --- Room Logic ---
w["R_FOYER"]["R_GARAGE"]["MOVE"] = foyer_garage_move;
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

w["R_FOYER"]["R_GARAGE"]["UNLOCK"] = foyer_garage_unlock;
fn foyer_garage_unlock(player) {
     const FROM = "R_FOYER";
     const TO = "R_GARAGE";
      
     let is_locked = this[FROM][TO]["IS_LOCKED"];
     if !is_locked {
          print("It's already unlocked");
          return;
     }

     let inventory = this.inventory(player);
     if "I_KEY" in inventory {
          this[FROM][TO]["IS_LOCKED"] = false;
          print("Unlocked");
          return;
     }

     print("You need to find and use the key to unlock it")
};

// w["R_FOYER"]["R_GARAGE"]["LOCK"] = |w, e| {
//      let is_locked = w["R_FOYER"]["R_GARAGE"]["IS_LOCKED"];
//      switch is_locked {
//           true => print("It's already locked"),
//           false => {
//                w["R_FOYER"]["R_GARAGE"]["IS_LOCKED"] = true;
//                print("Locked");
//           }
//      }
// };