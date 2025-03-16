import gleam/int

pub fn convert(number: Int) -> String {
  let div_3 = int.modulo(number, 3) == Ok(0)
  let div_5 = int.modulo(number, 5) == Ok(0)
  let div_7 = int.modulo(number, 7) == Ok(0)
  case div_3, div_5, div_7 {
    True, False, False -> "Pling"
    False, True, False -> "Plang"
    False, False, True -> "Plong"
    True, True, False -> "PlingPlang"
    False, True, True -> "PlangPlong"
    True, False, True -> "PlingPlong"
    True, True, True -> "PlingPlangPlong"
    False, False, False -> int.to_string(number)
  }
}
