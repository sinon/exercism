import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  // (1 + 2 + ... + 10)² = 55² = 3025.
  let nums = list.range(1, n)
  let sum = nums |> list.reduce(fn(acc, x) { acc + x })
  case sum {
    Ok(x) -> {
      x * x
    }
    Error(_) -> {
      0
    }
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  // 1² + 2² + ... + 10² = 385.
  let nums = list.range(1, n)
  let result = nums |> list.reduce(fn(acc, x) { acc + { x * x } })
  case result {
    Error(_) -> {
      0
    }
    Ok(x) -> x
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
