// --- Room Definition ---
w.r_bedroom = #{
	name: "Bedroom",
	items: ["i_bed", "i_nightstand", "i_wardrobe", "i_window", "i_painting"],
	exits: ["r_foyer"],
	try_leave: |entity_id, to_room_id| {
		if !(to_room_id in this.r_bedroom.exits) {
			print("There is no connection to room: " + this[to_room_id]?.name);
			return false;
		}

		return true;
	},
};

// --- Room Items definition ---
// Bed
w.i_bed = #{
	name: "Bed",
	description: "Queen sized bed. I haven't changed the bedclothes in months. My pillows now look yellow-ish instead of white so it might be the time to wash them.",
};
// Nightstand
w.i_nightstand = #{
	name: "Nightstands",
	description: "White and small tables located on each side of the the bed. Looking at the book on the left table, I see that I still have a lot of pages to read before I am done with it.",
};
// Wardrobe
w.i_wardrobe = #{
	name: "Wardrobe",
	description: "White two-door wardrobe. I don't have much clothes inside. Used to have way more but I finally did a proper spring cleanup this year and donated most of my hight school and university clothes.",
};
// Window
w.i_window = #{
	name: "Window",
	description: "Cheap PVC window. It's open so fresh air can come in.",
};
// Painting
w.i_painting = #{
	name: "Painting",
	description: "'The Starry Night'. Got it as a present and had to hang it somewhere. Not what I would pick but my friends like it so it will stay.",
};

