use rhai::{Engine, EvalAltResult, Scope};

const HEADER: &str = include_str!("./header.rhai");
const INITIALIZE_ROOM_SCRIPT: &str = include_str!("./initialize_rooms.rhai");
const INITIALIZE_ENTITIES_SCRIPT: &str = include_str!("./initialize_entities.rhai");
const GAME_SCRIPT: &str = include_str!("./game.rhai");

struct Game<'a> {
    engine: Engine,
    scope: Scope<'a>,
    player_script: String,
}

impl<'a> Game<'a> {
    pub fn new() -> Self {
        let mut scope = Scope::new();
        let states = rhai::Map::new();
        scope.set_or_push("w", states);

        // Initialize Level and Entities
        let engine = Engine::new();
        for i in [INITIALIZE_ROOM_SCRIPT, INITIALIZE_ENTITIES_SCRIPT] {
            engine
                .run_with_scope(&mut scope, &std::format!("{}{}", HEADER, i))
                .unwrap();
            scope.rewind(1);
        }

        // Construct player script
        let player_script = std::format!("{}{}", HEADER, GAME_SCRIPT);
        Self {
            engine,
            scope,
            player_script,
        }
    }

    pub fn run(&mut self, input: String) {
        self.scope.set_or_push("user_inp", input);
        self.engine
            .run_with_scope(&mut self.scope, &self.player_script)
            .unwrap();
        self.scope.rewind(1);
    }
}

pub fn main() -> Result<(), Box<EvalAltResult>> {
    let mut game = Game::new();
    game.run(String::new());

    // loop {
    //     println!("Start: ");
    //     let mut line = String::new();
    //     std::io::stdin().read_line(&mut line).unwrap();
    // }

    Ok(())
}
