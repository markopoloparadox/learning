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

fn sterilize_text(e) {
    let text = e.to_lower();
    text.trim();
    return text;
}

fn location(e) {
    return b[e]?["EXITS"];
}

fn exits(e) {
    let items =  b[e]?["EXITS"];
    if items == () {
        return ();
    }

    let context = b;
    return map!(items, |x| {let b = context; name!(x);});
}

//  --- Variable Code ---
