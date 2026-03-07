//  --- Rooms ---
// "R"
// "R_ENTRANCE";
// "R_LIVING";
// "R_KITCHEN";
// "R_EXIT";

//  --- Entities ---
// "E"
// "E_PLAYER";


//  --- Possible attributes ---
// "NAME";
// "CONTAINS";
// "EXITS";
// "INVENTORY";
// "DESCRIPTION";
// "CAN_STORE_ITEMS";
// "STORED_ITEMS";
// "LOCATION";

//  --- Items  ---
// "I_COIN";
// "I_BAG";

//  --- Methods ---
fn description(e) {
    return b[e]?["DESCRIPTION"];
}

fn name(e) {
    return b[e]?["NAME"];
}

fn names(items) {
    let c = b;
    return map!(items, |x| {let b = c; name!(x);});
}

fn can_store_items(e) {
    return b[e]?["CAN_STORE_ITEMS"] ?? false;
}

fn stored_items(e) {
    let items = b[e]?["STORED_ITEMS"];
    if items == () {
        return "Nothing is stored as you cannot store items here."
    }

    if items.is_empty() {
        return "Nothing is stored."
    }


    let context = b;
    return map!(items, |x| {let b = context; name!(x);});
}

fn sterilize(e) {
    let text = e.to_lower();
    text.trim();
    return text;
}

fn location(e) {
    return b[e]?["LOCATION"];
}

fn set_location(e, loc) {
    b[e]?["LOCATION"] = loc;
}


fn exits(e) {
    return b[e]?["EXITS"];
}

fn rooms() {
    return b["ROOMS"];
}

fn inventory(e) {
    return b[e]?["INVENTORY"];
}

fn pretty_display_visible_objects(e) {
    // here we talk about exits
    // Items in the room
    // etc.
    let visible = "";


    let exits = exits!(location!(e));
    if exits != () {
        visible += "\n- Exists: " + exits;
    }

    return visible;
}

//  --- Variable Code ---
