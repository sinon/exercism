import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub type Resistance {
  Resistance(unit: String, value: Int)
}

fn calculate_resistance(one, two, three) -> Result(Resistance, Nil) {
  let base = { color_value(one) * 10 } + color_value(two)
  let exp =
    list.repeat(10, color_value(three))
    |> list.reduce(fn(acc, x) { acc * x })
    |> result.unwrap(1)
  let zero_count =
    string.to_graphemes(int.to_string(base * exp))
    |> list.reverse
    |> list.take_while(fn(x) { x == "0" })
    |> list.length
  let #(unit, value) = case zero_count {
    i if i < 3 -> #("ohms", base * exp)
    i if i >= 3 && i < 6 -> #("kiloohms", base * exp / 1000)
    i if i >= 6 && i < 9 -> #("megaohms", base * exp / 1_000_000)
    i if i >= 9 && i < 12 -> #("gigaohms", base * exp / 1_000_000_000)
    _ -> #("ohms", 0)
  }
  Ok(Resistance(unit, value))
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors {
    [one, two, three] -> calculate_resistance(one, two, three)
    [one, two] ->
      Ok(Resistance("ohms", { color_value(one) * 10 } + color_value(two)))
    [one, two, three, ..] -> {
      calculate_resistance(one, two, three)
    }
    _ -> Error(Nil)
  }
}

fn color_value(color: String) -> Int {
  case color {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> 0
  }
}
