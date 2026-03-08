fn description(x) {
    return this[x]?["DESCRIPTION"];
}

fn name(x) {
    return this[x]?["NAME"];
}

fn names(items) {
    return map!(items, |x| { return this.name(x); });
}

fn can_store_items(e) {
    return this[e]?["CAN_STORE_ITEMS"] ?? false;
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
    return this[r]?["LOCATION"];
}

fn set_location(e, r) {
    this[e]?["LOCATION"] = r;
}


fn exits(e) {
    return this[e]?["EXITS"];
}

fn rooms() {
    return this["ROOMS"];
}

fn inventory(e) {
    return this[e]?["INVENTORY"];
}

fn can_enter(e, r) {
    let result =  this[r]?["CAN_ENTER"];
    if result == () {
        return true;
    }
    return result.call(this, e);
}

fn pretty_display_visible_objects(e) {
    // here we talk about exits
    // Items in the room
    // etc.
    let visible = "";


    let exits = w.exits(w.location(e));
    if exits != () {
        visible += "\n- Exists: " + exits;
    }

    return visible;
}

fn move_to(to, player) {
    let from = this[player]["LOCATION"];
    return this.move_between_rooms(from, to, player);
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
