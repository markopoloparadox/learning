// This script initializes all rooms and maybe NPCs. Will see

// --- Level design ---

/* 
  |---------|  |----------|
  | Bedroom X --- X Bathroom |
  |----X----|  |-----X----|
    |       |
  |----X----------------X----|     |--------|
  |    Foyer     X-----------X Garage |  
  |----X----------------X----|     |--------|
    |       |
  |----X----|  |-----X-------|
  | Kitchen X --- X Living Room |
  |---------|  |-------------|
*/

// Rooms
w["ROOMS"] = [];

let room_scripts = [
  "./src/rooms/bathroom.rhai",
  "./src/rooms/bedroom.rhai",
  "./src/rooms/foyer.rhai",
  "./src/rooms/garage.rhai",
  "./src/rooms/kitchen.rhai",
  "./src/rooms/living_room.rhai",
]
