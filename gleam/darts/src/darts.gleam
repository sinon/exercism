import gleam/float

pub fn score(x: Float, y: Float) -> Int {
  let assert Ok(r) = float.square_root({ x *. x } +. { y *. y })
  let inside_1 = {
    -1.0 <=. r && r <=. 1.0
  }
  let inside_5 = {
    -5.0 <=. r && r <=. 5.0
  }
  let inside_10 = {
    -10.0 <=. r && r <=. 10.0
  }
  case inside_1, inside_5, inside_10 {
    True, True, True -> 10
    False, True, True -> 5
    False, False, True -> 1
    _, _, _ -> 0
  }
}
