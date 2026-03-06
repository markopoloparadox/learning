// This script initializes all rooms and maybe NPCs. Will see

// --- Level design ---
b["R"] = ["R_ENTRANCE", "R_LIVING"];
b["R_ENTRANCE"] = #{};
b["R_ENTRANCE"]["NAME"] = "Entrance";
b["R_ENTRANCE"]["EXITS"] = ["R_LIVING"];

b["R_LIVING"] = #{};
b["R_LIVING"]["NAME"] = "GOD";

// --- Players ---
b["E"] = ["E_PLAYER"];
b["E_PLAYER"] = #{};
b["E_PLAYER"]["LOCATION"] = "R_ENTRANCE";

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


