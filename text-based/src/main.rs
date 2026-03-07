use rhai::{Engine, EvalAltResult, Scope};

const HEADER: &str = include_str!("./header.rhai");
const INITIALIZE_LEVEL_SCRIPT: &str = include_str!("./initialize_level.rhai");
const PLAYER_SCRIPT: &str = include_str!("./player.rhai");

struct Game<'a> {
    engine: Engine,
    scope: Scope<'a>,
    player_script: String,
}

impl<'a> Game<'a> {
    pub fn new() -> Self {
        let mut scope = Scope::new();
        let states = rhai::Map::new();
        scope.set_or_push("b", states);

        // Initialize Level
        let engine = Engine::new();
        let script = std::format!("{}{}", HEADER, INITIALIZE_LEVEL_SCRIPT);
        engine.run_with_scope(&mut scope, &script).unwrap();
        scope.rewind(1);

        // Construct player script
        let player_script = std::format!("{}{}", HEADER, PLAYER_SCRIPT);
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
