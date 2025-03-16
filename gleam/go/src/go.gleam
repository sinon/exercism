pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let new_game = case rule1(game) {
    Ok(g) -> g
    Error(e) -> Game(..game, error: e)
  }
  let new_game = rule2(new_game)
  let new_game = case rule3(new_game) {
    Error(e) -> Game(..game, error: e)
    Ok(g) -> g
  }
  let new_game = case rule4(new_game) {
    Error(e) -> Game(..game, error: e)
    Ok(g) -> g
  }
  let new_game = case new_game.error, new_game.player {
    "", Black -> Game(..new_game, player: White)
    "", White -> Game(..new_game, player: Black)
    _, _ -> new_game
  }
  new_game
}
