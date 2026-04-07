// Initial location and start game message
w.player.location = "r_woods";
w.r_woods.visited_count += 1;
// print(w.r_woods.initial_message);
// print(w.r_woods.description);
//w.describe("r_bedroom");
w.parse_input("describe Bedroom");
w.parse_input("describe Sword");


// w.r_book = #{
//     try_leave: |entity, from_room_id| {
//         print("Try Leave");
//         return false;
//     }
// };
// w.r_woob = #{
//     name: "Woob room",
//     try_enter: |entity, from_room_id| {
//         print("Try Enter");
//         return true;
//     }
// };
// w.r_foyer = #{
//     name: "Foyer",
//     try_enter: |entity, from_room_id| {
//         return true;
//     }
// };

// w.move("player", "r_bedroom", "r_foyer");
// print(w.player.location);


// for item in w.keys() {
// 	print("Key: " + item);
// }

// print(w.rooms());
// print(w.items());
// print(w.entities());
// print(w.combine(w.rooms(), w.name(w.rooms())));
