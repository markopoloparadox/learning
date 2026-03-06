exits!(location!("E_PLAYER"));

let input = sterilize_text(user_inp);
let tokens = input.split();
if tokens.is_empty() {
    return;
}

let token = tokens.shift();
if token.starts_with("kde") {
    kde_command!(tokens);
    return;
}

if token.starts_with("kam") {
    kam_command!(tokens);
    return;
}


fn kde_command(tokens) {
    let token = tokens.shift();
    if (token == "jsem") && tokens.is_empty() {
        print("You are currently located: " + name!(location!("E_PLAYER")));
    }

    print("Nerozumím: " + token);
}


fn kam_command(tokens) {
    let token = tokens.shift();
    if (token == "můžu") {
        token = tokens.shift();
        if (token != "jít") {
            print("Nerozumím: " + token);
            return;
        }
        print("Můžeš jít: " + exits!(location!("E_PLAYER")));
        return;
    }

    print("Nerozumím " + token);

}