fn description(x) {
	return this[x]?.description;
}

fn name(x) {
	return this[x]?.name;
}

fn names(items) {
	let names = [];
	for item in items {
		let name = this.name(item);
		if name != () {
			names.push(name);
		}
	}
	return names;
}

fn can_store_items(e) {
	return this[e]?["CAN_STORE_ITEMS"] ?? false;
}

fn items(x) {
	return this[x]?.items;
}

fn stored_items(e) {
	let items = this[e]?["STORED_ITEMS"];
	if items == () {
		return "Nothing is stored as you cannot store items here.";
	}
	
	if items.is_empty() {
		return "Nothing is stored.";
	}
	
	return this.name(items);
}

fn sterilize(e) {
	let text = e.to_lower();
	text.trim();
	return text;
}

fn location(r) {
	return this[r]?.location;
}

fn set_location(e, r) {
	this[e]?.location = r;
}

fn exits(e) {
	return this[e]?.exits;
}

fn room(r) {
	return this[r];
}

fn rooms() {
	return this["ROOMS"];
}

fn inventory(e) {
	return this[e]?.inventory;
}

fn can_enter(e, r) {
	let result =  this[r]?["CAN_ENTER"];
	if result == () {
		return true;
	}
	return result.call(this, e);
}

// fn pretty_display_visible_objects(e) {
//  let exits = w.exits(w.location(e));
//  if exits != () {
//      visible += "\n- Exists: " + exits;
//  }

//  return visible;
// }

fn move_to(to, player) {
	let from = this[player].location;
	let success = this.move_between_rooms(from, to, player);
	if success == false {
		return false;
	}
	
	this[player].location = to;
	if this["ROOMS_VISITED"] == () {
		this["ROOMS_VISITED"] = [];
	}
	
	print("You have entered: " + this.name(to));
	if to !in this["ROOMS_VISITED"] {
		print(this.description(to));
		this["ROOMS_VISITED"].push(to);
	}
	
	return true;
}


fn move_between_rooms(from, to, player) {
	let move = this[from]?[to]?["MOVE"];
	if move == () {
		return true;
	}
	
	return this.call(move, player)
}

fn unlock_room(room, player) {
	let from = this[player]["LOCATION"];
	let unlock = this[from]?[room]?["UNLOCK"];
	if unlock == () {
		print("There is nothing to unlock.");
		return 
	}
	
	return this.call(unlock, player);
}

//  --- Variable Code ---
