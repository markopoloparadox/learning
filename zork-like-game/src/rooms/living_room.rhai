w["ROOMS"].push("R_LIVING_ROOM");

// Room
w["R_LIVING_ROOM"] = #{
	name: "Obývaci Pokoj",
	exits: ["R_FOYER", "R_KITCHEN"],
	description: "Warmth and comfort, that's how I would describe this room. I have spend countless hours here as a kid waiting for the cartons to show up on our old CRT TV and since then this room has not changed at all besides the TV now being OLED. This room has a lot of interesting items in it, I should explore all of them.",
	items: ["I_SOFA", "I_PLANT", "I_SMALL_TABLE", "I_LIBRARY", "I_TV"],
	items_description: items_description,
};
// Items
w["I_SOFA"] = #{};
w["I_SOFA"].name = "Pohovka";
w["I_PLANT"] = #{};
w["I_PLANT"].name = "Rostlina";
w["I_SMALL_TABLE"] = #{};
w["I_SMALL_TABLE"].name = "Stolek";
w["I_LIBRARY"] = #{};
w["I_LIBRARY"].name = "Knihovna";
w["I_TV"] = #{};
w["I_TV"].name = "TV";

fn items_description(player) {
	let items = this.names(this.items("R_LIVING_ROOM"));
	print("The room is full with items, but the most important ones are: ");
	for item in items {
		print("- " + item);
	}
};

