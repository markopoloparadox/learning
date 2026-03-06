use rhai::{Engine, EvalAltResult, Scope};

const HEADER: &str = include_str!("./constants.rhai");

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

        let engine = Engine::new();
        let start_up_script = std::fs::read_to_string("./src/start_up.rhai").unwrap();
        let script = std::format!("{}{}", HEADER, start_up_script);
        engine.run_with_scope(&mut scope, &script).unwrap();
        scope.rewind(1);

        let player_script = std::fs::read_to_string("./src/player.rhai").unwrap();
        let player_script = std::format!("{}{}", HEADER, player_script);

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

    loop {
        println!("Start: ");
        let mut line = String::new();
        std::io::stdin().read_line(&mut line).unwrap();
        game.run(line);
    }
}
