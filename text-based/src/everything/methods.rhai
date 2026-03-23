w.name = |x| {
    if x.type_of() == "string" {
		return this[x]?.name;
	}

    for (item, count) in x {
        x[count] = this.name(item);
    }
    return x;
};

w.rooms = || {
   return this.keys().filter(|x| x.starts_with("r_"))
};

w.items = || {
   return this.keys().filter(|x| x.starts_with("i_"))
};

w.entities = || {
   return this.keys().filter(|x| x.starts_with("e_"))
};

w.move = |entity_id, from_room_id, to_room_id| {
    // This should never be triggered
    if this[from_room_id] == () {
        print("Unknown from room: " + from_room_id);
        return false;
    }

    // This should never be triggered
    if this[to_room_id] == () {
        print("Unknown to room: " + to_room_id);
        return false;
    }

    // Can entity leave room?
    if "try_leave" in this[from_room_id] {
        let success = this.call(this[from_room_id].try_leave, entity_id, to_room_id);
        if !success {
            return false;
        }
    }

    // Can entity enter room?
    if "try_enter" in this[to_room_id] {
        let success = this.call(this[to_room_id]?.try_enter, entity_id, from_room_id);
        if !success {
            return false;
        }
    }

    this[entity_id].location = to_room_id;
    return true;
};

w.combine = |arr1, arr2| {
    let combined = [];
    for i in 0..arr1.len() {
        combined.push([arr1.get(i), arr2.get(i)]);
    }
    return combined;
};

w.describe = |object_id| {
    let description = this[object_id].description;
    if description == () {
        print("Cannot describe " + this.name(object_id));
        return;
    }
    print(description);
};

w.find_id_by_name = |name| {
    for key in this.keys() {
        if this[key].name == name {
            return  key;
        }
    }

    return ()
}