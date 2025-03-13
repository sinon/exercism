import gleam/int
import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  // (1 + 2 + ... + 10)² = 55² = 3025.
  let total =
    list.range(1, n)
    |> int.sum()
  total * total
}

pub fn sum_of_squares(n: Int) -> Int {
  // 1² + 2² + ... + 10² = 385.
  list.range(1, n)
  |> list.map(fn(x) { x * x })
  |> int.sum()
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
