// This script initializes all rooms and maybe NPCs. Will see

// --- Level design ---

/* 

|---------|     |----------|
| Bedroom X --- X Bathroom |
|----X----|     |-----X----|
     |                |
|----X----------------X----|
|          Foyer           |
|--------------------------|

*/

// Rooms
b["ROOMS"] = ["R_FOYER", "R_BEDROOM", "R_BATHROOM"];

// Foyer
b["R_FOYER"] = #{};
b["R_FOYER"]["NAME"] = "Předsíň"; 
b["R_FOYER"]["EXITS"] = ["R_BEDROOM", "R_BATHROOM"];
b["R_FOYER"]["DESCRIPTION"] = "A normal foyer. Nothing unusual here."; 

// Bedroom
b["R_BEDROOM"] = #{};
b["R_BEDROOM"]["NAME"] = "Ložnice"; 
b["R_BEDROOM"]["EXITS"] = ["R_FOYER", "R_BATHROOM"];
b["R_BEDROOM"]["DESCRIPTION"] = "Somewhat small bedroom. It smells pleasant."; 

// Bathroom
b["R_BATHROOM"] = #{};
b["R_BATHROOM"]["NAME"] = "Koupelna"; 
b["R_BATHROOM"]["EXITS"] = ["R_FOYER", "R_BEDROOM"];
b["R_BATHROOM"]["DESCRIPTION"] = "Standard bathroom with 1970 Eastern European wall design."; 

// --- Player ---
b["E"] = ["E_PLAYER"];
b["E_PLAYER"] = #{};
b["E_PLAYER"]["LOCATION"] = "R_FOYER";
b["E_PLAYER"]["INVENTORY"] = [];

// // --- Items ---
// // Coin
// b["I_COIN"] = #{};
// b["I_COIN"]["DESCRIPTION"] = "Just a random coin. LuLz";
// b["I_COIN"]["NAME"] = "Coin";

// // Bag
// b["I_BAG"] = #{};
// b["I_BAG"]["DESCRIPTION"] = "Bag. You can store items here";
// b["I_BAG"]["NAME"] = "Coin";
// b["I_BAG"]["CAN_STORE_ITEMS"] = true;
// b["I_BAG"]["STORED_ITEMS"] = [];

// print(description!("I_COIN"));
// print(name!("I_COIN"));
// print(name!("I_BAG"));
// print(can_store_items!("I_BAG"));
// print(can_store_items!("I_COIN"));
// print(stored_items!("I_COIN"));
// print(stored_items!("I_BAG"));

// b["I_BAG"]["STORED_ITEMS"]  = ["I_COIN", "I_COIN"];
// print(stored_items!("I_BAG"));


