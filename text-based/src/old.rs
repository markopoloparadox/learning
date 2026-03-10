//
//
//
//
// engine.set_optimization_level(OptimizationLevel::None);
// let ast = engine
//  .compile_file_with_scope(&mut scope, "./src/player.rhai".into())
//  .unwrap();
// ast.iter_literal_variables(true, false)
//  .for_each(|(name, _, value)| {
//      scope.push_constant(name, value);
//  });

// // Turn optimization back ON
// engine.set_optimization_level(OptimizationLevel::Simple);
// let ast = engine.optimize_ast(&scope, ast, engine.optimization_level());

// engine.call_fn::<()>(&mut scope, &ast, "init", ()).unwrap();

// let mut state = scope.get_value::<rhai::Map>("bb").unwrap();
// state.insert("input".into(), "Kam mohu jít".into());
// scope.set_or_push("bb", state);
// engine.call_fn::<()>(&mut scope, &ast, "run", ()).unwrap();

// let mut state = scope.get_value::<rhai::Map>("bb").unwrap();
// state.insert("input".into(), "jdi LIVING_ROOM".into());
// scope.set_or_push("bb", state);
// engine.call_fn::<()>(&mut scope, &ast, "run", ()).unwrap();

// println!(
//  "{}",
//  scope
//      .get_value::<rhai::Map>("bb")
//      .unwrap()
//      .get("output")
//      .unwrap()
// );

// println!("{}", scope.len());
// dbg!(scope);

// println!("{:?}", scope.get_value::<i64>("a"));
// engine
//  .run_file_with_scope(&mut scope, "./src/hello_world.rhai".into())
//  .unwrap();
// println!("{}", scope.len());
// println!("{:?}", scope.get_value::<i64>("a"));

// Done!
