import gleam/int

pub fn is_leap_year(year: Int) -> Bool {
  let div_4 = int.modulo(year, 4) == Ok(0)
  let div_100 = int.modulo(year, 100) == Ok(0)
  let div_400 = int.modulo(year, 400) == Ok(0)
  case div_4, div_100, div_400 {
    False, _, _ -> False
    True, True, True -> True
    True, True, False -> False
    True, False, False -> True
    True, False, True -> True
  }
}
