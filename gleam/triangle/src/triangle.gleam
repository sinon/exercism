import gleam/list

pub fn valid_triangle(a: Float, b: Float, c: Float) -> Bool {
  list.all(
    [
      { a +. b >=. c },
      { b +. c >=. a },
      { a +. c >=. b },
      { a != 0.0 },
      { b != 0.0 },
      { c != 0.0 },
    ],
    fn(x) { x },
  )
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && valid_triangle(a, b, c)
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  { { a == b } || { a == c } || b == c } && valid_triangle(a, b, c)
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  !equilateral(a, b, c) && !isosceles(a, b, c) && valid_triangle(a, b, c)
}
