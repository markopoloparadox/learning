// Called by w
w.parse_input = |input| {
    let tokens = input.split();
    if tokens.len() == 0 {
        return;
    }

    let token = tokens.shift();
    if token == "describe" {
        this.describe_command(tokens);
        return;
    }

    print("Unknown command: " + token);
    return;
};

fn describe_command(tokens) {
    if tokens.len() == 0 {
        print("Describe what?");
        return;
    }
    let object_name = tokens.shift();

    // Find Object
    let object_id = this.find_id_by_name(object_name);
    if object_id == () {
        print("Don't know what " + object_name +  " is.");
        return;
    }

    this.describe(object_id);
}