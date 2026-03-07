parse_input!("kam můžu jít");
parse_input!("jdi ložnice");
parse_input!("kam můžu jít");


fn parse_input(input) {
    let input = sterilize(input);

    if input == "kam můžu jít" {
        name_room_where_i_can_go!();
        return;
    }
    if input == "co vidím" {
        // do Something
        return;
    }
    let tokens =  input.split();
    let token = tokens.shift();
    switch token {
        "jdi" => jdi_command!(tokens),
        _ => (),
    }
}


fn name_room_where_i_can_go() {
    // Fetch my current location
    let rooms = names!(exits!(location!("E_PLAYER")));
    print("Můžes jit: " + rooms);
}


fn jdi_command(tokens) {
    let room_name = sterilize(tokens.shift());
    let all_room_names = names!(rooms!()).map(sterilize);
    if room_name !in all_room_names {
        print("Ten pokoj neexistuje.");
        return;
    }

    let rooms_around_player = names!(exits!(location!("E_PLAYER")));
        if room_name !in all_room_names {
        print("There is no door to that room.");
        return;
    }

    let id = room_name_to_id!(room_name);
    set_location!("E_PLAYER", id);
}

fn room_name_to_id(name) {
    let all_rooms = rooms!();
    for room in all_rooms {
        if sterilize(name!(room)) == name {
            return room;
        }
    }
}


// exits!(location!("E_PLAYER"));

// let input = sterilize(user_inp);
// let tokens = input.split();
// if tokens.is_empty() {
//     return;
// }

// let token = tokens.shift();
// if token.starts_with("kde") {
//     kde_command!(tokens);
//     return;
// }

// if token.starts_with("kam") {
//     kam_command!(tokens);
//     return;
// }


// fn kde_command(tokens) {
//     let token = tokens.shift();
//     if (token == "jsem") && tokens.is_empty() {
//         print("You are currently located: " + name!(location!("E_PLAYER")));
//     }

//     print("Nerozumím: " + token);
// }


// fn kam_command(tokens) {
//     let token = tokens.shift();
//     if (token == "můžu") {
//         token = tokens.shift();
//         if (token != "jít") {
//             print("Nerozumím: " + token);
//             return;
//         }
//         print("Můžeš jít: " + exits!(location!("E_PLAYER")));
//         return;
//     }

//     print("Nerozumím " + token);

// }